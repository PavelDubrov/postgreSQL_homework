-- CREATE

CREATE TABLE company
(
	company_id serial primary key,
	company_name text not null
);

CREATE TABLE city
(
	city_id serial primary key,
	city_name text not null
);

CREATE TABLE person
(
	person_id serial primary key,
	person_name text not null,
	city_id integer not null references city(city_id)
);

CREATE TABLE vacancy
(
	vacancy_id serial primary key,
	vacancy_name text not null,
	company_id integer references company (company_id),
	city_id integer references city (city_id),
	compensation_from integer,
	compensation_to integer,
	compensation_gross bool,
	created_at date not null
);

CREATE TABLE job_application
(
	job_application_id serial primary key,
	person_id integer not null references person (person_id),
	vacancy_id integer not null references vacancy (vacancy_id),
	created_at date not null
);

-- INSERTs

INSERT INTO city (city_name)
VALUES
('Севастополь'),
('Сочи'),
('Усть-Штормград'),
('Пермь'),
('Париж'),
('Рига'),
('Керчь'),
('Астрахань'),
('Казань'),
('Новосибирск');

INSERT INTO person (person_name, city_id)
VALUES
('Иван Иванов',1),
('Петр Петров',2),
('Святослав Сидоров',5),
('Артур Борщеваров',7),
('John Doe',3),
('Ирина Быстроносова',9),
('Светлана Сидорова',6),
('Вероника Скрипенблюз',7),
('Людмила Котом',5),
('Марина Хлебопекова',5);

INSERT INTO company (company_name)
VALUES
('MacroHard'),
('Веселые пекари'),
('Быстрые суповары'),
('OOO "ТыжПрограммист"'),
('АО "Технологии будущего"'),
('НПП "Айсберг"'),
('НПП "Титаник"'),
('ИП "Ларёк на углу"'),
('Столовая №2'),
('Space Y');

INSERT INTO vacancy (vacancy_name,
					 company_id,
					 city_id,
					 compensation_from,
					 compensation_to,
					 compensation_gross,
					 created_at)
VALUES
('Разработчик', 4, 6, 10000, 100000, true, '2019-04-07'),
('Продавец', 5, 5, 20000, 30000, false, '2019-04-15'),
('Рыбак', 1, 2, 70000, 80000, false, '2019-05-05'),
('Строитель', 7, 7, 1000, 90000, true, '2019-06-21'),
('Продавец', 5, 5, 20000, 30000, false, '2019-07-08'),
('Зоолог', 9, 4, 50000, 55000, false, '2019-08-16'),
('Кинолог', 3, 3, 100000, 150000, true, '2019-08-22');

INSERT INTO vacancy (vacancy_name, company_id, city_id, compensation_gross, created_at)
VALUES ('Врачь', 3, 2, true, '2019-12-11');

INSERT INTO vacancy (vacancy_name, company_id, city_id, compensation_from, compensation_gross, created_at)
VALUES ('Учитель', 1, 9, 50000, false, '2019-12-23');

INSERT INTO vacancy (vacancy_name, company_id, city_id, compensation_to, compensation_gross, created_at)
VALUES ('Директор', 7, 3,200000, false, '2019-12-27');



INSERT INTO job_application (person_id, vacancy_id, created_at)
VALUES
(1, 1, '2020-01-01'),
(2, 3, '2020-01-02'),
(4, 6, '2020-02-11'),
(7, 4, '2020-02-14'),
(9, 6, '2020-02-18'),
(2, 7, '2020-03-04'),
(4, 3, '2020-03-08'),
(6, 2, '2020-04-21'),
(1, 8, '2020-04-23'),
(4, 7, '2020-05-05');
