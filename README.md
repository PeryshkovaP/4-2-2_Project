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
>Схема «сущность-связь» (также ERD или ER-диаграмма) — это разновидность блок-схемы(графическая модель), где показано, как разные атрибуты связаны между собой внутри системы. ER-диаграммы чаще всего используются для визуализации и описания структуры и связей между сущностями в базе данных. ER-диаграмма создается на основании базы данных, а именно по написанному ранее скрипту.

Для этого в MYSQL Workbench нужно сверху слева нажать на окошко Database--->Reverse Engineer...--->далее появится окошко с параметрами, нужно нажать Next-->в окошке появится выбор по какой базе данных создать таблицы Select Schemas to Reverse Engineer, выбираем нужную нам схему(в нашем случае это heart)-->Finish-->таблицы создались, но без связи. Для их построения мы используем связь 1:n, нажимаем на нужный нам атрибут в первой таблице и соединяем(нажатием на атрибуты) со второй таблицей. 
![image](https://psv4.userapi.com/c909218/u275446108/docs/d58/3b5d10cea631/Snimok_ekrana_2023-12-26_190537.png?extra=nTFrqY7ziKR-uo6jlfwqM5OHycy9jAaY9-N5HefngOedg71Ooo9adeo5dDcPz5FhTOIBsm0ueyPNfIsKig7-dqBQPf9KoOxxbjutU3aT-1UIAw9-IG9oQCC37desWQSXmlufMxJEnKS_D-NaqcSwhW5uug)

Связь между двумя таблицами задается через соответствие PK в одной таблице FK во второй. Можно сказать, FK в одной таблице – это один или несколько столбцов, значения которых соответствуют PK в другой таблице. В нашем случае первичным ключом(Primary Key, PK) является id пациента в таблице patients, а внешним ключом(Foreign Key, FK) id в таблице medicalexam.

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
1. Сначала, для импорта данных, мы добавляем csv-файл "heart" в папку, где содержится скрипт создания нашей базы данных.
2. Потом мы создаем таблицу "dataset", в которой будут содержаться все колонки из исходного csv-файла.![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/146061871/b4c18fe8-10a1-4eb2-99fd-13c2c83b3f0d)
3. Далее пишем скрипт выгрузки данных из файла "heart.csv" в таблицу "dataset".
![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/146061871/aa8fa967-590f-4f3a-9b70-3c9f9ae36c79)
4. Затем мы удаляем таблицы "patients" и "medicalexam" из нашей бд и создаем их снова, но не включаем в них столбцы "id". Поочередно заполняем таблицы данными, использую копирование данных из таблицы "dataset".
![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/146061768/703430c7-619f-4e44-95d5-3a52ac7670fc)
5. После импорта данных, добавляем в наши таблицы поле "id" и первичный ключ.

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

> Мы будем визуализировать данные в Google Colab с использованием нескольких библиотек и нашего файла heart.csv

Для начала нам необходимо импортировать библиотеки, которые могут пригодиться для дальнейшей визуализации

Коротко об каждой библиотеке:
* pandas - это библиотека Python для обработки и анализа структурированных данных, в нашем случае мы будем работать с файлом формата csv: heart.csv;
* matplotlib.pyplot - это библиотека на языке Python для визуализации данных. В ней можно построить двумерные (плоские) и трехмерные графики;
* math - это модуль предоставляет обширный функционал для работы с числами;
* seaborn -  библиотека для создания статистических графиков на Python. Она построена на основе matplotlib и тесно интегрируется со структурами данных pandas;
* plotly.express - библиотека для визуализации данных.

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/9ea0aa77-8454-4c16-b25a-d50b2f216f4b)

Для того, чтобы нам работать с файлом, необходимо его загрузить в Google Colab.

1. Заходим в раздел "Файлы"
 
![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/f3f23d8f-3a92-4e05-ab17-33fed3ea8866)

2. Нажимаем "Загрузить в сессионное хранилище"

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/9484ce5a-7ea9-4501-be68-a1b89a37b287)

3. Откроется проводник с файлами. Нам необходимо выбрать файл heart.csv

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/12ef2ead-90ce-49f4-ac3c-25b566ad0616)

4. Нажимаем "Открыть". Теперь наш файл загружен в Google Colab и с ним можно работать

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/d8c37361-c1fd-47ac-b625-a6671db1ace0)

Теперь можно открыть наш csv при помощи библиотеки pandas. Выведем первые 5 строчек.

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/3efaaf0a-8faf-46ba-89ec-4c9890c15a72)

Также я записала информацию о каждой колонке, чтобы иметь представление о том, какие данные включает в себя этот файл

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/3970d583-e788-4e19-8ae3-8393fdf4cd2e)



## Участники проекта 

* [Перышкова Полина Сергеевна](https://github.com/PeryshkovaP)

    - [x] Распределение задач между участниками проекта;
    - [x] Отслеживание прогресса выполнения задач;
    - [x] Создание коллективного проекта с доступом на редактирование;
    - [x] Визуализация данных в Python;
    - [x] Тестирование и проверка выполнения задач.
    
* [Рычкова Алена Сергеевна](https://github.com/aaalenushkaa)
  
    - [x] Развернуть базу данных на web-сервере [db4free.net](https://db4free.net/);
    - [x] Создание ER-диаграммы;
    - [x] Нормализация данных БД.
   
* [Теницкая Вероника Юрьевна](https://github.com/tenitskayav)
  
    - [x] Заполнение БД данными;
    - [x] Тестирование БД.

* [Николаева Софья Сергеевна](https://github.com/sofya365)

    - [x] Создание БД и ее ER-диаграммы;
    - [x] Проверка заполнения данных.






