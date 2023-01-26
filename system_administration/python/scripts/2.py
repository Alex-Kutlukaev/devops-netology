#!/usr/bin/env python3

import os

path = input("Введите путь: ")

bash_command = [f"cd {path}", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
for result in result_os.split('\n'):
    if result.find('изменено') != -1:
        prepare_result = result.replace('\tизменено:      ', '')
        print(os.path.abspath(prepare_result))
