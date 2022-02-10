﻿#language: ru

@tree

Функционал: Проверка заполнения документа Заказ

Как Менеджер по продажам  я хочу
фиксировать потребности клиентов 
чтобы осуществлять продажи 

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
	 
Сценарий: Проверка заполнения документа Заказ
	* Открытие формы документа Заказ
		И я закрываю все окна клиентского приложения
		И В командном интерфейсе я выбираю 'Продажи' 'Заказ'
		Тогда открылось окно 'Заказ (создание)'
	* Добавление услуги в табличную часть
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
		И в таблице "Список" я перехожу к строке:
			| 'Код'       | 'Наименование' |
			| '000000038' | 'Ремонт'       |
		И в таблице "Список" я выбираю текущую строку
		И таблица "Товары" содержит строки:
			| 'Товар'  |
			| 'Ремонт' |
		И значение поля с именем "ТоварыИтогКоличество" содержит текст "1"
	* Проверка доступности поля количество
		// следующая строка почему-то не срабатывает
		И В таблице "Товары" поле "Количество" доступно не только для просмотра
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '100,00'
		И в таблице "Товары" я завершаю редактирование строки
			
		
				
		
						
						

