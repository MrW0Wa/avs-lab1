#!/bin/bash

mkdir -p ~/lab0
cd ~/lab0
git init

#!/bin/bash

cd ~/lab0

# Создание каталогов
mkdir -p claude_monet/kitchen/hot_station
mkdir -p claude_monet/kitchen/cold_station
mkdir -p claude_monet/freezer
mkdir -p claude_monet/pantry
mkdir -p claude_monet/chef_office
mkdir -p claude_monet/staff_room

# Создание файлов с содержимым
echo 'Говядина для фирменного блюда получена
Сеня проверил мясо перед сменой
Одна упаковка колбасок оставлена на завтра' > claude_monet/kitchen/hot_station/senya_inventory

echo 'Телятина для шефа
Фарш для котлет
Курица для банкета
Заказ должен принять Сеня' > claude_monet/kitchen/hot_station/meat_order

echo 'Сибас доставлен утром
Федя проверил рыбный холодильник
Дорадо осталось четыре штуки' > claude_monet/kitchen/cold_station/fedya_inventory

echo 'Лосось для холодной закуски
Тунец для специального заказа
Рыбные продукты передать Феде' > claude_monet/kitchen/cold_station/fish_order

echo 'Две утки для блюда Баринова
Коробка замороженных овощей
Запас мяса для большой компании' > claude_monet/freezer/reserve_list

echo 'Пропала упаковка дорогих колбасок
Не найден сыр из новой поставки
Сеня и Федя обещали всё объяснить
Баринов требует отчёт до открытия' > claude_monet/pantry/missing_products

echo 'Сеня снова устроил розыгрыш на кухне
Федя помог спрятать продукты
Лёва должен проверить оба цеха
Шеф ждёт объяснительные после смены' > claude_monet/chef_office/barinov_report

echo 'Переставить коробки в кладовой
Сказать Лёве что поставку отменили
Успеть всё вернуть до прихода Баринова' > claude_monet/staff_room/prank_plan

echo 'Лёва заметил беспорядок в кладовой
Записи с кухни переданы шефу
Сеня и Федя останутся после смены' > claude_monet/staff_room/leva_warning

echo 'Вечерняя смена началась спокойно
На кухне обнаружилась пропажа продуктов
Баринов вызвал Сеню и Федю в кабинет' > evening_incident

# Установка прав доступа
chmod u=rwx,g=rx,o=rx claude_monet
chmod 750 claude_monet/kitchen
chmod u=rwx,g=rwx,o= claude_monet/kitchen/hot_station
chmod 640 claude_monet/kitchen/hot_station/senya_inventory
chmod u=rw,g=r,o=r claude_monet/kitchen/hot_station/meat_order
chmod 750 claude_monet/kitchen/cold_station
chmod u=rw,g=r,o= claude_monet/kitchen/cold_station/fedya_inventory
chmod 644 claude_monet/kitchen/cold_station/fish_order
chmod u=rwx,g=rx,o= claude_monet/freezer
chmod 600 claude_monet/freezer/reserve_list
chmod 750 claude_monet/pantry
chmod u=rw,g=r,o= claude_monet/pantry/missing_products
chmod 710 claude_monet/chef_office
chmod u=r,g=r,o= claude_monet/chef_office/barinov_report
chmod u=rwx,g=rx,o= claude_monet/staff_room
chmod 600 claude_monet/staff_room/prank_plan
chmod u=r,g=r,o= claude_monet/staff_room/leva_warning
chmod 644 evening_incident

# Первый коммит
git status
git add .
git commit -m "создано дерево файлов и выдача прав"
git push https://github.com/MrW0Wa/avs-lab1.git master

# Копирование, перемещение и создание ссылок
cp claude_monet/chef_office/barinov_report claude_monet/staff_room/shift_order

cp -R claude_monet/kitchen/cold_station claude_monet/staff_room/cold_backup

ln -s ../pantry/missing_products claude_monet/chef_office/product_loss

ln -s claude_monet/kitchen kitchen_work

ln evening_incident claude_monet/kitchen/incident_copy

cat claude_monet/kitchen/hot_station/senya_inventory claude_monet/kitchen/cold_station/fedya_inventory > claude_monet/kitchen/total_inventory

cat claude_monet/staff_room/leva_warning >> evening_incident

mv claude_monet/staff_room/prank_plan claude_monet/chef_office/senya_explanation

# Второй коммит и публикация
git status
git add .
git commit -m "Выполнены копирование, перемещение и создание ссылок"
git push https://github.com/MrW0Wa/avs-lab1.git master

# Поиск, фильтрация и обработка данных

# Задание 4.1
ls -lR . | grep '^-' | grep -v '_copy$' | sort -k5,5n | tail -n 4

# Задание 4.2
grep -rhiE --exclude-dir=.git 'сеня|федя' . | grep -v 'Баринов' | sort | head -n 6

# Задание 4.3
grep -il 'рыб' claude_monet/kitchen/cold_station/* claude_monet/staff_room/cold_backup/* | wc -l

# Задание 4.4
tail -q -n 2 claude_monet/kitchen/hot_station/*_inventory claude_monet/kitchen/cold_station/*_inventory | grep -iE 'проверил|оста' | sort -r

# Задание 4.5
grep -vE 'Сеня|Федя' claude_monet/kitchen/total_inventory | sort -r | head -n 3 | wc -w

# Задание 4.6
ls -lR . | grep '^l' | sort -k9,9r

# Задание 4.7
grep -hiE 'кух|шеф' claude_monet/chef_office/barinov_report claude_monet/staff_room/shift_order claude_monet/staff_room/leva_warning | grep -iv 'после' | sort -r | wc -w

# Удаление файлов, ссылок и каталогов
rm -f claude_monet/chef_office/barinov_report
rm claude_monet/chef_office/product_loss
rm kitchen_work
rm evening_incident
rm claude_monet/kitchen/incident_copy
rm claude_monet/freezer/reserve_list
rmdir claude_monet/freezer
rm -r claude_monet/staff_room/cold_backup

# Третий коммит и публикация
git status
git add .
git commit -m "Выполнены поиск, фильтрация и удаление по заданию"
git push https://github.com/MrW0Wa/avs-lab1.git master
