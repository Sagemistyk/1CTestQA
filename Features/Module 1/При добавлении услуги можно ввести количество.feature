﻿#language: ru

@tree

Функционал: Проверка что при добавлении Услуги в документ Заказ в поле Количество можно ввести значение

Как <Роль> я хочу 
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание документа Заказ с добавлением услуги и значения в поле количество
* Проверка что выбранный из справочника элемент будет Услугой 
	И В командном интерфейсе я выбираю "Товарные запасы" "Товары"
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Code"      | "Description" |
		| "000000037" | "Доставка"    |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Доставка (Товар)"
	Тогда элемент формы с именем 'Вид' стал равен "Услуга"
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "Доставка (Товар) *" в течение 1 секунд
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Заказ (create)"
* Заполнение шапки документа
	И из выпадающего списка с именем 'Организация' я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем 'Покупатель' я выбираю точное значение "Мосхлеб ОАО"
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Малый"
	И из выпадающего списка с именем 'Валюта' я выбираю точное значение "Рубли"
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю точное значение "Доставка"
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "500,00"	
	Тогда элемент формы с именем 'Наименование' стал равен "Доставка"
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' я завершаю редактирование строки
* Запись документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (create) *" в течение 3 секунд