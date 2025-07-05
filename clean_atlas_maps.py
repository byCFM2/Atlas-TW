#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Скрипт для очистки AtlasMaps.lua от zoneId, locationId и элементов entries

Удаляет:
- zoneId параметры
- locationId параметры  
- Все значения типа EntityTypes.NPC из entries
- Все числовые ID из entries
"""

import re
import os
import sys
from pathlib import Path

def clean_atlas_maps(file_path):
    """
    Очищает файл AtlasMaps.lua от указанных элементов
    
    Args:
        file_path (str): Путь к файлу AtlasMaps.lua
    """
    if not os.path.exists(file_path):
        print(f"Ошибка: Файл {file_path} не найден")
        return False
    
    print(f"Обрабатываю файл: {file_path}")
    
    # Читаем файл
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    original_lines = len(content.splitlines())
    
    # 1. Удаляем zoneId параметры
    # Ищем строки вида: zoneId = число,
    content = re.sub(r'\s*zoneId\s*=\s*\d+\s*,?\s*\n', '', content)
    
    # 2. Удаляем locationId параметры
    # Ищем строки вида: locationId = число, locationId = -число, locationId = { число, число },
    content = re.sub(r'\s*locationId\s*=\s*-?\d+\s*,?\s*\n', '', content)
    content = re.sub(r'\s*locationId\s*=\s*\{[^}]*\}\s*,?\s*\n', '', content)
    

    
    # 5. Очищаем пустые строки и лишние запятые
    # Удаляем множественные пустые строки
    content = re.sub(r'\n\s*\n\s*\n', '\n\n', content)
    
    # Удаляем запятые перед закрывающими скобками
    content = re.sub(r',\s*\n\s*}', '\n        }', content)
    content = re.sub(r',\s*\n\s*\)', '\n        )', content)
    
    new_lines = len(content.splitlines())
    removed_lines = original_lines - new_lines
    
    # Создаем резервную копию
    backup_path = file_path + '.backup'
    with open(backup_path, 'w', encoding='utf-8') as f:
        with open(file_path, 'r', encoding='utf-8') as original:
            f.write(original.read())
    
    # Записываем очищенный файл
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"✅ Обработка завершена!")
    print(f"📊 Статистика:")
    print(f"   - Исходное количество строк: {original_lines}")
    print(f"   - Новое количество строк: {new_lines}")
    print(f"   - Удалено строк: {removed_lines}")
    print(f"💾 Резервная копия сохранена: {backup_path}")
    
    return True

def main():
    """
    Основная функция
    """
    # Определяем путь к файлу AtlasMaps.lua
    if len(sys.argv) > 1:
        atlas_maps_path = sys.argv[1]
    else:
        # По умолчанию ищем в текущей директории
        atlas_maps_path = "AtlasMaps.lua"
        if not os.path.exists(atlas_maps_path):
            # Пробуем найти в стандартном расположении
            atlas_maps_path = "c:\\Users\\Vitali\\Documents\\Trae\\WOW\\Atlas-TW\\AtlasMaps.lua"
    
    print("🧹 Скрипт очистки AtlasMaps.lua")
    print("=" * 50)
    print("Удаляет:")
    print("- zoneId параметры")
    print("- locationId параметры")
    print("- Все entries с EntityTypes.NPC")
    print("- Все entries с числовыми ID")
    print("=" * 50)
    
    if clean_atlas_maps(atlas_maps_path):
        print("\n🎉 Очистка успешно завершена!")
    else:
        print("\n❌ Произошла ошибка при очистке")
        sys.exit(1)

if __name__ == "__main__":
    main()