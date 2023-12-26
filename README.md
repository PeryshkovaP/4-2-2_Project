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
>Создание базы данных – не самый сложный процесс, если действовать последовательно. Заострим внимание на формирование пустой БД. Данный вариант предусматривает два способа реализации – через специализированный язык, а также при помощи встроенного графического интерфейса.

1. CREATE DATABASE IF NOT EXISTS heart /!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci / /!80016 DEFAULT ENCRYPTION='N' /; - Эта команда создает базу данных с именем "heart", если она еще не существует. Указаны дополнительные параметры, такие как набор символов и кодировка.

2. USE heart; - Эта команда выбирает базу данных "heart" для выполнения всех последующих команд.

3. CREATE TABLE IF NOT EXISTS patients (...) - Эта команда создает таблицу "patients" с тремя столбцами: "id" (целое число, основной ключ с автоинкрементом), "age" (целое число, обязательное поле) и "sex" (строка, обязательное поле).

4. CREATE TABLE IF NOT EXISTS medicalexam (...) - Эта команда создает таблицу "medicalexam" с несколькими столбцами: "id" (целое число, ссылается на столбец "id" в таблице "patients"), "ChestPainType" (строка, обязательное поле), "RestingBP" (целое число, обязательное поле), "Cholesterol" (целое число, обязательное поле), и другими столбцами, которые указывают различные характеристики медицинского обследования.

5. INSERT INTO patients(...) VALUES (...) - Эта команда вставляет одну строку данных в таблицу "patients" со значениями заданными в скобках.

6. INSERT INTO medicalexam(...) VALUES (...) - Эта команда вставляет одну строку данных в таблицу "medicalexam" со значениями заданными в скобках.
Пункты 5 и 6 для проверки

7. ALTER TABLE medicalexam ADD CONSTRAINT medicalexam_pk PRIMARY KEY (id); - Эта команда добавляет первичный ключ "id" для таблицы "medicalexam".

8. ALTER TABLE patients ADD CONSTRAINT fk_patients_id FOREIGN KEY (id) REFERENCES medicalexam(id); - Эта команда добавляет внешний ключ "id" для таблицы "patients", который ссылается на столбец "id" в таблице "medicalexam".

![image](https://psv4.userapi.com/c237031/u275446108/docs/d33/03c4825daebd/Snimok_ekrana_2023-12-26_204154.png?extra=KPN8HFEDWKvt7AMlN2XMPD68IVem9eJcabgUTNjfSOTpLbCVMfnXZwowh97kCYKZbJHhyoqWO4cqNqr2PeYxnXuAWg8lnqws8Xe_gxtGrZOCbZZC_eW1MKQ6ygYnYTa-rcXIL_Zh32_9HWUv8Lmy-qkcLw)
![image](https://psv4.userapi.com/c236331/u275446108/docs/d44/80aaf3545e27/Snimok_ekrana_2023-12-26_204223.png?extra=MdCL1vlrEyGfFvMzyB-o5I-ns2P3Uv-ZZy9PBar_CHvb0XvOV6un2a2AbrNkUnVzUGM-sIyO7wwKdQk1I3RI6KGhrsUPFNV-zXp-ku6GdkctT7ZqHETPzNjf0l_0EVnSBAUolsyDUAskObEiwcWzBATRlA)

### Создание ER-диаграммы
>Схема «сущность-связь» (также ERD или ER-диаграмма) — это разновидность блок-схемы(графическая модель), где показано, как разные атрибуты связаны между собой внутри системы. ER-диаграммы чаще всего используются для визуализации и описания структуры и связей между сущностями в базе данных. ER-диаграмма создается на основании базы данных, а именно по написанному ранее скрипту.

Для этого в MYSQL Workbench нужно сверху слева нажать на Database--->Reverse Engineer...--->далее появится окошко с параметрами, нужно нажать Next-->в окошке появится выбор по какой базе данных создать таблицы Select Schemas to Reverse Engineer, выбираем нужную нам схему(в нашем случае это heart)-->Finish-->таблицы создались, но без связи. Для их построения мы используем связь 1:n, нажимаем на нужный нам атрибут в первой таблице и соединяем(нажатием на атрибуты) со второй таблицей.

![image](https://psv4.userapi.com/c909218/u275446108/docs/d58/3b5d10cea631/Snimok_ekrana_2023-12-26_190537.png?extra=nTFrqY7ziKR-uo6jlfwqM5OHycy9jAaY9-N5HefngOedg71Ooo9adeo5dDcPz5FhTOIBsm0ueyPNfIsKig7-dqBQPf9KoOxxbjutU3aT-1UIAw9-IG9oQCC37desWQSXmlufMxJEnKS_D-NaqcSwhW5uug)
![image](https://psv4.userapi.com/c909218/u275446108/docs/d17/94dfa00bc32f/Snimok_ekrana_2023-12-26_193250.png?extra=UJjBPMSYx3VG4z-e0FPeWyCD5dkdRmRqXJSCZtFRrQWXQ9QqutgE_9nEAUQzgWYFezREZlP5Us850taC3fEI6aoAKjLa3ZAgSqBpBMlTbqb1O71_TPM4NnhYkLf4waf7hJxE4_hcdpP0Thcj3GUf6QhJtg)
![image](https://psv4.userapi.com/c236331/u275446108/docs/d59/f58133d6be71/Snimok_ekrana_2023-12-26_193642.png?extra=KBlt2abHoAhb9Smgf_otVRnWzQJ8cvcYhSVpGIhoSSXjxPhLRYMPpJWdZu28muCSV-41xf53t8yaiE0MfrIxaOLGtNX1J5eIf6ye4BSNl6CdDZ20JpwMPNToIPYwGojJKqK2YJ3DDKzQKzKB8q5k03rucQ)
![image](https://psv4.userapi.com/c909418/u275446108/docs/d42/d7a03368760d/Snimok_ekrana_2023-12-26_194029.png?extra=LwZayf6c-463sfJJktHyF013w3umImSbXcdrFFyRFCfImEda27eY9vAjzJi48Rqqt12hRxS-Vi_IRD4SbYkuju28XJ_CC0gEkCJOYE5C5sIvCiAM0xIVDBg_3sM2nL54bEQiBPhuvOfAoFCYA6c2vl_8qg)

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
3. Далее пишем скрипт выгрузки данных из файла "heart.csv" в таблицу "dataset".![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/146061871/aa8fa967-590f-4f3a-9b70-3c9f9ae36c79)
4. Затем мы удаляем таблицы "patients" и "medicalexam" из нашей бд и создаем их снова, но не включаем в них столбцы "id". Поочередно заполняем таблицы данными, использую копирование данных из таблицы "dataset".![Uploading image.png…]()
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

> Для визуализации данных мы будем использовать Google Colab, различные библиотеки и сам файл heart.csv.

Импорируем библиотеки, которые позволят визуализировать данные. Коротко об каждой из них:

* pandas - это библиотека Python для обработки и анализа структурированных данных, в нашел случае с файлом heart.cav;
* matplotlib.pyplot - это библиотека на языке Python для визуализации данных. В ней можно построить двумерные (плоские) и трехмерные графики;
* math - это модуль предоставляет обширный функционал для работы с числами;
* seaborn - библиотека для создания статистических графиков на Python. Она построена на основе matplotlib и тесно интегрируется со структурами данных pandas;
* plotly.express - библиотека для визуализации данных.

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/9ea0aa77-8454-4c16-b25a-d50b2f216f4b)

Для того, чтобы начать работать с файлом, необходимо его загрузить в Google Colab.

1. Нажимаем на вкладку "Файлы".

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/2b482f11-c2c2-47e7-8036-55645353c31b)

2. Нажимаем "Загрузить в сессионное хранилище"

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/9484ce5a-7ea9-4501-be68-a1b89a37b287)

3. Откроется проводник с файлами. Нам необходимо выбрать файл heart.csv

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/12ef2ead-90ce-49f4-ac3c-25b566ad0616)

4. Нажимаем "Открыть". Теперь наш файл загружен в Google Colab и с ним можно работать

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/d8c37361-c1fd-47ac-b625-a6671db1ace0)

Теперь можно открыть наш csv при помощи библиотеки pandas. Выведем первые 5 строчек.

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/3efaaf0a-8faf-46ba-89ec-4c9890c15a72)

Также я записала информацию о каждой колонке, чтобы иметь представление о том, какие данные включает в себя этот файл.

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/3970d583-e788-4e19-8ae3-8393fdf4cd2e)

Сначала сделаем диаграмму по таким параметрам как возраст и пол:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/3f675bcc-ebb5-47ae-8ff3-297236894a67)

В результате у нас выводится вот такая гистограмма:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/87cec315-32a4-4662-bbb6-a2dd764d954d)

Отсюда мы понимаем, что мужчин гораздо больше, чем женщин. При этом видно, что большинство людей (и мужчин, и женщин) имеют возраст от 50 до 60 лет.

Далее рассмотрим распределение результатов электрокардиограммы (RestingECG) по полу:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/8474e98a-ff5f-45dd-ab3d-5ba2c61f0005)

Результатом кода является данная гистограмма:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/b423a609-cad4-4d9f-8714-e7bc10f22e1e)

Мы видим, что большинство мужчин и женщин имеют параметр Normal в RestingECG. Это означает, что результат электрокардиограммы соответствует норме.

Теперь создадим круговую диаграмму. В качестве параметра выберем ChestPainType.

Находим уникальные значения в ChestPainType. Они нам пригодятся для названий каждой части (label):

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/db8554e0-cb5a-4706-90ab-6d378d688bd0)

Затем мы ищем количество по каждому типу ChestPainType:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/7850647e-da08-42b7-a322-eb0d969ba7d0)

В конечно итоге пишем код для создания круговой диаграммы:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/bcb507f4-2129-4608-90b7-b640c5d11b3c)

Получилась такая круговая диаграмма:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/a01ae247-5e11-453f-b40a-ce36724afab6)

По ней можно понять, что больше всего людей имеют тип ASY (бессимптомная боль), а меньше всего TA (типичная стенокардия) в ChestPainType.

Далее создадим круговую диаграмму по параметру RestingBP. Сначала разделим данные на 3 типа в зависимости от значения:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/5b2c0105-846a-4ed1-a839-4198fc53499e)

Те, у кого значение ниже 100 - у них пониженное давление, у кого в пределе от 100 до 130 - нормальное, больше 130 - повышенное. Также выведем количество, которое соответствует каждому типу.

Создаем круговую диаграмму:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/934668cb-786e-43b1-9363-9e0521865daf)

Получаем следующую круговую диаграмму:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/53ad1740-72eb-4a67-a287-e2b35f0dec19)

Видим, что у людей в основном Normal и High, т.е. в основном встречаются случаи повышенного и нормального давлений. С пониженным давлением людей крайне мало (всего 2,94%)

Далее переходим к представлению данных в виде "ящика с усами". Немного о том, что из себя представляет этот тип визуализации:

> «Ящик с усами» представляется в виде прямоугольника, расположенного вокруг срединного
> значения (срединное значение или медиана выборки- это значение, которое разбивает выборку на
> две равные части при упорядочивании значений переменной по возрастанию), причем длина
> прямоугольника представляет стандартизованный размах выборки. Усы снаружи ящика представляют
> фиксированный процент от стандартизированного размаха.

Теперь создадим "ящик с усами", взяв данные HeartDisease, MaxHR и Sex:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/99dc3ef5-7042-457f-b6b4-f46ee2672a6a)

Вот что мы получили:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/c938d3b5-7691-4967-85d3-ef339448c133)

Как можно заметить, мы сделали несколько ящиков разных цветов: белый - мужчины, красный - женщины. По оси x мы взяли диагноз, а по оси y - максимально достигнутая частота пульса.

Далее мы используем функцию swarmplot() (построение диаграммы разброса значений точечно). Возьмем данные HeartDisease, ExerciseAngina и Cholesterol:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/32c66f9a-a09d-4f81-b9da-0f91db51d3d9)

В итоге получаем такую визуализацию: 

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/53aa861e-be6d-4fef-ad64-3a9395c91b81)

Данных очень много, поэтому все не вместилось, но мы видим, что по оси x - диагноз, по оси y - холестерин, а точки - значения стенокардии (да или нет). Среди тех, у кого диагноз не потвердился, нет проявления стенокардии, а у тех, у кого диагноз положительный - есть даннное проявление.

Рассмотрим еще такой метод как scatter (построение точечной диаграммы рассеяния). Берем данные Age, RestingBP и FastingBS:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/99cc31d8-dc9b-441f-82ec-757cd1eb8cbe)

Вывелось следующее:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/989ef9d2-de3c-4c75-bad9-0a27ef1305d5)

Синее - это значения, если FastingBS > 120, красное - иные. Также можно отметить, что большинство имеют значение RestingBP в диапазоне от 100 до 175. По возрасту можно сказать, что данные в пределе от 40 до 70.

Создадим более сложное представление, но информативное. Вначале выясним, у скольких человек потвердился диагноз, и наоборот:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/ce0abfe6-5f05-4975-9250-e2c2bdac96b2)

Видно, что у большинства потвердился диагноз. Теперь визуализируем, взяв RestingBP, HeartDisease, Age и FastingBS:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/8ea7384d-d9be-400d-a5f9-e5b6a0014e2d)

Получилось следующее:

![image](https://github.com/PeryshkovaP/4-2-2_Project/assets/147165843/51e8e6f4-ab0a-47ce-bac6-46ad043dab95)

Цвета соответствуют значениям HeartDisease: красный - потвердился, синий - не потвердился. Значки соответствуют FastingBS: ромб - значение 1, круг - значение 0. По оси x - значения артериального давления, по оси y - возраст.


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






