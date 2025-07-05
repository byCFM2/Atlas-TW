#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Скрипт для исправления форматирования AtlasMaps.lua:
1. Разделяет слипшиеся строки
2. Удаляет строки с zoneId/locationId (числа > 1000) полностью
3. Удаляет только 3-й параметр из CreateNPCEntry с обычными ID
4. Удаляет 3-й и 4-й параметры из CreateEntry с EntityTypes.NPC
5. Удаляет 3-й и 4-й параметры из CreateEntry с EntityTypes.OBJECT
6. Удаляет 3-й и 4-й параметры из CreateEntry с EntityTypes.ZONE
7. Удаляет числовые ID из CreateIndentedNPCEntry
8. Удаляет числовые ID из CreateIndentedObjectEntry
"""

import re
import shutil
from pathlib import Path

def fix_atlas_maps(file_path):
    """Исправляет форматирование файла AtlasMaps.lua"""
    
    # Создаем резервную копию
    backup_path = str(file_path) + '.backup'
    shutil.copy2(str(file_path), backup_path)
    print(f"Создана резервная копия: {backup_path}")
    
    # Читаем файл
    with open(str(file_path), 'r', encoding='utf-8') as f:
        content = f.read()
    
    original_lines = len(content.splitlines())
    print(f"Исходное количество строк: {original_lines}")
    
    # 1. Разделяем слипшиеся строки
    # Ищем паттерны где после ), идет пробел и затем Create
    content = re.sub(r'(\),)\s+(Create)', r'\1\n            \2', content)
    
    # Дополнительно обрабатываем случаи где нет запятой
    content = re.sub(r'(\))\s+(Create)', r'\1,\n            \2', content)
    
    # Обрабатываем случаи entries = { Create...
    content = re.sub(r'(entries = \{)\s+(Create)', r'\1\n            \2', content)
    
    # 2. Обрабатываем строки с CreateNPCEntry
    lines = content.splitlines()
    new_lines = []
    
    for line in lines:
        # Удаляем строки с zoneId больше 1000 или любые строки с locationId
        if re.search(r'zoneId\s*=\s*\d+', line) or re.search(r'locationId\s*=\s*\d+', line):
            match_zone = re.search(r'zoneId\s*=\s*(\d+)', line)
            match_location = re.search(r'locationId\s*=\s*(\d+)', line)
            if (match_zone and int(match_zone.group(1)) > 1000) or match_location:
                continue
        
        # Проверяем CreateNPCEntry с zoneId или locationId - удаляем строку полностью
        if re.search(r'CreateNPCEntry\([^,]+,\s*"[^"]*",\s*\d+', line):
            # Проверяем, содержит ли строка zoneId или locationId (обычно это большие числа > 1000)
            match = re.search(r'CreateNPCEntry\([^,]+,\s*"[^"]*",\s*(\d+)', line)
            if match and int(match.group(1)) > 0:
                # Это zoneId или locationId - удаляем строку
                continue
            else:
                # Это обычный ID - удаляем только 3-й параметр
                line = re.sub(
                    r'CreateNPCEntry\(([^,]+),\s*("[^"]*"),\s*\d+([^)]*)\)',
                    r'CreateNPCEntry(\1, \2\3)',
                    line
                )
        
        # Обрабатываем CreateEntry с EntityTypes.NPC - удаляем 3-й и 4-й параметры
        if 'CreateEntry' in line and 'EntityTypes.NPC' in line:
            # Используем более гибкое регулярное выражение для захвата сложных строк
            # Ищем CreateEntry с любым содержимым до EntityTypes.NPC
            line = re.sub(
                r'CreateEntry\(([^,]+),\s*(.+?),\s*EntityTypes\.NPC,\s*\d+\)',
                r'CreateEntry(\1, \2)',
                line
            )
            # Обрабатываем случай с запятой в конце
            line = re.sub(
                r'CreateEntry\(([^,]+),\s*(.+?),\s*EntityTypes\.NPC,\s*\d+\),',
                r'CreateEntry(\1, \2),',
                line
            )
        
        # Обрабатываем CreateEntry с EntityTypes.OBJECT - удаляем 3-й и 4-й параметры
        if 'CreateEntry' in line and 'EntityTypes.OBJECT' in line:
            # Ищем CreateEntry с любым содержимым до EntityTypes.OBJECT
            line = re.sub(
                r'CreateEntry\(([^,]+),\s*(.+?),\s*EntityTypes\.OBJECT,\s*\d+\)',
                r'CreateEntry(\1, \2)',
                line
            )
            # Обрабатываем случай с запятой в конце
            line = re.sub(
                r'CreateEntry\(([^,]+),\s*(.+?),\s*EntityTypes\.OBJECT,\s*\d+\),',
                r'CreateEntry(\1, \2),',
                line
            )
        
        # Обрабатываем CreateEntry с EntityTypes.ZONE - удаляем 3-й и 4-й параметры
        if 'CreateEntry' in line and 'EntityTypes.ZONE' in line:
            # Ищем CreateEntry с любым содержимым до EntityTypes.ZONE
            line = re.sub(
                r'CreateEntry\(([^,]+),\s*(.+?),\s*EntityTypes\.ZONE,\s*\d+\)',
                r'CreateEntry(\1, \2)',
                line
            )
            # Обрабатываем случай с запятой в конце
            line = re.sub(
                r'CreateEntry\(([^,]+),\s*(.+?),\s*EntityTypes\.ZONE,\s*\d+\),',
                r'CreateEntry(\1, \2),',
                line
            )
        
        # Обрабатываем CreateIndentedNPCEntry - удаляем числовые ID
        if 'CreateIndentedNPCEntry' in line:
            line = re.sub(
                r'CreateIndentedNPCEntry\(("[^"]*(?:\\.[^"]*)*"),\s*\d+([^)]*)\)',
                r'CreateIndentedNPCEntry(\1\2)',
                line
            )
        
        # Обрабатываем CreateIndentedObjectEntry - удаляем числовые ID
        if 'CreateIndentedObjectEntry' in line:
            line = re.sub(
                r'CreateIndentedObjectEntry\(("[^"]*(?:\\.[^"]*)*"),\s*\d+([^)]*)\)',
                r'CreateIndentedObjectEntry(\1\2)',
                line
            )
        
        new_lines.append(line)
    
    content = '\n'.join(new_lines)
    
    # 3. Исправляем лишние запятые после удаления параметров
    content = re.sub(r'CreateNPCEntry\(([^,]+),\s*,', r'CreateNPCEntry(\1,', content)
    content = re.sub(r'CreateIndentedNPCEntry\(([^,]+),\s*,', r'CreateIndentedNPCEntry(\1,', content)
    content = re.sub(r'CreateEntry\(([^,]+),\s*,', r'CreateEntry(\1,', content)
    
    # 4. Убираем лишние запятые в конце вызовов функций
    content = re.sub(r'CreateNPCEntry\(([^)]+),\s*\)', r'CreateNPCEntry(\1)', content)
    content = re.sub(r'CreateIndentedNPCEntry\(([^)]+),\s*\)', r'CreateIndentedNPCEntry(\1)', content)
    content = re.sub(r'CreateEntry\(([^)]+),\s*\)', r'CreateEntry(\1)', content)
    
    # Записываем исправленный файл
    with open(str(file_path), 'w', encoding='utf-8') as f:
        f.write(content)
    
    final_lines = len(content.splitlines())
    print(f"Итоговое количество строк: {final_lines}")
    print(f"Изменение: {final_lines - original_lines:+d} строк")
    
    return final_lines - original_lines

if __name__ == '__main__':
    atlas_file = Path('AtlasMaps.lua')
    
    if not atlas_file.exists():
        print(f"Файл {atlas_file} не найден!")
        exit(1)
    
    print("Исправление форматирования AtlasMaps.lua...")
    lines_changed = fix_atlas_maps(atlas_file)
    
    if lines_changed > 0:
        print(f"✓ Успешно добавлено {lines_changed} строк (разделены слипшиеся строки)")
    elif lines_changed < 0:
        print(f"✓ Успешно удалено {abs(lines_changed)} строк")
    else:
        print("✓ Файл не изменился")
    
    print("\nИсправления:")
    print("- Разделены слипшиеся строки")
    print("- Удалены строки с zoneId/locationId (> 1000)")
    print("- Удалены 3-й параметр из CreateNPCEntry")
    print("- Удалены 3-й и 4-й параметры из CreateEntry с EntityTypes.NPC")
    print("- Удалены 3-й и 4-й параметры из CreateEntry с EntityTypes.OBJECT")
    print("- Удалены 3-й и 4-й параметры из CreateEntry с EntityTypes.ZONE")
    print("- Удалены числовые ID из CreateIndentedNPCEntry")
    print("- Удалены числовые ID из CreateIndentedObjectEntry")
    print("\nГотово!")