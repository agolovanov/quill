#!/bin/bash

cat ../quill3d-conf/quill.conf"$1" | sed -e 's/#\(.*\)$//;s/\s//g;/^$/d;s/$/\n$/;s/=[+-]\?[0-9]*\(.[0-9]\+\)\?\(e[+-]\?[0-9]\+\)\?/&\n/;s/=/\n/' | sed -e 's/^$/#/;$a\$'

# Содержание строк после '#' удаляется
# Пробелы удаляются
# Пустые строки удаляются
# После каждой строки добавляется строка с символом '$'
# После '=[число]' (в качестве числа может использоваться в том числе
# запись вида +1.2e-5) вставляется переход на новую
# строку
# Вместо '=' вставляется переход на новую строку
# В пустые строки добавляется символ "#"
# В конец потока добавляется символ '$'

# Таким образом, строка вида 'имя = [значение] [размерность]'
# превращается в четыре строки:
# имя
# [значение]
# [размерность]
# $
# Если [значение] и/или [размерность] не указаны, то вместо них
# пишется символ "#"
