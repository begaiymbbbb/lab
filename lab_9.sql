--CREATE DATABASE Lab_work_9; 

USE Lab_work_9;

//*
create table tip_klienta (
id_tip_klienta int not null primary key identity(1,1),
tip_klienta nvarchar(50) not null
);
create table rayon (
id_rayon int not null primary key identity(1,1),
rayon nvarchar(50) not null
);
create table klient(
id_klient int not null primary key identity(1,1),
familiya_klienta nvarchar(50) not null,
imya_klienta nvarchar(50) not null,
otchestvo_klienta nvarchar(50) not null,
passport_klienta nvarchar(50) not null,
password nvarchar(50) not null,
login nvarchar(50) not null,
mesto_raboty nvarchar(50) not null,
skidka int not null,
id_tip_klienta int foreign key  references tip_klienta(id_tip_klienta) not null,
id_rayon int foreign key  references rayon(id_rayon) not null
);
create table tip_kontaktov(
id_tip_kontaktov int not null primary key identity(1,1),
tip_kontaktov nvarchar(50) not null
);
create table kontakty(
id_kontakty int not null primary key identity(1,1),
kontakty nvarchar(50) not null,
id_klient int foreign key  references klient(id_klient) not null,
id_tip_kontaktov int foreign key  references tip_kontaktov(id_tip_kontaktov) not null,
);
create table tip_zakaza(
id_tip_zakaza int not null primary key identity(1,1),
tip_zakaza nvarchar(50) not null
);
create table tip_prodaj(
id_tip_prodaj int not null primary key identity(1,1),
tip_prodaj nvarchar(50) not null
);
create table sostoyanie(
id_sostoyanie int not null primary key identity(1,1),
sostoyanie nvarchar(50) not null
);
create table doljnost(
id_doljnost int not null primary key identity(1,1),
doljnost nvarchar(50) not null
);
create table sotrudnik(
id_sotrudnik int not null primary key identity(1,1),
familiya_sotrudnika nvarchar(50) not null,
imya_sotrudnika nvarchar(50) not null,
otchestvo_sotrudnika nvarchar(50) not null,
id_doljnost int foreign key  references doljnost(id_doljnost) not null
);
create table zakaz(
id_zakaz int not null primary key identity(1,1),
data date not null,
nomer_doc nvarchar(50) not null,
comments nvarchar(50) not null,
id_klient int foreign key  references klient(id_klient) not null,
id_tip_zakaza int foreign key  references tip_zakaza(id_tip_zakaza ) not null,
id_sostoyanie int foreign key  references sostoyanie(id_sostoyanie) not null,
id_tip_prodaj int foreign key  references tip_prodaj(id_tip_prodaj) not null,
id_sotrudnik int foreign key  references sotrudnik(id_sotrudnik) not null
);
create table vid_oplaty(
id_vid_oplaty int not null primary key identity(1,1),
vid_oplaty nvarchar(50) not null
);
create table oplata(
id_oplata int not null primary key identity(1,1),
data date not null,
summa int not null,
comments nvarchar(50) not null,
id_zakaz int foreign key  references zakaz(id_zakaz) not null,
id_vid_oplaty int foreign key  references vid_oplaty(id_vid_oplaty) not null
);
create table tip_tovara(
id_tip_tovara int not null primary key identity(1,1),
tip_tovara nvarchar(50) not null
);
create table tovar(
id_tovar int not null primary key identity(1,1),
comments nvarchar(50) not null,
photo nvarchar(50) not null,
id_tip_tovara int foreign key  references tip_tovara(id_tip_tovara) not null
);
create table tip_postavki(
id_tip_postavki int not null primary key identity(1,1),
tip_postavki nvarchar(50) not null
);
create table tip_postavshika(
id_tip_postavshika int not null primary key identity(1,1),
tip_postavshika nvarchar(50) not null
);
create table postavshik(
id_postavshik int not null primary key identity(1,1),
nazvaniye nvarchar(50) not null,
familiya_postavshika nvarchar(50) not null,
imya_postavshika nvarchar(50) not null,
otchestvo_postavshika nvarchar(50) not null,
id_tip_postavshika int foreign key  references tip_postavshika(id_tip_postavshika) not null
);
create table postavki(
id_postavki int not null primary key identity(1,1),
numer_doc int not null,
data date not null,
comments nvarchar(50) not null,
id_postavshik int foreign key  references postavshik(id_postavshik) not null,
id_tip_postavki int foreign key  references tip_postavki(id_tip_postavki) not null
);
create table spisok_postavki(
id_spisok_postavki int not null primary key identity(1,1),
id_postavki int foreign key  references postavki(id_postavki) not null,
cena int not null,
kolichestvo int not null,
srok_godnosti date not null,
);
create table spisok_tovarov(
id_spisok_tovarov int not null primary key identity(1,1),
cena int not null,
kolichestvo int not null,
id_zakaz int foreign key  references zakaz(id_zakaz) not null,
id_tovar int foreign key  references tovar(id_tovar) not null,
id_spisok_postavki int foreign key  references spisok_postavki(id_spisok_postavki) not null
);
create table price_list(
id_price_list int not null primary key identity(1,1),
cena int not null,
data date not null,
comments nvarchar(50) not null,
id_tovar int foreign key  references tovar(id_tovar) not null
);
create table oplata2(
id_oplata int not null primary key identity(1,1),
data date not null,
summa int not null,
comments nvarchar(50) not null,
id_postavki int foreign key  references postavki(id_postavki) not null
);

INSERT tip_klienta VALUES
('Despot'),
('Unknowing'),
('Know-it-all'),
('Talker');

INSERT rayon VALUES
('Tup'),
('Groznyi'),
('Alpsee'),
('Huiston'),
('Guanchjou
INSERT klient VALUES 
('Asema', 'Kasymalieva', 'Ternerovna', 'ID112131', 'qwerty','adambek','META',5,1,1),
('Dastan', 'Sazanov', 'Ternerovich', 'ID222131', 'qwerty1','ayanbek','Google',5,2,3),
('Nagima', 'Birlikova', 'Turing', 'ID332131', 'qwerty2','akylbek','Amazon',5,3,2),
('Salima', 'Asanbaeva', 'Fox', 'ID442131', 'qwerty3','salimbek','Noodle',5,4,4);
INSERT tip_kontaktov VALUES
('Email'),
('Mobile phone'),
('Home phone'),
('Work phone');
INSERT kontakty VALUES
('+996567575465',1,2),
('berrjjk43@gmail.com',2,1),
('+996763455678',3,4),
('hsakkkko67@gmail.com',4,1);
INSERT doljnost VALUES
('Manager'),
('Director'),
('SMM specialist'),
('HR manager');
INSERT sotrudnik VALUES
('Kasymov','Nurlan','Ulanbekovich',1),
('Asanbekova','Jibek','Kydykovna',2),
('Izatova','Daria','Asylbekovna',3),
('Koilubaev','Elfat','Almazovich',4);
INSERT sostoyanie VALUES
('In process'),
('Accepted'),
('Expected');
INSERT tip_prodaj VALUES
('Active'),
('Passive'),
('Personal'),
('Impersonal
INSERT tip_zakaza VALUES
('Ordinary order'),
('Order accumulation'),
('Urgent order');
INSERT zakaz VALUES
('2019-01-02','123','no comment',1,1,1,1,1),
('2018-02-03','456','no comment',2,2,2,2,2),
('2020-03-04','789','no comment',3,3,3,3,3),
('2021-04-05','101','no comment',4,3,1,4,4);
INSERT vid_oplaty VALUES
('Cash'),
('By card');
INSERT oplata VALUES
('2019-01-01',1000,'no comment',1,2),
('2018-02-01',1500,'no comment',2,1),
('2020-03-02',2000,'no comment',3,2),
('2021-03-30',5000,'no comment',4,1);
INSERT tip_tovara VALUES
('Wholesale goods'),
('Retail goods'),
('Wholesale and retail');
INSERT tovar VALUES
('Books','---',1),
('Laptops','---',2),
('Smartphones','---',1),
('Clothes','---',3);
INSERT price_list VALUES
(3000,'2018-01-01','no',1),
(70000,'2019-01-02','no',2),
(20000,'2020-03-02','no',3),
(1000,'2021-01-03','no',4);
INSERT tip_postavki VALUES
('DELIVERED AT FRONTIER '),
('DELIVERED DUTY PAID'),
('DELIVERED DUTY UNPAID'),
('DELIVERED EX SHIP');
INSERT tip_postavshika VALUES
('Manufacturers'),
('Distributors'),
('Importers');
INSERT postavshik VALUES
('OSOO Union','Tashkulov','Nurislam','Tashkulovich',1),
('Couple CUP','Shamilbekov','Arslan','Shamilbekovich',2),
('OMEGA','Azimaliev','Nurdoolot','Azimalievich',3),
('DataG','Maasaliev','Bektur','Zhanybekovich',1
INSERT postavki VALUES
(11,'2017-02-12','no',1,1),
(12,'2019-03-01','no',2,2),
(13,'2020-04-01','no',3,3),
(14,'2021-05-02','no',4,4);
INSERT spisok_postavki VALUES
(2,1000,20,'2022-02-12'),
(3,2000,15,'2022-03-01'),
(4,3000,30,'2022-04-01'),
(5,4000,50,'2022-05-01');
INSERT oplata2 VALUES
('2019-01-01',1500,'no comment',2),
('2018-01-01',2400,'no comment',3),
('2020-01-02',2800,'no comment',4),
('2021-02-03',5500,'no comment',5);
INSERT spisok_tovarov VALUES
(2000,10,1,1,3),
(2500,20,2,2,4),
(4000,30,3,3,5),
(3000,40,4,4,6);


--Создать хранимые процедуры для выборки данных (Поставки):

-- Список поставки за период  по товарам
SELECT comments AS "Tovar"
FROM tovar 
WHERE id_tovar = (SELECT id_postavki FROM postavki WHERE data = '2020-04-01');
-- Список товаров поставленных по поставщику
SELECT comments AS "Tovar"
FROM tovar
WHERE id_tovar = (SELECT id_spisok_postavki FROM spisok_postavki WHERE id_postavki = (SELECT id_postavki FROM postavki WHERE id_postavshik = (SELECT id_postavshik FROM postavshik WHERE imya_postavshika='Nurislam')));
-- Список товаров поставленных по типу товара
SELECT *
FROM spisok_tovarov
WHERE id_spisok_postavki in (SELECT id_spisok_postavki FROM spisok_postavki WHERE id_postavki in (SELECT id_postavki FROM postavki WHERE id_postavshik in (SELECT id_postavshik FROM postavshik WHERE nazvaniye = 'Retail goods')));
-- Поставки по товарам 
SELECT numer_doc,data
FROM postavki
WHERE id_postavki = (SELECT id_spisok_postavki FROM spisok_postavki WHERE id_postavki = (SELECT id_spisok_tovarov FROM spisok_tovarov WHERE id_spisok_postavki = (SELECT id_tovar FROM tovar WHERE id_tovar='3')));
-- Поставки по товарам по клиентам за период
--Изменение цен на товары, поставленные за период
UPDATE dbo.spisok_postavki
SET cena = 2999
WHERE srok_godnosti BETWEEN '2018-01-01' AND '2023-01-12';
-- Оплата по поставкам (журнал) за период
SELECT *
FROM oplata
WHERE id_zakaz in (SELECT id_zakaz FROM zakaz WHERE id_zakaz in (SELECT id_zakaz FROM spisok_tovarov WHERE id_spisok_postavki IN (SELECT id_spisok_postavki FROM spisok_postavki WHERE id_postavki in (SELECT id_postavki FROM postavki WHERE data BETWEEN ('2022-01-01') and ('2022-03-01')))));


--Создать хранимые процедуры для выборки данных (Продажи):

-- Список продаж за период  по товарам
SELECT klient.familiya_klienta, zakaz.data
FROM dbo.klient, dbo.zakaz
WHERE klient.id_klient = zakaz.id_klient AND (data NOT BETWEEN '2022-01-01' AND '2021-01-12');
-- Заказы клиента за период
SELECT  tovar.comments, price_list.cena 
FROM dbo.tovar, dbo.price_list
WHERE tovar.id_tovar = price_list.id_tovar;
-- Список товаров проданных за период
SELECT  vid_oplaty.vid_oplaty, oplata.data 
FROM dbo.vid_oplaty, dbo.oplata
WHERE oplata.data BETWEEN '2017-01-01' AND '2023-12-01' AND (vid_oplaty.id_vid_oplaty = oplata.id_vid_oplaty
-- Изменение цен на товары, поставленные за период
UPDATE dbo.price_list
SET cena = 4000
WHERE data BETWEEN '2018-01-01' AND '2023-01-12';
--  Актуальный прайс-лист
SELECT id_tovar,cena
FROM price_list;
--  Оплата по продажам (журнал) за период
SELECT id_oplata, summa, id_zakaz
FROM oplata
WHERE data >= '2018-01-01'
  and data <= '2022-03-01';
--  Оплата по виду оплаты за период
SELECT summa
FROM oplata
WHERE id_vid_oplaty = (SELECT id_vid_oplaty from vid_oplaty WHERE vid_oplaty = 'cash')
  and data >= '2022-01-01'
  and data <= '2022-03-01';
-- Продажи по сотрудникам статистика
SELECT *
FROM zakaz
WHERE id_sotrudnik = 1;
-- Продажи по району за период
SELECT *
FROM zakaz
WHERE id_klient in (SELECT id_klient FROM klient WHERE id_rayon in (SELECT id_rayon FROM rayon WHERE rayon = 'Central'));
-- Контакты клиентов
SELECT klient.familiya_klienta,klient.imya_klienta,klient.otchestvo_klienta, kontakty.kontakty
FROM dbo.klient, dbo.kontakty
WHERE klient.id_klient = kontakty.id_klient
-- Заказы по типу продаж за период
SELECT id_zakaz, id_tip_prodaj
FROM zakaz;
-- Заказы по типу заказа за период
SELECT id_zakaz, id_tip_zakaza
FROM zakaz;

/*
