﻿#language: ru

@tree

Функционал: Проверка расчета итогового количества в документе Заказ

Как Менеджер по продажам я хочу
Корректно заполнять документы Заказ 
чтобы фиксировать потребности клиентов 

Сценарий: Проверка расчета итогового количества
* Заполнение шапки документа
	И Заполнение шапки документа Заказ
* Заполнение табличной части документа
	Когда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И таблица "Список" содержит строки:
		| 'Наименование' | 'Код'       |
		| 'Торт'         | '000000032' |
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000032' | 'Торт '        |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '500,00'
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И таблица "Список" содержит строки:
		| 'Наименование' | 'Код'       |
		| 'Колбаса'      | '000000030' |
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000030' | 'Колбаса'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '300,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка итоговой суммы
	Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен '6'
		
	
		