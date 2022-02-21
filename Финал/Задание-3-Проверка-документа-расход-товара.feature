﻿#language: ru

@tree
@ExportScenarios

Функционал: Проверка документа Расход (Продажа) товара

Как Менеджер по продажам я хочу
фиксировать факт продажи товара покупателю 
чтобы корректно отражались товарные остатки и финансовые результаты  

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

	
	
@critical
@Остатки
@Продажа
Сценарий: _3001 Открытие формы документа Продажи
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	И я нажимаю на кнопку с именем 'ФормаСоздать'

@critical
@Остатки
@Продажа
Сценарий: _3002 Заполнение шапки формы документа Продажи
	* Организация
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
		И значение поля "Организация" содержит текст 'ООО "1000 мелочей"'
	* Валюта
		И поле с именем "Валюта" отсутствует на форме
	* Покупатель
		И я нажимаю кнопку выбора у поля с именем "Покупатель"
		И таблица "Список" содержит строки:
			| 'Код'       | 'Наименование'           |
			| '000000016' | 'Магазин "Мясная лавка"' |
		И в таблице "Список" я перехожу к строке
			| 'Код'       | 'Наименование'           |
			| '000000016' | 'Магазин "Мясная лавка"' |
		И в таблице "Список" я выбираю текущую строку
		И значение поля "Покупатель" содержит текст 'Магазин "Мясная лавка"'
		И я удаляю переменную 'Покупатель'
		И я запоминаю значение поля "Покупатель" как "$$Покупатель$$"
	* Склад
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
		И значение поля "Склад" содержит текст 'Малый'
		И я удаляю переменную 'Склад'
		И я запоминаю значение поля "Склад" как "$$Склад$$"
	* Вид цен
		Если поле с именем "ВидЦен" имеет значение "" Тогда
			И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Мелкооптовая'
			И значение поля "ВидЦен" содержит текст 'Мелкооптовая'

@critical
@Остатки
@Продажа
Сценарий: _3003 Заполнение шапки формы документа Продажи валюта
	* Организация
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
		И значение поля "Организация" содержит текст 'ООО "Все для дома"'
	* Валюта
		И поле с именем "Валюта" присутствует на форме
		И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
		И значение поля с именем 'Валюта' содержит текст "Рубли"


@critical
@Остатки
@Продажа
Сценарий: _3004 Заполнение табличной части документа Продажи 
	* добавление строки товара
		И я удаляю переменную 'НомерДокумента'	
		И Я запоминаю в переменную "НашлиТовар" значение "Нет"
		И я запоминаю значение поля с именем "ТоварыИтогСумма" как "СуммаДокумента"
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
		И в таблице "Список" я перехожу к первой строке
	* Поиск товара с остатком
		И для каждой строки таблицы "Список" я выполняю:
			Если в таблице "Список" поле с именем "Количество" заполнено Тогда
				И я запоминаю значение поля "Количество" таблицы "Список" как "Остаток"
				Если выражение внутреннего языка 'Число($Остаток$)>0' Истинно Тогда
					И я удаляю переменную 'ПродажнаяЦена'
					И я удаляю переменную 'ВыбранныйТоварКод'
					И я удаляю переменную 'НачальныйОстаток'
					И я удаляю переменную 'ВыбранныйТоварНаименование'	
					И я запоминаю значение поля "Код" таблицы "Список" как "$$ВыбранныйТоварКод$$"
					И я запоминаю значение поля "Наименование" таблицы "Список" как "$$ВыбранныйТоварНаименование$$"
					И я запоминаю значение поля "Количество" таблицы "Список" как "$$НачальныйОстаток$$"
					И в таблице "Список" я выбираю текущую строку
					И Я запоминаю в переменную "НашлиТовар" значение 'Да'
					И я прерываю цикл
		Если '$НашлиТовар$ = "Нет"' Тогда
			И я вызываю исключение с текстом сообщения "Нет остатков для проверки документа расхода"
	* количество
		Если В таблице "Товары" поле "Количество" не заполнено Тогда
			И в таблице "Товары" в поле с именем 'Количество' я ввожу текст '1'
		И я удаляю переменную 'ВыбранныйТоварКоличество'	
		И я запоминаю значение поля "Количество" таблицы "Товары" как '$$ВыбранныйТоварКоличество$$'
	* цена
		Если В таблице "Товары" поле "Цена" не заполнено Тогда
			И в таблице "Товары" в поле с именем 'Цена' я ввожу текст '1000'
		И я удаляю переменную 'ПродажнаяЦена'
		И я запоминаю значение поля "Цена" таблицы "Товары" как '$$ПродажнаяЦена$$'
	* сумма в тч и документе
		И в таблице "Товары" поле "Сумма" имеет значение '{Формат(Число("$$ПродажнаяЦена$$") * Число("$$ВыбранныйТоварКоличество$$"), "ЧДЦ=2")}'
		И я удаляю переменную 'ВыбранныйТоварСумма'
		И я запоминаю значение поля с именем 'ТоварыСумма' таблицы 'Товары' как '$$ВыбранныйТоварСумма$$'
		И элемент формы с именем "ТоварыИтогСумма" стал равен '{Формат(Число("$СуммаДокумента$") + Число("$$ПродажнаяЦена$$") * Число("$$ВыбранныйТоварКоличество$$"), "ЧДЦ=0")}'
		И я удаляю переменную 'ДокументСумма'
		И я запоминаю значение поля с именем "ТоварыИтогСумма" как "$$ДокументСумма$$"
		
	* сохранение документа 
		И в таблице "Товары" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я запоминаю значение поля с именем "Номер" как "НомерДокумента" глобально
	
		
@critical
@Остатки
@Продажа
Сценарий: _3005 Проведение документа
	И я закрываю все окна клиентского приложения
	И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	И таблица "Список" содержит строки:
		| 'Номер'              |
		| '$$НомерДокумента$$' |
	И в таблице "Список" я перехожу к строке
		| 'Номер'              |
		| '$$НомерДокумента$$' |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ФормаПровести'
	И Пауза 10

			
@major
@Остатки
@Продажи
Сценарий: _3006 Проверка печатной формы Печать расходной накладной
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	И я жду когда в табличном документе "SpreadsheetDocument" заполнится ячейка "R1C2" в течение 10 секунд
	И табличный документ "SpreadsheetDocument" равен по шаблону:
		| 'Расход товара'                  | ''                                              | ''                                                         | ''                                                    |
		| ''                               | ''                                              | ''                                                         | ''                                                    |
		| 'Номер'                          | '$$НомерДокумента$$'                            | ''                                                         | ''                                                    |
		| 'Дата'                           | '*'                                             | ''                                                         | ''                                                    |
		| 'Покупатель'                     | '$$Покупатель$$'                                | ''                                                         | ''                                                    |
		| 'Склад'                          | '$$Склад$$'                                     | ''                                                         | ''                                                    |
		| 'Сумма'                          | '$$ДокументСумма$$*'                            | ''                                                         | ''                                                    |
		| 'Вес'                            | '*'                                             | ''                                                         | ''                                                    |
		| ''                               | ''                                              | ''                                                         | ''                                                    |
		| 'Товар'                          | 'Цена'                                          | 'Количество'                                               | 'Сумма'                                               |
		| '$$ВыбранныйТоварНаименование$$' | '{Формат(Число("$$ПродажнаяЦена$$"), "ЧДЦ=0")}' | '{Формат(Число("$$ВыбранныйТоварКоличество$$"), "ЧДЦ=0")}' | '{Формат(Число("$$ВыбранныйТоварСумма$$"), "ЧДЦ=0")}' |
	И я закрываю текущее окно
	
				
@major
@Остатки
@Продажи		
Сценарий: _3007 Проверка печатной формы заявка на доставку 				
	И я нажимаю на кнопку с именем 'ФормаОформитьДоставку'
	И я жду когда в табличном документе "ТабличныйДокумент" заполнится ячейка "R10C2" в течение 10 секунд
	И Табличный документ "ТабличныйДокумент" равен по шаблону:
		| 'Заявка на доставку товара'         | ''  |
		| ''                                  | ''  |
		| 'Прошу доставить товары по адресу:' | ''  |
		| ''                                  | ''  |
		| ''                                  | ''  |
		| 'Вес:'                              | ''  |
		| ''                                  | ''  |
		| 'Срок доставки:'                    | ''  |
		| 'Дата доставки'                     | ''  |
		| ''                                  | ''  |
		| 'Дата:'                             | '*' |
		| 'Подпись:'                          | ''  |
	И я закрываю текущее окно
			

@critical
@Взаиморасчеты
@Продажи		
Сценарий: _3008 Проверка движени по регистру взаиморасчетов с контрагентами				
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
	И таблица "Список" стала равной:
		| 'Номер строки' | 'Контрагент'     | 'Сумма'                                         | 'Валюта' |
		| '1'            | '$$Покупатель$$' | '{Формат(Число("$$ДокументСумма$$"), "ЧДЦ=2")}' | 'Рубли'  |
//	И я закрываю текущее окно
		
@critical
@Взаиморасчеты
@Продажи		
Сценарий: _3009 Проверка движени по регистру взаиморасчетов с контрагентами
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
	И таблица "Список" стала равной:
		| 'Номер строки' | 'Покупатель'     | 'Сумма'                                         | 'Товар'                          | 'Количество'                                               |
		| '1'            | '$$Покупатель$$' | '{Формат(Число("$$ДокументСумма$$"), "ЧДЦ=2")}' | '$$ВыбранныйТоварНаименование$$' | '{Формат(Число("$$ВыбранныйТоварКоличество$$"), "ЧДЦ=2")}' |
	
@critical
@Остатки
@Продажи		
Сценарий: _3010 Проверка движени по регистру товарных запасов
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
	И таблица "Список" стала равной:
		| 'Номер строки' | 'Склад'     | 'Товар'                          | 'Количество'                                               |
		| '1'            | '$$Склад$$' | '$$ВыбранныйТоварНаименование$$' | '{Формат(Число("$$ВыбранныйТоварКоличество$$"), "ЧДЦ=2")}' |
	И я закрываю текущее окно
		
				

	
	
								
	
