#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Заполнение шапки документа Заказ

Как Менеджер по продажам я хочу
формировать документ Заказ 
чтобы фиксировать потребности клиентов

Контекст: 
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

@ТипШага: Заполнение шапки документа Заказ
@Описание: Экспортный сценарий заполнения шапки заказа
@ПримерИспользования: И Заполнение шапки документа Заказ


Сценарий: Заполнение шапки документа Заказ
* Открыти формы нового документа	
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки	
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И таблица "Список" содержит строки:
		| 'Код'       | 'Наименование'    |
		| '000000015' | 'Магазин "Обувь"' |
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'    |
		| '000000015' | 'Магазин "Обувь"' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Средний'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'


