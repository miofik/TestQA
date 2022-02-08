﻿#language: ru

@tree

Функционал: Проверка отчета D2001 Продажи

Как Тестировщик я хочу
чтобы отчет по продажам корректно отображал возвраты
чтобы пользователи могли получать актуальные данные по продажам

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий


Сценарий: Проверка отчета D2001 Продажи	
	И я закрываю все окна клиентского приложения
	И я перехожу по навигационной ссылке "e1cib/app/Report.D2001_Sales"
	Когда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormChangeVariant'
	Тогда открылось окно 'Вариант "Default" отчета "D2001 Продажи"'
	И я перехожу к закладке с именем "FilterPage"
	И в таблице "SettingsComposerSettingsFilterFilterAvailableFields" я перехожу к строке:
		| 'Доступные поля' |
		| 'Количество'     |
	И в таблице "SettingsComposerSettingsFilterFilterAvailableFields" я выбираю текущую строку
	И в таблице "SettingsComposerSettingsFilter" я активизирую поле с именем "SettingsComposerSettingsFilterComparisonType"
	И в таблице "SettingsComposerSettingsFilter" я выбираю текущую строку
	И в таблице "SettingsComposerSettingsFilter" из выпадающего списка с именем "SettingsComposerSettingsFilterComparisonType" я выбираю точное значение 'Меньше'
	И в таблице "SettingsComposerSettingsFilter" я активизирую поле с именем "SettingsComposerSettingsFilterRightValue"
	И в таблице "SettingsComposerSettingsFilter" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'FormEndEdit'
	Тогда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "R2C1" в течение 20 секунд
	Тогда табличный документ "Result" равен:
		| 'Параметры:'               | 'Период: 01.02.2022 - 28.02.2022'                                                            | ''        | ''                  | ''             |
		| 'Отбор:'                   | 'Вид мультивалютной аналитики Равно "en наименование не заполнено" И\nКоличество Меньше "0"' | ''        | ''                  | ''             |
		| ''                         | ''                                                                                           | ''        | ''                  | ''             |
		| 'Период, месяц'            | 'Итого'                                                                                      | ''        | ''                  | ''             |
		| 'Номенклатура'             | ''                                                                                           | ''        | ''                  | ''             |
		| 'Характеристика'           | 'Количество'                                                                                 | 'Сумма'   | 'Сумма без налогов' | 'Сумма скидки' |
		| 'Март 2021'                | '-2,000'                                                                                     | '-680,00' | '-566,66'           | ''             |
		| 'Товар с характеристиками' | '-1,000'                                                                                     | '-190,00' | '-158,33'           | ''             |
		| 'S/Красный'                | '-1,000'                                                                                     | '-190,00' | '-158,33'           | ''             |
		| 'Товар без характеристик'  | '-1,000'                                                                                     | '-490,00' | '-408,33'           | ''             |
		| 'Товар без характеристик'  | '-1,000'                                                                                     | '-490,00' | '-408,33'           | ''             |
		| 'Итого'                    | '-2,000'                                                                                     | '-680,00' | '-566,66'           | ''             |
	
			

