### 1.Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea.
>Решение:  
> Выполним команду: git show aefea 
 >> Получаем:
 >> + полный хэш коммита - aefead2207ef7e2aa5dc81a34aedf0cad4c32545 
>> + и коментарий коммита - Update CHANGELOG.md

### 2. Какому тегу соответствует коммит 85024d3?
>Решение:  
> Выполним команду - git show 85024d3
>> Получаем:
>> + v0.12.23 - тэг данного коммита


### 3.Сколько родителей у коммита b8d720? Напишите их хеши.
>Решение:  
> Выполним git show b8d720
>> Получим: 
>> + два хеша 56cd7859e0 9ea88f22fc

### 4. Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами v0.12.23 и v0.12.24.
> Решение:  
> Выполним: git log v0.12.23..v0.12.24
>>Получим:  
33ff1c03bb (tag: v0.12.24) v0.12.24  
b14b74c493 [Website] vmc provider links  
3f235065b9 Update CHANGELOG.md  
6ae64e247b registry: Fix panic when server is unreachable  
5c619ca1ba website: Remove links to the getting started guide's old location  
06275647e2 Update CHANGELOG.md  
d5f9411f51 command: Fix bug when using terraform login on Windows  
4b6d06cc5d Update CHANGELOG.md  
dd01a35078 Update CHANGELOG.md  
225466bc3e Cleanup after v0.12.23 release  

### 5. Найдите коммит в котором была создана функция func providerSource, ее определение в коде выглядит так func providerSource(...) (вместо троеточия перечислены аргументы).
>Решение:  
> Выполним поиск по событиям: git log -S 'func providerSource(' --oneline
>>Получим:
>> + 8c928e8358 main: Consult local directories as potential mirrors of providers

### 6. Найдите все коммиты в которых была изменена функция globalPluginDirs
>Решение:  
> + Выполним поиск и найдем директорию функции: git grep "globalPluginDirs"  
> + найдем историю: git log -L :'func globalPluginDirs':plugins.go --oneline



### 7. Кто автор функции synchronizedWriters
> Решение:  
> Выполним команду - git log -S 'func synchronizedWriters' --pretty=format:%H--%an--%ae
>> Получим: два хэша. посмотря оба коммита становится ясно что второй коомит удаляет функцию  
> а первый коммит создает 
>> 
>> + 5ac311e2a91e381e2f52234668b49ba670aa0fe5--Martin Atkins--mart@degeneration.co.uk
