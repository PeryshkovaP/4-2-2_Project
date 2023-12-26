# Коллективный проект команды 4-2-2 на тему "Прогнозирование сердечной недостаточности"

Данный проект создан для того, чтобы создать базу данных в сфере прогнозирования сердечной недостаточности.

## Описание проекта

CSV файл по данной теме - [Kaggle](https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction)

### Структура
>В данном датасете собраны данные по прогнозированию сердечной недостаточности, а именно различные медицинские данные пациентов. Туда включена информация о всевозможных характеристиках, такие как возраст, пол, характер боли в грудной клетке,
>артериальное давление в состоянии покоя, показатели холестерина и сахара в крови, результаты электрокардиограммы, максимально достигаемый сердченый ритм, стенокардия и, в конечном итоге, диагноз.

### Реализация
>Данный датасет можно использовать для машинного обучения, в результате которого возможно прогнозирование сердечной недостаточности на основе предоставленных данных. К примеру, это будет эффективно для медицинских сотрудников, т.к.
>могут обнаружить сердечно-сосудистое заболевания и оказать своевременную помощь. Также это можно использовать для сопоставления статистических данных о том, в каком возрасте проявляется сердечная недостаточность, частота проявления
>среди людей разного пола и другие возможные сравнения и закономерности.

## Процесс создания коллективного проекта

### Создание базы данных
>

### Создание ER-диаграммы
>Схема «сущность-связь» (также ERD или ER-диаграмма) — это разновидность блок-схемы, где показано, как разные атрибуты связаны между собой внутри системы. ER-диаграммы чаще всего применяются для проектирования и отладки реляционных баз данных в сфере образования, исследования и разработки программного обеспечения и информационных систем для бизнеса. ER-диаграмма создается на основании базы данных, а именно по написанному ранее скрипту.

Для этого в MYSQL Workbench нужно сверху слева нажать на окошко Database--->Reverse Engineer...--->далее появится окошко с параметрами, нужно нажать Next-->в окошке появится выбор по какой базе данных создать таблицы Select Schemas to Reverse Engineer, выбираем нужную нам схему(в нашем случае это heart)-->Finish-->таблицы создались, но без связи. Для их построения мы используем связь 1:n, нажимаем на нужный нам атрибут в первой таблице и соединяем(нажатием на атрибуты) со второй таблицей. 
![Alt text](image.png)

Связь между двумя таблицами задается через соответствие PK в одной таблице FK во второй. Можно сказать, FK в одной таблице – это один или несколько столбцов, значения которых соответствуют PK в другой таблице. В нашем случае первичным ключом(Primary Key, PK) является id пациента в таблице patients, а внешним ключом(Foreign Key, FK) id в таблице medicalexam

### Нормализация данных
>Сама по себе нормализация данных означает организацию таблиц и их атрибутов таким образом, чтобы минимизировать избыточность данных и избежать аномалий при обновлении, вставке или удалении записей. Это включает разделение таблиц на более мелкие и более логически связанные сущности, чтобы уменьшить дублирование данных и повысить эффективность хранения и обработки информации.

Существует несколько нормальных форм (НФ):
1. Первая нормальная форма: не должно быть повторяющихся или многозначных данных в каждой строке таблицы (в каждом столбце должно храниться уникальное значение)
Если рассматривать это в контексте нашей базы данных, то 1НФ соблюдается: у нас отсутствуют повторяющиеся строки, все атрибуты простые(т.е. каждый столбец имеет простой тип) и в каждой строке хранится единственное значение 

2. Вторая нормальная форма: таблица должна быть в 1НФ, и каждый неключевой атрибут должен полностью зависеть от ключа таблицы (устранение частичных функциональных зависимостей)
2НФ у нас также  соблюдается: в таблице patients ключом является id пациента, все атрибуты(пол и возраст) зависят от этого ключа полностью.
в таблице medicalexam всё аналогично

3. Третья нормальная форма: Для достижения 3НФ таблица должна быть в 2НФ, и каждый неключевой атрибут должен быть непосредственно зависеть от первичного ключа(устранение транзитивные функциональные зависимости между атрибутами)

В обеих наших таблицах транзитивные функциональные зависимости устранены, то есть каждый атрибут зависит исключительно от первичного ключа(id)
База данных считается нормализованной, если достигнуты 3НФ – в нашей БД это условие выполняется, также мы разделили данные на две таблицы: этого можно было и не делать, но мы сделали это для более компактного представления наших данных

Если говорить про дополнительные НФ, их выделяют ещё три:
4. Нормальная форма Бойса-Кодда: Это расширение третьей нормальной формы, при котором все реляционные таблицы могут быть идентифицированы с помощью одного первичного ключа из главной таблицы.

5. Четвертая нормальная форма и пятая нормальная форма: если нет многозначных зависимостей от первичного ключа, и если данные не могут быть разделены на несколько таблиц без потери данных.


### Заполнение БД данными
>

## Дополнительные задачи

### Web-сервер [db4free.net](https://db4free.net/)
>
1. Изначально нам необходимо зарегистрироваться на сайте db4free.net
2. После регистрации мы переходим во вкладку phpMyAdmin и авторизуемся
3. Начинаем выгрузку данных. Изначально импортируем наш CSV файл, затем - пишем SQL-скрипт. CSV файл импортируется, таблицы создаются, а вот с заполнением с помощью нашего CSV файла возникли некоторые проблемы - решить их мы не смогли
![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/146061871/66c3e13a-f523-4b34-bf22-c3a3fcffabce)
4. Если говорить о том, можем ли мы запустить нашу БД через visual code - всё запускается
![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/146061871/3a47752d-ae09-42b4-b42d-4b824dc347c4)

### Визуализация данных в Python
>


## Участники проекта 

* [Перышкова Полина Сергеевна](https://github.com/PeryshkovaP)

    - [x] Распределение задач между участниками проекта;
    - [ ] Отслеживание прогресса выполнения задач;
    - [x] Создание коллективного проекта с доступом на редактирование;
    - [ ] Визуализация данных в Python;
    - [ ] Тестирование и проверка выполнения задач.
    
* [Рычкова Алена Сергеевна](https://github.com/aaalenushkaa)
  
    - [ ] Развернуть базу данных на web-сервере [db4free.net](https://db4free.net/);
    - [x] Создание ER-диаграммы;
    - [x] Нормализация данных БД.
   
* [Теницкая Вероника Юрьевна](https://github.com/tenitskayav)
  
    - [x] Заполнение БД данными;
    - [x] Тестирование БД.

* [Николаева Софья Сергеевна](https://github.com/sofya365)

    - [x] Создание БД и ее ER-диаграммы;
    - [x] Проверка заполнения данных.






