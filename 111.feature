﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 

Сценарий: тест
	И я удаляю переменную 'ВыбранныйТоварКоличество'	
	И я запоминаю значение поля "Количество" таблицы "Товары" как '$$ВыбранныйТоварКоличество$$'
	И я удаляю переменную 'ПродажнаяЦена'
	И я запоминаю значение поля "Цена" таблицы "Товары" как '$$ПродажнаяЦена$$'
	И в таблице "Товары" поле "Сумма" имеет значение '{Строка($$ПродажнаяЦена$$ * $$ВыбранныйТоварКоличество$$)}'