#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Скрипт для замены ID на имена существ и предметов в файле DONT_USE_itemsloot.lua
"""

import re
import os

def parse_lua_table(file_path, table_name):
    """
    Парсит Lua таблицу и возвращает словарь ID -> название
    """
    data = {}
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Ищем строки вида [ID] = "название"
    pattern = r'\[(\d+)\]\s*=\s*"([^"]+)"'
    matches = re.findall(pattern, content)
    
    for match in matches:
        item_id = int(match[0])
        name = match[1]
        data[item_id] = name
    
    return data

def replace_ids_in_content(content, units_data, items_data):
    """
    Заменяет ID на имена в зависимости от контекста:
    - Ключи верхнего уровня (предметы) заменяются на названия предметов
    - ID в блоках ["V"], ["U"], ["O"], ["R"] заменяются на имена существ
    """
    lines = content.split('\n')
    result_lines = []
    
    for line in lines:
        # Проверяем, является ли это ключом верхнего уровня (предмет)
        item_match = re.match(r'^\s*\[(\d+)\]\s*=\s*\{', line)
        if item_match:
            item_id = int(item_match.group(1))
            item_name = items_data.get(item_id, f"Unknown_Item_{item_id}")
            # Экранируем кавычки и специальные символы
            item_name = item_name.replace('\\', '')
           # item_name = item_name.replace('"', '\\"')
          #  item_name = item_name.replace("'", "\\'")
            new_line = line.replace(f'[{item_id}]', f'["{item_name}"] --{item_id}')
            result_lines.append(new_line)
            continue
        
        # Проверяем, является ли это ID существа в блоке
        creature_match = re.match(r'^(\s*)\[(\d+)\]\s*=\s*(.+)$', line)
        if creature_match:
            indent = creature_match.group(1)
            creature_id = int(creature_match.group(2))
            value = creature_match.group(3)
            
            # Получаем название существа
            creature_name = units_data.get(creature_id, f"Unknown_Creature_{creature_id}")
            # Экранируем кавычки и специальные символы
            creature_name = creature_name.replace('\\', '')
           # creature_name = creature_name.replace('"', '\\"')
           # creature_name = creature_name.replace("'", "\\'")
            
            new_line = f'{indent}["{creature_name}"] = {value} --{creature_id}'
            result_lines.append(new_line)
            continue
        
        # Если строка не подходит под паттерны, оставляем как есть
        result_lines.append(line)
    
    return '\n'.join(result_lines)

def main():
    # Пути к файлам
    base_path = r"c:\Users\Vitali\Documents\Trae\WOW\Atlas-TW"
    itemsloot_file = os.path.join(base_path, "DONT_USE_itemsloot.lua")
    units_file = os.path.join(base_path, "DONT_USE_unitsname.lua")
    items_file = os.path.join(base_path, "DONT_USE_items.lua")
    output_file = os.path.join(base_path, "itemsloot_with_names.lua")
    
    print("Загружаем данные о существах...")
    units_data = parse_lua_table(units_file, "units")
    print(f"Загружено {len(units_data)} существ")
    
    print("Загружаем данные о предметах...")
    items_data = parse_lua_table(items_file, "items")
    print(f"Загружено {len(items_data)} предметов")
    
    print("Читаем файл itemsloot...")
    with open(itemsloot_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    print("Заменяем ID на имена...")
    new_content = replace_ids_in_content(content, units_data, items_data)
    
    print("Сохраняем результат...")
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print(f"Готово! Результат сохранен в {output_file}")

if __name__ == "__main__":
    main()