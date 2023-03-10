### 1. Задача 1
Используя Docker, поднимите инстанс PostgreSQL (версию 13). Данные БД сохраните в volume.

Подключитесь к БД PostgreSQL, используя psql.

Воспользуйтесь командой \? для вывода подсказки по имеющимся в psql управляющим командам.

Найдите и приведите управляющие команды для:

вывода списка БД,
подключения к БД,
вывода списка таблиц,
вывода описания содержимого таблиц,
выхода из psql.

> Решение:
```yml
version: '3'

services:
  postgresql:
    container_name: postgre
    image: postgres:13
    environment:
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: admin
      POSTGRES_DB: test_database
      PGDATA: /data/postgres
    volumes:
       - ./postgres:/data/postgres
       - ./postgresback:/tmp/backup
    ports:
      - "5432:5432"

  pgadmin:
    container_name: pgadmin4_container
    image: dpage/pgadmin4
    restart: always
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@admin.com
      PGADMIN_DEFAULT_PASSWORD: admin
    ports:
      - "5050:80"
```
Подключаюсь  
> docker exec -it postgre psql -U admin -d test_database  

команды в субд  
- список бд это: \l[+] [PATTERN] list databases
- подключение к бд это: \c[onnect] {[DBNAME|- USER|- HOST|- PORT|-] | conninfo}
                         connect to new database (currently "test_database")
- вывод списка таблиц это: \d[S+] list tables, views, and sequences или \dt[S+] [PATTERN] list tables
- вывод описания списка таблиц это: \dS+ или \dtS+
- выход это: \q

### 2. Используя psql создайте БД test_database.
Используя psql, создайте БД test_database.  
Изучите бэкап БД.  
Восстановите бэкап БД в test_database.  
Перейдите в управляющую консоль psql внутри контейнера.
Подключитесь к восстановленной БД и проведите операцию ANALYZE для сбора статистики по таблице.  
Используя таблицу pg_stats, найдите столбец таблицы orders с наибольшим средним значением размера элементов в байтах.
Приведите в ответе команду, которую вы использовали для вычисления, и полученный результат.  

> Решение:  

> docker exec -it postgre psql -U admin -d test_database -f /tmp/backup/test_dump.sql  

> ANALYZE VERBOSE public.orders;
> 

>SELECT tablename, attname, avg_width FROM pg_stats WHERE tablename='orders' ORDER BY avg_width DESC LIMIT 1;
> 

### 3. Задача 3
Архитектор и администратор БД выяснили, что ваша таблица orders разрослась до невиданных размеров и поиск по ней занимает долгое время. Вам как успешному выпускнику курсов DevOps в Нетологии предложили провести разбиение таблицы на 2: шардировать на orders_1 - price>499 и orders_2 - price<=499.

Предложите SQL-транзакцию для проведения этой операции.

Можно ли было изначально исключить ручное разбиение при проектировании таблицы orders?

> Решение:
>
```
CREATE TABLE orders_1 (LIKE orders);
INSERT INTO orders_1 SELECT * FROM orders WHERE price > 499;
DELETE FROM orders WHERE price < 499;

```
````
CREATE TABLE orders_2 (LIKE orders);
INSERT INTO orders_2 SELECT * FROM orders WHERE price =< 499;
DELETE FROM orders WHERE price =< 499;
````
Ручное разбиение можно было исключить если заранее продумать архитектуру таблицы

### 4.Задача 4
Используя утилиту pg_dump, создайте бекап БД test_database.

Как бы вы доработали бэкап-файл, чтобы добавить уникальность значения столбца title для таблиц test_database?

> Решение:  

> резервируем роли:  
docker exec -it postgre pg_dumpall -U admin --roles-only -f /tmp/backup/roles.sql

>резервируем базу:  
docker exec -it postgre pg_dump -U admin -d test_database -f /tmp/backup/test_database_dump.sql

> использовать ограничения UNIQUE