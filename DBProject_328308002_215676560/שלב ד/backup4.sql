prompt PL/SQL Developer Export Tables for user SYSTEM@XE
prompt Created by ADMIN on יום שני 15 יולי 2024
set feedback off
set define off

prompt Creating BASE...
create table BASE
(
  base_id  INTEGER not null,
  location VARCHAR2(25) not null,
  capacity INTEGER not null
)
;
alter table BASE
  add primary key (BASE_ID);

prompt Creating AIRCRAFT...
create table AIRCRAFT
(
  aircraft_id INTEGER not null,
  type        VARCHAR2(25) not null,
  status      VARCHAR2(25) not null,
  base_id     INTEGER not null
)
;
alter table AIRCRAFT
  add primary key (AIRCRAFT_ID);
alter table AIRCRAFT
  add foreign key (BASE_ID)
  references BASE (BASE_ID);

prompt Creating MISSION...
create table MISSION
(
  mission_id      INTEGER not null,
  date_of_mission DATE not null,
  type            VARCHAR2(25) not null
)
;
alter table MISSION
  add primary key (MISSION_ID);

prompt Creating ASSIGNED_TO...
create table ASSIGNED_TO
(
  aircraft_id INTEGER not null,
  mission_id  INTEGER not null
)
;
alter table ASSIGNED_TO
  add primary key (AIRCRAFT_ID, MISSION_ID);
alter table ASSIGNED_TO
  add foreign key (AIRCRAFT_ID)
  references AIRCRAFT (AIRCRAFT_ID);
alter table ASSIGNED_TO
  add foreign key (MISSION_ID)
  references MISSION (MISSION_ID);

prompt Creating FLIGHT...
create table FLIGHT
(
  flight_id      INTEGER not null,
  mission_id     INTEGER not null,
  date_of_flight DATE not null,
  type_of_flight VARCHAR2(25) not null
)
;
alter table FLIGHT
  add primary key (FLIGHT_ID, MISSION_ID);
alter table FLIGHT
  add foreign key (MISSION_ID)
  references MISSION (MISSION_ID);

prompt Creating SOLDIER...
create table SOLDIER
(
  soldier_id   INTEGER not null,
  birth_date   DATE not null,
  soldier_rank VARCHAR2(20) not null,
  first_name   VARCHAR2(20) not null,
  last_name    VARCHAR2(20) not null,
  unit         VARCHAR2(20) default 'Infantry'
)
;
alter table SOLDIER
  add constraint PK_SOLDIER primary key (SOLDIER_ID);

prompt Creating FLOWN_BY...
create table FLOWN_BY
(
  soldier_id  INTEGER not null,
  aircraft_id INTEGER not null
)
;
alter table FLOWN_BY
  add primary key (SOLDIER_ID, AIRCRAFT_ID);
alter table FLOWN_BY
  add constraint FK_FLOWN_BY_SOLDIER foreign key (SOLDIER_ID)
  references SOLDIER (SOLDIER_ID);
alter table FLOWN_BY
  add foreign key (AIRCRAFT_ID)
  references AIRCRAFT (AIRCRAFT_ID);

prompt Creating STORES...
create table STORES
(
  store_id INTEGER not null,
  capacity INTEGER not null,
  base_id  INTEGER
)
;
alter table STORES
  add primary key (STORE_ID);
alter table STORES
  add constraint FK_STORE_BASE foreign key (BASE_ID)
  references BASE (BASE_ID);
alter table STORES
  add constraint CHK_CAPACITY
  check (Capacity >= 0);

prompt Creating ITEM...
create table ITEM
(
  serial_number INTEGER not null,
  manufact_date DATE not null,
  price         FLOAT not null,
  store_id      INTEGER not null
)
;
alter table ITEM
  add primary key (SERIAL_NUMBER);
alter table ITEM
  add foreign key (STORE_ID)
  references STORES (STORE_ID);

prompt Creating OWNS...
create table OWNS
(
  serial_number INTEGER not null,
  soldier_id    INTEGER not null
)
;
alter table OWNS
  add primary key (SERIAL_NUMBER);
alter table OWNS
  add foreign key (SERIAL_NUMBER)
  references ITEM (SERIAL_NUMBER);

prompt Creating STOREMAN...
create table STOREMAN
(
  soldier_id     INTEGER not null,
  hours_per_week FLOAT not null,
  store_id       INTEGER not null
)
;
alter table STOREMAN
  add foreign key (STORE_ID)
  references STORES (STORE_ID);

prompt Creating SUPPLIER...
create table SUPPLIER
(
  company_name VARCHAR2(150) not null,
  email        VARCHAR2(150) not null,
  location     VARCHAR2(150) not null,
  company_id   INTEGER not null
)
;
alter table SUPPLIER
  add primary key (COMPANY_ID);

prompt Creating SUPPLIES...
create table SUPPLIES
(
  company_id INTEGER not null,
  store_id   INTEGER not null
)
;
alter table SUPPLIES
  add primary key (COMPANY_ID, STORE_ID);
alter table SUPPLIES
  add foreign key (COMPANY_ID)
  references SUPPLIER (COMPANY_ID);
alter table SUPPLIES
  add foreign key (STORE_ID)
  references STORES (STORE_ID);

prompt Creating UNIFORM...
create table UNIFORM
(
  uniform_type  VARCHAR2(40) not null,
  uniform_size  VARCHAR2(10) not null,
  serial_number INTEGER not null,
  officiality   VARCHAR2(1) not null
)
;
alter table UNIFORM
  add primary key (SERIAL_NUMBER);
alter table UNIFORM
  add foreign key (SERIAL_NUMBER)
  references ITEM (SERIAL_NUMBER);
alter table UNIFORM
  add check (Officiality IN ('A','B'));

prompt Creating WEAPON...
create table WEAPON
(
  weapon_type   VARCHAR2(40) not null,
  weight        FLOAT not null,
  serial_number INTEGER not null,
  reliability   INTEGER not null
)
;
alter table WEAPON
  add primary key (SERIAL_NUMBER);
alter table WEAPON
  add foreign key (SERIAL_NUMBER)
  references ITEM (SERIAL_NUMBER);

prompt Loading BASE...
insert into BASE (base_id, location, capacity)
values (5858610, 'South', 9692);
insert into BASE (base_id, location, capacity)
values (6976065, 'South', 5604);
insert into BASE (base_id, location, capacity)
values (9726685, 'North', 3388);
insert into BASE (base_id, location, capacity)
values (9797811, 'South', 2387);
insert into BASE (base_id, location, capacity)
values (2705942, 'South', 3779);
insert into BASE (base_id, location, capacity)
values (2804121, 'South', 2950);
insert into BASE (base_id, location, capacity)
values (7292579, 'North', 2795);
insert into BASE (base_id, location, capacity)
values (5727542, 'South', 7696);
insert into BASE (base_id, location, capacity)
values (5656777, 'North', 3571);
insert into BASE (base_id, location, capacity)
values (7249488, 'South', 7851);
insert into BASE (base_id, location, capacity)
values (1604680, 'North', 8000);
insert into BASE (base_id, location, capacity)
values (9184050, 'North', 3108);
insert into BASE (base_id, location, capacity)
values (4457895, 'South', 3152);
insert into BASE (base_id, location, capacity)
values (1453003, 'North', 7546);
insert into BASE (base_id, location, capacity)
values (9569121, 'North', 6199);
insert into BASE (base_id, location, capacity)
values (6373161, 'South', 4075);
insert into BASE (base_id, location, capacity)
values (9488672, 'South', 5710);
insert into BASE (base_id, location, capacity)
values (1477365, 'South', 9879);
insert into BASE (base_id, location, capacity)
values (1321073, 'North', 3544);
insert into BASE (base_id, location, capacity)
values (6642199, 'South', 5366);
insert into BASE (base_id, location, capacity)
values (7780653, 'North', 4405);
insert into BASE (base_id, location, capacity)
values (7511303, 'North', 7500);
insert into BASE (base_id, location, capacity)
values (5432571, 'South', 4101);
insert into BASE (base_id, location, capacity)
values (3395577, 'South', 5526);
insert into BASE (base_id, location, capacity)
values (6653592, 'North', 9059);
insert into BASE (base_id, location, capacity)
values (3812988, 'South', 5611);
insert into BASE (base_id, location, capacity)
values (4527562, 'North', 3175);
insert into BASE (base_id, location, capacity)
values (6913701, 'South', 5183);
insert into BASE (base_id, location, capacity)
values (2266541, 'North', 4288);
insert into BASE (base_id, location, capacity)
values (5033344, 'South', 8370);
insert into BASE (base_id, location, capacity)
values (3382312, 'North', 5660);
insert into BASE (base_id, location, capacity)
values (1840828, 'South', 3338);
insert into BASE (base_id, location, capacity)
values (8787104, 'South', 6715);
insert into BASE (base_id, location, capacity)
values (2809855, 'North', 5086);
insert into BASE (base_id, location, capacity)
values (5839283, 'North', 2009);
insert into BASE (base_id, location, capacity)
values (8357490, 'North', 9748);
insert into BASE (base_id, location, capacity)
values (7131970, 'North', 6864);
insert into BASE (base_id, location, capacity)
values (1771510, 'North', 7336);
insert into BASE (base_id, location, capacity)
values (8112614, 'North', 4473);
insert into BASE (base_id, location, capacity)
values (5303110, 'North', 5539);
insert into BASE (base_id, location, capacity)
values (7481871, 'North', 7382);
insert into BASE (base_id, location, capacity)
values (3345502, 'South', 6102);
insert into BASE (base_id, location, capacity)
values (1313329, 'South', 8209);
insert into BASE (base_id, location, capacity)
values (6764446, 'South', 2178);
insert into BASE (base_id, location, capacity)
values (8024073, 'North', 3210);
insert into BASE (base_id, location, capacity)
values (5006318, 'North', 8095);
insert into BASE (base_id, location, capacity)
values (5272396, 'South', 7909);
insert into BASE (base_id, location, capacity)
values (9895475, 'North', 6909);
insert into BASE (base_id, location, capacity)
values (3625535, 'North', 7316);
insert into BASE (base_id, location, capacity)
values (3857827, 'North', 8351);
insert into BASE (base_id, location, capacity)
values (4989763, 'South', 2555);
insert into BASE (base_id, location, capacity)
values (1984347, 'South', 8796);
insert into BASE (base_id, location, capacity)
values (2389852, 'South', 3626);
insert into BASE (base_id, location, capacity)
values (4689005, 'North', 6248);
insert into BASE (base_id, location, capacity)
values (5287495, 'North', 2934);
insert into BASE (base_id, location, capacity)
values (1033041, 'North', 5495);
insert into BASE (base_id, location, capacity)
values (1301115, 'North', 6782);
insert into BASE (base_id, location, capacity)
values (7893921, 'North', 6062);
insert into BASE (base_id, location, capacity)
values (7495137, 'South', 2532);
insert into BASE (base_id, location, capacity)
values (7365327, 'South', 4879);
insert into BASE (base_id, location, capacity)
values (9407813, 'South', 2331);
insert into BASE (base_id, location, capacity)
values (8896599, 'South', 9189);
insert into BASE (base_id, location, capacity)
values (2245431, 'South', 2441);
insert into BASE (base_id, location, capacity)
values (7028691, 'North', 9630);
insert into BASE (base_id, location, capacity)
values (2249892, 'South', 7005);
insert into BASE (base_id, location, capacity)
values (6971394, 'North', 7146);
insert into BASE (base_id, location, capacity)
values (2708504, 'South', 6898);
insert into BASE (base_id, location, capacity)
values (8005820, 'South', 2939);
insert into BASE (base_id, location, capacity)
values (8482110, 'South', 2672);
insert into BASE (base_id, location, capacity)
values (5599498, 'South', 2500);
insert into BASE (base_id, location, capacity)
values (9842668, 'South', 4077);
insert into BASE (base_id, location, capacity)
values (2501279, 'North', 3442);
insert into BASE (base_id, location, capacity)
values (9896801, 'South', 3628);
insert into BASE (base_id, location, capacity)
values (6752205, 'South', 6829);
insert into BASE (base_id, location, capacity)
values (1489935, 'South', 4770);
insert into BASE (base_id, location, capacity)
values (2819021, 'North', 3482);
insert into BASE (base_id, location, capacity)
values (4299184, 'North', 6823);
insert into BASE (base_id, location, capacity)
values (3741554, 'South', 6842);
insert into BASE (base_id, location, capacity)
values (3394388, 'South', 5572);
insert into BASE (base_id, location, capacity)
values (3596329, 'South', 6879);
insert into BASE (base_id, location, capacity)
values (6938326, 'North', 8659);
insert into BASE (base_id, location, capacity)
values (6528989, 'North', 3798);
insert into BASE (base_id, location, capacity)
values (5471534, 'South', 9200);
insert into BASE (base_id, location, capacity)
values (4409836, 'North', 8273);
insert into BASE (base_id, location, capacity)
values (2446905, 'North', 9989);
insert into BASE (base_id, location, capacity)
values (9632643, 'North', 9338);
insert into BASE (base_id, location, capacity)
values (1906749, 'North', 4566);
insert into BASE (base_id, location, capacity)
values (4019241, 'South', 6216);
insert into BASE (base_id, location, capacity)
values (5492882, 'North', 4927);
insert into BASE (base_id, location, capacity)
values (4023885, 'North', 2841);
insert into BASE (base_id, location, capacity)
values (3910956, 'South', 3247);
insert into BASE (base_id, location, capacity)
values (5764337, 'North', 8102);
insert into BASE (base_id, location, capacity)
values (3596212, 'South', 7112);
insert into BASE (base_id, location, capacity)
values (1653748, 'South', 9472);
insert into BASE (base_id, location, capacity)
values (2211654, 'South', 6939);
insert into BASE (base_id, location, capacity)
values (3880995, 'North', 3076);
insert into BASE (base_id, location, capacity)
values (7813716, 'North', 9036);
insert into BASE (base_id, location, capacity)
values (7499865, 'North', 3986);
insert into BASE (base_id, location, capacity)
values (2607420, 'North', 6566);
insert into BASE (base_id, location, capacity)
values (3751711, 'South', 9052);
commit;
prompt 100 records committed...
insert into BASE (base_id, location, capacity)
values (7245252, 'South', 4070);
insert into BASE (base_id, location, capacity)
values (2274538, 'South', 3476);
insert into BASE (base_id, location, capacity)
values (8164017, 'South', 3635);
insert into BASE (base_id, location, capacity)
values (5356352, 'South', 5944);
insert into BASE (base_id, location, capacity)
values (3564288, 'South', 2815);
insert into BASE (base_id, location, capacity)
values (1184562, 'North', 2141);
insert into BASE (base_id, location, capacity)
values (3880226, 'South', 6478);
insert into BASE (base_id, location, capacity)
values (7438718, 'North', 9264);
insert into BASE (base_id, location, capacity)
values (7026024, 'South', 9386);
insert into BASE (base_id, location, capacity)
values (4383441, 'South', 3223);
insert into BASE (base_id, location, capacity)
values (1901528, 'North', 3997);
insert into BASE (base_id, location, capacity)
values (2154556, 'North', 4181);
insert into BASE (base_id, location, capacity)
values (3656169, 'South', 5276);
insert into BASE (base_id, location, capacity)
values (8006597, 'North', 5238);
insert into BASE (base_id, location, capacity)
values (9609769, 'South', 9551);
insert into BASE (base_id, location, capacity)
values (4216640, 'North', 6198);
insert into BASE (base_id, location, capacity)
values (4573516, 'North', 6420);
insert into BASE (base_id, location, capacity)
values (3930228, 'South', 9614);
insert into BASE (base_id, location, capacity)
values (1166918, 'South', 5589);
insert into BASE (base_id, location, capacity)
values (7802543, 'North', 4541);
insert into BASE (base_id, location, capacity)
values (2649426, 'North', 5062);
insert into BASE (base_id, location, capacity)
values (6644408, 'South', 6871);
insert into BASE (base_id, location, capacity)
values (2341058, 'North', 5677);
insert into BASE (base_id, location, capacity)
values (9740737, 'South', 2407);
insert into BASE (base_id, location, capacity)
values (5957349, 'North', 2086);
insert into BASE (base_id, location, capacity)
values (3881087, 'South', 4468);
insert into BASE (base_id, location, capacity)
values (4692725, 'North', 4525);
insert into BASE (base_id, location, capacity)
values (5740636, 'South', 2188);
insert into BASE (base_id, location, capacity)
values (4715516, 'South', 9405);
insert into BASE (base_id, location, capacity)
values (8887579, 'South', 9436);
insert into BASE (base_id, location, capacity)
values (3449727, 'North', 4651);
insert into BASE (base_id, location, capacity)
values (3682201, 'North', 9797);
insert into BASE (base_id, location, capacity)
values (9675914, 'South', 8048);
insert into BASE (base_id, location, capacity)
values (7486203, 'North', 8921);
insert into BASE (base_id, location, capacity)
values (5648560, 'North', 6301);
insert into BASE (base_id, location, capacity)
values (1230754, 'South', 6211);
insert into BASE (base_id, location, capacity)
values (5162677, 'North', 9573);
insert into BASE (base_id, location, capacity)
values (9310665, 'North', 9775);
insert into BASE (base_id, location, capacity)
values (1370555, 'North', 9251);
insert into BASE (base_id, location, capacity)
values (3292604, 'South', 4389);
insert into BASE (base_id, location, capacity)
values (4213017, 'South', 2417);
insert into BASE (base_id, location, capacity)
values (9859836, 'North', 8305);
insert into BASE (base_id, location, capacity)
values (1150872, 'South', 5119);
insert into BASE (base_id, location, capacity)
values (4077115, 'North', 7637);
insert into BASE (base_id, location, capacity)
values (8523816, 'South', 6828);
insert into BASE (base_id, location, capacity)
values (5259525, 'South', 3312);
insert into BASE (base_id, location, capacity)
values (1888478, 'South', 4810);
insert into BASE (base_id, location, capacity)
values (4780856, 'South', 7595);
insert into BASE (base_id, location, capacity)
values (2157015, 'South', 7971);
insert into BASE (base_id, location, capacity)
values (5872898, 'South', 7547);
insert into BASE (base_id, location, capacity)
values (6835215, 'South', 3717);
insert into BASE (base_id, location, capacity)
values (5159434, 'North', 9948);
insert into BASE (base_id, location, capacity)
values (2206902, 'South', 2880);
insert into BASE (base_id, location, capacity)
values (6150145, 'South', 6698);
insert into BASE (base_id, location, capacity)
values (2492108, 'South', 5303);
insert into BASE (base_id, location, capacity)
values (8502657, 'South', 5976);
insert into BASE (base_id, location, capacity)
values (2882459, 'North', 6839);
insert into BASE (base_id, location, capacity)
values (5358033, 'North', 9056);
insert into BASE (base_id, location, capacity)
values (4491012, 'North', 9697);
insert into BASE (base_id, location, capacity)
values (9778633, 'South', 2099);
insert into BASE (base_id, location, capacity)
values (2707855, 'South', 2836);
insert into BASE (base_id, location, capacity)
values (5079970, 'South', 2950);
insert into BASE (base_id, location, capacity)
values (7789746, 'South', 3916);
insert into BASE (base_id, location, capacity)
values (1962449, 'South', 5509);
insert into BASE (base_id, location, capacity)
values (9794238, 'North', 3717);
insert into BASE (base_id, location, capacity)
values (1627194, 'North', 9116);
insert into BASE (base_id, location, capacity)
values (2758821, 'North', 8353);
insert into BASE (base_id, location, capacity)
values (1815039, 'South', 2032);
insert into BASE (base_id, location, capacity)
values (3385937, 'North', 6655);
insert into BASE (base_id, location, capacity)
values (2751730, 'North', 9090);
insert into BASE (base_id, location, capacity)
values (4987898, 'South', 4132);
insert into BASE (base_id, location, capacity)
values (8627871, 'South', 4352);
insert into BASE (base_id, location, capacity)
values (3134210, 'South', 5567);
insert into BASE (base_id, location, capacity)
values (1301720, 'North', 4773);
insert into BASE (base_id, location, capacity)
values (3890101, 'South', 7997);
insert into BASE (base_id, location, capacity)
values (9699088, 'South', 2691);
insert into BASE (base_id, location, capacity)
values (3801644, 'North', 5101);
insert into BASE (base_id, location, capacity)
values (2709769, 'South', 2286);
insert into BASE (base_id, location, capacity)
values (7432294, 'South', 3303);
insert into BASE (base_id, location, capacity)
values (4556709, 'South', 4114);
insert into BASE (base_id, location, capacity)
values (3350354, 'South', 5819);
insert into BASE (base_id, location, capacity)
values (7454917, 'South', 3230);
insert into BASE (base_id, location, capacity)
values (2569477, 'South', 5792);
insert into BASE (base_id, location, capacity)
values (4194531, 'North', 4538);
insert into BASE (base_id, location, capacity)
values (3617094, 'South', 4197);
insert into BASE (base_id, location, capacity)
values (4888873, 'South', 8497);
insert into BASE (base_id, location, capacity)
values (4211396, 'South', 8733);
insert into BASE (base_id, location, capacity)
values (8836351, 'North', 3614);
insert into BASE (base_id, location, capacity)
values (9028404, 'South', 5076);
insert into BASE (base_id, location, capacity)
values (1067132, 'North', 9735);
insert into BASE (base_id, location, capacity)
values (7799508, 'North', 2076);
insert into BASE (base_id, location, capacity)
values (5994133, 'South', 6567);
insert into BASE (base_id, location, capacity)
values (6058922, 'South', 6178);
insert into BASE (base_id, location, capacity)
values (6475597, 'North', 9608);
insert into BASE (base_id, location, capacity)
values (4822423, 'North', 6250);
insert into BASE (base_id, location, capacity)
values (5835743, 'North', 7152);
insert into BASE (base_id, location, capacity)
values (7385989, 'South', 4318);
insert into BASE (base_id, location, capacity)
values (1793337, 'South', 9969);
insert into BASE (base_id, location, capacity)
values (6847949, 'South', 7193);
insert into BASE (base_id, location, capacity)
values (7127882, 'North', 3824);
commit;
prompt 200 records committed...
insert into BASE (base_id, location, capacity)
values (3943663, 'South', 2942);
insert into BASE (base_id, location, capacity)
values (1082097, 'North', 5071);
insert into BASE (base_id, location, capacity)
values (7899860, 'South', 9292);
insert into BASE (base_id, location, capacity)
values (5269837, 'North', 7272);
insert into BASE (base_id, location, capacity)
values (3329277, 'South', 2601);
insert into BASE (base_id, location, capacity)
values (1043200, 'South', 2943);
insert into BASE (base_id, location, capacity)
values (6257519, 'South', 8816);
insert into BASE (base_id, location, capacity)
values (3183683, 'South', 7418);
insert into BASE (base_id, location, capacity)
values (2265653, 'South', 6006);
insert into BASE (base_id, location, capacity)
values (3232451, 'South', 4052);
insert into BASE (base_id, location, capacity)
values (2006475, 'South', 4480);
insert into BASE (base_id, location, capacity)
values (6076546, 'South', 6028);
insert into BASE (base_id, location, capacity)
values (4072115, 'South', 7265);
insert into BASE (base_id, location, capacity)
values (1373671, 'North', 4385);
insert into BASE (base_id, location, capacity)
values (5918165, 'South', 3780);
insert into BASE (base_id, location, capacity)
values (1340571, 'South', 7040);
insert into BASE (base_id, location, capacity)
values (5347409, 'South', 8957);
insert into BASE (base_id, location, capacity)
values (8161495, 'North', 4064);
insert into BASE (base_id, location, capacity)
values (7486838, 'North', 9696);
insert into BASE (base_id, location, capacity)
values (8106200, 'South', 2751);
insert into BASE (base_id, location, capacity)
values (4317667, 'South', 8633);
insert into BASE (base_id, location, capacity)
values (9194052, 'South', 4630);
insert into BASE (base_id, location, capacity)
values (5201831, 'South', 6411);
insert into BASE (base_id, location, capacity)
values (4214407, 'North', 3976);
insert into BASE (base_id, location, capacity)
values (4552529, 'South', 2405);
insert into BASE (base_id, location, capacity)
values (3926146, 'South', 4111);
insert into BASE (base_id, location, capacity)
values (6383330, 'North', 4663);
insert into BASE (base_id, location, capacity)
values (8623493, 'North', 4312);
insert into BASE (base_id, location, capacity)
values (8002559, 'North', 7217);
insert into BASE (base_id, location, capacity)
values (7783581, 'South', 9012);
insert into BASE (base_id, location, capacity)
values (5516085, 'South', 2625);
insert into BASE (base_id, location, capacity)
values (2561075, 'North', 9440);
insert into BASE (base_id, location, capacity)
values (8829232, 'South', 4330);
insert into BASE (base_id, location, capacity)
values (1621944, 'North', 9891);
insert into BASE (base_id, location, capacity)
values (5603515, 'South', 5419);
insert into BASE (base_id, location, capacity)
values (6782058, 'North', 8884);
insert into BASE (base_id, location, capacity)
values (6522233, 'South', 8513);
insert into BASE (base_id, location, capacity)
values (2207468, 'South', 5579);
insert into BASE (base_id, location, capacity)
values (2016907, 'North', 6915);
insert into BASE (base_id, location, capacity)
values (6950843, 'South', 2237);
insert into BASE (base_id, location, capacity)
values (8029673, 'North', 2355);
insert into BASE (base_id, location, capacity)
values (5320367, 'South', 6771);
insert into BASE (base_id, location, capacity)
values (4880879, 'South', 3225);
insert into BASE (base_id, location, capacity)
values (6222040, 'South', 2823);
insert into BASE (base_id, location, capacity)
values (3446973, 'North', 5050);
insert into BASE (base_id, location, capacity)
values (5938360, 'South', 9466);
insert into BASE (base_id, location, capacity)
values (8127586, 'South', 3494);
insert into BASE (base_id, location, capacity)
values (7094849, 'South', 7336);
insert into BASE (base_id, location, capacity)
values (9488116, 'South', 4615);
insert into BASE (base_id, location, capacity)
values (4736425, 'South', 6792);
insert into BASE (base_id, location, capacity)
values (7725236, 'South', 5202);
insert into BASE (base_id, location, capacity)
values (4960965, 'North', 9901);
insert into BASE (base_id, location, capacity)
values (9828531, 'North', 6479);
insert into BASE (base_id, location, capacity)
values (9654575, 'North', 2101);
insert into BASE (base_id, location, capacity)
values (2979017, 'South', 7278);
insert into BASE (base_id, location, capacity)
values (2981171, 'South', 2745);
insert into BASE (base_id, location, capacity)
values (5665760, 'North', 7577);
insert into BASE (base_id, location, capacity)
values (5776999, 'South', 7765);
insert into BASE (base_id, location, capacity)
values (6383273, 'South', 6637);
insert into BASE (base_id, location, capacity)
values (7534197, 'South', 9295);
insert into BASE (base_id, location, capacity)
values (8261243, 'North', 3652);
insert into BASE (base_id, location, capacity)
values (1510097, 'North', 8309);
insert into BASE (base_id, location, capacity)
values (7603338, 'North', 2786);
insert into BASE (base_id, location, capacity)
values (3526562, 'South', 4111);
insert into BASE (base_id, location, capacity)
values (5105795, 'North', 8982);
insert into BASE (base_id, location, capacity)
values (7716161, 'South', 7195);
insert into BASE (base_id, location, capacity)
values (1277662, 'South', 7822);
insert into BASE (base_id, location, capacity)
values (8802505, 'North', 4372);
insert into BASE (base_id, location, capacity)
values (5344218, 'South', 3658);
insert into BASE (base_id, location, capacity)
values (8459654, 'North', 3702);
insert into BASE (base_id, location, capacity)
values (1118980, 'North', 6278);
insert into BASE (base_id, location, capacity)
values (8680745, 'North', 8032);
insert into BASE (base_id, location, capacity)
values (3635244, 'North', 5407);
insert into BASE (base_id, location, capacity)
values (4618633, 'North', 4658);
insert into BASE (base_id, location, capacity)
values (6343849, 'North', 9984);
insert into BASE (base_id, location, capacity)
values (3879408, 'North', 7356);
insert into BASE (base_id, location, capacity)
values (2546404, 'North', 2541);
insert into BASE (base_id, location, capacity)
values (4449294, 'North', 7245);
insert into BASE (base_id, location, capacity)
values (9188851, 'North', 3003);
insert into BASE (base_id, location, capacity)
values (6960977, 'South', 2324);
insert into BASE (base_id, location, capacity)
values (9453155, 'North', 5169);
insert into BASE (base_id, location, capacity)
values (8371346, 'North', 5635);
insert into BASE (base_id, location, capacity)
values (4867157, 'North', 5712);
insert into BASE (base_id, location, capacity)
values (1783223, 'North', 9394);
insert into BASE (base_id, location, capacity)
values (8173179, 'South', 5487);
insert into BASE (base_id, location, capacity)
values (4078084, 'North', 4089);
insert into BASE (base_id, location, capacity)
values (9671100, 'North', 8247);
insert into BASE (base_id, location, capacity)
values (7494784, 'North', 5752);
insert into BASE (base_id, location, capacity)
values (9367537, 'South', 3184);
insert into BASE (base_id, location, capacity)
values (7488637, 'South', 7733);
insert into BASE (base_id, location, capacity)
values (2848346, 'North', 6843);
insert into BASE (base_id, location, capacity)
values (4254601, 'South', 7419);
insert into BASE (base_id, location, capacity)
values (7985300, 'South', 6255);
insert into BASE (base_id, location, capacity)
values (1598446, 'South', 7064);
insert into BASE (base_id, location, capacity)
values (2461106, 'South', 6005);
insert into BASE (base_id, location, capacity)
values (1200517, 'North', 5388);
insert into BASE (base_id, location, capacity)
values (4859469, 'North', 8143);
insert into BASE (base_id, location, capacity)
values (7999478, 'South', 5206);
insert into BASE (base_id, location, capacity)
values (4228001, 'North', 5886);
insert into BASE (base_id, location, capacity)
values (9522749, 'South', 8863);
commit;
prompt 300 records committed...
insert into BASE (base_id, location, capacity)
values (7142778, 'South', 8248);
insert into BASE (base_id, location, capacity)
values (6767808, 'South', 5464);
insert into BASE (base_id, location, capacity)
values (3645412, 'North', 2750);
insert into BASE (base_id, location, capacity)
values (9796583, 'South', 9778);
insert into BASE (base_id, location, capacity)
values (9447081, 'South', 6562);
insert into BASE (base_id, location, capacity)
values (1550393, 'South', 8546);
insert into BASE (base_id, location, capacity)
values (3409378, 'North', 9745);
insert into BASE (base_id, location, capacity)
values (7333912, 'North', 2399);
insert into BASE (base_id, location, capacity)
values (5411817, 'North', 7447);
insert into BASE (base_id, location, capacity)
values (3973174, 'South', 4982);
insert into BASE (base_id, location, capacity)
values (4173329, 'South', 8591);
insert into BASE (base_id, location, capacity)
values (4364915, 'South', 7636);
insert into BASE (base_id, location, capacity)
values (5968371, 'South', 8854);
insert into BASE (base_id, location, capacity)
values (4830313, 'North', 4897);
insert into BASE (base_id, location, capacity)
values (8069111, 'South', 2784);
insert into BASE (base_id, location, capacity)
values (5654494, 'South', 9079);
insert into BASE (base_id, location, capacity)
values (9702693, 'North', 7780);
insert into BASE (base_id, location, capacity)
values (2093635, 'North', 9615);
insert into BASE (base_id, location, capacity)
values (7673017, 'South', 8575);
insert into BASE (base_id, location, capacity)
values (3675512, 'South', 6006);
insert into BASE (base_id, location, capacity)
values (5170618, 'North', 7558);
insert into BASE (base_id, location, capacity)
values (7042556, 'South', 4750);
insert into BASE (base_id, location, capacity)
values (9081656, 'South', 7743);
insert into BASE (base_id, location, capacity)
values (2541742, 'South', 9432);
insert into BASE (base_id, location, capacity)
values (2573950, 'North', 4604);
insert into BASE (base_id, location, capacity)
values (7680583, 'North', 5096);
insert into BASE (base_id, location, capacity)
values (8242911, 'South', 6603);
insert into BASE (base_id, location, capacity)
values (1678848, 'South', 8004);
insert into BASE (base_id, location, capacity)
values (3894143, 'South', 7219);
insert into BASE (base_id, location, capacity)
values (7588771, 'North', 3922);
insert into BASE (base_id, location, capacity)
values (2435008, 'South', 8098);
insert into BASE (base_id, location, capacity)
values (5895010, 'North', 8792);
insert into BASE (base_id, location, capacity)
values (1157014, 'North', 2029);
insert into BASE (base_id, location, capacity)
values (8701909, 'North', 7227);
insert into BASE (base_id, location, capacity)
values (1227023, 'South', 4363);
insert into BASE (base_id, location, capacity)
values (6632196, 'North', 5653);
insert into BASE (base_id, location, capacity)
values (8280458, 'South', 2719);
insert into BASE (base_id, location, capacity)
values (6960681, 'North', 2120);
insert into BASE (base_id, location, capacity)
values (8936465, 'South', 7893);
insert into BASE (base_id, location, capacity)
values (9351241, 'South', 4788);
insert into BASE (base_id, location, capacity)
values (9645797, 'South', 8163);
insert into BASE (base_id, location, capacity)
values (9417924, 'North', 9962);
insert into BASE (base_id, location, capacity)
values (6849552, 'South', 5439);
insert into BASE (base_id, location, capacity)
values (4253827, 'North', 7115);
insert into BASE (base_id, location, capacity)
values (7783391, 'North', 3108);
insert into BASE (base_id, location, capacity)
values (2627121, 'South', 8879);
insert into BASE (base_id, location, capacity)
values (1719804, 'North', 8756);
insert into BASE (base_id, location, capacity)
values (4794509, 'North', 9099);
insert into BASE (base_id, location, capacity)
values (3813126, 'South', 8526);
insert into BASE (base_id, location, capacity)
values (2391242, 'South', 8304);
insert into BASE (base_id, location, capacity)
values (2310589, 'North', 2321);
insert into BASE (base_id, location, capacity)
values (1685902, 'South', 5635);
insert into BASE (base_id, location, capacity)
values (7530416, 'South', 6735);
insert into BASE (base_id, location, capacity)
values (2200056, 'South', 8132);
insert into BASE (base_id, location, capacity)
values (3997230, 'North', 6169);
insert into BASE (base_id, location, capacity)
values (6350158, 'South', 4650);
insert into BASE (base_id, location, capacity)
values (5278329, 'North', 8456);
insert into BASE (base_id, location, capacity)
values (8934054, 'North', 9141);
insert into BASE (base_id, location, capacity)
values (9694317, 'South', 9929);
insert into BASE (base_id, location, capacity)
values (9019860, 'South', 9000);
insert into BASE (base_id, location, capacity)
values (4996481, 'North', 2893);
insert into BASE (base_id, location, capacity)
values (5663092, 'North', 3297);
insert into BASE (base_id, location, capacity)
values (9623832, 'South', 8236);
insert into BASE (base_id, location, capacity)
values (2941446, 'North', 3326);
insert into BASE (base_id, location, capacity)
values (1087305, 'North', 5989);
insert into BASE (base_id, location, capacity)
values (7617887, 'South', 2565);
insert into BASE (base_id, location, capacity)
values (6689720, 'North', 9614);
insert into BASE (base_id, location, capacity)
values (5159719, 'South', 9351);
insert into BASE (base_id, location, capacity)
values (3414667, 'South', 6023);
insert into BASE (base_id, location, capacity)
values (9621508, 'South', 8753);
insert into BASE (base_id, location, capacity)
values (8155818, 'North', 8127);
insert into BASE (base_id, location, capacity)
values (6006500, 'South', 3737);
insert into BASE (base_id, location, capacity)
values (8358419, 'South', 8807);
insert into BASE (base_id, location, capacity)
values (3254708, 'South', 9444);
insert into BASE (base_id, location, capacity)
values (7672225, 'North', 4572);
insert into BASE (base_id, location, capacity)
values (1948663, 'North', 7295);
insert into BASE (base_id, location, capacity)
values (2100001, 'South', 3401);
insert into BASE (base_id, location, capacity)
values (6473725, 'North', 7101);
insert into BASE (base_id, location, capacity)
values (3027847, 'North', 6038);
insert into BASE (base_id, location, capacity)
values (5434342, 'North', 5982);
insert into BASE (base_id, location, capacity)
values (8868197, 'South', 8268);
insert into BASE (base_id, location, capacity)
values (7337064, 'North', 5814);
insert into BASE (base_id, location, capacity)
values (1360966, 'North', 2776);
insert into BASE (base_id, location, capacity)
values (1575557, 'South', 7558);
insert into BASE (base_id, location, capacity)
values (5664370, 'North', 3603);
insert into BASE (base_id, location, capacity)
values (3947799, 'South', 5922);
insert into BASE (base_id, location, capacity)
values (7953959, 'North', 3709);
insert into BASE (base_id, location, capacity)
values (7938820, 'South', 8606);
insert into BASE (base_id, location, capacity)
values (8269150, 'North', 7501);
insert into BASE (base_id, location, capacity)
values (8595332, 'North', 2265);
insert into BASE (base_id, location, capacity)
values (4693621, 'South', 6667);
insert into BASE (base_id, location, capacity)
values (1638608, 'South', 5982);
insert into BASE (base_id, location, capacity)
values (2667321, 'North', 7490);
insert into BASE (base_id, location, capacity)
values (1921039, 'North', 2123);
insert into BASE (base_id, location, capacity)
values (6235298, 'North', 4978);
insert into BASE (base_id, location, capacity)
values (1257997, 'North', 8117);
insert into BASE (base_id, location, capacity)
values (6938609, 'North', 5392);
insert into BASE (base_id, location, capacity)
values (7996821, 'North', 2336);
insert into BASE (base_id, location, capacity)
values (6977097, 'South', 5008);
insert into BASE (base_id, location, capacity)
values (3598298, 'North', 9548);
commit;
prompt 400 records loaded
prompt Loading AIRCRAFT...
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4152741, 'F-16I Sufa', 'Under Maintenance', 2341058);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5893093, 'F-35I Adir', 'Inactive', 9407813);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8582823, 'F-35I Adir', 'Active', 7938820);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8882657, 'F-35I Adir', 'Inactive', 2006475);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1609955, 'F-35I Adir', 'Inactive', 5938360);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8981330, 'F-16I Sufa', 'Active', 6383330);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9260284, 'F-15I Raam', 'Inactive', 9188851);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6284745, 'F-16I Sufa', 'Active', 8680745);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2921342, 'F-35I Adir', 'Under Maintenance', 1321073);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3743331, 'F-15I Raam', 'Inactive', 6373161);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3479015, 'F-15 Baz', 'Active', 7680583);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1027551, 'F-16I Sufa', 'Inactive', 6849552);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9089023, 'F-35I Adir', 'Under Maintenance', 3894143);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4705632, 'F-15 Baz', 'Inactive', 1621944);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2260910, 'F-16I Sufa', 'Under Maintenance', 7802543);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9733803, 'F-15I Raam', 'Active', 4228001);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9254523, 'F-35I Adir', 'Under Maintenance', 3894143);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6259026, 'F-16I Sufa', 'Under Maintenance', 2561075);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4788999, 'F-35I Adir', 'Inactive', 6222040);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2734234, 'F-15I Raam', 'Inactive', 1477365);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4064250, 'F-15I Raam', 'Active', 5347409);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2346062, 'F-35I Adir', 'Active', 7365327);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9094945, 'F-35I Adir', 'Active', 7486838);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4755086, 'F-35I Adir', 'Under Maintenance', 4859469);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7356995, 'F-15I Raam', 'Inactive', 5918165);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6148550, 'F-15 Baz', 'Under Maintenance', 8127586);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4746541, 'F-16I Sufa', 'Inactive', 2819021);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6605609, 'F-15I Raam', 'Active', 3910956);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2851433, 'F-15I Raam', 'Active', 2154556);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6775056, 'F-15I Raam', 'Under Maintenance', 9569121);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1535216, 'F-16I Sufa', 'Under Maintenance', 3926146);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2865561, 'F-15 Baz', 'Active', 7488637);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8833618, 'F-35I Adir', 'Inactive', 7245252);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6948403, 'F-16I Sufa', 'Inactive', 9699088);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4163530, 'F-35I Adir', 'Under Maintenance', 7617887);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2572707, 'F-15I Raam', 'Under Maintenance', 8595332);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7844491, 'F-16I Sufa', 'Inactive', 5835743);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6693175, 'F-35I Adir', 'Inactive', 7432294);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4932676, 'F-35I Adir', 'Inactive', 5516085);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3910321, 'F-15 Baz', 'Active', 1575557);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2367375, 'F-15 Baz', 'Active', 2941446);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5023209, 'F-35I Adir', 'Under Maintenance', 3254708);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3429980, 'F-35I Adir', 'Inactive', 1621944);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4894684, 'F-35I Adir', 'Under Maintenance', 9447081);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7515473, 'F-35I Adir', 'Inactive', 1489935);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1629105, 'F-35I Adir', 'Active', 3813126);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8216402, 'F-35I Adir', 'Under Maintenance', 1719804);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5062584, 'F-15 Baz', 'Active', 4211396);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7719373, 'F-16I Sufa', 'Inactive', 5162677);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7565717, 'F-15I Raam', 'Under Maintenance', 5764337);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2514032, 'F-15 Baz', 'Inactive', 4736425);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7158819, 'F-15 Baz', 'Under Maintenance', 7385989);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3414547, 'F-15 Baz', 'Under Maintenance', 1604680);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1939659, 'F-16I Sufa', 'Inactive', 6076546);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8893595, 'F-16I Sufa', 'Active', 2501279);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9823693, 'F-15I Raam', 'Under Maintenance', 7985300);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3728847, 'F-35I Adir', 'Active', 2006475);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5596801, 'F-35I Adir', 'Inactive', 4960965);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9961949, 'F-15 Baz', 'Under Maintenance', 2941446);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9280519, 'F-35I Adir', 'Active', 8261243);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1170010, 'F-16I Sufa', 'Active', 6644408);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1809773, 'F-35I Adir', 'Under Maintenance', 1373671);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4049584, 'F-35I Adir', 'Inactive', 5895010);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1023116, 'F-15 Baz', 'Active', 5162677);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9313155, 'F-15 Baz', 'Inactive', 1627194);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9965460, 'F-16I Sufa', 'Under Maintenance', 1360966);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6898122, 'F-15 Baz', 'Under Maintenance', 1621944);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8503312, 'F-35I Adir', 'Inactive', 7245252);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1488283, 'F-16I Sufa', 'Under Maintenance', 2391242);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6252508, 'F-15I Raam', 'Inactive', 1118980);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8347820, 'F-35I Adir', 'Under Maintenance', 9351241);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3818444, 'F-15I Raam', 'Under Maintenance', 4736425);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2467780, 'F-15 Baz', 'Under Maintenance', 5269837);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6348818, 'F-16I Sufa', 'Active', 1621944);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1025065, 'F-15 Baz', 'Under Maintenance', 8161495);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8398855, 'F-15 Baz', 'Active', 8936465);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9153913, 'F-15 Baz', 'Inactive', 4552529);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4109051, 'F-35I Adir', 'Active', 3910956);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9029880, 'F-16I Sufa', 'Active', 6971394);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4695397, 'F-15 Baz', 'Under Maintenance', 2389852);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1266331, 'F-15 Baz', 'Under Maintenance', 1685902);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9252124, 'F-15I Raam', 'Active', 3675512);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8623418, 'F-16I Sufa', 'Active', 7481871);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9866928, 'F-35I Adir', 'Active', 5648560);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6029568, 'F-15 Baz', 'Under Maintenance', 5648560);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4048713, 'F-15I Raam', 'Under Maintenance', 8829232);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1915467, 'F-15I Raam', 'Under Maintenance', 3027847);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5467817, 'F-35I Adir', 'Under Maintenance', 9895475);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9860541, 'F-15 Baz', 'Active', 9194052);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8008752, 'F-15 Baz', 'Inactive', 6383330);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9551946, 'F-15 Baz', 'Under Maintenance', 4736425);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2135437, 'F-15I Raam', 'Under Maintenance', 5663092);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5056047, 'F-16I Sufa', 'Active', 1033041);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7568931, 'F-16I Sufa', 'Inactive', 1118980);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9402407, 'F-15I Raam', 'Inactive', 6473725);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5277671, 'F-16I Sufa', 'Under Maintenance', 6235298);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9480268, 'F-16I Sufa', 'Under Maintenance', 8680745);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2780201, 'F-16I Sufa', 'Under Maintenance', 2705942);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1247537, 'F-35I Adir', 'Active', 1277662);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7760410, 'F-35I Adir', 'Inactive', 3656169);
commit;
prompt 100 records committed...
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5252269, 'F-35I Adir', 'Under Maintenance', 8836351);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8995267, 'F-15I Raam', 'Active', 4253827);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8466653, 'F-35I Adir', 'Inactive', 4822423);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9595052, 'F-15 Baz', 'Under Maintenance', 4692725);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3433496, 'F-15I Raam', 'Inactive', 6076546);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4556095, 'F-15I Raam', 'Active', 6350158);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7725207, 'F-15 Baz', 'Active', 4253827);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1626004, 'F-35I Adir', 'Under Maintenance', 3183683);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9715280, 'F-15 Baz', 'Active', 4888873);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4481406, 'F-15I Raam', 'Inactive', 2310589);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2662282, 'F-35I Adir', 'Under Maintenance', 3446973);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3218179, 'F-16I Sufa', 'Under Maintenance', 8029673);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8106334, 'F-15I Raam', 'Under Maintenance', 8868197);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8154183, 'F-35I Adir', 'Inactive', 6522233);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7578096, 'F-15I Raam', 'Active', 8005820);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9944499, 'F-16I Sufa', 'Inactive', 7673017);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7620252, 'F-16I Sufa', 'Under Maintenance', 7588771);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1009161, 'F-15I Raam', 'Under Maintenance', 5968371);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4121496, 'F-16I Sufa', 'Under Maintenance', 8802505);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4273393, 'F-15I Raam', 'Inactive', 3414667);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7963014, 'F-16I Sufa', 'Under Maintenance', 8106200);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1220339, 'F-35I Adir', 'Active', 1301720);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5977467, 'F-16I Sufa', 'Under Maintenance', 9675914);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2256300, 'F-16I Sufa', 'Under Maintenance', 9699088);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1220480, 'F-35I Adir', 'Inactive', 1906749);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7388469, 'F-35I Adir', 'Under Maintenance', 1301115);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6554623, 'F-35I Adir', 'Inactive', 7899860);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1215163, 'F-15I Raam', 'Inactive', 9726685);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9545895, 'F-15 Baz', 'Under Maintenance', 3345502);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9228562, 'F-15I Raam', 'Under Maintenance', 5079970);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7672711, 'F-15I Raam', 'Inactive', 2265653);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8429937, 'F-35I Adir', 'Inactive', 6971394);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5847385, 'F-15 Baz', 'Under Maintenance', 7454917);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7257389, 'F-15 Baz', 'Active', 2981171);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3250114, 'F-16I Sufa', 'Active', 8280458);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6826082, 'F-16I Sufa', 'Active', 4072115);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5475461, 'F-15I Raam', 'Under Maintenance', 9019860);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5480977, 'F-35I Adir', 'Inactive', 9796583);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7991343, 'F-15 Baz', 'Under Maintenance', 7530416);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1662066, 'F-35I Adir', 'Inactive', 5895010);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4910514, 'F-35I Adir', 'Inactive', 4715516);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4082110, 'F-15I Raam', 'Under Maintenance', 8802505);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5074546, 'F-16I Sufa', 'Inactive', 7292579);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4216867, 'F-15I Raam', 'Inactive', 1575557);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1450319, 'F-15 Baz', 'Inactive', 2569477);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1107832, 'F-15I Raam', 'Inactive', 1301720);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1839002, 'F-15I Raam', 'Active', 4457895);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6477468, 'F-15I Raam', 'Active', 4987898);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3897536, 'F-15 Baz', 'Inactive', 6971394);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3156942, 'F-16I Sufa', 'Inactive', 8280458);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4472622, 'F-16I Sufa', 'Under Maintenance', 3997230);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9826361, 'F-35I Adir', 'Under Maintenance', 5858610);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7247204, 'F-16I Sufa', 'Active', 3801644);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9067501, 'F-16I Sufa', 'Active', 2341058);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1699452, 'F-35I Adir', 'Active', 1653748);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8729046, 'F-15I Raam', 'Inactive', 1370555);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3374248, 'F-35I Adir', 'Under Maintenance', 1685902);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2604323, 'F-15 Baz', 'Inactive', 4077115);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2467169, 'F-16I Sufa', 'Inactive', 5006318);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1421531, 'F-16I Sufa', 'Under Maintenance', 8680745);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9720973, 'F-16I Sufa', 'Inactive', 7385989);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8146483, 'F-15I Raam', 'Under Maintenance', 7783391);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1634583, 'F-15I Raam', 'Inactive', 5492882);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9597832, 'F-15I Raam', 'Under Maintenance', 6938326);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7984570, 'F-15I Raam', 'Inactive', 1230754);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2374813, 'F-15 Baz', 'Under Maintenance', 3350354);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8659139, 'F-15 Baz', 'Inactive', 8280458);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8097471, 'F-15I Raam', 'Under Maintenance', 5303110);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8804611, 'F-16I Sufa', 'Active', 2667321);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5959402, 'F-15 Baz', 'Inactive', 3596212);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4284411, 'F-15 Baz', 'Active', 2848346);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7592981, 'F-15 Baz', 'Inactive', 1962449);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8450550, 'F-15I Raam', 'Inactive', 3926146);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4247099, 'F-16I Sufa', 'Inactive', 4457895);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5227609, 'F-15I Raam', 'Inactive', 2705942);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2277399, 'F-35I Adir', 'Active', 2607420);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8509225, 'F-15I Raam', 'Active', 3741554);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2949008, 'F-35I Adir', 'Active', 3801644);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2867074, 'F-15I Raam', 'Active', 5968371);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7551773, 'F-15I Raam', 'Active', 3656169);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8572356, 'F-15 Baz', 'Under Maintenance', 5918165);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2827993, 'F-16I Sufa', 'Active', 5740636);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9929781, 'F-15 Baz', 'Under Maintenance', 1984347);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7712656, 'F-16I Sufa', 'Under Maintenance', 8482110);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7924048, 'F-35I Adir', 'Under Maintenance', 2249892);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1386174, 'F-15I Raam', 'Active', 3880995);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8178837, 'F-35I Adir', 'Active', 2006475);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2639613, 'F-16I Sufa', 'Active', 2804121);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7228287, 'F-15 Baz', 'Inactive', 1200517);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3552431, 'F-16I Sufa', 'Under Maintenance', 8280458);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4100983, 'F-35I Adir', 'Under Maintenance', 8005820);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9482712, 'F-15I Raam', 'Inactive', 8173179);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1216440, 'F-35I Adir', 'Inactive', 7999478);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5369899, 'F-35I Adir', 'Active', 5434342);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3594090, 'F-15I Raam', 'Inactive', 4996481);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1350031, 'F-35I Adir', 'Under Maintenance', 7337064);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7374761, 'F-15I Raam', 'Active', 4214407);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4683474, 'F-15 Baz', 'Active', 7333912);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4654666, 'F-15 Baz', 'Inactive', 6971394);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7995158, 'F-35I Adir', 'Inactive', 1257997);
commit;
prompt 200 records committed...
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4631884, 'F-15 Baz', 'Active', 1678848);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2827308, 'F-16I Sufa', 'Under Maintenance', 1906749);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8065348, 'F-15 Baz', 'Under Maintenance', 9621508);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9504684, 'F-15I Raam', 'Inactive', 4715516);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7046326, 'F-15I Raam', 'Active', 8358419);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6312310, 'F-35I Adir', 'Inactive', 6058922);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1082408, 'F-35I Adir', 'Active', 3930228);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9985712, 'F-16I Sufa', 'Inactive', 9797811);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2493988, 'F-35I Adir', 'Under Maintenance', 6938609);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1513649, 'F-35I Adir', 'Under Maintenance', 5776999);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4123250, 'F-16I Sufa', 'Inactive', 5411817);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3253351, 'F-15 Baz', 'Inactive', 6960977);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8355652, 'F-35I Adir', 'Active', 2569477);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1358250, 'F-15I Raam', 'Under Maintenance', 8155818);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9453911, 'F-16I Sufa', 'Inactive', 8069111);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1518218, 'F-15 Baz', 'Under Maintenance', 8242911);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1204485, 'F-15I Raam', 'Inactive', 7672225);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2012297, 'F-35I Adir', 'Active', 4216640);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9876560, 'F-35I Adir', 'Active', 2882459);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1073937, 'F-15I Raam', 'Inactive', 4449294);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8493535, 'F-35I Adir', 'Active', 2501279);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2568730, 'F-15I Raam', 'Active', 5358033);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9417002, 'F-15I Raam', 'Under Maintenance', 3292604);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1984642, 'F-16I Sufa', 'Inactive', 2627121);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2243234, 'F-15 Baz', 'Inactive', 7617887);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6734750, 'F-15 Baz', 'Active', 6383273);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7012169, 'F-15 Baz', 'Active', 9623832);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9772473, 'F-35I Adir', 'Inactive', 7530416);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8728896, 'F-15 Baz', 'Inactive', 5918165);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6519312, 'F-35I Adir', 'Inactive', 9794238);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7197633, 'F-15 Baz', 'Under Maintenance', 3449727);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1105079, 'F-35I Adir', 'Inactive', 1082097);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2168218, 'F-16I Sufa', 'Inactive', 5764337);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1920632, 'F-35I Adir', 'Active', 3409378);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3795092, 'F-15I Raam', 'Under Maintenance', 3926146);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6483114, 'F-15I Raam', 'Under Maintenance', 1719804);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5408780, 'F-16I Sufa', 'Under Maintenance', 1227023);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2613682, 'F-35I Adir', 'Under Maintenance', 6950843);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8599881, 'F-16I Sufa', 'Under Maintenance', 5347409);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3927744, 'F-35I Adir', 'Under Maintenance', 1200517);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1615546, 'F-16I Sufa', 'Inactive', 1166918);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2637693, 'F-15I Raam', 'Under Maintenance', 4299184);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8068467, 'F-35I Adir', 'Under Maintenance', 8482110);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1668141, 'F-15 Baz', 'Active', 4689005);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7958360, 'F-16I Sufa', 'Under Maintenance', 9859836);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9083652, 'F-16I Sufa', 'Under Maintenance', 5648560);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1005949, 'F-15 Baz', 'Under Maintenance', 5654494);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3828982, 'F-15 Baz', 'Active', 5663092);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5299451, 'F-16I Sufa', 'Under Maintenance', 1598446);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7781806, 'F-35I Adir', 'Under Maintenance', 5269837);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9253559, 'F-35I Adir', 'Inactive', 9797811);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3117957, 'F-35I Adir', 'Under Maintenance', 7333912);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2880930, 'F-15I Raam', 'Under Maintenance', 3329277);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9989159, 'F-16I Sufa', 'Inactive', 4715516);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7376163, 'F-16I Sufa', 'Active', 7486203);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9513260, 'F-15 Baz', 'Inactive', 3812988);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4012291, 'F-35I Adir', 'Active', 5278329);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9076971, 'F-15I Raam', 'Under Maintenance', 8934054);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5349759, 'F-15I Raam', 'Under Maintenance', 2758821);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6951095, 'F-15 Baz', 'Under Maintenance', 7802543);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7757911, 'F-15I Raam', 'Active', 1360966);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9218263, 'F-15I Raam', 'Active', 5105795);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5248976, 'F-15I Raam', 'Inactive', 8357490);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9013171, 'F-15I Raam', 'Inactive', 1719804);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1624550, 'F-15I Raam', 'Inactive', 8802505);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9075312, 'F-15I Raam', 'Under Maintenance', 8005820);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2934580, 'F-15I Raam', 'Inactive', 9702693);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6614209, 'F-15 Baz', 'Under Maintenance', 6522233);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8248850, 'F-16I Sufa', 'Inactive', 2541742);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3487152, 'F-15I Raam', 'Inactive', 8934054);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7740965, 'F-15I Raam', 'Inactive', 3890101);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5689433, 'F-15I Raam', 'Under Maintenance', 2709769);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6084836, 'F-15I Raam', 'Inactive', 2265653);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3157077, 'F-16I Sufa', 'Under Maintenance', 9488672);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8163662, 'F-35I Adir', 'Under Maintenance', 5858610);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1882079, 'F-35I Adir', 'Under Maintenance', 4449294);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3091417, 'F-15 Baz', 'Active', 2100001);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9340137, 'F-15 Baz', 'Active', 4527562);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9546833, 'F-16I Sufa', 'Under Maintenance', 6235298);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9230888, 'F-35I Adir', 'Inactive', 7813716);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2419883, 'F-15 Baz', 'Active', 5159719);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6530640, 'F-35I Adir', 'Under Maintenance', 3813126);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8770771, 'F-15I Raam', 'Inactive', 4214407);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7857610, 'F-16I Sufa', 'Under Maintenance', 8358419);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4101408, 'F-15 Baz', 'Inactive', 1653748);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9149654, 'F-35I Adir', 'Active', 1184562);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4939405, 'F-16I Sufa', 'Under Maintenance', 1200517);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8654504, 'F-15 Baz', 'Inactive', 8280458);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6734549, 'F-15 Baz', 'Active', 6383273);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9232502, 'F-15 Baz', 'Inactive', 4736425);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1067795, 'F-16I Sufa', 'Active', 7432294);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9971834, 'F-16I Sufa', 'Inactive', 9726685);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9172745, 'F-15I Raam', 'Active', 7127882);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5116265, 'F-15 Baz', 'Active', 5356352);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5769635, 'F-16I Sufa', 'Inactive', 2389852);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8305374, 'F-15I Raam', 'Inactive', 7530416);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3211818, 'F-16I Sufa', 'Active', 3880226);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3127284, 'F-15 Baz', 'Inactive', 2607420);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7944750, 'F-15I Raam', 'Active', 8802505);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8983905, 'F-16I Sufa', 'Active', 7783581);
commit;
prompt 300 records committed...
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2277472, 'F-15I Raam', 'Active', 2200056);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1268657, 'F-15 Baz', 'Under Maintenance', 2389852);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5466599, 'F-16I Sufa', 'Under Maintenance', 2100001);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9856715, 'F-16I Sufa', 'Inactive', 4618633);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7112797, 'F-15 Baz', 'Inactive', 1301720);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8907738, 'F-15I Raam', 'Inactive', 9609769);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6869774, 'F-15 Baz', 'Inactive', 3232451);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2981103, 'F-15 Baz', 'Active', 7673017);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7465762, 'F-15I Raam', 'Active', 4254601);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3463641, 'F-15I Raam', 'Under Maintenance', 3292604);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6037500, 'F-15I Raam', 'Under Maintenance', 6835215);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3309871, 'F-35I Adir', 'Active', 8836351);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1776720, 'F-15 Baz', 'Active', 8242911);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4094736, 'F-15 Baz', 'Inactive', 6383273);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1889133, 'F-35I Adir', 'Inactive', 4019241);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5378834, 'F-15 Baz', 'Inactive', 5872898);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7865909, 'F-16I Sufa', 'Active', 4078084);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1386153, 'F-15 Baz', 'Inactive', 9671100);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9067664, 'F-16I Sufa', 'Active', 2709769);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2994310, 'F-16I Sufa', 'Under Maintenance', 9675914);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1620946, 'F-16I Sufa', 'Under Maintenance', 4457895);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4037278, 'F-35I Adir', 'Active', 3635244);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5627217, 'F-15I Raam', 'Inactive', 8164017);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8920628, 'F-15I Raam', 'Under Maintenance', 4491012);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8684335, 'F-15I Raam', 'Active', 1230754);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4549256, 'F-15 Baz', 'Under Maintenance', 2100001);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6720545, 'F-15 Baz', 'Active', 4689005);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2567623, 'F-15 Baz', 'Under Maintenance', 9859836);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7140959, 'F-35I Adir', 'Under Maintenance', 9447081);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7912488, 'F-15I Raam', 'Inactive', 1984347);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3286539, 'F-16I Sufa', 'Inactive', 7813716);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3678140, 'F-15 Baz', 'Active', 2501279);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1205585, 'F-16I Sufa', 'Under Maintenance', 5159719);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6294135, 'F-15 Baz', 'Inactive', 5938360);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8737719, 'F-15I Raam', 'Active', 7673017);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2015529, 'F-15 Baz', 'Under Maintenance', 3617094);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4910365, 'F-16I Sufa', 'Under Maintenance', 7530416);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7725614, 'F-15I Raam', 'Active', 5278329);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6647740, 'F-15I Raam', 'Under Maintenance', 1227023);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4051150, 'F-35I Adir', 'Inactive', 7333912);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7792331, 'F-15 Baz', 'Active', 3394388);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1790102, 'F-16I Sufa', 'Under Maintenance', 7953959);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6438888, 'F-16I Sufa', 'Inactive', 7813716);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7651871, 'F-35I Adir', 'Active', 9028404);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3580899, 'F-15 Baz', 'Under Maintenance', 5105795);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6310031, 'F-35I Adir', 'Active', 3879408);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9069583, 'F-15 Baz', 'Under Maintenance', 8482110);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3767565, 'F-35I Adir', 'Under Maintenance', 1962449);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9885369, 'F-35I Adir', 'Active', 4214407);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6034594, 'F-15 Baz', 'Inactive', 5079970);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8721879, 'F-16I Sufa', 'Inactive', 8280458);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5118616, 'F-16I Sufa', 'Under Maintenance', 1771510);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6882420, 'F-16I Sufa', 'Under Maintenance', 3997230);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8327238, 'F-35I Adir', 'Inactive', 8006597);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3488960, 'F-15I Raam', 'Under Maintenance', 9184050);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2883414, 'F-16I Sufa', 'Inactive', 8595332);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2003618, 'F-35I Adir', 'Inactive', 2979017);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8853172, 'F-16I Sufa', 'Under Maintenance', 1301720);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6062645, 'F-15 Baz', 'Under Maintenance', 4693621);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4385857, 'F-16I Sufa', 'Active', 8280458);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4622910, 'F-16I Sufa', 'Under Maintenance', 1370555);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2266859, 'F-16I Sufa', 'Active', 2093635);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9420885, 'F-15 Baz', 'Inactive', 9828531);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7782852, 'F-15I Raam', 'Inactive', 8680745);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9744126, 'F-15I Raam', 'Under Maintenance', 7495137);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1899523, 'F-15I Raam', 'Under Maintenance', 1453003);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6515263, 'F-16I Sufa', 'Under Maintenance', 2848346);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (3751812, 'F-15I Raam', 'Under Maintenance', 3350354);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8688478, 'F-35I Adir', 'Inactive', 9488672);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5446643, 'F-15 Baz', 'Inactive', 6971394);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9958496, 'F-15 Baz', 'Inactive', 5259525);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4178159, 'F-15 Baz', 'Active', 4794509);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8782063, 'F-15I Raam', 'Inactive', 3930228);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5655458, 'F-15 Baz', 'Inactive', 1598446);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8711934, 'F-15 Baz', 'Inactive', 2809855);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7842823, 'F-35I Adir', 'Under Maintenance', 5432571);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8043358, 'F-16I Sufa', 'Active', 1678848);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1012463, 'F-15 Baz', 'Under Maintenance', 6752205);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5773059, 'F-16I Sufa', 'Under Maintenance', 9621508);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2109742, 'F-16I Sufa', 'Active', 4457895);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5870725, 'F-35I Adir', 'Active', 5656777);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6430914, 'F-15I Raam', 'Inactive', 8459654);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1862987, 'F-16I Sufa', 'Inactive', 9351241);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9613359, 'F-35I Adir', 'Inactive', 2705942);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4729907, 'F-35I Adir', 'Inactive', 1815039);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9938320, 'F-16I Sufa', 'Active', 4780856);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (6113964, 'F-15I Raam', 'Under Maintenance', 4253827);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8946129, 'F-15 Baz', 'Inactive', 3134210);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2841532, 'F-15I Raam', 'Active', 2573950);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1363952, 'F-35I Adir', 'Inactive', 8896599);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1756872, 'F-35I Adir', 'Active', 2546404);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (8346013, 'F-15I Raam', 'Active', 1067132);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (4868610, 'F-35I Adir', 'Inactive', 3635244);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1026336, 'F-35I Adir', 'Inactive', 1340571);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (1808725, 'F-35I Adir', 'Inactive', 4689005);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (2383978, 'F-15I Raam', 'Inactive', 1082097);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5604032, 'F-15I Raam', 'Active', 8024073);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (7420759, 'F-16I Sufa', 'Inactive', 9081656);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (5760168, 'F-16I Sufa', 'Under Maintenance', 6653592);
insert into AIRCRAFT (aircraft_id, type, status, base_id)
values (9651501, 'F-35I Adir', 'Inactive', 7127882);
commit;
prompt 400 records loaded
prompt Loading MISSION...
insert into MISSION (mission_id, date_of_mission, type)
values (3218552, to_date('09-07-2003', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (2709369, to_date('13-07-2027', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9404272, to_date('21-08-2034', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (5797194, to_date('14-06-2005', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6554457, to_date('26-06-2012', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (3515761, to_date('15-12-2011', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (7802681, to_date('22-08-2011', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8525629, to_date('29-09-2019', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3134922, to_date('19-10-2034', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7118731, to_date('27-12-2003', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (4529789, to_date('12-05-2008', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (3796511, to_date('12-01-2007', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (9732153, to_date('07-07-2027', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (4206122, to_date('09-03-2018', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (2329588, to_date('21-06-2004', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (4287317, to_date('05-11-2015', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (4089261, to_date('13-03-2010', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (8210261, to_date('22-10-2018', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8455306, to_date('26-05-2021', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (7482293, to_date('12-02-2025', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (3838136, to_date('26-12-2010', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7032377, to_date('08-12-2007', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7160188, to_date('16-06-2008', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (1207909, to_date('15-12-2010', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1869631, to_date('05-02-2019', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (4002386, to_date('22-11-2027', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7607231, to_date('15-04-2008', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (9536493, to_date('15-06-2028', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6724245, to_date('09-04-2020', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (1402141, to_date('28-05-2025', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (4213476, to_date('19-07-2016', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (2011139, to_date('26-01-2013', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8143942, to_date('07-10-2011', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7130293, to_date('15-12-2028', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (3694506, to_date('06-05-2020', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4395036, to_date('09-10-2004', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5175730, to_date('26-07-2008', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (3336865, to_date('05-05-2003', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5324763, to_date('20-08-2001', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4398340, to_date('18-02-2022', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (2467616, to_date('19-11-2025', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7105695, to_date('14-05-2027', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3179306, to_date('01-11-2018', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4085701, to_date('23-05-2024', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8647578, to_date('02-11-2031', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (4512841, to_date('09-12-2034', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (9372639, to_date('20-01-2029', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5917587, to_date('08-08-2019', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (9926164, to_date('11-07-2014', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (9639097, to_date('03-09-2030', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (9560243, to_date('04-04-2006', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9628517, to_date('03-01-2032', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (2313347, to_date('14-09-2033', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7364727, to_date('13-08-2002', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (7218418, to_date('07-01-2000', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (9395337, to_date('10-06-2004', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (6090267, to_date('28-11-2029', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (9024560, to_date('01-03-2001', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (9468073, to_date('18-09-2000', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (9998653, to_date('06-02-2003', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (6426485, to_date('28-06-2021', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (2251555, to_date('20-06-2013', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7458094, to_date('18-01-2016', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (1930567, to_date('14-10-2004', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9283353, to_date('13-06-2020', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (1586969, to_date('16-12-2013', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (6573895, to_date('14-03-2030', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (8651807, to_date('08-05-2005', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7994166, to_date('19-04-2032', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (3685252, to_date('16-10-2014', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (1986797, to_date('07-10-2020', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6451418, to_date('10-12-2029', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (9161674, to_date('07-12-2018', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (4191796, to_date('27-06-2019', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (4309853, to_date('16-04-2005', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5612097, to_date('21-07-2023', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7763616, to_date('08-08-2030', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1621655, to_date('05-02-2004', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (6375740, to_date('22-04-2027', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (7834334, to_date('11-06-2033', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (1606883, to_date('12-09-2014', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (5817369, to_date('07-09-2023', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9402345, to_date('24-09-2000', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7122452, to_date('06-10-2007', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (2520938, to_date('08-03-2020', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (7814021, to_date('06-05-2020', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (4061678, to_date('08-01-2012', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (5585702, to_date('04-08-2028', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (3931117, to_date('17-10-2004', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5189634, to_date('08-01-2014', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (2217722, to_date('28-06-2026', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8857505, to_date('11-03-2003', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (1702444, to_date('13-11-2016', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (8229052, to_date('20-06-2022', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1348858, to_date('25-11-2004', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (4085995, to_date('21-11-2002', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (5394571, to_date('09-01-2012', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (8479422, to_date('10-05-2020', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (8920489, to_date('12-11-2030', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (6698977, to_date('15-04-2008', 'dd-mm-yyyy'), 'Tactical bombing');
commit;
prompt 100 records committed...
insert into MISSION (mission_id, date_of_mission, type)
values (6318482, to_date('12-06-2023', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1525401, to_date('08-10-2008', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (4223473, to_date('22-01-2023', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (3396411, to_date('24-04-2020', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (6035576, to_date('11-06-2034', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5062216, to_date('10-09-2027', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (5444014, to_date('22-07-2029', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (8073576, to_date('02-09-2020', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4189762, to_date('23-10-2006', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (6594696, to_date('19-08-2023', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6980614, to_date('08-02-2024', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (8628011, to_date('01-06-2016', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (8813180, to_date('16-06-2032', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (2340415, to_date('11-10-2023', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (4273726, to_date('16-02-2007', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7853381, to_date('20-05-2023', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (8496188, to_date('03-10-2018', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3165050, to_date('19-02-2016', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (1663725, to_date('14-11-2020', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3873366, to_date('13-10-2028', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (1062224, to_date('13-03-2024', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (2628100, to_date('09-09-2004', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (9042822, to_date('14-02-2015', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9818736, to_date('17-07-2017', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (4638183, to_date('25-09-2000', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (3467078, to_date('25-04-2010', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (8316555, to_date('07-11-2003', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (7700692, to_date('24-03-2014', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6260920, to_date('18-04-2006', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (3098301, to_date('02-03-2009', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (7940466, to_date('29-03-2007', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (3683640, to_date('20-09-2030', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3410518, to_date('22-02-2015', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (2962414, to_date('25-03-2021', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9047610, to_date('20-12-2024', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3210492, to_date('14-08-2030', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (8110930, to_date('27-04-2018', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9792759, to_date('08-11-2004', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5932496, to_date('01-08-2012', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5683638, to_date('06-04-2030', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (2488640, to_date('24-02-2019', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8134725, to_date('25-02-2035', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1907110, to_date('15-05-2018', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (3654699, to_date('23-06-2005', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (7929944, to_date('22-08-2032', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (2694196, to_date('15-06-2015', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (5794625, to_date('13-08-2010', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9726209, to_date('14-06-2024', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9227501, to_date('06-09-2029', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (6343228, to_date('25-06-2018', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (3576438, to_date('15-01-2030', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1618314, to_date('12-08-2010', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (8356758, to_date('05-04-2023', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4861078, to_date('29-01-2029', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (9958145, to_date('02-10-2002', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (2103660, to_date('25-04-2033', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7772886, to_date('28-09-2007', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (3738705, to_date('31-01-2026', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (9870094, to_date('01-09-2007', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (8763548, to_date('16-06-2017', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4368851, to_date('11-07-2001', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (3624881, to_date('19-01-2006', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7168128, to_date('03-03-2033', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (3768516, to_date('31-01-2035', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5485240, to_date('28-10-2027', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (5242018, to_date('01-03-2020', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (4050150, to_date('02-09-2034', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (6136460, to_date('01-01-2017', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8612467, to_date('11-09-2018', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (2849857, to_date('10-07-2021', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6954133, to_date('22-04-2017', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5171409, to_date('22-10-2029', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5675996, to_date('16-03-2025', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (8585125, to_date('20-09-2000', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3953202, to_date('30-05-2018', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (3036102, to_date('24-05-2009', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3045187, to_date('02-04-2029', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8255299, to_date('01-07-2012', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4913407, to_date('09-08-2014', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (9661469, to_date('08-12-2007', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5656405, to_date('27-02-2005', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (3414596, to_date('10-04-2023', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3929822, to_date('20-09-2034', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6446157, to_date('17-07-2004', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5891012, to_date('19-12-2003', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (8800309, to_date('06-04-2013', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (4806585, to_date('28-01-2026', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (5449216, to_date('25-08-2000', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (2098863, to_date('19-10-2006', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (2457629, to_date('17-03-2033', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (9596512, to_date('06-07-2020', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (9029079, to_date('15-10-2033', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1907940, to_date('14-10-2009', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8131060, to_date('05-08-2030', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (7465901, to_date('10-12-2023', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (1131950, to_date('11-03-2035', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3710739, to_date('04-11-2033', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5750565, to_date('11-09-2011', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (3400160, to_date('07-09-2016', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (4682736, to_date('15-03-2031', 'dd-mm-yyyy'), 'Air interdiction');
commit;
prompt 200 records committed...
insert into MISSION (mission_id, date_of_mission, type)
values (5968043, to_date('05-02-2009', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7090564, to_date('01-06-2018', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (2515883, to_date('19-02-2001', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7781641, to_date('04-07-2030', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6220702, to_date('23-11-2022', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5929904, to_date('27-11-2008', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (2994987, to_date('27-07-2006', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4659548, to_date('09-10-2008', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7950046, to_date('02-10-2014', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9290936, to_date('12-08-2022', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7906559, to_date('15-05-2005', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (3595319, to_date('08-03-2022', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1677553, to_date('11-02-2026', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7585818, to_date('03-03-2029', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5432006, to_date('21-10-2021', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9248129, to_date('14-07-2030', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (5944405, to_date('28-02-2035', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (4748163, to_date('29-12-2000', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (4259164, to_date('03-04-2016', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (7107968, to_date('20-06-2009', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (4061548, to_date('25-02-2007', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (6678172, to_date('26-07-2015', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6160971, to_date('04-08-2020', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (7017428, to_date('21-11-2020', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (1770885, to_date('10-08-2021', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3579364, to_date('31-07-2025', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7024337, to_date('22-02-2019', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6967912, to_date('10-07-2025', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (1208230, to_date('22-03-2028', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (2015035, to_date('10-09-2004', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (2844833, to_date('01-05-2033', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1623369, to_date('14-05-2008', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3808639, to_date('03-12-2029', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (2762562, to_date('25-07-2018', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6452827, to_date('11-02-2028', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (9274709, to_date('13-07-2006', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (4044756, to_date('05-02-2015', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (2793696, to_date('17-04-2027', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1986691, to_date('09-12-2009', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (3177991, to_date('01-10-2026', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1138784, to_date('09-10-2030', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (2958945, to_date('24-01-2012', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (9378698, to_date('13-10-2022', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (4479541, to_date('25-06-2025', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (4138723, to_date('01-05-2019', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5204185, to_date('27-03-2002', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (1369247, to_date('09-04-2005', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (2181091, to_date('02-05-2027', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (7999481, to_date('07-01-2005', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (3397632, to_date('10-04-2012', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (2815027, to_date('04-02-2011', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (6848103, to_date('08-08-2006', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (1559501, to_date('04-01-2023', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1095279, to_date('03-11-2012', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (2306757, to_date('06-11-2030', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7014361, to_date('03-05-2014', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7553514, to_date('17-12-2005', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1822942, to_date('19-10-2033', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1362113, to_date('21-11-2005', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (4485995, to_date('01-08-2016', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4052055, to_date('17-08-2028', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (9703027, to_date('21-10-2010', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (6709486, to_date('21-07-2032', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (9998032, to_date('06-08-2014', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1968363, to_date('11-08-2011', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8504156, to_date('01-04-2021', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7428176, to_date('24-05-2021', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (8926614, to_date('12-02-2001', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (6523279, to_date('06-09-2009', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (6441761, to_date('16-07-2008', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7960661, to_date('24-08-2029', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (8010012, to_date('04-12-2022', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (6808790, to_date('04-09-2026', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (2307785, to_date('06-10-2011', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1262561, to_date('14-11-2018', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6281541, to_date('05-07-2027', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (4840819, to_date('15-12-2004', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (9757611, to_date('15-05-2017', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (2605923, to_date('28-02-2026', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5667529, to_date('08-04-2029', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7741910, to_date('03-01-2010', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8832334, to_date('26-12-2007', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (5801444, to_date('31-07-2013', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (7953435, to_date('08-12-2007', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7944406, to_date('04-11-2002', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (2044522, to_date('07-06-2014', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (4855280, to_date('29-11-2012', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (1071270, to_date('08-07-2021', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (5554774, to_date('12-05-2016', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3605568, to_date('29-03-2021', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1326030, to_date('15-11-2024', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (2911421, to_date('23-11-2034', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3269680, to_date('27-08-2004', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8622772, to_date('26-01-2009', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (9897561, to_date('26-09-2024', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (8112022, to_date('09-10-2034', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5484445, to_date('02-03-2022', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9344278, to_date('30-12-2001', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (4933261, to_date('07-10-2010', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (9528983, to_date('27-06-2020', 'dd-mm-yyyy'), 'Strategic bombing');
commit;
prompt 300 records committed...
insert into MISSION (mission_id, date_of_mission, type)
values (1484519, to_date('23-06-2019', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1779982, to_date('01-11-2031', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5027371, to_date('28-06-2005', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7339813, to_date('23-10-2034', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4860575, to_date('31-12-2000', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9276546, to_date('08-03-2011', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (8819014, to_date('08-08-2034', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (1984353, to_date('06-08-2018', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7537870, to_date('21-10-2025', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7874637, to_date('18-10-2010', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (1584539, to_date('26-02-2011', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (5395552, to_date('23-10-2024', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (6060485, to_date('15-04-2001', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (9526513, to_date('28-04-2031', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (2373811, to_date('05-04-2027', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8223403, to_date('13-09-2027', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (8021073, to_date('02-03-2006', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3502098, to_date('10-03-2030', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6706076, to_date('06-07-2008', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (5005170, to_date('26-08-2021', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (9776743, to_date('19-01-2014', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (7561641, to_date('17-07-2018', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (6091016, to_date('13-12-2028', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1485033, to_date('03-12-2016', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1841694, to_date('13-04-2019', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5723120, to_date('29-08-2016', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (6890626, to_date('21-12-2011', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (2536262, to_date('29-11-2007', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (6597242, to_date('31-08-2019', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1702482, to_date('24-08-2018', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9287540, to_date('28-07-2026', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (8389066, to_date('05-11-2033', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (2209847, to_date('05-12-2026', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (5354867, to_date('01-01-2020', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (8375420, to_date('08-02-2028', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4117224, to_date('03-01-2001', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (2897777, to_date('14-06-2001', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5694939, to_date('27-01-2029', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (9637046, to_date('09-02-2023', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1586633, to_date('07-02-2005', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9937027, to_date('20-11-2005', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4324427, to_date('02-08-2027', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8325726, to_date('29-01-2020', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (6318896, to_date('18-04-2027', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (9047125, to_date('24-03-2032', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5345037, to_date('07-01-2031', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (1515649, to_date('12-11-2020', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8973070, to_date('01-10-2007', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3047437, to_date('02-10-2026', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (4084827, to_date('05-09-2019', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (4836808, to_date('02-06-2033', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (4398705, to_date('19-02-2001', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (7924620, to_date('12-06-2009', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (1216187, to_date('23-11-2014', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3160122, to_date('25-07-2024', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7463302, to_date('29-03-2021', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5701815, to_date('07-09-2016', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (8093550, to_date('20-02-2018', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9748374, to_date('05-06-2023', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (1107300, to_date('26-12-2003', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (2750236, to_date('08-01-2029', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (2388949, to_date('25-07-2034', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5638597, to_date('23-12-2028', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (6329739, to_date('25-09-2008', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (2433761, to_date('14-06-2019', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (2353552, to_date('23-05-2022', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (1271531, to_date('16-09-2020', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7057699, to_date('01-10-2008', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9227160, to_date('02-11-2018', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (7283300, to_date('27-05-2007', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5633770, to_date('22-06-2026', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (5102664, to_date('31-05-2009', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (3698571, to_date('26-04-2033', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (4016772, to_date('26-06-2009', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5428238, to_date('03-10-2033', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (5656922, to_date('13-03-2004', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (9996873, to_date('25-11-2010', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (7543399, to_date('04-10-2002', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5038602, to_date('31-05-2034', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (6033124, to_date('20-09-2029', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (1734557, to_date('27-12-2027', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7050156, to_date('18-08-2033', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (9303260, to_date('18-09-2006', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (8600140, to_date('10-04-2024', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (6406730, to_date('09-10-2026', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (5984854, to_date('11-10-2028', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4364524, to_date('11-01-2001', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (9118322, to_date('10-05-2016', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (5736882, to_date('06-06-2034', 'dd-mm-yyyy'), 'Strategic bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (4964164, to_date('04-11-2000', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (3108621, to_date('03-04-2009', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (3927310, to_date('25-09-2011', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (5590032, to_date('27-07-2000', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (3604485, to_date('21-09-2024', 'dd-mm-yyyy'), 'Tactical bombing');
insert into MISSION (mission_id, date_of_mission, type)
values (7962139, to_date('28-01-2014', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7689503, to_date('13-02-2017', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (3343883, to_date('19-10-2024', 'dd-mm-yyyy'), 'Air superiority');
insert into MISSION (mission_id, date_of_mission, type)
values (9603793, to_date('18-09-2002', 'dd-mm-yyyy'), 'Air interdiction');
insert into MISSION (mission_id, date_of_mission, type)
values (7060553, to_date('02-01-2022', 'dd-mm-yyyy'), 'Close air support');
insert into MISSION (mission_id, date_of_mission, type)
values (3642317, to_date('04-01-2011', 'dd-mm-yyyy'), 'Close air support');
commit;
prompt 400 records loaded
prompt Loading ASSIGNED_TO...
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2493988, 3927310);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5596801, 9402345);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8106334, 1262561);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1220480, 7853381);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6775056, 4061678);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3414547, 1584539);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3286539, 6954133);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1882079, 5612097);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5769635, 5189634);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6693175, 1262561);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4472622, 2457629);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2865561, 1986797);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4549256, 7543399);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9230888, 7168128);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3479015, 8813180);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4910514, 5667529);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2374813, 5394571);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9153913, 4512841);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8770771, 8926614);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2827993, 2217722);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9340137, 5038602);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7257389, 6597242);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1073937, 2433761);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9597832, 6090267);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3429980, 4806585);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7719373, 6160971);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1808725, 3576438);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9480268, 4855280);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5760168, 8600140);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8770771, 2181091);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7924048, 4855280);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6034594, 7364727);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4178159, 7160188);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8907738, 1216187);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4100983, 4485995);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9651501, 3808639);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8782063, 1930567);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9453911, 3685252);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4910514, 5444014);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9069583, 5485240);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7140959, 2628100);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9885369, 5667529);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3479015, 5102664);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8995267, 5683638);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5604032, 1623369);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8065348, 6160971);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8582823, 3605568);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7578096, 1584539);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5847385, 2467616);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7376163, 8813180);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1220339, 2098863);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3374248, 4213476);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8654504, 6967912);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6826082, 1907940);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6734549, 1062224);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8770771, 9732153);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6310031, 7929944);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5604032, 5929904);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8493535, 3502098);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2467780, 3165050);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4163530, 7814021);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6430914, 5394571);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6148550, 6808790);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7228287, 1271531);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9482712, 3414596);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5959402, 5354867);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4654666, 8647578);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9989159, 9996873);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9172745, 9526513);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6530640, 4485995);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9417002, 5449216);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9651501, 3838136);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2613682, 9703027);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2419883, 9283353);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3127284, 1984353);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8728896, 1663725);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7995158, 6573895);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7725614, 4364524);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3374248, 5204185);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4683474, 1515649);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1204485, 1208230);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7565717, 4117224);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8572356, 6281541);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6614209, 5102664);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7857610, 1062224);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2604323, 9937027);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2015529, 9047125);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6693175, 5944405);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8659139, 9274709);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9772473, 6967912);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2934580, 5005170);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3487152, 1369247);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7963014, 2815027);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9545895, 7853381);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7740965, 9161674);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2514032, 5038602);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3927744, 9042822);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2467169, 8134725);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4123250, 5449216);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2514032, 1062224);
commit;
prompt 100 records committed...
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5252269, 7781641);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3594090, 3595319);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4123250, 2520938);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3253351, 1623369);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6951095, 4364524);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7725614, 5675996);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1513649, 8600140);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9453911, 3134922);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1620946, 8010012);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6948403, 3796511);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7984570, 4840819);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4216867, 4682736);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4631884, 2750236);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2637693, 9402345);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2109742, 9637046);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8008752, 5694939);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9546833, 6808790);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2012297, 9958145);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9826361, 9748374);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8327238, 5444014);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9989159, 5736882);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2266859, 5817369);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9504684, 2457629);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7651871, 6091016);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2256300, 3873366);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5074546, 6980614);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7958360, 7130293);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6430914, 4398705);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9218263, 9603793);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8327238, 7689503);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9866928, 9726209);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8347820, 9937027);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5475461, 3343883);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5056047, 7772886);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7712656, 5633770);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9958496, 7944406);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4729907, 4309853);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2467169, 9372639);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8582823, 8832334);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2827308, 7537870);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8882657, 5932496);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7465762, 8356758);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3580899, 5038602);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6037500, 3929822);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5893093, 2958945);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8907738, 1207909);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5604032, 4855280);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6734750, 7218418);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1247537, 3400160);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4121496, 9526513);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6259026, 8600140);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1756872, 8455306);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4123250, 2844833);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5349759, 2251555);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5604032, 2251555);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9876560, 4085995);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6554623, 1623369);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9067501, 4364524);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5252269, 7090564);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3479015, 1369247);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1629105, 9998653);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4481406, 5432006);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2567623, 7944406);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2568730, 4529789);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1939659, 9998653);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6252508, 4002386);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9823693, 7853381);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5466599, 4050150);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5252269, 2515883);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7725207, 1402141);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7781806, 4806585);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1027551, 8210261);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5074546, 7014361);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2346062, 2353552);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5466599, 3397632);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1386153, 9276546);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6029568, 8585125);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3818444, 4638183);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4705632, 8316555);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3414547, 5794625);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9029880, 2373811);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1220480, 3642317);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7420759, 4324427);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7565717, 3927310);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4121496, 1326030);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5118616, 8763548);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9069583, 2849857);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2012297, 9248129);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1513649, 9536493);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2243234, 3576438);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9961949, 1485033);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2921342, 7700692);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8216402, 9703027);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5604032, 4287317);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3253351, 7553514);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2883414, 5929904);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9067664, 6090267);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4755086, 7999481);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7247204, 8857505);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4549256, 2433761);
commit;
prompt 200 records committed...
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8907738, 3576438);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4152741, 4050150);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3751812, 7050156);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9067664, 4044756);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7725207, 7853381);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8770771, 8819014);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9651501, 2520938);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5023209, 7953435);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8853172, 9870094);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7857610, 9395337);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8355652, 5633770);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2260910, 5932496);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4683474, 4117224);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7374761, 1702444);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3414547, 1095279);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7592981, 3624881);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7865909, 7962139);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9860541, 1986797);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2567623, 9926164);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4100983, 3808639);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1204485, 2181091);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7046326, 1984353);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7247204, 5204185);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5408780, 9958145);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9094945, 7014361);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7984570, 3502098);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7757911, 6160971);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9076971, 6318482);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3818444, 9958145);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1984642, 3738705);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3594090, 5633770);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7197633, 7428176);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9172745, 8131060);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8106334, 4682736);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5349759, 2313347);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6284745, 7168128);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5977467, 5444014);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5252269, 3683640);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7551773, 5656405);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4121496, 6890626);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1615546, 9528983);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3117957, 8600140);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7578096, 1869631);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8983905, 7364727);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1027551, 5612097);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8804611, 5428238);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7984570, 2958945);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7551773, 1271531);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4082110, 6451418);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1809773, 4364524);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9480268, 3683640);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1107832, 7465901);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1450319, 3683640);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7984570, 9998032);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9720973, 2373811);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3897536, 9029079);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8106334, 7465901);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9944499, 5683638);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2109742, 3179306);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3767565, 8612467);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5369899, 5944405);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1105079, 9303260);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9149654, 1485033);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3751812, 3738705);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2419883, 5395552);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5769635, 5102664);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2374813, 5817369);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1839002, 4933261);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2734234, 6706076);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2780201, 5394571);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8654504, 2962414);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8623418, 8973070);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2493988, 3642317);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6029568, 4913407);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5074546, 4682736);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2514032, 8455306);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2883414, 2815027);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6294135, 5723120);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5277671, 7700692);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4481406, 8134725);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6029568, 6343228);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2934580, 7090564);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7842823, 8356758);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8920628, 1559501);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1350031, 4061548);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2851433, 5723120);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8493535, 3045187);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4284411, 4682736);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9094945, 8389066);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5062584, 4682736);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7578096, 4309853);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1620946, 8800309);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5408780, 7950046);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7374761, 9395337);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5467817, 6678172);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9069583, 7607231);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6693175, 5656405);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7376163, 6967912);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8163662, 1559501);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9253559, 7105695);
commit;
prompt 300 records committed...
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3218179, 7929944);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5466599, 7772886);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8804611, 2467616);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9545895, 8093550);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3552431, 2388949);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3374248, 7950046);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8068467, 3396411);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3767565, 7553514);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9218263, 7763616);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9989159, 2536262);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3250114, 1623369);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9260284, 6890626);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7725207, 3160122);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9613359, 7537870);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5056047, 5345037);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7944750, 7014361);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1776720, 3160122);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2012297, 8920489);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2419883, 5038602);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5369899, 1138784);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1350031, 7107968);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5870725, 7853381);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4939405, 7543399);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9340137, 4002386);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8429937, 3710739);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8582823, 3515761);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5760168, 5175730);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9260284, 2750236);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2277472, 5038602);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4121496, 9290936);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7944750, 9628517);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4705632, 8857505);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4746541, 8010012);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9083652, 7057699);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4939405, 8920489);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2867074, 1986797);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8728896, 2098863);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6519312, 2488640);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4163530, 5204185);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6647740, 3269680);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1023116, 7994166);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7112797, 9998653);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2256300, 3036102);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5116265, 7014361);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6062645, 7853381);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1386153, 2709369);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3818444, 5204185);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8782063, 4861078);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6898122, 9161674);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8008752, 5585702);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5604032, 1271531);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7672711, 1621655);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3728847, 1584539);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8981330, 7802681);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9826361, 5395552);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8355652, 1930567);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1220480, 5345037);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6294135, 2433761);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6554623, 1138784);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4012291, 2694196);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3374248, 6406730);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2135437, 2251555);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9076971, 4052055);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5378834, 9639097);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7578096, 2911421);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3157077, 4061678);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6647740, 7781641);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4705632, 8479422);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4247099, 9303260);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7712656, 3654699);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5349759, 4395036);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6826082, 3576438);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9453911, 2467616);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1626004, 3396411);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4472622, 5817369);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6348818, 8612467);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1220339, 4368851);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7844491, 2307785);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8327238, 7944406);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6775056, 7689503);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2135437, 4748163);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5369899, 6698977);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3250114, 5585702);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3678140, 5102664);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9420885, 8093550);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4064250, 5189634);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9860541, 9047610);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (9260284, 4016772);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2865561, 1062224);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2841532, 3768516);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (6720545, 7781641);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (3552431, 3685252);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5773059, 3953202);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (7995158, 7607231);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2981103, 3768516);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (1862987, 4206122);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (2880930, 9897561);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (8599881, 9227160);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (5248976, 4398705);
insert into ASSIGNED_TO (aircraft_id, mission_id)
values (4729907, 4084827);
commit;
prompt 400 records loaded
prompt Loading FLIGHT...
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9658074, 7024337, to_date('13-01-2004', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2421305, 2536262, to_date('22-01-2032', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3770644, 7960661, to_date('07-05-2001', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7574808, 8496188, to_date('23-07-2017', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5063040, 4002386, to_date('25-03-2018', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9917513, 5656405, to_date('19-07-2002', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8792557, 1485033, to_date('01-09-2020', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2580956, 1623369, to_date('06-12-2000', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1599187, 3400160, to_date('29-06-2015', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2113484, 2181091, to_date('20-08-2002', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9878595, 8316555, to_date('19-08-2023', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7611110, 6967912, to_date('20-05-2019', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8569233, 9402345, to_date('09-12-2020', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7660876, 2750236, to_date('16-12-2008', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3751947, 2011139, to_date('23-12-2004', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8096711, 4002386, to_date('24-06-2031', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1062089, 3336865, to_date('18-12-2010', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8567790, 7482293, to_date('30-03-2001', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3914124, 5797194, to_date('05-03-2006', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8919396, 2709369, to_date('08-04-2024', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5538740, 7024337, to_date('29-05-2016', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9386276, 5633770, to_date('07-02-2013', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1832458, 7962139, to_date('19-10-2024', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4598500, 3768516, to_date('08-10-2028', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7019740, 4806585, to_date('23-12-2031', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7399825, 9661469, to_date('04-02-2006', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9127599, 5005170, to_date('06-01-2030', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3478550, 7700692, to_date('05-05-2029', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9272711, 6554457, to_date('04-09-2031', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7810877, 2515883, to_date('12-08-2026', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9761019, 7130293, to_date('23-05-2013', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6916770, 1071270, to_date('12-07-2014', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4999848, 8622772, to_date('29-08-2019', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2928314, 7283300, to_date('17-03-2009', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2222510, 1525401, to_date('16-05-2004', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6470578, 3400160, to_date('14-11-2027', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9025416, 6136460, to_date('04-05-2010', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5354967, 8356758, to_date('19-03-2004', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5717684, 8255299, to_date('17-01-2015', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8085088, 3654699, to_date('07-08-2006', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1483250, 4206122, to_date('30-06-2008', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9175108, 2488640, to_date('31-05-2016', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3355474, 9661469, to_date('23-03-2020', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2280611, 8223403, to_date('30-03-2009', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6004254, 8010012, to_date('28-09-2024', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5141958, 3838136, to_date('10-07-2020', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2335632, 9703027, to_date('24-04-2008', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6340150, 4364524, to_date('17-12-2018', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5903904, 2994987, to_date('11-04-2020', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4865182, 9726209, to_date('31-12-2011', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4136231, 3108621, to_date('05-02-2032', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7496906, 4855280, to_date('16-09-2029', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4369747, 5801444, to_date('08-06-2028', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1998389, 3502098, to_date('13-07-2022', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1701166, 1841694, to_date('31-01-2012', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5121774, 3045187, to_date('16-05-2026', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3648897, 2488640, to_date('20-09-2028', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5426636, 3576438, to_date('31-05-2029', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3627649, 6033124, to_date('01-11-2034', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7910846, 1869631, to_date('18-03-2000', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2235542, 6954133, to_date('26-12-2032', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9453924, 1822942, to_date('26-05-2006', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4353715, 7585818, to_date('06-11-2014', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4072906, 1734557, to_date('27-01-2035', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1058437, 5554774, to_date('12-03-2030', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8990698, 7107968, to_date('08-11-2009', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8345718, 7689503, to_date('05-04-2028', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3516936, 3047437, to_date('13-08-2004', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9668411, 5395552, to_date('19-11-2001', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5741349, 3624881, to_date('18-06-2017', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9285832, 9303260, to_date('29-01-2010', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8039614, 7283300, to_date('02-02-2012', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7425861, 9287540, to_date('11-05-2008', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5391716, 2536262, to_date('25-05-2014', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5259554, 1348858, to_date('04-03-2017', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8512810, 5891012, to_date('06-11-2016', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3688253, 5554774, to_date('12-05-2027', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5796579, 7553514, to_date('16-10-2008', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4943197, 3605568, to_date('31-07-2031', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9071092, 7160188, to_date('23-08-2026', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7997627, 4398705, to_date('22-11-2004', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3167166, 7463302, to_date('09-11-2011', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6791398, 5683638, to_date('04-05-2011', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6299223, 5485240, to_date('21-12-2006', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9268090, 5189634, to_date('20-02-2012', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7258651, 4840819, to_date('25-12-2017', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5224613, 2709369, to_date('15-01-2012', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4419661, 8316555, to_date('30-08-2002', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8973321, 4512841, to_date('26-05-2013', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2557650, 5189634, to_date('21-03-2020', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5816618, 3400160, to_date('01-07-2025', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3480058, 6967912, to_date('21-11-2011', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9334069, 8628011, to_date('10-01-2023', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8469728, 4052055, to_date('25-09-2025', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4482009, 9596512, to_date('28-07-2030', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5540764, 5633770, to_date('23-08-2001', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1505653, 7537870, to_date('14-10-2014', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4506892, 7160188, to_date('26-07-2000', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2663703, 9726209, to_date('23-08-2008', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2862321, 4287317, to_date('14-04-2029', 'dd-mm-yyyy'), 'Combat flights');
commit;
prompt 100 records committed...
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7765462, 7463302, to_date('22-01-2008', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8475098, 2103660, to_date('18-07-2026', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4520438, 3410518, to_date('22-10-2029', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2092970, 4861078, to_date('30-06-2010', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6700457, 9372639, to_date('05-08-2012', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1661744, 9958145, to_date('13-11-2033', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5114271, 8651807, to_date('27-10-2020', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3456145, 5817369, to_date('13-08-2017', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2394667, 6724245, to_date('16-08-2008', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7023175, 7585818, to_date('26-09-2028', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5598080, 2340415, to_date('02-02-2028', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6937975, 9661469, to_date('03-04-2012', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3616694, 6954133, to_date('14-01-2033', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5372181, 3108621, to_date('01-10-2002', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1403062, 5204185, to_date('21-12-2020', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9474786, 5801444, to_date('09-03-2002', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3007208, 5345037, to_date('23-01-2018', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4565497, 1907940, to_date('29-01-2019', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6426237, 1770885, to_date('08-05-2013', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2140597, 9468073, to_date('16-06-2021', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1266449, 9603793, to_date('22-11-2018', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9691303, 1907110, to_date('21-10-2015', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5217943, 5656922, to_date('12-05-2008', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3334625, 5656405, to_date('08-06-2004', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4341730, 3467078, to_date('28-12-2016', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2256726, 3738705, to_date('07-07-2033', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4169339, 2750236, to_date('15-11-2013', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1968781, 9276546, to_date('30-05-2013', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2614931, 9560243, to_date('21-04-2006', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9375337, 6890626, to_date('23-08-2018', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1699905, 5701815, to_date('06-08-2022', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8655171, 5204185, to_date('30-07-2006', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4090006, 1131950, to_date('10-09-2008', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1954651, 1606883, to_date('20-09-2015', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3444940, 7024337, to_date('19-07-2027', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7893596, 9047125, to_date('10-04-2030', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4580476, 9998653, to_date('19-09-2018', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8883631, 2849857, to_date('17-01-2006', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1443064, 5484445, to_date('03-03-2002', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9259053, 1095279, to_date('25-04-2022', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2896934, 2457629, to_date('03-02-2019', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6220185, 1986691, to_date('04-04-2029', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7323717, 7940466, to_date('15-11-2021', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8589236, 6035576, to_date('02-04-2004', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7034544, 8763548, to_date('05-07-2031', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4378664, 3218552, to_date('20-12-2021', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4494661, 5444014, to_date('28-12-2031', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3172031, 4061678, to_date('15-02-2026', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4360537, 2694196, to_date('17-01-2026', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9317366, 4206122, to_date('26-01-2010', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8329475, 2098863, to_date('07-09-2004', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6933021, 7482293, to_date('17-02-2005', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3801719, 1348858, to_date('06-05-2007', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1726034, 9395337, to_date('05-02-2018', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9355062, 9276546, to_date('20-02-2025', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2622984, 3410518, to_date('24-12-2023', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6031962, 8073576, to_date('28-01-2030', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6213356, 9344278, to_date('29-12-2013', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6439143, 6091016, to_date('25-02-2024', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2005395, 3808639, to_date('10-02-2028', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9659711, 3796511, to_date('07-04-2002', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7494467, 6375740, to_date('27-08-2030', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3977760, 8455306, to_date('01-10-2005', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7043921, 7814021, to_date('23-12-2017', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8415481, 3098301, to_date('26-12-2018', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1578445, 7944406, to_date('04-08-2004', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9082774, 4052055, to_date('30-04-2027', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7089927, 2457629, to_date('26-02-2029', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6339356, 9283353, to_date('29-03-2024', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1955815, 1663725, to_date('02-08-2003', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1769369, 3045187, to_date('05-12-2002', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3069973, 5794625, to_date('11-05-2006', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5968492, 6523279, to_date('26-03-2003', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9786045, 2605923, to_date('17-12-2029', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4143547, 2897777, to_date('11-08-2001', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4673312, 4138723, to_date('01-02-2031', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5524613, 4089261, to_date('06-03-2033', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2085052, 7940466, to_date('25-09-2000', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5589631, 6706076, to_date('23-05-2015', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9539396, 7017428, to_date('05-11-2018', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5101517, 4806585, to_date('05-12-2015', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9912695, 4061678, to_date('28-07-2010', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4957766, 1326030, to_date('29-01-2010', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9445370, 9468073, to_date('01-07-2017', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3852568, 8143942, to_date('21-08-2011', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7560279, 9996873, to_date('15-01-2029', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7751413, 8800309, to_date('20-06-2011', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5493573, 6597242, to_date('30-07-2010', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6178203, 5701815, to_date('02-10-2006', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8738056, 1770885, to_date('23-02-2022', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5314859, 6451418, to_date('18-09-2014', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5299043, 5750565, to_date('23-06-2003', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9913430, 1071270, to_date('07-03-2000', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9762722, 1770885, to_date('05-03-2003', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8020706, 3098301, to_date('08-03-2035', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2177011, 3414596, to_date('20-07-2003', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3515324, 7364727, to_date('08-10-2018', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4744918, 9526513, to_date('13-10-2012', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6457379, 2844833, to_date('28-10-2017', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8330403, 2962414, to_date('27-03-2000', 'dd-mm-yyyy'), 'Surveillance flights');
commit;
prompt 200 records committed...
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8250534, 4368851, to_date('05-09-2026', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9776731, 9227501, to_date('31-05-2028', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4616625, 8819014, to_date('14-06-2029', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7037341, 3134922, to_date('19-11-2015', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3382776, 3624881, to_date('08-08-2011', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6119194, 7741910, to_date('08-02-2015', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8081007, 2536262, to_date('09-09-2026', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3838642, 1369247, to_date('18-02-2015', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4360340, 4044756, to_date('15-03-2000', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9389783, 6260920, to_date('11-09-2011', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3211412, 2605923, to_date('18-11-2012', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5725319, 8134725, to_date('24-06-2026', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6003583, 7057699, to_date('22-11-2002', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3749921, 9748374, to_date('02-11-2004', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8334545, 6260920, to_date('17-03-2018', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9326081, 4061548, to_date('15-04-2016', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6692434, 7874637, to_date('12-04-2029', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2092477, 2313347, to_date('16-03-2015', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7930433, 7585818, to_date('21-01-2009', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7094829, 4748163, to_date('13-05-2010', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5553891, 9227160, to_date('06-12-2032', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7229263, 5554774, to_date('13-11-2006', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3819923, 3515761, to_date('07-08-2009', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2498163, 2181091, to_date('27-04-2003', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8649524, 3045187, to_date('05-12-2032', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9078539, 8628011, to_date('09-11-2008', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3352180, 3931117, to_date('02-03-2011', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7202877, 7050156, to_date('02-06-2009', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8162973, 1968363, to_date('27-03-2023', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8852508, 4273726, to_date('18-07-2024', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7592193, 3210492, to_date('26-01-2023', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2263459, 1770885, to_date('01-05-2007', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6587447, 3179306, to_date('18-07-2023', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7244819, 7802681, to_date('02-10-2011', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8508268, 9402345, to_date('17-05-2017', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7309594, 7814021, to_date('21-04-2026', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4913226, 5242018, to_date('12-01-2024', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1618068, 9029079, to_date('21-04-2004', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4159535, 4223473, to_date('26-01-2015', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5733662, 7772886, to_date('16-03-2020', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8815162, 1663725, to_date('23-10-2000', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1191294, 1907110, to_date('05-06-2021', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4883440, 6446157, to_date('28-10-2030', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4878238, 7814021, to_date('09-06-2024', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7840174, 6446157, to_date('19-02-2002', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6227483, 5656922, to_date('24-06-2012', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3483252, 6698977, to_date('27-09-2017', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6223592, 8356758, to_date('16-12-2029', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8594754, 4061548, to_date('05-06-2022', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5221064, 1402141, to_date('17-11-2013', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8415560, 4806585, to_date('05-04-2024', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2575190, 8647578, to_date('09-02-2034', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4932462, 4398340, to_date('25-09-2017', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8085414, 7130293, to_date('17-02-2023', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4977773, 1062224, to_date('03-11-2032', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2251193, 1402141, to_date('25-09-2020', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2141432, 3953202, to_date('19-04-2027', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7340354, 1071270, to_date('13-04-2014', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6495620, 5189634, to_date('09-10-2010', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8269957, 3410518, to_date('02-01-2011', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5131865, 4052055, to_date('20-03-2012', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2299651, 4395036, to_date('17-02-2024', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6510652, 5633770, to_date('28-09-2031', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6537534, 6594696, to_date('03-03-2008', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6623533, 4659548, to_date('08-05-2012', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5258515, 3177991, to_date('01-04-2026', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2967737, 6318482, to_date('30-05-2008', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8035171, 3579364, to_date('11-01-2013', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2333279, 8255299, to_date('11-05-2020', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2681106, 9748374, to_date('04-03-2017', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4402567, 9024560, to_date('20-02-2026', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1006810, 7160188, to_date('15-01-2004', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6162516, 3738705, to_date('09-07-2032', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6388023, 8021073, to_date('11-11-2031', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9129152, 1623369, to_date('05-11-2004', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2146589, 7339813, to_date('02-07-2023', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2384727, 2209847, to_date('09-11-2028', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5743817, 7814021, to_date('02-10-2017', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2427323, 3400160, to_date('18-09-2032', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8786340, 5027371, to_date('29-03-2016', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5832965, 1968363, to_date('14-12-2023', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9844479, 9395337, to_date('02-01-2027', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7730231, 9528983, to_date('29-01-2028', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5083093, 9024560, to_date('14-11-2021', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5087356, 8651807, to_date('15-09-2011', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8704947, 7950046, to_date('28-10-2019', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2811847, 2329588, to_date('23-05-2002', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4206569, 3927310, to_date('15-06-2013', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4662592, 5038602, to_date('01-03-2016', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6446606, 8920489, to_date('16-05-2021', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6974464, 8389066, to_date('30-12-2004', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9526689, 1606883, to_date('28-01-2019', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4195438, 2897777, to_date('29-11-2000', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9484785, 7032377, to_date('26-02-2031', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6236194, 3410518, to_date('04-07-2032', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2801065, 9274709, to_date('18-03-2031', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4632230, 1216187, to_date('22-12-2025', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5716258, 7465901, to_date('14-02-2003', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4518469, 9870094, to_date('29-11-2008', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4362509, 2307785, to_date('13-03-2022', 'dd-mm-yyyy'), 'Surveillance flights');
commit;
prompt 300 records committed...
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5416372, 4085995, to_date('11-10-2015', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6706744, 2536262, to_date('07-08-2002', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2833542, 2457629, to_date('20-03-2013', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7306524, 1326030, to_date('11-06-2030', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1675840, 9628517, to_date('14-02-2022', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8878408, 3642317, to_date('29-07-2009', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5471987, 4748163, to_date('09-01-2012', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1678810, 4479541, to_date('09-06-2034', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8410679, 7874637, to_date('11-07-2027', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8697361, 9274709, to_date('28-11-2004', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8190195, 1207909, to_date('10-06-2016', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7662764, 8021073, to_date('04-08-2003', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3680506, 9792759, to_date('16-05-2031', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8861158, 4840819, to_date('23-02-2021', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4397883, 4398705, to_date('08-11-2026', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9766975, 3396411, to_date('12-10-2019', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6792007, 4084827, to_date('17-01-2030', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6486300, 1107300, to_date('26-07-2016', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9345582, 9402345, to_date('01-01-2013', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8012730, 4913407, to_date('08-12-2009', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3486439, 4061678, to_date('27-05-2032', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8295733, 2217722, to_date('26-01-2032', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3312149, 3595319, to_date('12-03-2000', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6121509, 9161674, to_date('19-01-2009', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6127129, 3108621, to_date('06-07-2004', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9806349, 3838136, to_date('13-11-2029', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9792257, 7107968, to_date('17-01-2014', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8702490, 3397632, to_date('08-03-2034', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5886974, 8255299, to_date('26-07-2026', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1516484, 8455306, to_date('09-01-2015', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2683901, 7364727, to_date('27-03-2025', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9440045, 1621655, to_date('22-03-2029', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5935942, 9248129, to_date('23-06-2025', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2093420, 9372639, to_date('24-07-2015', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2475897, 1348858, to_date('01-05-2000', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6281241, 7950046, to_date('18-10-2021', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9628571, 5484445, to_date('30-06-2002', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1560886, 5932496, to_date('22-03-2027', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1435381, 1586633, to_date('07-05-2023', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7623340, 3576438, to_date('30-08-2032', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8691469, 4206122, to_date('03-05-2013', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3486553, 5633770, to_date('03-12-2028', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5795308, 5102664, to_date('26-04-2028', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2501300, 2958945, to_date('17-06-2020', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7410814, 4117224, to_date('01-11-2006', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4169540, 5324763, to_date('10-08-2033', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5941954, 5932496, to_date('13-12-2026', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2775274, 6724245, to_date('02-04-2003', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1819856, 7050156, to_date('23-03-2017', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7827909, 7130293, to_date('21-12-2032', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9602417, 1485033, to_date('28-12-2017', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4318112, 1986691, to_date('11-04-2003', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3886413, 8131060, to_date('22-10-2002', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5786171, 9732153, to_date('12-12-2012', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3032112, 5723120, to_date('19-09-2002', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2202856, 5701815, to_date('23-01-2027', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2700376, 6706076, to_date('08-11-2002', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9662778, 6033124, to_date('12-07-2004', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2202278, 1208230, to_date('21-05-2000', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5890247, 5750565, to_date('08-03-2010', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6661204, 3036102, to_date('23-08-2011', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3557630, 1822942, to_date('11-07-2028', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4987471, 7050156, to_date('15-05-2028', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9416217, 7944406, to_date('07-07-2009', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4665428, 7130293, to_date('17-04-2029', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4239572, 9703027, to_date('13-12-2004', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6353070, 6954133, to_date('10-07-2011', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6579398, 6160971, to_date('20-07-2006', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8294147, 9596512, to_date('05-07-2006', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4333894, 7834334, to_date('05-01-2016', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4542772, 3604485, to_date('24-10-2009', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6128614, 8010012, to_date('13-12-2028', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4000533, 2488640, to_date('25-06-2001', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (5509830, 4398340, to_date('02-05-2003', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7266097, 4398340, to_date('28-08-2021', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1950386, 4638183, to_date('01-08-2024', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4297326, 7772886, to_date('31-07-2018', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6668061, 1326030, to_date('16-12-2030', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1885882, 7553514, to_date('18-09-2034', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6256428, 7834334, to_date('02-06-2018', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8944338, 6426485, to_date('20-10-2023', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1128213, 9996873, to_date('06-12-2017', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6605787, 5354867, to_date('11-01-2006', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1771154, 4748163, to_date('01-12-2021', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2135951, 7060553, to_date('20-12-2030', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9816358, 7118731, to_date('18-04-2001', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4657791, 3685252, to_date('01-12-2018', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1919167, 7543399, to_date('28-02-2013', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3688617, 8455306, to_date('15-02-2011', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (6452512, 4138723, to_date('08-02-2010', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4489694, 9958145, to_date('27-07-2015', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3012771, 8316555, to_date('09-01-2023', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (3228358, 4085701, to_date('28-01-2014', 'dd-mm-yyyy'), 'Surveillance flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (4738136, 1362113, to_date('16-03-2010', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (9952616, 5683638, to_date('03-09-2024', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8439463, 4324427, to_date('17-03-2009', 'dd-mm-yyyy'), 'Non-combat reconnaissance');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (2378266, 2181091, to_date('24-01-2007', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (1543638, 1062224, to_date('29-09-2025', 'dd-mm-yyyy'), 'Training flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (8488497, 4206122, to_date('05-02-2000', 'dd-mm-yyyy'), 'Combat flights');
insert into FLIGHT (flight_id, mission_id, date_of_flight, type_of_flight)
values (7849433, 6033124, to_date('26-02-2013', 'dd-mm-yyyy'), 'Training flights');
commit;
prompt 400 records loaded
prompt Loading SOLDIER...
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (918922079, to_date('19-07-1975', 'dd-mm-yyyy'), 'RavSamal', 'Lia', 'Dayan', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (939435895, to_date('13-01-1972', 'dd-mm-yyyy'), 'RavSamal', 'Galit', 'Mizrahi', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (876816056, to_date('10-03-1962', 'dd-mm-yyyy'), 'RavTurai', 'Dana', 'Levi', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (894326216, to_date('31-01-1978', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Ziv', 'Dayan', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (863879911, to_date('01-01-1951', 'dd-mm-yyyy'), 'RavSamal', 'Yonatan', 'Ben-Avraham', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (78008934, to_date('15-02-1967', 'dd-mm-yyyy'), 'RavSamal', 'Oren', 'Azoulay', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (276412817, to_date('09-01-1959', 'dd-mm-yyyy'), 'RavAluf', 'Dana', 'Azulay', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (707520332, to_date('19-07-1998', 'dd-mm-yyyy'), 'SamalRishon', 'Eitan', 'Mor', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (257132733, to_date('01-06-1968', 'dd-mm-yyyy'), 'RavSamal', 'Tal', 'Mizrahi', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (895727331, to_date('17-10-1960', 'dd-mm-yyyy'), 'RavSamal', 'Nir', 'Avraham', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (398012055, to_date('26-11-1987', 'dd-mm-yyyy'), 'RavSamal', 'Elad', 'Levi', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (227809174, to_date('23-04-1980', 'dd-mm-yyyy'), 'RavSamal', 'Maya', 'Cohen', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (539272033, to_date('24-11-1993', 'dd-mm-yyyy'), 'RavSamal', 'Nir', 'Ben-Haim', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (58230132, to_date('08-05-1968', 'dd-mm-yyyy'), 'AlufMishne', 'Yonatan', 'Mizrahi', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (161094854, to_date('19-03-1996', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Or', 'Azoulay', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (100823687, to_date('14-01-1975', 'dd-mm-yyyy'), 'RavSamal', 'Yotam', 'Barak', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (787377762, to_date('15-01-1990', 'dd-mm-yyyy'), 'RavSamal', 'Ayelet', 'Cohen', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (553773429, to_date('02-05-1954', 'dd-mm-yyyy'), 'RavSamal', 'Alon', 'Peretz', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (472264837, to_date('27-05-1957', 'dd-mm-yyyy'), 'RavSamal', 'Tal', 'Mizrahi', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (211911905, to_date('26-05-1993', 'dd-mm-yyyy'), 'Turai', 'Hila', 'Malka', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (688544625, to_date('01-08-1971', 'dd-mm-yyyy'), 'SamalRishon', 'Yaara', 'Mor', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (19900422, to_date('03-03-2002', 'dd-mm-yyyy'), 'RavSamal', 'Aviv', 'Ben-Shlomo', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (938695176, to_date('15-12-1985', 'dd-mm-yyyy'), 'SamalRishon', 'Gal', 'Ben-Avraham', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (204735426, to_date('02-09-1999', 'dd-mm-yyyy'), 'RavTurai', 'Amit', 'Levi', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (27309463, to_date('19-05-1984', 'dd-mm-yyyy'), 'RavSamal', 'Ilana', 'Ben-David', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (119324186, to_date('01-03-1995', 'dd-mm-yyyy'), 'RavSamal', 'Yaara', 'Malka', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (516903398, to_date('08-11-1957', 'dd-mm-yyyy'), 'RavAlufBait', 'Or', 'Bitton', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (390303866, to_date('09-04-1969', 'dd-mm-yyyy'), 'RavSamal', 'Hila', 'Cohen', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (14859674, to_date('09-02-1956', 'dd-mm-yyyy'), 'RavSamal', 'Dana', 'Cohen', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (772344246, to_date('05-07-2001', 'dd-mm-yyyy'), 'RavSamal', 'Keren', 'Ben-Shlomo', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (33348831, to_date('24-02-2000', 'dd-mm-yyyy'), 'RavSamal', 'Amit', 'Ben-Avraham', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (678156612, to_date('18-02-1979', 'dd-mm-yyyy'), 'Segen', 'Or', 'Levi', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (775186259, to_date('12-12-2000', 'dd-mm-yyyy'), 'SegenMishneh', 'Shira', 'Malka', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (791356613, to_date('25-12-1951', 'dd-mm-yyyy'), 'RavSamal', 'Nadav', 'Peretz', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (580744813, to_date('24-09-1975', 'dd-mm-yyyy'), 'RavSamal', 'Galit', 'Barak', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (990619358, to_date('02-08-1985', 'dd-mm-yyyy'), 'Rotem', 'Dalia', 'Ben-Shalom', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (33519446, to_date('08-08-1965', 'dd-mm-yyyy'), 'RavSamal', 'Aviv', 'Malka', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (353399272, to_date('08-09-1956', 'dd-mm-yyyy'), 'RavSamal', 'Tamar', 'Malka', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (957293214, to_date('02-04-1988', 'dd-mm-yyyy'), 'RavSamal', 'Nadav', 'Bitton', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (268280838, to_date('08-04-1987', 'dd-mm-yyyy'), 'RavSamal', 'Itai', 'Mizrahi', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (537542840, to_date('06-01-1992', 'dd-mm-yyyy'), 'RavSamal', 'Shachar', 'Cohen', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (791194510, to_date('01-05-1973', 'dd-mm-yyyy'), 'RavSamal', 'Barak', 'Cohen', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (693277640, to_date('26-02-1994', 'dd-mm-yyyy'), 'AlufMishne', 'Nadav', 'Cohen', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (521791185, to_date('14-10-1997', 'dd-mm-yyyy'), 'RavSamal', 'Yael', 'Ben-Avraham', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (326217360, to_date('04-05-1958', 'dd-mm-yyyy'), 'RavSamal', 'Ilana', 'Mizrahi', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (528040682, to_date('06-09-1958', 'dd-mm-yyyy'), 'RavSamal', 'Yonatan', 'Levy', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (339156780, to_date('01-06-1960', 'dd-mm-yyyy'), 'RavSamal', 'Aviv', 'Mizrahi', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (528905573, to_date('15-10-1986', 'dd-mm-yyyy'), 'RavSamal', 'Maya', 'Malka', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (785530631, to_date('12-03-1996', 'dd-mm-yyyy'), 'RavSamal', 'Matan', 'Dayan', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (47521761, to_date('04-10-1953', 'dd-mm-yyyy'), 'RavSamal', 'Roni', 'Levy', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (700051578, to_date('20-03-1980', 'dd-mm-yyyy'), 'RavSamal', 'Galit', 'Azulay', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (658456825, to_date('08-08-1997', 'dd-mm-yyyy'), 'RavSamal', 'Galit', 'Cohen', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (356782622, to_date('22-12-1983', 'dd-mm-yyyy'), 'RavSamal', 'Dalia', 'Malka', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (109746290, to_date('04-03-1966', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Shira', 'Barak', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (139730663, to_date('16-10-1995', 'dd-mm-yyyy'), 'RavSamal', 'Shani', 'Ben-Avraham', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (138780621, to_date('01-03-1986', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Itai', 'Biton', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (80299456, to_date('16-01-1954', 'dd-mm-yyyy'), 'RavSamal', 'Galit', 'Ben-Shlomo', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (640870770, to_date('18-10-1970', 'dd-mm-yyyy'), 'SegenMishneh', 'Galit', 'Malka', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (938341769, to_date('26-09-1967', 'dd-mm-yyyy'), 'RavSamal', 'Shani', 'Bitton', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (515164706, to_date('06-02-1965', 'dd-mm-yyyy'), 'RavSamal', 'Matan', 'Mizrahi', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (346165870, to_date('29-03-1970', 'dd-mm-yyyy'), 'RavSamal', 'Gal', 'Ben-Avraham', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (344417887, to_date('13-02-1990', 'dd-mm-yyyy'), 'RavSamal', 'Keren', 'Levi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (27888027, to_date('21-09-1973', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Gal', 'Cohen', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (99392871, to_date('03-01-1970', 'dd-mm-yyyy'), 'Segen', 'Erez', 'Malka', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (979203046, to_date('13-06-1959', 'dd-mm-yyyy'), 'RavSamal', 'Yonatan', 'Mizrahi', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (63905300, to_date('19-08-2000', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Matan', 'Amar', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (787617930, to_date('11-04-1971', 'dd-mm-yyyy'), 'RavSamal', 'Noga', 'Mizrahi', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (621448955, to_date('05-02-1987', 'dd-mm-yyyy'), 'RavSamal', 'Dalia', 'Levy', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (340818594, to_date('15-06-1974', 'dd-mm-yyyy'), 'RavSamal', 'Maya', 'Levi', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (601514113, to_date('23-08-1965', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Yotam', 'Barak', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (565195540, to_date('08-11-1996', 'dd-mm-yyyy'), 'RavSamal', 'Avital', 'Biton', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (597169972, to_date('14-12-1955', 'dd-mm-yyyy'), 'Aluf', 'Alon', 'Barak', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (355518824, to_date('01-07-1958', 'dd-mm-yyyy'), 'RavSamal', 'Eitan', 'Azulay', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (480375782, to_date('13-08-1954', 'dd-mm-yyyy'), 'Turai', 'Maya', 'Cohen', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (421861798, to_date('06-08-2001', 'dd-mm-yyyy'), 'RavSamal', 'Or', 'Cohen', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (22117822, to_date('18-11-1971', 'dd-mm-yyyy'), 'RavSamal', 'Eitan', 'Mor', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (741528628, to_date('06-01-1974', 'dd-mm-yyyy'), 'AlufMishne', 'Maya', 'Ben-Avraham', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (219695867, to_date('14-11-1952', 'dd-mm-yyyy'), 'RavSamal', 'Eitan', 'Cohen', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (623560716, to_date('11-12-1951', 'dd-mm-yyyy'), 'RavSamal', 'Dana', 'Mizrahi', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (243993217, to_date('06-12-1992', 'dd-mm-yyyy'), 'RavSamal', 'Liat', 'Levi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (61751992, to_date('28-06-1994', 'dd-mm-yyyy'), 'RavSamal', 'Inbar', 'Avraham', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (814858838, to_date('04-12-1980', 'dd-mm-yyyy'), 'RavSamal', 'Matan', 'Levy', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (253020708, to_date('17-08-1950', 'dd-mm-yyyy'), 'RavSamal', 'Roni', 'Levy', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (958408916, to_date('16-02-1974', 'dd-mm-yyyy'), 'RavSamal', 'Roni', 'Ben-Haim', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (856555734, to_date('20-06-1991', 'dd-mm-yyyy'), 'TatAluf', 'Lia', 'Levi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (739502967, to_date('19-06-1986', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Lia', 'Amar', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (14962501, to_date('29-09-1968', 'dd-mm-yyyy'), 'RavSamal', 'Erez', 'Mizrahi', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (354262773, to_date('14-05-1998', 'dd-mm-yyyy'), 'RavTurai', 'Avital', 'Barak', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (262774555, to_date('30-03-1964', 'dd-mm-yyyy'), 'RavAlufBait', 'Barak', 'Mizrahi', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (388593835, to_date('05-02-1956', 'dd-mm-yyyy'), 'Rotem', 'Yuval', 'Mizrahi', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (128587055, to_date('14-08-1959', 'dd-mm-yyyy'), 'RavSamal', 'Noga', 'Mizrahi', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (777390005, to_date('27-09-1977', 'dd-mm-yyyy'), 'RavSamal', 'Maya', 'Cohen', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (445021747, to_date('24-10-1993', 'dd-mm-yyyy'), 'RavSamal', 'Shira', 'Levy', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (919730837, to_date('31-05-1976', 'dd-mm-yyyy'), 'Aluf', 'Maya', 'Azoulay', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (921345792, to_date('12-05-1956', 'dd-mm-yyyy'), 'RavSamal', 'Michal', 'Levi', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (335043978, to_date('06-01-1999', 'dd-mm-yyyy'), 'RavAluf', 'Noa', 'Mizrahi', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (533658209, to_date('03-01-1965', 'dd-mm-yyyy'), 'RavSamal', 'Galit', 'Ben-Shalom', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (130230511, to_date('01-09-1950', 'dd-mm-yyyy'), 'Turai', 'Dana', 'Azulay', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (559946127, to_date('22-01-1957', 'dd-mm-yyyy'), 'RavSamal', 'Michal', 'Cohen', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (501339491, to_date('10-07-1955', 'dd-mm-yyyy'), 'RavTurai', 'Dalia', 'Malka', 'Bardelas');
commit;
prompt 100 records committed...
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (951979571, to_date('10-04-1971', 'dd-mm-yyyy'), 'RavSamal', 'Omri', 'Ben-Haim', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (83424189, to_date('09-09-2000', 'dd-mm-yyyy'), 'RavSamal', 'Shani', 'Levi', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (48296139, to_date('04-06-1968', 'dd-mm-yyyy'), 'Aluf', 'Shani', 'Bitton', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (852148646, to_date('10-11-1959', 'dd-mm-yyyy'), 'RavSamal', 'Amit', 'Ben-David', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (209537395, to_date('18-02-1992', 'dd-mm-yyyy'), 'RavSamal', 'Lia', 'Ben-David', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (765470455, to_date('17-06-1956', 'dd-mm-yyyy'), 'RavSamal', 'Avital', 'Mor', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (835614936, to_date('08-03-1993', 'dd-mm-yyyy'), 'RavSamal', 'Maya', 'Mizrahi', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (86417259, to_date('25-05-1981', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Oren', 'Biton', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (915186888, to_date('06-03-2004', 'dd-mm-yyyy'), 'RavSamal', 'Roni', 'Ben-Shalom', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (940572982, to_date('06-07-2004', 'dd-mm-yyyy'), 'Rotem', 'Shani', 'Cohen', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (388851398, to_date('13-04-1953', 'dd-mm-yyyy'), 'RavSamal', 'Eitan', 'Levy', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (33810605, to_date('28-04-1954', 'dd-mm-yyyy'), 'SamalRishon', 'Amir', 'Amar', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (645592237, to_date('08-01-1965', 'dd-mm-yyyy'), 'RavSamal', 'Amit', 'Amar', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (668859191, to_date('11-10-1955', 'dd-mm-yyyy'), 'RavSamal', 'Tamar', 'Levi', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (8310165, to_date('16-04-1971', 'dd-mm-yyyy'), 'SamalRishon', 'Talia', 'Azulay', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (954789903, to_date('08-11-1958', 'dd-mm-yyyy'), 'RavSamal', 'Tamar', 'Dayan', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (591654777, to_date('06-05-1974', 'dd-mm-yyyy'), 'RavSamal', 'Lia', 'Malka', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (922868636, to_date('07-08-1971', 'dd-mm-yyyy'), 'RavAlufBait', 'Yael', 'Ben-Avraham', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (149955748, to_date('16-03-1961', 'dd-mm-yyyy'), 'ReshoomSitum', 'Matan', 'Amar', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (132254189, to_date('29-03-1981', 'dd-mm-yyyy'), 'RavSamal', 'Shani', 'Cohen', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (984292034, to_date('17-01-1960', 'dd-mm-yyyy'), 'RavSamal', 'Tamar', 'Bitton', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (222038979, to_date('31-12-1999', 'dd-mm-yyyy'), 'Rotem', 'Lia', 'Barak', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (321863485, to_date('21-02-1965', 'dd-mm-yyyy'), 'RavSamal', 'Omri', 'Cohen', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (426023600, to_date('31-01-2000', 'dd-mm-yyyy'), 'Samal', 'Shachar', 'Mor', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (563250879, to_date('26-01-1990', 'dd-mm-yyyy'), 'RavSamal', 'Omri', 'Cohen', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (146228453, to_date('01-03-1999', 'dd-mm-yyyy'), 'RavSamal', 'Dana', 'Mor', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (920665418, to_date('08-01-1997', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Hila', 'Barak', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (42187495, to_date('05-08-1982', 'dd-mm-yyyy'), 'RavSamal', 'Eitan', 'Azoulay', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (190685698, to_date('14-04-1979', 'dd-mm-yyyy'), 'RavSamal', 'Or', 'Mizrahi', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (633046823, to_date('18-05-1969', 'dd-mm-yyyy'), 'RavSamal', 'Barak', 'Mizrahi', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (678454411, to_date('02-06-2004', 'dd-mm-yyyy'), 'RavSamal', 'Gal', 'Ben-Shlomo', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (655441077, to_date('13-07-1970', 'dd-mm-yyyy'), 'RavSamal', 'Ziv', 'Ben-Shlomo', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (913550787, to_date('02-07-1967', 'dd-mm-yyyy'), 'RavAluf', 'Galit', 'Barak', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (868116529, to_date('31-12-1951', 'dd-mm-yyyy'), 'RavSamal', 'Omri', 'Bitton', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (691870152, to_date('14-02-1951', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Ziv', 'Levy', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (705828591, to_date('06-03-1998', 'dd-mm-yyyy'), 'RavSamal', 'Lior', 'Ben-David', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (586503670, to_date('22-08-1966', 'dd-mm-yyyy'), 'RavSamal', 'Boaz', 'Levi', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (141017923, to_date('05-12-1983', 'dd-mm-yyyy'), 'RavSamal', 'Liat', 'Avraham', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (527623213, to_date('22-09-1952', 'dd-mm-yyyy'), 'RavSamal', 'Gilad', 'Cohen', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (223653476, to_date('18-06-1981', 'dd-mm-yyyy'), 'RavSamal', 'Avital', 'Peretz', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (648570736, to_date('21-11-1985', 'dd-mm-yyyy'), 'RavSamal', 'Amit', 'Mizrahi', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (103774210, to_date('01-05-1955', 'dd-mm-yyyy'), 'RavSamal', 'Dalia', 'David', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (18313165, to_date('30-10-1992', 'dd-mm-yyyy'), 'Samal', 'Amit', 'Amar', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (262946526, to_date('03-07-1964', 'dd-mm-yyyy'), 'RavTurai', 'Boaz', 'Amar', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (25744932, to_date('30-11-1971', 'dd-mm-yyyy'), 'RavSamal', 'Alon', 'Mizrahi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (283254004, to_date('21-02-1992', 'dd-mm-yyyy'), 'RavSamal', 'Adi', 'Ben-David', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (843391891, to_date('01-09-1964', 'dd-mm-yyyy'), 'RavSamal', 'Barak', 'Mor', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (860944630, to_date('31-08-1993', 'dd-mm-yyyy'), 'RavSamal', 'Dalia', 'Malka', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (970939234, to_date('19-07-1998', 'dd-mm-yyyy'), 'RavSamal', 'Michal', 'Mor', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (790597387, to_date('07-06-1951', 'dd-mm-yyyy'), 'RavSamal', 'Gilad', 'Ben-David', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (449535616, to_date('13-10-1996', 'dd-mm-yyyy'), 'RavSamal', 'Shira', 'Azoulay', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (92384346, to_date('06-12-1991', 'dd-mm-yyyy'), 'ReshoomSitum', 'Shani', 'Dayan', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (96798324, to_date('03-12-1959', 'dd-mm-yyyy'), 'RavSamal', 'Dana', 'Malka', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (920019884, to_date('31-05-1991', 'dd-mm-yyyy'), 'Segen', 'Yair', 'Mizrahi', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (848876967, to_date('24-09-1997', 'dd-mm-yyyy'), 'RavAluf', 'Ziv', 'Levy', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (86348597, to_date('13-02-2004', 'dd-mm-yyyy'), 'SamalRishon', 'Eitan', 'Cohen', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (427633412, to_date('01-09-1976', 'dd-mm-yyyy'), 'RavSamal', 'Itai', 'Amar', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (884802758, to_date('04-07-1971', 'dd-mm-yyyy'), 'RavSamal', 'Dalia', 'Ben-David', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (368073352, to_date('05-09-1954', 'dd-mm-yyyy'), 'RavSamal', 'Yael', 'Malka', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (696164740, to_date('27-11-1981', 'dd-mm-yyyy'), 'RavSamal', 'Alon', 'Ben-Avraham', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (509280185, to_date('30-09-1984', 'dd-mm-yyyy'), 'SegenMishneh', 'Inbar', 'Biton', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (170428173, to_date('15-06-1967', 'dd-mm-yyyy'), 'RavSamal', 'Erez', 'Cohen', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (128185588, to_date('26-01-1977', 'dd-mm-yyyy'), 'RavSamal', 'Boaz', 'Avraham', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (806039254, to_date('03-12-1985', 'dd-mm-yyyy'), 'RavSamal', 'Eitan', 'Levy', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (427054136, to_date('17-07-1979', 'dd-mm-yyyy'), 'RavSamal', 'Shachar', 'Barak', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (366024509, to_date('05-10-1953', 'dd-mm-yyyy'), 'RavSamal', 'Shira', 'Azoulay', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (156074960, to_date('12-09-1950', 'dd-mm-yyyy'), 'RavSamal', 'Nir', 'Cohen', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (823226118, to_date('02-03-1962', 'dd-mm-yyyy'), 'RavSamal', 'Yonatan', 'Amar', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (100460095, to_date('27-05-1986', 'dd-mm-yyyy'), 'RavSamal', 'Yael', 'Mor', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (873879832, to_date('25-01-1971', 'dd-mm-yyyy'), 'RavSamal', 'Elad', 'Levi', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (392616556, to_date('17-12-1954', 'dd-mm-yyyy'), 'RavSamal', 'Ronen', 'David', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (563546248, to_date('16-05-1999', 'dd-mm-yyyy'), 'RavSamal', 'Matan', 'Bitton', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (38809955, to_date('05-07-1953', 'dd-mm-yyyy'), 'RavSamal', 'Yuval', 'David', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (496442797, to_date('03-02-1985', 'dd-mm-yyyy'), 'RavSamal', 'Adi', 'Levy', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (999169755, to_date('17-06-1982', 'dd-mm-yyyy'), 'RavSamal', 'Amit', 'Cohen', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (31991919, to_date('07-05-1961', 'dd-mm-yyyy'), 'RavSamal', 'Barak', 'Malka', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (517005127, to_date('11-03-2004', 'dd-mm-yyyy'), 'RavSamal', 'Shira', 'Ben-Avraham', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (676864100, to_date('30-09-1964', 'dd-mm-yyyy'), 'RavSamal', 'Amir', 'Levy', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (605232968, to_date('30-12-1954', 'dd-mm-yyyy'), 'RavAlufBait', 'Shachar', 'Barak', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (975713400, to_date('16-03-1992', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Yonatan', 'Mizrahi', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (346162990, to_date('01-10-1954', 'dd-mm-yyyy'), 'RavAlufBait', 'Ayelet', 'Ben-David', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (648030699, to_date('10-06-1951', 'dd-mm-yyyy'), 'RavSamal', 'Omri', 'Dayan', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (890501796, to_date('05-01-1972', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Talia', 'Levy', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (864915460, to_date('25-02-1982', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Tal', 'Mor', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (619446944, to_date('11-05-1978', 'dd-mm-yyyy'), 'RavSamal', 'Yaara', 'Ben-Shlomo', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (309679728, to_date('04-06-1955', 'dd-mm-yyyy'), 'RavSamal', 'Yael', 'Ben-David', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (908940344, to_date('04-03-1987', 'dd-mm-yyyy'), 'TatAluf', 'Talia', 'Ben-David', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (309719029, to_date('09-08-1988', 'dd-mm-yyyy'), 'RavSamal', 'Noa', 'Malka', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (918298456, to_date('05-02-1963', 'dd-mm-yyyy'), 'RavSamal', 'Oren', 'Barak', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (189616313, to_date('04-07-1989', 'dd-mm-yyyy'), 'TatAluf', 'Noga', 'Biton', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (59689472, to_date('31-10-1985', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Erez', 'Dayan', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (804656953, to_date('25-07-1989', 'dd-mm-yyyy'), 'SamalRishon', 'Ziv', 'Malka', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (933905106, to_date('29-07-1952', 'dd-mm-yyyy'), 'RavSamal', 'Avital', 'Mizrahi', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (506038648, to_date('21-02-1971', 'dd-mm-yyyy'), 'SamalRishon', 'Liat', 'Ben-David', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (359931013, to_date('12-10-1964', 'dd-mm-yyyy'), 'SamalRishon', 'Aviv', 'Cohen', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (304072316, to_date('23-08-1988', 'dd-mm-yyyy'), 'Aluf', 'Inbar', 'Levy', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (896601848, to_date('25-07-1970', 'dd-mm-yyyy'), 'TatAluf', 'Itai', 'Biton', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (357980431, to_date('22-03-1955', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Tal', 'Malka', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (501199684, to_date('21-03-1957', 'dd-mm-yyyy'), 'ReshoomSitum', 'Shachar', 'Barak', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (195146138, to_date('23-12-1990', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Gilad', 'Ben-Shalom', 'IronDomeBattery');
commit;
prompt 200 records committed...
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (173486842, to_date('04-02-1977', 'dd-mm-yyyy'), 'Samal', 'Amit', 'Azulay', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (123915433, to_date('22-02-1998', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Ronen', 'Amar', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (882391029, to_date('25-11-1959', 'dd-mm-yyyy'), 'RavTurai', 'Adi', 'Ben-Shalom', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (886513759, to_date('11-10-1988', 'dd-mm-yyyy'), 'Aluf', 'Maya', 'Biton', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (549867969, to_date('04-09-1995', 'dd-mm-yyyy'), 'ReshoomSitum', 'Alon', 'Bitton', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (84777329, to_date('05-04-1974', 'dd-mm-yyyy'), 'RavAlufBait', 'Tamar', 'Amar', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (703258636, to_date('11-06-1962', 'dd-mm-yyyy'), 'RavAluf', 'Noa', 'Biton', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (176298527, to_date('08-03-1975', 'dd-mm-yyyy'), 'RavAluf', 'Noga', 'Ben-Shalom', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (301683965, to_date('14-12-1965', 'dd-mm-yyyy'), 'AlufMishne', 'Yair', 'Mizrahi', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (226706494, to_date('18-11-1981', 'dd-mm-yyyy'), 'Rotem', 'Barak', 'Cohen', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (590776766, to_date('26-11-1973', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Or', 'Mor', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (452407341, to_date('19-02-1967', 'dd-mm-yyyy'), 'Aluf', 'Lior', 'Azulay', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (169511690, to_date('03-08-2003', 'dd-mm-yyyy'), 'TatAluf', 'Oren', 'Cohen', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (2786419, to_date('25-02-1988', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Roni', 'Mor', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (147105179, to_date('21-05-1963', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Noga', 'Ben-David', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (617020936, to_date('31-01-1980', 'dd-mm-yyyy'), 'RavAluf', 'Ronen', 'Azoulay', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (338354276, to_date('09-01-1956', 'dd-mm-yyyy'), 'RavTurai', 'Noga', 'Azulay', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (716887752, to_date('07-10-1968', 'dd-mm-yyyy'), 'Turai', 'Talia', 'Levy', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (896099346, to_date('02-12-1976', 'dd-mm-yyyy'), 'SegenMishneh', 'Shachar', 'Mizrahi', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (586606762, to_date('24-04-1979', 'dd-mm-yyyy'), 'RavAluf', 'Noa', 'Mizrahi', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (451854589, to_date('01-03-2000', 'dd-mm-yyyy'), 'RavSamal', 'Yair', 'Biton', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (899177615, to_date('11-01-1988', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Nir', 'Amar', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (659409755, to_date('05-11-1991', 'dd-mm-yyyy'), 'RavAlufBait', 'Omri', 'Cohen', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (120870438, to_date('21-05-1955', 'dd-mm-yyyy'), 'TatAluf', 'Yonatan', 'Cohen', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (682434276, to_date('15-01-1968', 'dd-mm-yyyy'), 'Aluf', 'Noa', 'Levi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (633915592, to_date('12-04-1971', 'dd-mm-yyyy'), 'Samal', 'Yuval', 'Barak', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (555852958, to_date('21-06-1965', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Erez', 'Avraham', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (992565772, to_date('05-05-1966', 'dd-mm-yyyy'), 'Samal', 'Alon', 'Cohen', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (344105739, to_date('12-03-1978', 'dd-mm-yyyy'), 'TatAluf', 'Ayelet', 'Mizrahi', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (164769073, to_date('27-06-1957', 'dd-mm-yyyy'), 'Aluf', 'Talia', 'Barak', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (755301653, to_date('12-01-1974', 'dd-mm-yyyy'), 'Samal', 'Yaara', 'Bitton', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (17071673, to_date('22-10-1959', 'dd-mm-yyyy'), 'Rotem', 'Lia', 'Cohen', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (206940749, to_date('02-07-1989', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Dana', 'Biton', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (224953763, to_date('01-07-1953', 'dd-mm-yyyy'), 'Segen', 'Nir', 'Mizrahi', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (807157955, to_date('24-12-1984', 'dd-mm-yyyy'), 'Turai', 'Dalia', 'Mizrahi', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (577952863, to_date('02-04-1964', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Ilana', 'Ben-Shalom', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (780471285, to_date('18-02-1990', 'dd-mm-yyyy'), 'Samal', 'Yuval', 'Cohen', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (59907258, to_date('17-10-1965', 'dd-mm-yyyy'), 'RavSamal', 'Gal', 'Mizrahi', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (711151482, to_date('02-07-2000', 'dd-mm-yyyy'), 'SegenMishneh', 'Hila', 'Azulay', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (544994839, to_date('16-07-1955', 'dd-mm-yyyy'), 'RavSamal', 'Shani', 'Barak', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (243360154, to_date('24-08-2003', 'dd-mm-yyyy'), 'AlufMishne', 'Yael', 'David', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (401210905, to_date('11-05-1954', 'dd-mm-yyyy'), 'Rotem', 'Alon', 'Levi', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (83980733, to_date('29-02-1996', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Gal', 'Malka', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (331354231, to_date('26-03-1975', 'dd-mm-yyyy'), 'Rotem', 'Or', 'Mor', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (394675954, to_date('10-02-1993', 'dd-mm-yyyy'), 'RavSamal', 'Liat', 'Malka', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (535247162, to_date('22-12-1979', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Liat', 'Ben-Shlomo', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (760601144, to_date('27-12-2004', 'dd-mm-yyyy'), 'RavTurai', 'Itai', 'Levy', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (679255217, to_date('06-02-1967', 'dd-mm-yyyy'), 'Aluf', 'Alon', 'Cohen', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (6948714, to_date('24-10-1993', 'dd-mm-yyyy'), 'RavAlufBait', 'Or', 'Azoulay', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (90975405, to_date('07-01-1995', 'dd-mm-yyyy'), 'AlufMishne', 'Aviv', 'Cohen', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (406939452, to_date('20-03-1968', 'dd-mm-yyyy'), 'RavAlufBait', 'Liat', 'Azulay', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (838807727, to_date('30-07-1960', 'dd-mm-yyyy'), 'SegenMishneh', 'Ilana', 'Amar', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (223163717, to_date('07-04-1995', 'dd-mm-yyyy'), 'Samal', 'Barak', 'Ben-Shlomo', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (151672394, to_date('26-04-1999', 'dd-mm-yyyy'), 'TatAluf', 'Barak', 'Malka', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (953566820, to_date('21-06-2002', 'dd-mm-yyyy'), 'RavSamal', 'Shira', 'Mizrahi', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (948068148, to_date('18-11-1956', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Dalia', 'Barak', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (302239238, to_date('04-12-1950', 'dd-mm-yyyy'), 'SamalRishon', 'Lia', 'Ben-David', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (971369974, to_date('25-02-1988', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Oren', 'Azoulay', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (62655216, to_date('05-04-1973', 'dd-mm-yyyy'), 'AlufMishne', 'Nadav', 'Amar', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (304753010, to_date('29-05-1980', 'dd-mm-yyyy'), 'Samal', 'Roni', 'Mor', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (584742297, to_date('28-10-1993', 'dd-mm-yyyy'), 'RavAluf', 'Tamar', 'Mor', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (583586907, to_date('25-06-1966', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Noa', 'Azulay', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (843885713, to_date('13-08-1959', 'dd-mm-yyyy'), 'RavSamal', 'Elad', 'Azoulay', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (894536977, to_date('27-04-1981', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Ayelet', 'Cohen', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (30314782, to_date('01-10-1971', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Alon', 'Ben-David', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (217702278, to_date('06-04-1981', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Tal', 'Avraham', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (970573543, to_date('09-04-1950', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Alon', 'Mizrahi', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (987435024, to_date('19-12-1967', 'dd-mm-yyyy'), 'RavAluf', 'Boaz', 'Levi', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (434703552, to_date('03-03-1963', 'dd-mm-yyyy'), 'Samal', 'Yaara', 'Mizrahi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (249755717, to_date('16-11-1950', 'dd-mm-yyyy'), 'SamalRishon', 'Keren', 'Mizrahi', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (743021164, to_date('19-12-1971', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Matan', 'Levi', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (807717422, to_date('24-04-1952', 'dd-mm-yyyy'), 'Rotem', 'Tal', 'Levi', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (408958649, to_date('07-10-1953', 'dd-mm-yyyy'), 'AlufMishne', 'Talia', 'Cohen', 'Paratroopers');
commit;
prompt 273 records loaded
prompt Loading FLOWN_BY...
insert into FLOWN_BY (soldier_id, aircraft_id)
values (918922079, 6554623);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (939435895, 4178159);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (876816056, 9482712);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (894326216, 4163530);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (863879911, 5062584);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (78008934, 9826361);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (276412817, 1920632);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (707520332, 2572707);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (257132733, 5369899);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (895727331, 6029568);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (398012055, 9866928);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (227809174, 6614209);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (539272033, 6438888);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (58230132, 3117957);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (161094854, 1107832);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (100823687, 8729046);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (787377762, 2934580);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (553773429, 4910365);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (472264837, 9651501);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (211911905, 6869774);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (688544625, 3156942);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (19900422, 2109742);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (938695176, 3127284);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (204735426, 8907738);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (27309463, 2637693);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (119324186, 8163662);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (516903398, 4049584);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (390303866, 1204485);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (14859674, 3250114);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (772344246, 7672711);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (33348831, 4705632);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (678156612, 2880930);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (775186259, 9965460);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (791356613, 9876560);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (580744813, 6530640);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (990619358, 6438888);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (33519446, 1699452);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (353399272, 4273393);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (957293214, 9772473);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (268280838, 3127284);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (537542840, 5349759);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (791194510, 9094945);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (693277640, 9340137);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (521791185, 4121496);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (326217360, 9965460);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (528040682, 9069583);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (339156780, 2639613);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (528905573, 9228562);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (785530631, 7857610);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (47521761, 9504684);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (700051578, 4868610);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (658456825, 6614209);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (356782622, 8728896);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (109746290, 1699452);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (139730663, 2883414);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (138780621, 3157077);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (80299456, 9228562);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (640870770, 8327238);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (938341769, 9482712);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (515164706, 7984570);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (346165870, 1266331);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (344417887, 9938320);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (27888027, 8737719);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (99392871, 1920632);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (979203046, 3286539);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (63905300, 6734549);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (787617930, 9230888);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (621448955, 1839002);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (340818594, 7991343);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (601514113, 7620252);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (565195540, 4121496);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (597169972, 3433496);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (355518824, 1889133);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (480375782, 7568931);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (421861798, 4695397);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (22117822, 4273393);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (741528628, 3580899);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (219695867, 1386174);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (623560716, 9149654);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (243993217, 9958496);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (61751992, 7374761);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (814858838, 7592981);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (253020708, 1862987);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (958408916, 8599881);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (856555734, 7782852);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (739502967, 3429980);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (14962501, 9083652);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (354262773, 4695397);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (262774555, 9089023);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (388593835, 2613682);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (128587055, 2109742);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (777390005, 8450550);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (445021747, 1809773);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (919730837, 1216440);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (921345792, 3678140);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (335043978, 1620946);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (533658209, 7958360);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (130230511, 2865561);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (559946127, 1220339);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (501339491, 3910321);
commit;
prompt 100 records committed...
insert into FLOWN_BY (soldier_id, aircraft_id)
values (951979571, 1662066);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (83424189, 1629105);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (48296139, 6348818);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (852148646, 4049584);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (209537395, 8684335);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (765470455, 5062584);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (835614936, 7912488);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (86417259, 5299451);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (915186888, 4178159);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (940572982, 7991343);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (388851398, 3479015);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (33810605, 8008752);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (645592237, 5248976);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (668859191, 8429937);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (8310165, 4048713);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (954789903, 7247204);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (591654777, 8907738);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (922868636, 1756872);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (149955748, 5467817);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (132254189, 5118616);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (984292034, 7228287);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (222038979, 8572356);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (321863485, 4472622);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (426023600, 2168218);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (563250879, 5408780);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (146228453, 8770771);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (920665418, 3286539);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (42187495, 8893595);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (190685698, 8853172);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (633046823, 2135437);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (678454411, 5277671);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (655441077, 7924048);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (913550787, 3594090);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (868116529, 2827308);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (691870152, 9938320);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (705828591, 8043358);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (586503670, 1488283);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (141017923, 1266331);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (527623213, 3374248);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (223653476, 7844491);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (648570736, 3828982);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (103774210, 9513260);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (18313165, 9866928);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (262946526, 9876560);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (25744932, 8729046);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (283254004, 7356995);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (843391891, 7197633);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (860944630, 8106334);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (970939234, 4910514);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (790597387, 2867074);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (449535616, 7515473);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (92384346, 8770771);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (96798324, 9149654);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (920019884, 5056047);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (848876967, 2883414);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (86348597, 1513649);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (427633412, 4121496);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (884802758, 6284745);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (368073352, 4101408);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (696164740, 4121496);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (509280185, 4654666);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (170428173, 9075312);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (128185588, 8721879);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (806039254, 1107832);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (427054136, 7515473);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (366024509, 8833618);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (156074960, 4051150);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (823226118, 9989159);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (100460095, 8582823);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (873879832, 6312310);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (392616556, 9089023);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (563546248, 4755086);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (38809955, 6084836);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (496442797, 1215163);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (999169755, 7725614);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (31991919, 8983905);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (517005127, 7046326);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (676864100, 9172745);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (605232968, 8355652);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (975713400, 1073937);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (346162990, 9402407);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (648030699, 6554623);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (890501796, 2568730);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (864915460, 2493988);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (619446944, 6693175);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (309679728, 4152741);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (908940344, 6477468);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (309719029, 9971834);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (918298456, 3433496);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (189616313, 7781806);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (59689472, 5074546);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (804656953, 9453911);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (933905106, 5369899);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (506038648, 1809773);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (359931013, 1012463);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (304072316, 3728847);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (896601848, 7782852);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (357980431, 9613359);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (501199684, 6882420);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (195146138, 9744126);
commit;
prompt 200 records committed...
insert into FLOWN_BY (soldier_id, aircraft_id)
values (173486842, 1220339);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (123915433, 3157077);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (882391029, 5248976);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (886513759, 2637693);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (549867969, 7046326);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (84777329, 7551773);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (703258636, 4910514);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (176298527, 7924048);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (301683965, 1026336);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (226706494, 4556095);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (590776766, 8729046);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (452407341, 7197633);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (169511690, 9856715);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (2786419, 3479015);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (147105179, 2639613);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (617020936, 5655458);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (338354276, 9860541);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (716887752, 1012463);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (896099346, 5369899);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (586606762, 7140959);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (451854589, 9989159);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (899177615, 9929781);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (659409755, 7725207);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (120870438, 9961949);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (682434276, 3594090);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (633915592, 9504684);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (555852958, 2851433);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (992565772, 8882657);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (344105739, 2934580);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (164769073, 9083652);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (755301653, 9720973);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (17071673, 7565717);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (206940749, 2367375);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (224953763, 8248850);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (807157955, 3250114);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (577952863, 9313155);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (780471285, 5118616);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (59907258, 7112797);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (711151482, 5596801);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (544994839, 2367375);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (243360154, 4755086);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (401210905, 3678140);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (83980733, 1386153);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (331354231, 9597832);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (394675954, 6084836);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (535247162, 8711934);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (760601144, 1025065);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (679255217, 9402407);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (6948714, 5689433);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (90975405, 1268657);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (406939452, 3743331);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (838807727, 9340137);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (223163717, 5604032);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (151672394, 4549256);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (953566820, 5056047);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (948068148, 3767565);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (302239238, 5056047);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (971369974, 6259026);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (62655216, 9253559);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (304753010, 1756872);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (584742297, 4123250);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (583586907, 1920632);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (843885713, 8981330);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (894536977, 4556095);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (30314782, 8503312);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (217702278, 8983905);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (970573543, 8684335);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (987435024, 6826082);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (434703552, 2260910);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (249755717, 1205585);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (743021164, 4152741);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (807717422, 1808725);
insert into FLOWN_BY (soldier_id, aircraft_id)
values (408958649, 5475461);
commit;
prompt 273 records loaded
prompt Loading STORES...
insert into STORES (store_id, capacity, base_id)
values (7998045433, 423, 5858610);
insert into STORES (store_id, capacity, base_id)
values (5260113197, 808, 6976065);
insert into STORES (store_id, capacity, base_id)
values (8719506268, 2069, 9797811);
insert into STORES (store_id, capacity, base_id)
values (3220487253, 4264, 2705942);
insert into STORES (store_id, capacity, base_id)
values (8015551792, 2318, 7292579);
insert into STORES (store_id, capacity, base_id)
values (4309160419, 4401, 5727542);
insert into STORES (store_id, capacity, base_id)
values (4473030814, 3277, 5656777);
insert into STORES (store_id, capacity, base_id)
values (4305773626, 1037, 1604680);
insert into STORES (store_id, capacity, base_id)
values (4094829436, 557, 9184050);
insert into STORES (store_id, capacity, base_id)
values (4254840602, 541, 1453003);
insert into STORES (store_id, capacity, base_id)
values (8741317356, 4187, 9569121);
insert into STORES (store_id, capacity, base_id)
values (3029221199, 1054, 6373161);
insert into STORES (store_id, capacity, base_id)
values (3558617930, 4675, 1477365);
insert into STORES (store_id, capacity, base_id)
values (6640968939, 1856, 1321073);
insert into STORES (store_id, capacity, base_id)
values (684943291, 4969, 6642199);
insert into STORES (store_id, capacity, base_id)
values (261407387, 2900, 7511303);
insert into STORES (store_id, capacity, base_id)
values (8008467226, 4257, 5432571);
insert into STORES (store_id, capacity, base_id)
values (6875389640, 815, 3395577);
insert into STORES (store_id, capacity, base_id)
values (8761922338, 4826, 3812988);
insert into STORES (store_id, capacity, base_id)
values (127338072, 3309, 4527562);
insert into STORES (store_id, capacity, base_id)
values (1069660621, 128, 2266541);
insert into STORES (store_id, capacity, base_id)
values (3379209368, 1218, 5033344);
insert into STORES (store_id, capacity, base_id)
values (7257468760, 3155, 1840828);
insert into STORES (store_id, capacity, base_id)
values (6051015683, 4617, 8787104);
insert into STORES (store_id, capacity, base_id)
values (6909820646, 2278, 2809855);
insert into STORES (store_id, capacity, base_id)
values (5494311415, 3705, 8357490);
insert into STORES (store_id, capacity, base_id)
values (9912916709, 4660, 7131970);
insert into STORES (store_id, capacity, base_id)
values (7857194612, 382, 1771510);
insert into STORES (store_id, capacity, base_id)
values (2051033117, 4610, 8112614);
insert into STORES (store_id, capacity, base_id)
values (2362984114, 3138, 7481871);
insert into STORES (store_id, capacity, base_id)
values (43859418, 1506, 3345502);
insert into STORES (store_id, capacity, base_id)
values (9560385514, 3546, 1313329);
insert into STORES (store_id, capacity, base_id)
values (9215297133, 4917, 6764446);
insert into STORES (store_id, capacity, base_id)
values (7873678207, 1582, 5006318);
insert into STORES (store_id, capacity, base_id)
values (4382214167, 424, 5272396);
insert into STORES (store_id, capacity, base_id)
values (4193257857, 350, 9895475);
insert into STORES (store_id, capacity, base_id)
values (3532193164, 1578, 3857827);
insert into STORES (store_id, capacity, base_id)
values (5755503158, 3787, 4989763);
insert into STORES (store_id, capacity, base_id)
values (6606838009, 2753, 2389852);
insert into STORES (store_id, capacity, base_id)
values (9947274359, 23, 4689005);
insert into STORES (store_id, capacity, base_id)
values (4993512060, 4892, 5287495);
insert into STORES (store_id, capacity, base_id)
values (1627572129, 4834, 1301115);
insert into STORES (store_id, capacity, base_id)
values (7159771341, 211, 7893921);
insert into STORES (store_id, capacity, base_id)
values (1009400256, 4982, 7365327);
insert into STORES (store_id, capacity, base_id)
values (3432086456, 4618, 9407813);
insert into STORES (store_id, capacity, base_id)
values (4840843889, 4119, 8896599);
insert into STORES (store_id, capacity, base_id)
values (1394366144, 1063, 7028691);
insert into STORES (store_id, capacity, base_id)
values (2195427266, 185, 2249892);
insert into STORES (store_id, capacity, base_id)
values (711915037, 245, 6971394);
insert into STORES (store_id, capacity, base_id)
values (9851046040, 4715, 2708504);
insert into STORES (store_id, capacity, base_id)
values (4532819678, 1965, 8482110);
insert into STORES (store_id, capacity, base_id)
values (9542897224, 966, 5599498);
insert into STORES (store_id, capacity, base_id)
values (1711577649, 4484, 2501279);
insert into STORES (store_id, capacity, base_id)
values (9018685179, 4125, 9896801);
insert into STORES (store_id, capacity, base_id)
values (900082013, 1972, 1489935);
insert into STORES (store_id, capacity, base_id)
values (2073504657, 1706, 2819021);
insert into STORES (store_id, capacity, base_id)
values (5773732563, 4813, 4299184);
insert into STORES (store_id, capacity, base_id)
values (3472501279, 3536, 3394388);
insert into STORES (store_id, capacity, base_id)
values (8494880937, 4165, 3596329);
insert into STORES (store_id, capacity, base_id)
values (7162438431, 1082, 6938326);
insert into STORES (store_id, capacity, base_id)
values (3295113117, 4114, 6528989);
insert into STORES (store_id, capacity, base_id)
values (8014422314, 655, 4409836);
insert into STORES (store_id, capacity, base_id)
values (8828866526, 1094, 2446905);
insert into STORES (store_id, capacity, base_id)
values (560519940, 4869, 1906749);
insert into STORES (store_id, capacity, base_id)
values (1126661700, 1452, 4019241);
insert into STORES (store_id, capacity, base_id)
values (7689428194, 3565, 5492882);
insert into STORES (store_id, capacity, base_id)
values (9422744030, 4937, 3910956);
insert into STORES (store_id, capacity, base_id)
values (7856772511, 4399, 5764337);
insert into STORES (store_id, capacity, base_id)
values (2635359704, 2704, 3596212);
insert into STORES (store_id, capacity, base_id)
values (198493237, 90, 2211654);
insert into STORES (store_id, capacity, base_id)
values (7752406588, 2158, 3880995);
insert into STORES (store_id, capacity, base_id)
values (9792008952, 86, 7499865);
insert into STORES (store_id, capacity, base_id)
values (9427109086, 1308, 2607420);
insert into STORES (store_id, capacity, base_id)
values (4456118071, 433, 3751711);
insert into STORES (store_id, capacity, base_id)
values (9862505986, 3004, 2274538);
insert into STORES (store_id, capacity, base_id)
values (7001159921, 2117, 8164017);
insert into STORES (store_id, capacity, base_id)
values (3490649377, 1822, 5356352);
insert into STORES (store_id, capacity, base_id)
values (415522799, 351, 1184562);
insert into STORES (store_id, capacity, base_id)
values (9603944310, 798, 3880226);
insert into STORES (store_id, capacity, base_id)
values (2863308060, 3955, 7026024);
insert into STORES (store_id, capacity, base_id)
values (3199368328, 1800, 4383441);
insert into STORES (store_id, capacity, base_id)
values (4549105621, 3065, 1901528);
insert into STORES (store_id, capacity, base_id)
values (112043827, 2139, 3656169);
insert into STORES (store_id, capacity, base_id)
values (6484335275, 3112, 8006597);
insert into STORES (store_id, capacity, base_id)
values (8772493343, 759, 9609769);
insert into STORES (store_id, capacity, base_id)
values (3692035034, 4387, 4573516);
insert into STORES (store_id, capacity, base_id)
values (131447274, 1954, 3930228);
insert into STORES (store_id, capacity, base_id)
values (7442771353, 2018, 1166918);
insert into STORES (store_id, capacity, base_id)
values (1245195236, 996, 2649426);
insert into STORES (store_id, capacity, base_id)
values (1695723512, 570, 6644408);
insert into STORES (store_id, capacity, base_id)
values (9010351513, 4013, 2341058);
insert into STORES (store_id, capacity, base_id)
values (9726857902, 544, 9740737);
insert into STORES (store_id, capacity, base_id)
values (3079312747, 2504, 3881087);
insert into STORES (store_id, capacity, base_id)
values (6958849171, 2058, 4692725);
insert into STORES (store_id, capacity, base_id)
values (4237643702, 3137, 5740636);
insert into STORES (store_id, capacity, base_id)
values (5220721040, 1176, 4715516);
insert into STORES (store_id, capacity, base_id)
values (1674658590, 3033, 3449727);
insert into STORES (store_id, capacity, base_id)
values (4399125649, 476, 3682201);
insert into STORES (store_id, capacity, base_id)
values (4732946988, 4247, 7486203);
insert into STORES (store_id, capacity, base_id)
values (373156598, 3617, 5648560);
commit;
prompt 100 records committed...
insert into STORES (store_id, capacity, base_id)
values (6245206047, 677, 1230754);
insert into STORES (store_id, capacity, base_id)
values (3130013219, 2485, 5162677);
insert into STORES (store_id, capacity, base_id)
values (8283282713, 3027, 1370555);
insert into STORES (store_id, capacity, base_id)
values (9676309403, 1195, 3292604);
insert into STORES (store_id, capacity, base_id)
values (7094245914, 3236, 4213017);
insert into STORES (store_id, capacity, base_id)
values (8870701376, 960, 1150872);
insert into STORES (store_id, capacity, base_id)
values (663483986, 757, 4077115);
insert into STORES (store_id, capacity, base_id)
values (3048079767, 1480, 8523816);
insert into STORES (store_id, capacity, base_id)
values (1015657414, 3888, 5259525);
insert into STORES (store_id, capacity, base_id)
values (362072609, 815, 4780856);
insert into STORES (store_id, capacity, base_id)
values (5739282429, 1502, 2157015);
insert into STORES (store_id, capacity, base_id)
values (8357509128, 369, 5872898);
insert into STORES (store_id, capacity, base_id)
values (4798387437, 2222, 6835215);
insert into STORES (store_id, capacity, base_id)
values (9456089279, 2702, 2206902);
insert into STORES (store_id, capacity, base_id)
values (5281120135, 1053, 6150145);
insert into STORES (store_id, capacity, base_id)
values (7405919321, 2041, 2492108);
insert into STORES (store_id, capacity, base_id)
values (5986847282, 2449, 2882459);
insert into STORES (store_id, capacity, base_id)
values (9139855618, 3328, 5358033);
insert into STORES (store_id, capacity, base_id)
values (8171193171, 414, 4491012);
insert into STORES (store_id, capacity, base_id)
values (1925464105, 434, 2707855);
insert into STORES (store_id, capacity, base_id)
values (3105156743, 3529, 5079970);
insert into STORES (store_id, capacity, base_id)
values (5137393457, 1958, 7789746);
insert into STORES (store_id, capacity, base_id)
values (2378580045, 3531, 9794238);
insert into STORES (store_id, capacity, base_id)
values (4615379066, 4046, 1627194);
insert into STORES (store_id, capacity, base_id)
values (9691746383, 4555, 1815039);
insert into STORES (store_id, capacity, base_id)
values (2828855385, 1425, 3385937);
insert into STORES (store_id, capacity, base_id)
values (9662472323, 1946, 2751730);
insert into STORES (store_id, capacity, base_id)
values (7183055861, 4118, 8627871);
insert into STORES (store_id, capacity, base_id)
values (2300617388, 3881, 3134210);
insert into STORES (store_id, capacity, base_id)
values (845393956, 1333, 3890101);
insert into STORES (store_id, capacity, base_id)
values (2505310704, 4761, 9699088);
insert into STORES (store_id, capacity, base_id)
values (2255353139, 1023, 3801644);
insert into STORES (store_id, capacity, base_id)
values (3855948706, 4637, 7432294);
insert into STORES (store_id, capacity, base_id)
values (188126018, 1244, 4556709);
insert into STORES (store_id, capacity, base_id)
values (8951937158, 1985, 7454917);
insert into STORES (store_id, capacity, base_id)
values (1726567562, 1059, 2569477);
insert into STORES (store_id, capacity, base_id)
values (9929535518, 1944, 4194531);
insert into STORES (store_id, capacity, base_id)
values (6224217074, 3515, 4888873);
insert into STORES (store_id, capacity, base_id)
values (4743275322, 2008, 4211396);
insert into STORES (store_id, capacity, base_id)
values (7194272436, 853, 9028404);
insert into STORES (store_id, capacity, base_id)
values (8981396378, 1008, 1067132);
insert into STORES (store_id, capacity, base_id)
values (591700657, 3103, 7799508);
insert into STORES (store_id, capacity, base_id)
values (2437887388, 319, 6058922);
insert into STORES (store_id, capacity, base_id)
values (8356241074, 1697, 6475597);
insert into STORES (store_id, capacity, base_id)
values (4711622117, 572, 4822423);
insert into STORES (store_id, capacity, base_id)
values (4740632252, 3704, 7385989);
insert into STORES (store_id, capacity, base_id)
values (272314523, 3485, 1793337);
insert into STORES (store_id, capacity, base_id)
values (2853209284, 3435, 6847949);
insert into STORES (store_id, capacity, base_id)
values (3006393424, 2983, 3943663);
insert into STORES (store_id, capacity, base_id)
values (3462661594, 1039, 1082097);
insert into STORES (store_id, capacity, base_id)
values (3780928275, 1461, 7899860);
insert into STORES (store_id, capacity, base_id)
values (1985703929, 1387, 3329277);
insert into STORES (store_id, capacity, base_id)
values (6737760058, 4349, 1043200);
insert into STORES (store_id, capacity, base_id)
values (3469925177, 2703, 6257519);
insert into STORES (store_id, capacity, base_id)
values (3039337505, 4233, 2265653);
insert into STORES (store_id, capacity, base_id)
values (1341843981, 36, 3232451);
insert into STORES (store_id, capacity, base_id)
values (8889599837, 3254, 6076546);
insert into STORES (store_id, capacity, base_id)
values (4336329790, 2110, 4072115);
insert into STORES (store_id, capacity, base_id)
values (4440812047, 1763, 1373671);
insert into STORES (store_id, capacity, base_id)
values (9197008138, 4355, 1340571);
insert into STORES (store_id, capacity, base_id)
values (3824071590, 4431, 5347409);
insert into STORES (store_id, capacity, base_id)
values (8734165994, 399, 8161495);
insert into STORES (store_id, capacity, base_id)
values (3103587291, 4936, 7486838);
insert into STORES (store_id, capacity, base_id)
values (28008819, 2082, 4317667);
insert into STORES (store_id, capacity, base_id)
values (3561117427, 907, 9194052);
insert into STORES (store_id, capacity, base_id)
values (4054632455, 3171, 4214407);
insert into STORES (store_id, capacity, base_id)
values (6247731793, 906, 4552529);
insert into STORES (store_id, capacity, base_id)
values (7551884229, 1068, 3926146);
insert into STORES (store_id, capacity, base_id)
values (1630047150, 4576, 8623493);
insert into STORES (store_id, capacity, base_id)
values (1962143604, 4005, 8002559);
insert into STORES (store_id, capacity, base_id)
values (2366342534, 3813, 7783581);
insert into STORES (store_id, capacity, base_id)
values (6559900244, 1193, 8829232);
insert into STORES (store_id, capacity, base_id)
values (3975703508, 2508, 3414667);
insert into STORES (store_id, capacity, base_id)
values (5499267131, 769, 1621944);
insert into STORES (store_id, capacity, base_id)
values (1485190959, 1842, 9621508);
insert into STORES (store_id, capacity, base_id)
values (3519532740, 2698, 6522233);
insert into STORES (store_id, capacity, base_id)
values (8640946841, 3229, 8155818);
insert into STORES (store_id, capacity, base_id)
values (5355522402, 3556, 2016907);
insert into STORES (store_id, capacity, base_id)
values (799358136, 763, 6950843);
insert into STORES (store_id, capacity, base_id)
values (2759393, 3113, 8358419);
insert into STORES (store_id, capacity, base_id)
values (4594720156, 436, 4880879);
insert into STORES (store_id, capacity, base_id)
values (2893899139, 1871, 6222040);
insert into STORES (store_id, capacity, base_id)
values (9470876840, 253, 3446973);
insert into STORES (store_id, capacity, base_id)
values (4470308572, 2824, 8127586);
insert into STORES (store_id, capacity, base_id)
values (3380981990, 3884, 7672225);
insert into STORES (store_id, capacity, base_id)
values (6586650711, 3715, 9488116);
insert into STORES (store_id, capacity, base_id)
values (6942159379, 1968, 4960965);
insert into STORES (store_id, capacity, base_id)
values (6568010629, 3076, 2100001);
insert into STORES (store_id, capacity, base_id)
values (4081165844, 3441, 9828531);
insert into STORES (store_id, capacity, base_id)
values (6361451930, 1661, 9654575);
insert into STORES (store_id, capacity, base_id)
values (3012025231, 2920, 2981171);
insert into STORES (store_id, capacity, base_id)
values (7449507055, 2367, 5665760);
insert into STORES (store_id, capacity, base_id)
values (2023192352, 1591, 5776999);
insert into STORES (store_id, capacity, base_id)
values (2126843023, 3999, 7534197);
insert into STORES (store_id, capacity, base_id)
values (5740985568, 3090, 8261243);
insert into STORES (store_id, capacity, base_id)
values (353622213, 3851, 8868197);
insert into STORES (store_id, capacity, base_id)
values (167134478, 1732, 7603338);
insert into STORES (store_id, capacity, base_id)
values (6042288054, 4330, 5105795);
insert into STORES (store_id, capacity, base_id)
values (4092892706, 4581, 7337064);
insert into STORES (store_id, capacity, base_id)
values (2864156706, 1717, 7716161);
commit;
prompt 200 records committed...
insert into STORES (store_id, capacity, base_id)
values (850149958, 103, 5344218);
insert into STORES (store_id, capacity, base_id)
values (5442740858, 3443, 1575557);
insert into STORES (store_id, capacity, base_id)
values (8887758405, 4490, 1118980);
insert into STORES (store_id, capacity, base_id)
values (3201043602, 3310, 8680745);
insert into STORES (store_id, capacity, base_id)
values (2746852182, 2906, 4618633);
insert into STORES (store_id, capacity, base_id)
values (9478531595, 2637, 6343849);
insert into STORES (store_id, capacity, base_id)
values (6308448206, 3342, 3947799);
insert into STORES (store_id, capacity, base_id)
values (6649963460, 2902, 3879408);
insert into STORES (store_id, capacity, base_id)
values (3746821747, 757, 7953959);
insert into STORES (store_id, capacity, base_id)
values (754274858, 3638, 4449294);
insert into STORES (store_id, capacity, base_id)
values (1007528486, 1924, 9188851);
insert into STORES (store_id, capacity, base_id)
values (5114987385, 3553, 6960977);
insert into STORES (store_id, capacity, base_id)
values (2740526322, 3218, 7938820);
insert into STORES (store_id, capacity, base_id)
values (1697357799, 3658, 9453155);
insert into STORES (store_id, capacity, base_id)
values (6491145944, 4595, 8371346);
insert into STORES (store_id, capacity, base_id)
values (4034737735, 2108, 4867157);
insert into STORES (store_id, capacity, base_id)
values (3578687032, 4259, 8269150);
insert into STORES (store_id, capacity, base_id)
values (167476784, 4757, 1783223);
insert into STORES (store_id, capacity, base_id)
values (2771095897, 2380, 8173179);
insert into STORES (store_id, capacity, base_id)
values (9353106044, 653, 8595332);
insert into STORES (store_id, capacity, base_id)
values (9933939684, 1643, 4078084);
insert into STORES (store_id, capacity, base_id)
values (260155129, 3923, 9671100);
insert into STORES (store_id, capacity, base_id)
values (9098809595, 3140, 7494784);
insert into STORES (store_id, capacity, base_id)
values (1292917045, 682, 4693621);
insert into STORES (store_id, capacity, base_id)
values (1493446177, 322, 9367537);
insert into STORES (store_id, capacity, base_id)
values (8367317858, 4897, 7488637);
insert into STORES (store_id, capacity, base_id)
values (8920688122, 4618, 1638608);
insert into STORES (store_id, capacity, base_id)
values (3466456849, 3586, 2848346);
insert into STORES (store_id, capacity, base_id)
values (5896707556, 4956, 4254601);
insert into STORES (store_id, capacity, base_id)
values (1236262640, 1209, 7985300);
insert into STORES (store_id, capacity, base_id)
values (8928426488, 4690, 2667321);
insert into STORES (store_id, capacity, base_id)
values (6414717976, 1964, 1598446);
insert into STORES (store_id, capacity, base_id)
values (9271702664, 3967, 2461106);
insert into STORES (store_id, capacity, base_id)
values (9774061637, 4103, 1921039);
insert into STORES (store_id, capacity, base_id)
values (9195231798, 3910, 1200517);
insert into STORES (store_id, capacity, base_id)
values (7597390758, 3940, 4859469);
insert into STORES (store_id, capacity, base_id)
values (3790288824, 4416, 7999478);
insert into STORES (store_id, capacity, base_id)
values (577535758, 2371, 6235298);
insert into STORES (store_id, capacity, base_id)
values (8840679769, 1191, 4228001);
insert into STORES (store_id, capacity, base_id)
values (3251223333, 571, 9522749);
insert into STORES (store_id, capacity, base_id)
values (617915992, 4613, 1257997);
insert into STORES (store_id, capacity, base_id)
values (2081070241, 1251, 7142778);
insert into STORES (store_id, capacity, base_id)
values (5903693783, 3172, 6767808);
insert into STORES (store_id, capacity, base_id)
values (4340842495, 967, 3645412);
insert into STORES (store_id, capacity, base_id)
values (1556576479, 434, 6938609);
insert into STORES (store_id, capacity, base_id)
values (5276367047, 1089, 9796583);
insert into STORES (store_id, capacity, base_id)
values (1488574064, 3230, 9447081);
insert into STORES (store_id, capacity, base_id)
values (3023914742, 209, 7996821);
insert into STORES (store_id, capacity, base_id)
values (3305391502, 2303, 1550393);
insert into STORES (store_id, capacity, base_id)
values (1770851029, 3146, 3409378);
insert into STORES (store_id, capacity, base_id)
values (1368073561, 1115, 7333912);
insert into STORES (store_id, capacity, base_id)
values (3799577075, 2969, 6977097);
insert into STORES (store_id, capacity, base_id)
values (208465955, 3223, 5411817);
insert into STORES (store_id, capacity, base_id)
values (839667416, 1669, 3973174);
insert into STORES (store_id, capacity, base_id)
values (4613136344, 3988, 3598298);
insert into STORES (store_id, capacity, base_id)
values (7058052664, 1571, 4173329);
insert into STORES (store_id, capacity, base_id)
values (1777614297, 2503, 4364915);
insert into STORES (store_id, capacity, base_id)
values (9067753838, 804, 5968371);
insert into STORES (store_id, capacity, base_id)
values (6336812574, 1658, 4830313);
insert into STORES (store_id, capacity, base_id)
values (209254136, 2310, 8069111);
insert into STORES (store_id, capacity, base_id)
values (7268923610, 4730, 5654494);
insert into STORES (store_id, capacity, base_id)
values (2126725238, 1434, 9702693);
insert into STORES (store_id, capacity, base_id)
values (900496394, 3144, 2093635);
insert into STORES (store_id, capacity, base_id)
values (6537827757, 4734, 7673017);
insert into STORES (store_id, capacity, base_id)
values (8781434597, 3621, 3675512);
insert into STORES (store_id, capacity, base_id)
values (128193586, 2500, 5170618);
insert into STORES (store_id, capacity, base_id)
values (2619360974, 2382, 7042556);
insert into STORES (store_id, capacity, base_id)
values (9893338138, 914, 9081656);
insert into STORES (store_id, capacity, base_id)
values (9975891720, 2211, 2541742);
insert into STORES (store_id, capacity, base_id)
values (9431365316, 2108, 2573950);
insert into STORES (store_id, capacity, base_id)
values (8746782320, 1021, 7680583);
insert into STORES (store_id, capacity, base_id)
values (9974190274, 1279, 8242911);
insert into STORES (store_id, capacity, base_id)
values (8967262439, 3219, 1678848);
insert into STORES (store_id, capacity, base_id)
values (7605192682, 3319, 3894143);
insert into STORES (store_id, capacity, base_id)
values (479735255, 3652, 7588771);
insert into STORES (store_id, capacity, base_id)
values (1457671959, 707, 2435008);
insert into STORES (store_id, capacity, base_id)
values (1632587230, 4248, 5895010);
insert into STORES (store_id, capacity, base_id)
values (7712522193, 4058, 1157014);
insert into STORES (store_id, capacity, base_id)
values (2650179284, 1011, 8701909);
insert into STORES (store_id, capacity, base_id)
values (6317605166, 4012, 1227023);
insert into STORES (store_id, capacity, base_id)
values (7163319710, 1564, 6632196);
insert into STORES (store_id, capacity, base_id)
values (3213318404, 4007, 8280458);
insert into STORES (store_id, capacity, base_id)
values (5176914888, 2406, 6960681);
insert into STORES (store_id, capacity, base_id)
values (8959262012, 1604, 8936465);
insert into STORES (store_id, capacity, base_id)
values (2160440590, 1014, 9351241);
insert into STORES (store_id, capacity, base_id)
values (6226352815, 1481, 9645797);
insert into STORES (store_id, capacity, base_id)
values (3106691424, 519, 9417924);
insert into STORES (store_id, capacity, base_id)
values (7455337253, 3686, 6849552);
insert into STORES (store_id, capacity, base_id)
values (5150734028, 876, 4253827);
insert into STORES (store_id, capacity, base_id)
values (4046490551, 3910, 7783391);
insert into STORES (store_id, capacity, base_id)
values (3686348545, 1305, 2627121);
insert into STORES (store_id, capacity, base_id)
values (7207154142, 1219, 1719804);
insert into STORES (store_id, capacity, base_id)
values (9832737195, 1920, 4794509);
insert into STORES (store_id, capacity, base_id)
values (8679296847, 4773, 3813126);
insert into STORES (store_id, capacity, base_id)
values (4024776489, 1600, 2391242);
insert into STORES (store_id, capacity, base_id)
values (6784021008, 1179, 2310589);
insert into STORES (store_id, capacity, base_id)
values (1217704657, 2578, 1685902);
insert into STORES (store_id, capacity, base_id)
values (1625879836, 3765, 7530416);
insert into STORES (store_id, capacity, base_id)
values (2089357011, 295, 2200056);
insert into STORES (store_id, capacity, base_id)
values (6810415683, 3373, 3997230);
commit;
prompt 300 records committed...
insert into STORES (store_id, capacity, base_id)
values (3686259046, 620, 6350158);
insert into STORES (store_id, capacity, base_id)
values (7952258665, 2186, 5278329);
insert into STORES (store_id, capacity, base_id)
values (5066853243, 3534, 8934054);
insert into STORES (store_id, capacity, base_id)
values (546285283, 1468, 9694317);
insert into STORES (store_id, capacity, base_id)
values (4584810996, 4751, 9019860);
insert into STORES (store_id, capacity, base_id)
values (7148321307, 2574, 4996481);
insert into STORES (store_id, capacity, base_id)
values (9623978107, 4147, 5663092);
insert into STORES (store_id, capacity, base_id)
values (2480992828, 176, 9623832);
insert into STORES (store_id, capacity, base_id)
values (265482596, 1987, 2941446);
insert into STORES (store_id, capacity, base_id)
values (2313663892, 1996, 1087305);
insert into STORES (store_id, capacity, base_id)
values (1836771829, 2408, 7617887);
insert into STORES (store_id, capacity, base_id)
values (3609675609, 722, 6689720);
insert into STORES (store_id, capacity, base_id)
values (5172408020, 2879, 2561075);
insert into STORES (store_id, capacity, base_id)
values (3329377019, 3865, 5603515);
insert into STORES (store_id, capacity, base_id)
values (3749590920, 2830, 2207468);
insert into STORES (store_id, capacity, base_id)
values (9005316961, 2099, 5320367);
insert into STORES (store_id, capacity, base_id)
values (5247882929, 2072, 3254708);
insert into STORES (store_id, capacity, base_id)
values (7824424657, 3597, 7094849);
insert into STORES (store_id, capacity, base_id)
values (7468990299, 3038, 7725236);
insert into STORES (store_id, capacity, base_id)
values (4035042798, 547, 6473725);
insert into STORES (store_id, capacity, base_id)
values (3910656292, 1471, 3027847);
insert into STORES (store_id, capacity, base_id)
values (7703434216, 1031, 5434342);
insert into STORES (store_id, capacity, base_id)
values (5468834990, 4076, 3526562);
insert into STORES (store_id, capacity, base_id)
values (1261413139, 3313, 1277662);
insert into STORES (store_id, capacity, base_id)
values (2864089839, 2485, 8459654);
insert into STORES (store_id, capacity, base_id)
values (5038905616, 231, 5664370);
insert into STORES (store_id, capacity, base_id)
values (9144536098, 4367, 2546404);
insert into STORES (store_id, capacity, base_id)
values (5381021633, 4167, 9726685);
insert into STORES (store_id, capacity, base_id)
values (8994723781, 1168, 2804121);
insert into STORES (store_id, capacity, base_id)
values (7323150268, 4535, 7249488);
insert into STORES (store_id, capacity, base_id)
values (4041541856, 4748, 4457895);
insert into STORES (store_id, capacity, base_id)
values (7272891544, 2179, 9488672);
insert into STORES (store_id, capacity, base_id)
values (3824994328, 4940, 7780653);
insert into STORES (store_id, capacity, base_id)
values (7434237718, 3296, 6653592);
insert into STORES (store_id, capacity, base_id)
values (5504829974, 1246, 6913701);
insert into STORES (store_id, capacity, base_id)
values (7989090403, 2911, 3382312);
insert into STORES (store_id, capacity, base_id)
values (3033908172, 3782, 5839283);
insert into STORES (store_id, capacity, base_id)
values (2996647879, 2181, 5303110);
insert into STORES (store_id, capacity, base_id)
values (5882221317, 2014, 8024073);
insert into STORES (store_id, capacity, base_id)
values (8978310700, 4152, 3625535);
insert into STORES (store_id, capacity, base_id)
values (6213785118, 1993, 1984347);
insert into STORES (store_id, capacity, base_id)
values (6954833971, 4542, 1033041);
insert into STORES (store_id, capacity, base_id)
values (7934300986, 974, 7495137);
insert into STORES (store_id, capacity, base_id)
values (8057578690, 2588, 2245431);
insert into STORES (store_id, capacity, base_id)
values (4068531670, 2503, 8005820);
insert into STORES (store_id, capacity, base_id)
values (3312919799, 2636, 9842668);
insert into STORES (store_id, capacity, base_id)
values (6064937749, 2672, 6752205);
insert into STORES (store_id, capacity, base_id)
values (8527911504, 4428, 3741554);
insert into STORES (store_id, capacity, base_id)
values (8763912363, 1248, 5471534);
insert into STORES (store_id, capacity, base_id)
values (44779413, 2250, 9632643);
insert into STORES (store_id, capacity, base_id)
values (5094140215, 3765, 4023885);
insert into STORES (store_id, capacity, base_id)
values (1434253358, 480, 1653748);
insert into STORES (store_id, capacity, base_id)
values (9709423948, 2722, 7813716);
insert into STORES (store_id, capacity, base_id)
values (7732712269, 1447, 7245252);
insert into STORES (store_id, capacity, base_id)
values (4314102466, 4685, 3564288);
insert into STORES (store_id, capacity, base_id)
values (8250848739, 2451, 7438718);
insert into STORES (store_id, capacity, base_id)
values (9398613622, 3631, 2154556);
insert into STORES (store_id, capacity, base_id)
values (9718088970, 1416, 4216640);
insert into STORES (store_id, capacity, base_id)
values (1649583078, 2003, 7802543);
insert into STORES (store_id, capacity, base_id)
values (4682958986, 1641, 5957349);
insert into STORES (store_id, capacity, base_id)
values (2197776850, 4461, 8887579);
insert into STORES (store_id, capacity, base_id)
values (1281019521, 3791, 9675914);
insert into STORES (store_id, capacity, base_id)
values (9126746616, 4633, 9310665);
insert into STORES (store_id, capacity, base_id)
values (6406506193, 4355, 9859836);
insert into STORES (store_id, capacity, base_id)
values (1489063880, 190, 1888478);
insert into STORES (store_id, capacity, base_id)
values (7717664071, 4017, 5159434);
insert into STORES (store_id, capacity, base_id)
values (6517710118, 2626, 8502657);
insert into STORES (store_id, capacity, base_id)
values (4942167703, 4845, 9778633);
insert into STORES (store_id, capacity, base_id)
values (3671015115, 1016, 1962449);
insert into STORES (store_id, capacity, base_id)
values (1867855029, 504, 2758821);
insert into STORES (store_id, capacity, base_id)
values (9719981141, 465, 4987898);
insert into STORES (store_id, capacity, base_id)
values (7419201939, 1164, 1301720);
insert into STORES (store_id, capacity, base_id)
values (803486996, 223, 2709769);
insert into STORES (store_id, capacity, base_id)
values (298592433, 3882, 3350354);
insert into STORES (store_id, capacity, base_id)
values (1234693204, 10, 3617094);
insert into STORES (store_id, capacity, base_id)
values (1330820784, 4582, 8836351);
insert into STORES (store_id, capacity, base_id)
values (1310384304, 3638, 5994133);
insert into STORES (store_id, capacity, base_id)
values (3166073625, 2907, 5835743);
insert into STORES (store_id, capacity, base_id)
values (6996515713, 3534, 7127882);
insert into STORES (store_id, capacity, base_id)
values (8935672982, 3514, 5269837);
insert into STORES (store_id, capacity, base_id)
values (6140354405, 4091, 3183683);
insert into STORES (store_id, capacity, base_id)
values (9055110599, 1814, 2006475);
insert into STORES (store_id, capacity, base_id)
values (6961077817, 1056, 5918165);
insert into STORES (store_id, capacity, base_id)
values (6310702033, 4245, 8106200);
insert into STORES (store_id, capacity, base_id)
values (9933450947, 3753, 5201831);
insert into STORES (store_id, capacity, base_id)
values (525402490, 3571, 6383330);
insert into STORES (store_id, capacity, base_id)
values (9322452254, 2909, 5516085);
insert into STORES (store_id, capacity, base_id)
values (2191549381, 3244, 6782058);
insert into STORES (store_id, capacity, base_id)
values (1438361279, 1215, 8029673);
insert into STORES (store_id, capacity, base_id)
values (3087552079, 3420, 5938360);
insert into STORES (store_id, capacity, base_id)
values (3497285055, 1752, 4736425);
insert into STORES (store_id, capacity, base_id)
values (7706462827, 1635, 2979017);
insert into STORES (store_id, capacity, base_id)
values (4196055991, 953, 6383273);
insert into STORES (store_id, capacity, base_id)
values (3756708831, 2735, 1510097);
insert into STORES (store_id, capacity, base_id)
values (8367450085, 3878, 8802505);
insert into STORES (store_id, capacity, base_id)
values (1129019389, 1288, 3635244);
insert into STORES (store_id, capacity, base_id)
values (2314952425, 58, 5159719);
insert into STORES (store_id, capacity, base_id)
values (8272317810, 2629, 6006500);
insert into STORES (store_id, capacity, base_id)
values (7404015917, 468, 1948663);
insert into STORES (store_id, capacity, base_id)
values (5025045083, 2878, 1360966);
commit;
prompt 400 records loaded
prompt Loading ITEM...
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7053260187, to_date('08-11-2017', 'dd-mm-yyyy'), 152218.539, 2051033117);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3680210664, to_date('30-06-1997', 'dd-mm-yyyy'), 121590.942, 3199368328);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5836903518, to_date('04-08-2007', 'dd-mm-yyyy'), 76494.52, 1697357799);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8451575436, to_date('10-12-2017', 'dd-mm-yyyy'), 127890.708, 5499267131);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1834828258, to_date('08-10-2001', 'dd-mm-yyyy'), 216670.311, 4993512060);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3330706469, to_date('06-09-2021', 'dd-mm-yyyy'), 40299.62, 3466456849);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5756394082, to_date('19-01-2011', 'dd-mm-yyyy'), 83506.78, 3006393424);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (38179425, to_date('26-03-2023', 'dd-mm-yyyy'), 10228.39, 7194272436);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (390672970, to_date('25-07-2023', 'dd-mm-yyyy'), 213942.927, 9691746383);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9676581907, to_date('04-11-2007', 'dd-mm-yyyy'), 62612.84, 6954833971);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3873774387, to_date('10-06-1997', 'dd-mm-yyyy'), 16237.58, 112043827);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5642982211, to_date('15-05-1991', 'dd-mm-yyyy'), 20700.99, 5025045083);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (692110927, to_date('16-05-2019', 'dd-mm-yyyy'), 188841.796, 6996515713);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1582602210, to_date('30-08-1994', 'dd-mm-yyyy'), 178070.915, 9322452254);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4389875876, to_date('29-09-1997', 'dd-mm-yyyy'), 62208.95, 9662472323);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2263419287, to_date('14-06-2016', 'dd-mm-yyyy'), 65216.24, 7873678207);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7467542023, to_date('23-11-2005', 'dd-mm-yyyy'), 10925.42, 4798387437);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7345415381, to_date('07-09-2017', 'dd-mm-yyyy'), 115320.007, 5172408020);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (891758819, to_date('28-05-1992', 'dd-mm-yyyy'), 62961.76, 3105156743);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5571303439, to_date('23-11-2008', 'dd-mm-yyyy'), 23361.28, 1129019389);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6335074087, to_date('11-12-2015', 'dd-mm-yyyy'), 164147.335, 5176914888);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4344305082, to_date('02-05-2006', 'dd-mm-yyyy'), 15265.72, 8887758405);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (266082722, to_date('16-08-2003', 'dd-mm-yyyy'), 219692.242, 7934300986);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7086336983, to_date('05-04-2013', 'dd-mm-yyyy'), 51441.14, 3466456849);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5175251649, to_date('11-11-2006', 'dd-mm-yyyy'), 168945.645, 2160440590);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1228578944, to_date('13-04-1994', 'dd-mm-yyyy'), 85191.32, 9431365316);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8581056579, to_date('31-12-2019', 'dd-mm-yyyy'), 52322.25, 7605192682);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9883327420, to_date('18-07-1994', 'dd-mm-yyyy'), 45262.04, 6961077817);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9479295798, to_date('30-12-2020', 'dd-mm-yyyy'), 142201.4, 1777614297);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9580220237, to_date('08-09-2020', 'dd-mm-yyyy'), 149898.331, 5882221317);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5591685868, to_date('23-09-2016', 'dd-mm-yyyy'), 149305.057, 684943291);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2405274223, to_date('31-05-1991', 'dd-mm-yyyy'), 111197.757, 7272891544);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5834352081, to_date('02-02-2012', 'dd-mm-yyyy'), 122947.165, 3103587291);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6370510168, to_date('20-06-1991', 'dd-mm-yyyy'), 40153.02, 6310702033);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2031234946, to_date('16-01-2010', 'dd-mm-yyyy'), 12010.19, 7268923610);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7370138655, to_date('05-05-1992', 'dd-mm-yyyy'), 148055.38, 9662472323);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (926515357, to_date('01-05-2009', 'dd-mm-yyyy'), 194928.118, 1627572129);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7009406097, to_date('21-08-2013', 'dd-mm-yyyy'), 17627.65, 9144536098);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2482072218, to_date('31-08-2020', 'dd-mm-yyyy'), 54182.12, 4711622117);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1184275527, to_date('30-03-2012', 'dd-mm-yyyy'), 16567.61, 2619360974);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3630705803, to_date('23-07-2003', 'dd-mm-yyyy'), 83165.18, 1245195236);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4681615236, to_date('23-01-1994', 'dd-mm-yyyy'), 57086.54, 1438361279);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1948558566, to_date('26-10-1991', 'dd-mm-yyyy'), 170352.468, 4035042798);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2226913709, to_date('06-08-2016', 'dd-mm-yyyy'), 212609.837, 3532193164);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4125438016, to_date('18-08-2018', 'dd-mm-yyyy'), 185587.655, 7689428194);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (158656062, to_date('11-02-2023', 'dd-mm-yyyy'), 121911.438, 3199368328);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3417211848, to_date('07-12-2023', 'dd-mm-yyyy'), 132398.695, 6406506193);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1908773791, to_date('07-08-1999', 'dd-mm-yyyy'), 157767.753, 3220487253);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1872734501, to_date('02-04-2007', 'dd-mm-yyyy'), 8319.02, 3103587291);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3558094170, to_date('01-08-2021', 'dd-mm-yyyy'), 159763.571, 5220721040);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (422483010, to_date('03-06-2011', 'dd-mm-yyyy'), 40252.58, 9542897224);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6014854779, to_date('11-11-1996', 'dd-mm-yyyy'), 181881.557, 188126018);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (230008394, to_date('26-03-1999', 'dd-mm-yyyy'), 156443.672, 2126725238);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (641561064, to_date('05-10-2018', 'dd-mm-yyyy'), 204474.776, 3130013219);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (478856073, to_date('24-10-2008', 'dd-mm-yyyy'), 146811.126, 5281120135);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9632072596, to_date('11-05-2006', 'dd-mm-yyyy'), 111276.154, 4081165844);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6099078632, to_date('26-03-2023', 'dd-mm-yyyy'), 56592.88, 3305391502);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1400241095, to_date('12-03-1991', 'dd-mm-yyyy'), 88982.27, 9933939684);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8551873597, to_date('25-07-1990', 'dd-mm-yyyy'), 127975.958, 2863308060);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8941236223, to_date('06-09-2012', 'dd-mm-yyyy'), 79339.41, 8367450085);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9895127078, to_date('16-02-2023', 'dd-mm-yyyy'), 117649.686, 6140354405);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3749861360, to_date('10-09-2003', 'dd-mm-yyyy'), 87854.78, 3469925177);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (761388688, to_date('14-08-2010', 'dd-mm-yyyy'), 178443.1, 7183055861);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4665817453, to_date('09-08-2015', 'dd-mm-yyyy'), 91705.34, 5260113197);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7460591027, to_date('28-07-2020', 'dd-mm-yyyy'), 185575.016, 3039337505);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7571405649, to_date('14-04-1994', 'dd-mm-yyyy'), 153406.66, 8741317356);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4451001713, to_date('03-01-2000', 'dd-mm-yyyy'), 24278.36, 7605192682);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2646421433, to_date('07-09-2004', 'dd-mm-yyyy'), 133177.198, 9010351513);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1776030317, to_date('11-02-2016', 'dd-mm-yyyy'), 216510.899, 3910656292);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5514472868, to_date('02-05-1992', 'dd-mm-yyyy'), 154953.062, 8935672982);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (994233393, to_date('30-05-2019', 'dd-mm-yyyy'), 71408.39, 1649583078);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2556513514, to_date('02-12-2020', 'dd-mm-yyyy'), 166337.314, 9144536098);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2812510629, to_date('03-02-2000', 'dd-mm-yyyy'), 43030.1, 1985703929);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6295860053, to_date('25-03-2004', 'dd-mm-yyyy'), 158137.287, 1985703929);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (622407240, to_date('31-12-1990', 'dd-mm-yyyy'), 97842.8, 1368073561);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3620098614, to_date('30-11-2005', 'dd-mm-yyyy'), 20973.65, 5220721040);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2230371298, to_date('21-09-2011', 'dd-mm-yyyy'), 185474.531, 3087552079);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8883230783, to_date('09-06-2018', 'dd-mm-yyyy'), 121279.939, 9718088970);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8314172401, to_date('29-03-2023', 'dd-mm-yyyy'), 50787.15, 8014422314);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4994635416, to_date('07-04-1998', 'dd-mm-yyyy'), 80196.01, 6226352815);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (902675271, to_date('06-02-2021', 'dd-mm-yyyy'), 202910.015, 6484335275);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (385429535, to_date('04-10-1991', 'dd-mm-yyyy'), 61000.83, 5739282429);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3155084673, to_date('23-07-2022', 'dd-mm-yyyy'), 173567.889, 4054632455);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6888304187, to_date('30-08-2015', 'dd-mm-yyyy'), 35194.88, 6361451930);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2510433061, to_date('17-07-2020', 'dd-mm-yyyy'), 183490.692, 9478531595);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8809827074, to_date('28-02-2018', 'dd-mm-yyyy'), 111122.759, 8494880937);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (232904835, to_date('28-09-2016', 'dd-mm-yyyy'), 164513.58, 9197008138);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4335331780, to_date('20-05-2020', 'dd-mm-yyyy'), 215629.359, 8763912363);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1010831716, to_date('13-10-2015', 'dd-mm-yyyy'), 203681.808, 4237643702);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (938811084, to_date('09-12-2015', 'dd-mm-yyyy'), 121968.737, 2650179284);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9924387366, to_date('05-03-2012', 'dd-mm-yyyy'), 121977.075, 6517710118);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4293757346, to_date('28-03-2005', 'dd-mm-yyyy'), 197719.181, 6606838009);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (587490820, to_date('07-08-1991', 'dd-mm-yyyy'), 135669.094, 2023192352);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4385037561, to_date('30-12-2013', 'dd-mm-yyyy'), 7995.23, 2366342534);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3509868672, to_date('20-04-1997', 'dd-mm-yyyy'), 71244.26, 3472501279);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6097157700, to_date('09-06-2016', 'dd-mm-yyyy'), 168753.233, 1457671959);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6464037187, to_date('16-09-2014', 'dd-mm-yyyy'), 183913.202, 3432086456);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (204684713, to_date('26-02-2000', 'dd-mm-yyyy'), 27911.71, 1627572129);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2715127502, to_date('08-03-2003', 'dd-mm-yyyy'), 207325.646, 8887758405);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6571298521, to_date('15-07-2010', 'dd-mm-yyyy'), 48879.72, 209254136);
commit;
prompt 100 records committed...
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2893599072, to_date('01-07-2021', 'dd-mm-yyyy'), 25309.85, 3910656292);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3160515194, to_date('24-05-2006', 'dd-mm-yyyy'), 151854.769, 9893338138);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (747316484, to_date('18-03-2016', 'dd-mm-yyyy'), 197531.389, 3490649377);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4177899180, to_date('23-03-2015', 'dd-mm-yyyy'), 180622.068, 8772493343);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4346861955, to_date('17-05-2018', 'dd-mm-yyyy'), 65809.43, 2023192352);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2683868188, to_date('18-07-1997', 'dd-mm-yyyy'), 110012.914, 4440812047);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4265394667, to_date('09-01-2022', 'dd-mm-yyyy'), 176725.142, 1245195236);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2778432526, to_date('12-03-2004', 'dd-mm-yyyy'), 204963.627, 6649963460);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1528435879, to_date('29-10-2023', 'dd-mm-yyyy'), 121782.188, 7268923610);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4879294859, to_date('10-02-2011', 'dd-mm-yyyy'), 135538.249, 3087552079);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1785298805, to_date('15-07-2011', 'dd-mm-yyyy'), 42220.6, 839667416);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8321627394, to_date('08-09-2019', 'dd-mm-yyyy'), 159470.289, 2864089839);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7427208123, to_date('27-01-1999', 'dd-mm-yyyy'), 157534.652, 8640946841);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3702815764, to_date('02-12-2006', 'dd-mm-yyyy'), 120781.243, 3329377019);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9820336654, to_date('24-09-2017', 'dd-mm-yyyy'), 149699.341, 6640968939);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6075899124, to_date('18-08-1996', 'dd-mm-yyyy'), 155523.819, 3910656292);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2976639701, to_date('02-01-2020', 'dd-mm-yyyy'), 172880.026, 3855948706);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9205556849, to_date('31-07-2017', 'dd-mm-yyyy'), 17025.1, 7194272436);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8878444019, to_date('16-04-2019', 'dd-mm-yyyy'), 27170.35, 9933450947);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2470087389, to_date('01-02-2017', 'dd-mm-yyyy'), 129685.622, 5504829974);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5833378046, to_date('02-01-2008', 'dd-mm-yyyy'), 166927.079, 3532193164);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (315142032, to_date('11-12-2004', 'dd-mm-yyyy'), 60839.99, 1630047150);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8223248730, to_date('24-08-2021', 'dd-mm-yyyy'), 18397.23, 9055110599);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1408371941, to_date('22-11-2008', 'dd-mm-yyyy'), 88242.09, 6875389640);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2824010364, to_date('04-08-2001', 'dd-mm-yyyy'), 95923.69, 5504829974);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2009814228, to_date('26-04-2000', 'dd-mm-yyyy'), 120700.492, 2893899139);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (325655207, to_date('03-08-2014', 'dd-mm-yyyy'), 72183.77, 2650179284);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3057183134, to_date('05-05-2020', 'dd-mm-yyyy'), 113844.434, 4034737735);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8936946513, to_date('17-04-1991', 'dd-mm-yyyy'), 114801.071, 3201043602);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9931713814, to_date('29-04-2004', 'dd-mm-yyyy'), 170713.466, 577535758);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9176613838, to_date('24-11-1997', 'dd-mm-yyyy'), 204112.04, 5220721040);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3970933202, to_date('05-05-2012', 'dd-mm-yyyy'), 199688.654, 5739282429);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (529209147, to_date('19-04-2016', 'dd-mm-yyyy'), 95544.74, 6406506193);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8907998716, to_date('24-01-2004', 'dd-mm-yyyy'), 196318.111, 7163319710);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7550791935, to_date('24-12-2011', 'dd-mm-yyyy'), 89010.41, 2023192352);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5855194343, to_date('10-07-2004', 'dd-mm-yyyy'), 190308.855, 5281120135);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9670792326, to_date('08-11-2006', 'dd-mm-yyyy'), 175068.806, 7163319710);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8853811992, to_date('20-10-2002', 'dd-mm-yyyy'), 45984, 5276367047);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2311582629, to_date('03-09-2009', 'dd-mm-yyyy'), 32653.54, 5381021633);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6948275372, to_date('29-08-2008', 'dd-mm-yyyy'), 50835.13, 9676309403);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4013596334, to_date('05-06-2008', 'dd-mm-yyyy'), 87496.54, 7268923610);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5124048563, to_date('16-08-1991', 'dd-mm-yyyy'), 178374.108, 128193586);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5090139576, to_date('13-09-2003', 'dd-mm-yyyy'), 121200.134, 362072609);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7650357697, to_date('30-09-2007', 'dd-mm-yyyy'), 20978.09, 5903693783);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1680834889, to_date('05-08-2022', 'dd-mm-yyyy'), 164026.445, 9974190274);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (328732672, to_date('02-03-2007', 'dd-mm-yyyy'), 96367.38, 3910656292);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2723762727, to_date('02-11-2018', 'dd-mm-yyyy'), 26739.84, 8008467226);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4051540212, to_date('30-11-2020', 'dd-mm-yyyy'), 63352.89, 9774061637);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8362138857, to_date('02-06-1996', 'dd-mm-yyyy'), 1173.29, 8870701376);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1717369028, to_date('26-10-2005', 'dd-mm-yyyy'), 43706.03, 1261413139);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5444782353, to_date('08-05-2010', 'dd-mm-yyyy'), 5814.4, 7706462827);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5416239837, to_date('29-06-2002', 'dd-mm-yyyy'), 49760.19, 1962143604);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3483363493, to_date('29-07-1999', 'dd-mm-yyyy'), 36755.9, 1330820784);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4129827174, to_date('12-12-2010', 'dd-mm-yyyy'), 26418.77, 1985703929);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8061050411, to_date('31-12-1993', 'dd-mm-yyyy'), 6492.83, 8920688122);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6429015335, to_date('13-12-2008', 'dd-mm-yyyy'), 2885.82, 4549105621);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5003249514, to_date('21-06-2023', 'dd-mm-yyyy'), 114670.853, 3305391502);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2854977328, to_date('10-04-2015', 'dd-mm-yyyy'), 69954.08, 373156598);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8993860800, to_date('05-05-2003', 'dd-mm-yyyy'), 69652.02, 6361451930);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3842884879, to_date('16-11-2023', 'dd-mm-yyyy'), 169488.583, 8283282713);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9333939838, to_date('20-10-2008', 'dd-mm-yyyy'), 5032.76, 8828866526);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3245910012, to_date('11-05-2005', 'dd-mm-yyyy'), 41556.91, 7824424657);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2773902643, to_date('23-01-2004', 'dd-mm-yyyy'), 215424.748, 9603944310);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1731323314, to_date('04-07-2011', 'dd-mm-yyyy'), 5043.82, 8494880937);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5929446631, to_date('09-01-2002', 'dd-mm-yyyy'), 29683.68, 8959262012);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7154987675, to_date('21-12-2019', 'dd-mm-yyyy'), 19851.14, 5986847282);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9018714735, to_date('01-07-1998', 'dd-mm-yyyy'), 46780.51, 5442740858);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9454735786, to_date('01-04-1994', 'dd-mm-yyyy'), 70883.59, 6414717976);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8645482576, to_date('19-01-2000', 'dd-mm-yyyy'), 73897.56, 3609675609);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7111194518, to_date('18-02-2016', 'dd-mm-yyyy'), 55160.89, 261407387);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9584655068, to_date('29-01-2009', 'dd-mm-yyyy'), 35955.13, 2864089839);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1977854324, to_date('10-06-1991', 'dd-mm-yyyy'), 210007.985, 2300617388);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1769138498, to_date('23-01-2022', 'dd-mm-yyyy'), 92306.96, 4615379066);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9540178816, to_date('11-08-2009', 'dd-mm-yyyy'), 159725.489, 4196055991);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7124291017, to_date('17-07-2011', 'dd-mm-yyyy'), 37869.16, 6640968939);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2277124599, to_date('30-11-2018', 'dd-mm-yyyy'), 210346.983, 2300617388);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1333311341, to_date('16-08-1991', 'dd-mm-yyyy'), 90581.46, 5114987385);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (285160749, to_date('05-01-1992', 'dd-mm-yyyy'), 3512.9, 7183055861);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3876762268, to_date('11-09-2010', 'dd-mm-yyyy'), 218803.035, 9709423948);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (892037875, to_date('24-07-1997', 'dd-mm-yyyy'), 83824.48, 43859418);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1929631780, to_date('02-04-2020', 'dd-mm-yyyy'), 209001.309, 1962143604);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5091022909, to_date('04-08-2018', 'dd-mm-yyyy'), 193785.614, 1962143604);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6652019407, to_date('22-04-1990', 'dd-mm-yyyy'), 91108.79, 3105156743);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8562475536, to_date('10-12-1991', 'dd-mm-yyyy'), 179134.593, 8935672982);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5642591639, to_date('09-05-2018', 'dd-mm-yyyy'), 208001.684, 5504829974);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9575266503, to_date('11-03-1994', 'dd-mm-yyyy'), 54268.86, 3497285055);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1803488600, to_date('26-01-2021', 'dd-mm-yyyy'), 167746.799, 8981396378);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2210819525, to_date('14-09-2011', 'dd-mm-yyyy'), 160597.283, 9271702664);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (739009819, to_date('26-11-2012', 'dd-mm-yyyy'), 116939.812, 5499267131);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5007486095, to_date('12-08-2003', 'dd-mm-yyyy'), 30692.65, 7148321307);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9237887302, to_date('14-09-2017', 'dd-mm-yyyy'), 125472.853, 3532193164);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8492082501, to_date('28-09-2002', 'dd-mm-yyyy'), 40714.3, 6245206047);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6743868091, to_date('18-04-2013', 'dd-mm-yyyy'), 10098.39, 8772493343);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7999946869, to_date('10-01-2020', 'dd-mm-yyyy'), 198931.777, 8679296847);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5165544117, to_date('20-10-2007', 'dd-mm-yyyy'), 31775.74, 2864089839);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6049262641, to_date('01-09-2019', 'dd-mm-yyyy'), 127690.86, 3462661594);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2324699039, to_date('26-12-2011', 'dd-mm-yyyy'), 171078.644, 7272891544);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2629501774, to_date('30-07-2009', 'dd-mm-yyyy'), 33881.95, 6784021008);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4758040032, to_date('08-01-2019', 'dd-mm-yyyy'), 81024.95, 6875389640);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1262299833, to_date('26-06-2013', 'dd-mm-yyyy'), 3646.25, 9832737195);
commit;
prompt 200 records committed...
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9523148241, to_date('18-05-1995', 'dd-mm-yyyy'), 49277.42, 2619360974);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7014455172, to_date('23-07-2001', 'dd-mm-yyyy'), 20772.34, 5220721040);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2140841427, to_date('09-12-2007', 'dd-mm-yyyy'), 73348.18, 2300617388);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1200615407, to_date('24-03-2020', 'dd-mm-yyyy'), 13374.99, 9431365316);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (482885185, to_date('13-11-2000', 'dd-mm-yyyy'), 123528.834, 3380981990);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9409136868, to_date('23-05-2016', 'dd-mm-yyyy'), 170941.386, 1726567562);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9204521715, to_date('30-06-2006', 'dd-mm-yyyy'), 130780.716, 3006393424);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3824151839, to_date('18-09-1997', 'dd-mm-yyyy'), 89669.65, 5381021633);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8616378236, to_date('29-08-2010', 'dd-mm-yyyy'), 112275.427, 4309160419);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3877381022, to_date('21-08-2001', 'dd-mm-yyyy'), 61687.22, 128193586);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3936947312, to_date('27-10-2005', 'dd-mm-yyyy'), 173362.541, 591700657);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1298410592, to_date('30-07-2006', 'dd-mm-yyyy'), 111581.338, 5247882929);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5265579556, to_date('14-11-2012', 'dd-mm-yyyy'), 9153.41, 4068531670);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5629509802, to_date('08-06-2021', 'dd-mm-yyyy'), 187145.684, 265482596);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1110601567, to_date('13-11-1996', 'dd-mm-yyyy'), 25585.37, 3251223333);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6087940051, to_date('11-08-2023', 'dd-mm-yyyy'), 153324.061, 2023192352);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5699999772, to_date('12-08-1998', 'dd-mm-yyyy'), 130967.793, 5494311415);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2957564496, to_date('15-08-2013', 'dd-mm-yyyy'), 36394.83, 2313663892);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8970363792, to_date('21-12-1998', 'dd-mm-yyyy'), 135045.812, 7194272436);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6895769343, to_date('04-09-2016', 'dd-mm-yyyy'), 200690.468, 6308448206);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1999868858, to_date('07-04-2012', 'dd-mm-yyyy'), 49578.77, 9933939684);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3111200179, to_date('28-08-2015', 'dd-mm-yyyy'), 200943.325, 8640946841);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7356040892, to_date('28-10-2019', 'dd-mm-yyyy'), 60016.3, 373156598);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8376578566, to_date('08-10-2010', 'dd-mm-yyyy'), 69330.01, 3532193164);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4745226508, to_date('18-11-2023', 'dd-mm-yyyy'), 186977.274, 4092892706);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3093322757, to_date('24-08-2011', 'dd-mm-yyyy'), 96132.98, 5114987385);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6838547615, to_date('07-12-2003', 'dd-mm-yyyy'), 179345.232, 845393956);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3826165229, to_date('26-06-2004', 'dd-mm-yyyy'), 38506.37, 9603944310);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8453732359, to_date('04-01-2015', 'dd-mm-yyyy'), 80087.35, 3519532740);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5937258864, to_date('08-07-2014', 'dd-mm-yyyy'), 138338.024, 4309160419);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3980061818, to_date('14-12-2017', 'dd-mm-yyyy'), 40299.85, 8959262012);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2654978152, to_date('04-04-2002', 'dd-mm-yyyy'), 83403.85, 1281019521);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8785584565, to_date('14-09-2014', 'dd-mm-yyyy'), 32303.11, 8356241074);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5891750537, to_date('14-12-2001', 'dd-mm-yyyy'), 209252.461, 2313663892);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7811237309, to_date('15-09-2010', 'dd-mm-yyyy'), 30077.11, 3130013219);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7805191905, to_date('23-03-1999', 'dd-mm-yyyy'), 29341.72, 3033908172);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8889502433, to_date('06-10-2018', 'dd-mm-yyyy'), 172571.707, 6517710118);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (260730540, to_date('10-01-2005', 'dd-mm-yyyy'), 19027.67, 7712522193);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (942877337, to_date('02-10-2017', 'dd-mm-yyyy'), 4537.94, 1129019389);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4282853791, to_date('11-10-1994', 'dd-mm-yyyy'), 144922.041, 9271702664);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9350915849, to_date('02-04-2011', 'dd-mm-yyyy'), 62705.15, 8928426488);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7648787738, to_date('18-07-1990', 'dd-mm-yyyy'), 195881.081, 9912916709);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1503426516, to_date('30-09-2003', 'dd-mm-yyyy'), 18837.65, 5276367047);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (860388597, to_date('26-04-1996', 'dd-mm-yyyy'), 84964.2, 9197008138);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5765653102, to_date('23-08-1992', 'dd-mm-yyyy'), 29707.78, 8283282713);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3512221536, to_date('10-07-1993', 'dd-mm-yyyy'), 142961.357, 5494311415);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9232725334, to_date('21-10-1994', 'dd-mm-yyyy'), 16380.38, 5499267131);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1415593509, to_date('31-01-2022', 'dd-mm-yyyy'), 135256.946, 9851046040);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3209891703, to_date('20-09-2015', 'dd-mm-yyyy'), 52791.37, 7257468760);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6983230755, to_date('04-12-1995', 'dd-mm-yyyy'), 217301.821, 3006393424);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3071654574, to_date('20-01-1993', 'dd-mm-yyyy'), 77503.08, 9005316961);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4577691416, to_date('25-04-2022', 'dd-mm-yyyy'), 170006.936, 9144536098);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7760305070, to_date('02-06-2002', 'dd-mm-yyyy'), 14192.19, 2619360974);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9430521484, to_date('21-12-1999', 'dd-mm-yyyy'), 120955.12, 9018685179);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9133040940, to_date('27-04-2020', 'dd-mm-yyyy'), 215682.445, 9851046040);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (908979604, to_date('24-01-2010', 'dd-mm-yyyy'), 10465.67, 6051015683);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5355726709, to_date('19-11-2014', 'dd-mm-yyyy'), 87867.45, 7207154142);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3390750082, to_date('09-01-2010', 'dd-mm-yyyy'), 177569.172, 9726857902);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4457245265, to_date('23-10-2023', 'dd-mm-yyyy'), 65444.5, 3213318404);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4849937660, to_date('29-09-1998', 'dd-mm-yyyy'), 83136.75, 9933939684);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6495295562, to_date('22-09-1994', 'dd-mm-yyyy'), 205909.429, 9623978107);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (483302118, to_date('11-03-2020', 'dd-mm-yyyy'), 67339.38, 6361451930);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6815959712, to_date('04-09-2020', 'dd-mm-yyyy'), 114195.708, 6640968939);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9081084175, to_date('01-07-1998', 'dd-mm-yyyy'), 91521.22, 6213785118);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2173913130, to_date('22-01-2008', 'dd-mm-yyyy'), 45185.76, 8250848739);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2254129654, to_date('14-08-2001', 'dd-mm-yyyy'), 128028.945, 1695723512);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (866097764, to_date('21-01-1999', 'dd-mm-yyyy'), 217880.795, 3749590920);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1164029589, to_date('02-02-2002', 'dd-mm-yyyy'), 72266.78, 8828866526);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (955629631, to_date('05-07-2008', 'dd-mm-yyyy'), 71427.4, 8959262012);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (683348723, to_date('04-06-2008', 'dd-mm-yyyy'), 167540.406, 9422744030);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3667968980, to_date('23-06-2013', 'dd-mm-yyyy'), 86861.56, 8527911504);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3897040961, to_date('18-08-2009', 'dd-mm-yyyy'), 78841.28, 362072609);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1280240574, to_date('09-04-2001', 'dd-mm-yyyy'), 112139.533, 1777614297);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (543820185, to_date('13-06-2006', 'dd-mm-yyyy'), 52832.44, 4237643702);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2838153407, to_date('08-10-2000', 'dd-mm-yyyy'), 126523.474, 4711622117);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5781075011, to_date('26-04-2011', 'dd-mm-yyyy'), 88760.39, 2378580045);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2195341596, to_date('09-12-2023', 'dd-mm-yyyy'), 58093.53, 7952258665);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5021473481, to_date('31-10-2004', 'dd-mm-yyyy'), 194464.237, 3561117427);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9680612994, to_date('22-09-2005', 'dd-mm-yyyy'), 111127.61, 2996647879);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5624202797, to_date('23-01-2001', 'dd-mm-yyyy'), 82434.12, 9067753838);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7192383516, to_date('09-08-2006', 'dd-mm-yyyy'), 39108.48, 2073504657);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1573851561, to_date('07-11-2005', 'dd-mm-yyyy'), 76118.41, 9893338138);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7982327048, to_date('20-10-1990', 'dd-mm-yyyy'), 64730.43, 4094829436);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3854171921, to_date('02-02-2008', 'dd-mm-yyyy'), 203786.913, 6308448206);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3275996479, to_date('16-10-1997', 'dd-mm-yyyy'), 97393.49, 3039337505);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3325538218, to_date('03-05-2007', 'dd-mm-yyyy'), 33896.9, 546285283);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (543568112, to_date('23-06-1998', 'dd-mm-yyyy'), 7114.39, 5468834990);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8321964413, to_date('01-07-2015', 'dd-mm-yyyy'), 23875.75, 6484335275);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2164950368, to_date('05-01-1996', 'dd-mm-yyyy'), 173797.888, 6491145944);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7252212975, to_date('07-08-2013', 'dd-mm-yyyy'), 94479.82, 7873678207);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9528784025, to_date('30-01-1994', 'dd-mm-yyyy'), 73053.52, 1632587230);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1450848120, to_date('30-03-2019', 'dd-mm-yyyy'), 58173.64, 3012025231);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (251857345, to_date('14-06-2014', 'dd-mm-yyyy'), 54653.94, 1281019521);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1415456917, to_date('06-07-2014', 'dd-mm-yyyy'), 210550.505, 9010351513);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3924559881, to_date('23-03-1998', 'dd-mm-yyyy'), 149053.839, 6942159379);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6398597844, to_date('16-11-2001', 'dd-mm-yyyy'), 78564.58, 8994723781);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7828420631, to_date('24-03-2018', 'dd-mm-yyyy'), 63012.12, 3012025231);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1242459170, to_date('06-10-2013', 'dd-mm-yyyy'), 20257.75, 3166073625);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4114119921, to_date('12-03-2016', 'dd-mm-yyyy'), 32058.94, 2300617388);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (778431398, to_date('13-02-1996', 'dd-mm-yyyy'), 12592.68, 9662472323);
commit;
prompt 300 records committed...
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6439774971, to_date('18-01-1998', 'dd-mm-yyyy'), 92568.24, 3686259046);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9073260014, to_date('30-07-2005', 'dd-mm-yyyy'), 86829.66, 9067753838);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5977343407, to_date('18-10-2015', 'dd-mm-yyyy'), 11496.95, 4305773626);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2512363797, to_date('18-06-2001', 'dd-mm-yyyy'), 141205.218, 9456089279);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (998751341, to_date('04-06-2002', 'dd-mm-yyyy'), 64540.11, 8994723781);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6958086779, to_date('22-01-2019', 'dd-mm-yyyy'), 151585.478, 8928426488);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6540687170, to_date('11-09-2022', 'dd-mm-yyyy'), 41493.3, 8057578690);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9359418172, to_date('11-07-2006', 'dd-mm-yyyy'), 163732.635, 617915992);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7374716055, to_date('21-12-2000', 'dd-mm-yyyy'), 206580, 3329377019);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1475863296, to_date('19-12-2003', 'dd-mm-yyyy'), 151608.919, 4340842495);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1435507476, to_date('15-12-2019', 'dd-mm-yyyy'), 19867.9, 188126018);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8568175602, to_date('30-11-2010', 'dd-mm-yyyy'), 150421.447, 2081070241);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1079825445, to_date('10-10-2005', 'dd-mm-yyyy'), 178190.177, 4196055991);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (933290972, to_date('28-08-2008', 'dd-mm-yyyy'), 193261.299, 617915992);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4102448880, to_date('22-05-2003', 'dd-mm-yyyy'), 112366.21, 9676309403);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2589020774, to_date('10-11-2009', 'dd-mm-yyyy'), 168879.612, 2864156706);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (673214350, to_date('14-03-2001', 'dd-mm-yyyy'), 203922.895, 1261413139);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4135878550, to_date('21-11-2014', 'dd-mm-yyyy'), 58420.62, 265482596);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8526305078, to_date('04-06-2004', 'dd-mm-yyyy'), 209036.047, 9603944310);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3036573687, to_date('25-10-2003', 'dd-mm-yyyy'), 195482.045, 4196055991);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (774580020, to_date('10-10-2005', 'dd-mm-yyyy'), 131218.692, 5381021633);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3293025958, to_date('08-09-2015', 'dd-mm-yyyy'), 78913.01, 167476784);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4152220811, to_date('29-06-2015', 'dd-mm-yyyy'), 3491.07, 6810415683);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5210986503, to_date('05-12-2009', 'dd-mm-yyyy'), 87223.02, 9422744030);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7184224880, to_date('22-06-1994', 'dd-mm-yyyy'), 160679.992, 4081165844);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6998256864, to_date('16-08-2007', 'dd-mm-yyyy'), 144178.771, 5903693783);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6961578331, to_date('16-01-1990', 'dd-mm-yyyy'), 138935.94, 2378580045);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6759189070, to_date('05-12-1991', 'dd-mm-yyyy'), 87211.76, 9933939684);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1606707193, to_date('13-01-2015', 'dd-mm-yyyy'), 164230.77, 167476784);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9187893375, to_date('10-09-1999', 'dd-mm-yyyy'), 112071.212, 7163319710);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8655033031, to_date('14-02-1995', 'dd-mm-yyyy'), 52927.42, 9005316961);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5452670529, to_date('30-07-1993', 'dd-mm-yyyy'), 43217.78, 6042288054);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (798188194, to_date('03-10-1999', 'dd-mm-yyyy'), 53211.87, 1836771829);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6941805533, to_date('04-03-2014', 'dd-mm-yyyy'), 163132.475, 2740526322);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2750118238, to_date('07-05-1990', 'dd-mm-yyyy'), 158459.829, 7732712269);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8897890075, to_date('17-10-2006', 'dd-mm-yyyy'), 136307.71, 6961077817);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1372061954, to_date('21-02-2013', 'dd-mm-yyyy'), 188377.068, 4732946988);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (878905313, to_date('26-08-2014', 'dd-mm-yyyy'), 112387.121, 6737760058);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5696934493, to_date('24-02-1993', 'dd-mm-yyyy'), 99130.69, 8994723781);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4522656863, to_date('02-12-1995', 'dd-mm-yyyy'), 181618.558, 9098809595);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8164614079, to_date('09-02-2019', 'dd-mm-yyyy'), 166560.471, 9774061637);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8260501471, to_date('09-05-1996', 'dd-mm-yyyy'), 26232.81, 9478531595);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7444300184, to_date('26-01-2019', 'dd-mm-yyyy'), 13662.15, 3166073625);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6949933028, to_date('30-08-2007', 'dd-mm-yyyy'), 70772.13, 3824994328);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2307184703, to_date('11-10-2002', 'dd-mm-yyyy'), 146200.087, 1217704657);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7447089392, to_date('24-04-2020', 'dd-mm-yyyy'), 11564.89, 5773732563);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9305240493, to_date('31-07-2006', 'dd-mm-yyyy'), 204116.66, 8959262012);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3739214383, to_date('15-03-2020', 'dd-mm-yyyy'), 209415.481, 260155129);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6788615513, to_date('03-11-2008', 'dd-mm-yyyy'), 60503.91, 1697357799);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9528830090, to_date('16-02-2013', 'dd-mm-yyyy'), 116247.824, 5150734028);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5990448028, to_date('01-12-2012', 'dd-mm-yyyy'), 174684.686, 1674658590);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9918192368, to_date('03-06-1995', 'dd-mm-yyyy'), 218366.654, 2759393);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8638171133, to_date('23-01-2017', 'dd-mm-yyyy'), 60124.98, 9929535518);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1123396738, to_date('09-11-2015', 'dd-mm-yyyy'), 120769.792, 1625879836);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6915106091, to_date('23-12-1990', 'dd-mm-yyyy'), 143618.992, 2126725238);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6192309066, to_date('30-07-2015', 'dd-mm-yyyy'), 75247.85, 3029221199);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (820431040, to_date('10-02-2006', 'dd-mm-yyyy'), 194541.094, 2378580045);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (10666183, to_date('28-09-1993', 'dd-mm-yyyy'), 13757.21, 1292917045);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9361021734, to_date('10-01-1999', 'dd-mm-yyyy'), 30951.9, 617915992);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2231117282, to_date('16-04-2008', 'dd-mm-yyyy'), 165586.212, 4840843889);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2639500814, to_date('19-02-1995', 'dd-mm-yyyy'), 139769.751, 9215297133);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3589290562, to_date('17-02-2006', 'dd-mm-yyyy'), 133752.278, 8920688122);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1943603908, to_date('27-07-2022', 'dd-mm-yyyy'), 214169.384, 2378580045);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3876469407, to_date('19-10-2004', 'dd-mm-yyyy'), 138334.163, 7752406588);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2591365316, to_date('10-12-2023', 'dd-mm-yyyy'), 97404.55, 6954833971);
commit;
prompt 365 records loaded
prompt Loading OWNS...
insert into OWNS (serial_number, soldier_id)
values (7053260187, 268280838);
insert into OWNS (serial_number, soldier_id)
values (3680210664, 527623213);
insert into OWNS (serial_number, soldier_id)
values (5836903518, 896601848);
insert into OWNS (serial_number, soldier_id)
values (8451575436, 838807727);
insert into OWNS (serial_number, soldier_id)
values (1834828258, 958408916);
insert into OWNS (serial_number, soldier_id)
values (3330706469, 678454411);
insert into OWNS (serial_number, soldier_id)
values (5756394082, 864915460);
insert into OWNS (serial_number, soldier_id)
values (38179425, 401210905);
insert into OWNS (serial_number, soldier_id)
values (390672970, 14859674);
insert into OWNS (serial_number, soldier_id)
values (9676581907, 787377762);
insert into OWNS (serial_number, soldier_id)
values (3873774387, 61751992);
insert into OWNS (serial_number, soldier_id)
values (5642982211, 346165870);
insert into OWNS (serial_number, soldier_id)
values (692110927, 920019884);
insert into OWNS (serial_number, soldier_id)
values (1582602210, 335043978);
insert into OWNS (serial_number, soldier_id)
values (4389875876, 501339491);
insert into OWNS (serial_number, soldier_id)
values (2263419287, 716887752);
insert into OWNS (serial_number, soldier_id)
values (7467542023, 84777329);
insert into OWNS (serial_number, soldier_id)
values (7345415381, 528040682);
insert into OWNS (serial_number, soldier_id)
values (891758819, 339156780);
insert into OWNS (serial_number, soldier_id)
values (5571303439, 921345792);
insert into OWNS (serial_number, soldier_id)
values (6335074087, 617020936);
insert into OWNS (serial_number, soldier_id)
values (4344305082, 169511690);
insert into OWNS (serial_number, soldier_id)
values (266082722, 276412817);
insert into OWNS (serial_number, soldier_id)
values (7086336983, 807717422);
insert into OWNS (serial_number, soldier_id)
values (5175251649, 856555734);
insert into OWNS (serial_number, soldier_id)
values (1228578944, 791194510);
insert into OWNS (serial_number, soldier_id)
values (8581056579, 835614936);
insert into OWNS (serial_number, soldier_id)
values (9883327420, 843391891);
insert into OWNS (serial_number, soldier_id)
values (9479295798, 90975405);
insert into OWNS (serial_number, soldier_id)
values (9580220237, 648570736);
insert into OWNS (serial_number, soldier_id)
values (5591685868, 309719029);
insert into OWNS (serial_number, soldier_id)
values (2405274223, 863879911);
insert into OWNS (serial_number, soldier_id)
values (5834352081, 999169755);
insert into OWNS (serial_number, soldier_id)
values (6370510168, 970939234);
insert into OWNS (serial_number, soldier_id)
values (2031234946, 206940749);
insert into OWNS (serial_number, soldier_id)
values (7370138655, 868116529);
insert into OWNS (serial_number, soldier_id)
values (926515357, 696164740);
insert into OWNS (serial_number, soldier_id)
values (7009406097, 123915433);
insert into OWNS (serial_number, soldier_id)
values (2482072218, 915186888);
insert into OWNS (serial_number, soldier_id)
values (1184275527, 807157955);
insert into OWNS (serial_number, soldier_id)
values (3630705803, 344417887);
insert into OWNS (serial_number, soldier_id)
values (4681615236, 18313165);
insert into OWNS (serial_number, soldier_id)
values (1948558566, 515164706);
insert into OWNS (serial_number, soldier_id)
values (2226913709, 304072316);
insert into OWNS (serial_number, soldier_id)
values (4125438016, 31991919);
insert into OWNS (serial_number, soldier_id)
values (158656062, 59907258);
insert into OWNS (serial_number, soldier_id)
values (3417211848, 27309463);
insert into OWNS (serial_number, soldier_id)
values (1908773791, 219695867);
insert into OWNS (serial_number, soldier_id)
values (1872734501, 243360154);
insert into OWNS (serial_number, soldier_id)
values (3558094170, 6948714);
insert into OWNS (serial_number, soldier_id)
values (422483010, 33519446);
insert into OWNS (serial_number, soldier_id)
values (6014854779, 222038979);
insert into OWNS (serial_number, soldier_id)
values (230008394, 777390005);
insert into OWNS (serial_number, soldier_id)
values (641561064, 427633412);
insert into OWNS (serial_number, soldier_id)
values (478856073, 33810605);
insert into OWNS (serial_number, soldier_id)
values (9632072596, 648030699);
insert into OWNS (serial_number, soldier_id)
values (6099078632, 586606762);
insert into OWNS (serial_number, soldier_id)
values (1400241095, 918922079);
insert into OWNS (serial_number, soldier_id)
values (8551873597, 804656953);
insert into OWNS (serial_number, soldier_id)
values (8941236223, 211911905);
insert into OWNS (serial_number, soldier_id)
values (9895127078, 918298456);
insert into OWNS (serial_number, soldier_id)
values (3749861360, 472264837);
insert into OWNS (serial_number, soldier_id)
values (761388688, 835614936);
insert into OWNS (serial_number, soldier_id)
values (4665817453, 590776766);
insert into OWNS (serial_number, soldier_id)
values (7460591027, 882391029);
insert into OWNS (serial_number, soldier_id)
values (7571405649, 868116529);
insert into OWNS (serial_number, soldier_id)
values (4451001713, 975713400);
insert into OWNS (serial_number, soldier_id)
values (2646421433, 563250879);
insert into OWNS (serial_number, soldier_id)
values (1776030317, 938341769);
insert into OWNS (serial_number, soldier_id)
values (5514472868, 597169972);
insert into OWNS (serial_number, soldier_id)
values (994233393, 19900422);
insert into OWNS (serial_number, soldier_id)
values (2556513514, 868116529);
insert into OWNS (serial_number, soldier_id)
values (2812510629, 772344246);
insert into OWNS (serial_number, soldier_id)
values (6295860053, 130230511);
insert into OWNS (serial_number, soldier_id)
values (622407240, 555852958);
insert into OWNS (serial_number, soldier_id)
values (3620098614, 326217360);
insert into OWNS (serial_number, soldier_id)
values (2230371298, 899177615);
insert into OWNS (serial_number, soldier_id)
values (8883230783, 896099346);
insert into OWNS (serial_number, soldier_id)
values (8314172401, 58230132);
insert into OWNS (serial_number, soldier_id)
values (4994635416, 217702278);
insert into OWNS (serial_number, soldier_id)
values (902675271, 894326216);
insert into OWNS (serial_number, soldier_id)
values (385429535, 151672394);
insert into OWNS (serial_number, soldier_id)
values (3155084673, 283254004);
insert into OWNS (serial_number, soldier_id)
values (6888304187, 164769073);
insert into OWNS (serial_number, soldier_id)
values (2510433061, 938695176);
insert into OWNS (serial_number, soldier_id)
values (8809827074, 445021747);
insert into OWNS (serial_number, soldier_id)
values (232904835, 335043978);
insert into OWNS (serial_number, soldier_id)
values (4335331780, 549867969);
insert into OWNS (serial_number, soldier_id)
values (1010831716, 549867969);
insert into OWNS (serial_number, soldier_id)
values (938811084, 678156612);
insert into OWNS (serial_number, soldier_id)
values (9924387366, 99392871);
insert into OWNS (serial_number, soldier_id)
values (4293757346, 535247162);
insert into OWNS (serial_number, soldier_id)
values (587490820, 359931013);
insert into OWNS (serial_number, soldier_id)
values (4385037561, 156074960);
insert into OWNS (serial_number, soldier_id)
values (3509868672, 886513759);
insert into OWNS (serial_number, soldier_id)
values (6097157700, 584742297);
insert into OWNS (serial_number, soldier_id)
values (6464037187, 161094854);
insert into OWNS (serial_number, soldier_id)
values (204684713, 559946127);
insert into OWNS (serial_number, soldier_id)
values (2715127502, 633046823);
insert into OWNS (serial_number, soldier_id)
values (6571298521, 25744932);
commit;
prompt 100 records committed...
insert into OWNS (serial_number, soldier_id)
values (2893599072, 30314782);
insert into OWNS (serial_number, soldier_id)
values (3160515194, 890501796);
insert into OWNS (serial_number, soldier_id)
values (747316484, 919730837);
insert into OWNS (serial_number, soldier_id)
values (4177899180, 741528628);
insert into OWNS (serial_number, soldier_id)
values (4346861955, 63905300);
insert into OWNS (serial_number, soldier_id)
values (2683868188, 807157955);
insert into OWNS (serial_number, soldier_id)
values (4265394667, 176298527);
insert into OWNS (serial_number, soldier_id)
values (2778432526, 806039254);
insert into OWNS (serial_number, soldier_id)
values (1528435879, 355518824);
insert into OWNS (serial_number, soldier_id)
values (4879294859, 583586907);
insert into OWNS (serial_number, soldier_id)
values (1785298805, 876816056);
insert into OWNS (serial_number, soldier_id)
values (8321627394, 586503670);
insert into OWNS (serial_number, soldier_id)
values (7427208123, 42187495);
insert into OWNS (serial_number, soldier_id)
values (3702815764, 283254004);
insert into OWNS (serial_number, soldier_id)
values (9820336654, 388851398);
insert into OWNS (serial_number, soldier_id)
values (6075899124, 83424189);
insert into OWNS (serial_number, soldier_id)
values (2976639701, 346162990);
insert into OWNS (serial_number, soldier_id)
values (9205556849, 521791185);
insert into OWNS (serial_number, soldier_id)
values (8878444019, 703258636);
insert into OWNS (serial_number, soldier_id)
values (2470087389, 707520332);
insert into OWNS (serial_number, soldier_id)
values (5833378046, 176298527);
insert into OWNS (serial_number, soldier_id)
values (315142032, 394675954);
insert into OWNS (serial_number, soldier_id)
values (8223248730, 990619358);
insert into OWNS (serial_number, soldier_id)
values (1408371941, 445021747);
insert into OWNS (serial_number, soldier_id)
values (2824010364, 984292034);
insert into OWNS (serial_number, soldier_id)
values (2009814228, 896099346);
insert into OWNS (serial_number, soldier_id)
values (325655207, 449535616);
insert into OWNS (serial_number, soldier_id)
values (3057183134, 19900422);
insert into OWNS (serial_number, soldier_id)
values (8936946513, 100823687);
insert into OWNS (serial_number, soldier_id)
values (9931713814, 48296139);
insert into OWNS (serial_number, soldier_id)
values (9176613838, 59907258);
insert into OWNS (serial_number, soldier_id)
values (3970933202, 78008934);
insert into OWNS (serial_number, soldier_id)
values (529209147, 565195540);
insert into OWNS (serial_number, soldier_id)
values (8907998716, 933905106);
insert into OWNS (serial_number, soldier_id)
values (7550791935, 249755717);
insert into OWNS (serial_number, soldier_id)
values (5855194343, 691870152);
insert into OWNS (serial_number, soldier_id)
values (9670792326, 61751992);
insert into OWNS (serial_number, soldier_id)
values (8853811992, 204735426);
insert into OWNS (serial_number, soldier_id)
values (2311582629, 340818594);
insert into OWNS (serial_number, soldier_id)
values (6948275372, 62655216);
insert into OWNS (serial_number, soldier_id)
values (4013596334, 772344246);
insert into OWNS (serial_number, soldier_id)
values (5124048563, 775186259);
insert into OWNS (serial_number, soldier_id)
values (5090139576, 577952863);
insert into OWNS (serial_number, soldier_id)
values (7650357697, 304072316);
insert into OWNS (serial_number, soldier_id)
values (1680834889, 128185588);
insert into OWNS (serial_number, soldier_id)
values (328732672, 357980431);
insert into OWNS (serial_number, soldier_id)
values (2723762727, 922868636);
insert into OWNS (serial_number, soldier_id)
values (4051540212, 390303866);
insert into OWNS (serial_number, soldier_id)
values (8362138857, 195146138);
insert into OWNS (serial_number, soldier_id)
values (1717369028, 211911905);
insert into OWNS (serial_number, soldier_id)
values (5444782353, 705828591);
insert into OWNS (serial_number, soldier_id)
values (5416239837, 227809174);
insert into OWNS (serial_number, soldier_id)
values (3483363493, 109746290);
insert into OWNS (serial_number, soldier_id)
values (4129827174, 354262773);
insert into OWNS (serial_number, soldier_id)
values (8061050411, 619446944);
insert into OWNS (serial_number, soldier_id)
values (6429015335, 301683965);
insert into OWNS (serial_number, soldier_id)
values (5003249514, 659409755);
insert into OWNS (serial_number, soldier_id)
values (2854977328, 149955748);
insert into OWNS (serial_number, soldier_id)
values (8993860800, 992565772);
insert into OWNS (serial_number, soldier_id)
values (3842884879, 601514113);
insert into OWNS (serial_number, soldier_id)
values (9333939838, 321863485);
insert into OWNS (serial_number, soldier_id)
values (3245910012, 785530631);
insert into OWNS (serial_number, soldier_id)
values (2773902643, 96798324);
insert into OWNS (serial_number, soldier_id)
values (1731323314, 658456825);
insert into OWNS (serial_number, soldier_id)
values (5929446631, 224953763);
insert into OWNS (serial_number, soldier_id)
values (7154987675, 787617930);
insert into OWNS (serial_number, soldier_id)
values (9018714735, 80299456);
insert into OWNS (serial_number, soldier_id)
values (9454735786, 693277640);
insert into OWNS (serial_number, soldier_id)
values (8645482576, 539272033);
insert into OWNS (serial_number, soldier_id)
values (7111194518, 696164740);
insert into OWNS (serial_number, soldier_id)
values (9584655068, 971369974);
insert into OWNS (serial_number, soldier_id)
values (1977854324, 204735426);
insert into OWNS (serial_number, soldier_id)
values (1769138498, 421861798);
insert into OWNS (serial_number, soldier_id)
values (9540178816, 120870438);
insert into OWNS (serial_number, soldier_id)
values (7124291017, 517005127);
insert into OWNS (serial_number, soldier_id)
values (2277124599, 388593835);
insert into OWNS (serial_number, soldier_id)
values (1333311341, 913550787);
insert into OWNS (serial_number, soldier_id)
values (285160749, 790597387);
insert into OWNS (serial_number, soldier_id)
values (3876762268, 164769073);
insert into OWNS (serial_number, soldier_id)
values (892037875, 17071673);
insert into OWNS (serial_number, soldier_id)
values (1929631780, 130230511);
insert into OWNS (serial_number, soldier_id)
values (5091022909, 452407341);
insert into OWNS (serial_number, soldier_id)
values (6652019407, 559946127);
insert into OWNS (serial_number, soldier_id)
values (8562475536, 953566820);
insert into OWNS (serial_number, soldier_id)
values (5642591639, 739502967);
insert into OWNS (serial_number, soldier_id)
values (9575266503, 743021164);
insert into OWNS (serial_number, soldier_id)
values (1803488600, 984292034);
insert into OWNS (serial_number, soldier_id)
values (2210819525, 22117822);
insert into OWNS (serial_number, soldier_id)
values (739009819, 338354276);
insert into OWNS (serial_number, soldier_id)
values (5007486095, 58230132);
insert into OWNS (serial_number, soldier_id)
values (9237887302, 544994839);
insert into OWNS (serial_number, soldier_id)
values (8492082501, 226706494);
insert into OWNS (serial_number, soldier_id)
values (6743868091, 948068148);
insert into OWNS (serial_number, soldier_id)
values (7999946869, 451854589);
insert into OWNS (serial_number, soldier_id)
values (5165544117, 899177615);
insert into OWNS (serial_number, soldier_id)
values (6049262641, 509280185);
insert into OWNS (serial_number, soldier_id)
values (2324699039, 452407341);
insert into OWNS (serial_number, soldier_id)
values (2629501774, 63905300);
insert into OWNS (serial_number, soldier_id)
values (4758040032, 190685698);
insert into OWNS (serial_number, soldier_id)
values (1262299833, 366024509);
commit;
prompt 200 records committed...
insert into OWNS (serial_number, soldier_id)
values (9523148241, 388593835);
insert into OWNS (serial_number, soldier_id)
values (7014455172, 987435024);
insert into OWNS (serial_number, soldier_id)
values (2140841427, 388851398);
insert into OWNS (serial_number, soldier_id)
values (1200615407, 688544625);
insert into OWNS (serial_number, soldier_id)
values (482885185, 304753010);
insert into OWNS (serial_number, soldier_id)
values (9409136868, 951979571);
insert into OWNS (serial_number, soldier_id)
values (9204521715, 100823687);
insert into OWNS (serial_number, soldier_id)
values (3824151839, 970573543);
insert into OWNS (serial_number, soldier_id)
values (8616378236, 700051578);
insert into OWNS (serial_number, soldier_id)
values (3877381022, 760601144);
insert into OWNS (serial_number, soldier_id)
values (3936947312, 921345792);
insert into OWNS (serial_number, soldier_id)
values (1298410592, 807717422);
insert into OWNS (serial_number, soldier_id)
values (5265579556, 760601144);
insert into OWNS (serial_number, soldier_id)
values (5629509802, 130230511);
insert into OWNS (serial_number, soldier_id)
values (1110601567, 309719029);
insert into OWNS (serial_number, soldier_id)
values (6087940051, 146228453);
insert into OWNS (serial_number, soldier_id)
values (5699999772, 119324186);
insert into OWNS (serial_number, soldier_id)
values (2957564496, 516903398);
insert into OWNS (serial_number, soldier_id)
values (8970363792, 100460095);
insert into OWNS (serial_number, soldier_id)
values (6895769343, 860944630);
insert into OWNS (serial_number, soldier_id)
values (1999868858, 17071673);
insert into OWNS (serial_number, soldier_id)
values (3111200179, 711151482);
insert into OWNS (serial_number, soldier_id)
values (7356040892, 253020708);
insert into OWNS (serial_number, soldier_id)
values (8376578566, 791356613);
insert into OWNS (serial_number, soldier_id)
values (4745226508, 954789903);
insert into OWNS (serial_number, soldier_id)
values (3093322757, 304072316);
insert into OWNS (serial_number, soldier_id)
values (6838547615, 146228453);
insert into OWNS (serial_number, soldier_id)
values (3826165229, 309679728);
insert into OWNS (serial_number, soldier_id)
values (8453732359, 586503670);
insert into OWNS (serial_number, soldier_id)
values (5937258864, 156074960);
insert into OWNS (serial_number, soldier_id)
values (3980061818, 401210905);
insert into OWNS (serial_number, soldier_id)
values (2654978152, 480375782);
insert into OWNS (serial_number, soldier_id)
values (8785584565, 47521761);
insert into OWNS (serial_number, soldier_id)
values (5891750537, 59907258);
insert into OWNS (serial_number, soldier_id)
values (7811237309, 222038979);
insert into OWNS (serial_number, soldier_id)
values (7805191905, 940572982);
insert into OWNS (serial_number, soldier_id)
values (8889502433, 655441077);
insert into OWNS (serial_number, soldier_id)
values (260730540, 90975405);
insert into OWNS (serial_number, soldier_id)
values (942877337, 884802758);
insert into OWNS (serial_number, soldier_id)
values (4282853791, 398012055);
insert into OWNS (serial_number, soldier_id)
values (9350915849, 42187495);
insert into OWNS (serial_number, soldier_id)
values (7648787738, 528905573);
insert into OWNS (serial_number, soldier_id)
values (1503426516, 633915592);
insert into OWNS (serial_number, soldier_id)
values (860388597, 823226118);
insert into OWNS (serial_number, soldier_id)
values (5765653102, 243993217);
insert into OWNS (serial_number, soldier_id)
values (3512221536, 807717422);
insert into OWNS (serial_number, soldier_id)
values (9232725334, 253020708);
insert into OWNS (serial_number, soldier_id)
values (1415593509, 30314782);
insert into OWNS (serial_number, soldier_id)
values (3209891703, 679255217);
insert into OWNS (serial_number, soldier_id)
values (6983230755, 2786419);
insert into OWNS (serial_number, soldier_id)
values (3071654574, 189616313);
insert into OWNS (serial_number, soldier_id)
values (4577691416, 33348831);
insert into OWNS (serial_number, soldier_id)
values (7760305070, 368073352);
insert into OWNS (serial_number, soldier_id)
values (9430521484, 979203046);
insert into OWNS (serial_number, soldier_id)
values (9133040940, 814858838);
insert into OWNS (serial_number, soldier_id)
values (908979604, 843885713);
insert into OWNS (serial_number, soldier_id)
values (5355726709, 755301653);
insert into OWNS (serial_number, soldier_id)
values (3390750082, 346162990);
insert into OWNS (serial_number, soldier_id)
values (4457245265, 516903398);
insert into OWNS (serial_number, soldier_id)
values (4849937660, 913550787);
insert into OWNS (serial_number, soldier_id)
values (6495295562, 990619358);
insert into OWNS (serial_number, soldier_id)
values (483302118, 954789903);
insert into OWNS (serial_number, soldier_id)
values (6815959712, 549867969);
insert into OWNS (serial_number, soldier_id)
values (9081084175, 645592237);
insert into OWNS (serial_number, soldier_id)
values (2173913130, 86417259);
insert into OWNS (serial_number, soldier_id)
values (2254129654, 14962501);
insert into OWNS (serial_number, soldier_id)
values (866097764, 668859191);
insert into OWNS (serial_number, soldier_id)
values (1164029589, 864915460);
insert into OWNS (serial_number, soldier_id)
values (955629631, 223653476);
insert into OWNS (serial_number, soldier_id)
values (683348723, 958408916);
insert into OWNS (serial_number, soldier_id)
values (3667968980, 676864100);
insert into OWNS (serial_number, soldier_id)
values (3897040961, 100823687);
insert into OWNS (serial_number, soldier_id)
values (1280240574, 176298527);
insert into OWNS (serial_number, soldier_id)
values (543820185, 304753010);
insert into OWNS (serial_number, soldier_id)
values (2838153407, 344105739);
insert into OWNS (serial_number, soldier_id)
values (5781075011, 331354231);
insert into OWNS (serial_number, soldier_id)
values (2195341596, 427054136);
insert into OWNS (serial_number, soldier_id)
values (5021473481, 426023600);
insert into OWNS (serial_number, soldier_id)
values (9680612994, 591654777);
insert into OWNS (serial_number, soldier_id)
values (5624202797, 621448955);
insert into OWNS (serial_number, soldier_id)
values (7192383516, 563546248);
insert into OWNS (serial_number, soldier_id)
values (1573851561, 480375782);
insert into OWNS (serial_number, soldier_id)
values (7982327048, 262774555);
insert into OWNS (serial_number, soldier_id)
values (3854171921, 864915460);
insert into OWNS (serial_number, soldier_id)
values (3275996479, 394675954);
insert into OWNS (serial_number, soldier_id)
values (3325538218, 451854589);
insert into OWNS (serial_number, soldier_id)
values (543568112, 128587055);
insert into OWNS (serial_number, soldier_id)
values (8321964413, 971369974);
insert into OWNS (serial_number, soldier_id)
values (2164950368, 848876967);
insert into OWNS (serial_number, soldier_id)
values (7252212975, 434703552);
insert into OWNS (serial_number, soldier_id)
values (9528784025, 103774210);
insert into OWNS (serial_number, soldier_id)
values (1450848120, 86348597);
insert into OWNS (serial_number, soldier_id)
values (251857345, 392616556);
insert into OWNS (serial_number, soldier_id)
values (1415456917, 895727331);
insert into OWNS (serial_number, soldier_id)
values (3924559881, 682434276);
insert into OWNS (serial_number, soldier_id)
values (6398597844, 262946526);
insert into OWNS (serial_number, soldier_id)
values (7828420631, 605232968);
insert into OWNS (serial_number, soldier_id)
values (1242459170, 356782622);
insert into OWNS (serial_number, soldier_id)
values (4114119921, 668859191);
insert into OWNS (serial_number, soldier_id)
values (778431398, 780471285);
commit;
prompt 300 records committed...
insert into OWNS (serial_number, soldier_id)
values (6439774971, 83424189);
insert into OWNS (serial_number, soldier_id)
values (9073260014, 355518824);
insert into OWNS (serial_number, soldier_id)
values (5977343407, 863879911);
insert into OWNS (serial_number, soldier_id)
values (2512363797, 765470455);
insert into OWNS (serial_number, soldier_id)
values (998751341, 132254189);
insert into OWNS (serial_number, soldier_id)
values (6958086779, 806039254);
insert into OWNS (serial_number, soldier_id)
values (6540687170, 823226118);
insert into OWNS (serial_number, soldier_id)
values (9359418172, 406939452);
insert into OWNS (serial_number, soldier_id)
values (7374716055, 209537395);
insert into OWNS (serial_number, soldier_id)
values (1475863296, 586503670);
insert into OWNS (serial_number, soldier_id)
values (1435507476, 170428173);
insert into OWNS (serial_number, soldier_id)
values (8568175602, 353399272);
insert into OWNS (serial_number, soldier_id)
values (1079825445, 640870770);
insert into OWNS (serial_number, soldier_id)
values (933290972, 138780621);
insert into OWNS (serial_number, soldier_id)
values (4102448880, 262774555);
insert into OWNS (serial_number, soldier_id)
values (2589020774, 919730837);
insert into OWNS (serial_number, soldier_id)
values (673214350, 939435895);
insert into OWNS (serial_number, soldier_id)
values (4135878550, 537542840);
insert into OWNS (serial_number, soldier_id)
values (8526305078, 957293214);
insert into OWNS (serial_number, soldier_id)
values (3036573687, 223163717);
insert into OWNS (serial_number, soldier_id)
values (774580020, 304753010);
insert into OWNS (serial_number, soldier_id)
values (3293025958, 501199684);
insert into OWNS (serial_number, soldier_id)
values (4152220811, 27888027);
insert into OWNS (serial_number, soldier_id)
values (5210986503, 908940344);
insert into OWNS (serial_number, soldier_id)
values (7184224880, 645592237);
insert into OWNS (serial_number, soldier_id)
values (6998256864, 83980733);
insert into OWNS (serial_number, soldier_id)
values (6961578331, 533658209);
insert into OWNS (serial_number, soldier_id)
values (6759189070, 876816056);
insert into OWNS (serial_number, soldier_id)
values (1606707193, 894536977);
insert into OWNS (serial_number, soldier_id)
values (9187893375, 501199684);
insert into OWNS (serial_number, soldier_id)
values (8655033031, 219695867);
insert into OWNS (serial_number, soldier_id)
values (5452670529, 190685698);
insert into OWNS (serial_number, soldier_id)
values (798188194, 257132733);
insert into OWNS (serial_number, soldier_id)
values (6941805533, 14962501);
insert into OWNS (serial_number, soldier_id)
values (2750118238, 645592237);
insert into OWNS (serial_number, soldier_id)
values (8897890075, 173486842);
insert into OWNS (serial_number, soldier_id)
values (1372061954, 939435895);
insert into OWNS (serial_number, soldier_id)
values (878905313, 92384346);
insert into OWNS (serial_number, soldier_id)
values (5696934493, 339156780);
insert into OWNS (serial_number, soldier_id)
values (4522656863, 920665418);
insert into OWNS (serial_number, soldier_id)
values (8164614079, 249755717);
insert into OWNS (serial_number, soldier_id)
values (8260501471, 648030699);
insert into OWNS (serial_number, soldier_id)
values (7444300184, 852148646);
insert into OWNS (serial_number, soldier_id)
values (6949933028, 580744813);
insert into OWNS (serial_number, soldier_id)
values (2307184703, 139730663);
insert into OWNS (serial_number, soldier_id)
values (7447089392, 553773429);
insert into OWNS (serial_number, soldier_id)
values (9305240493, 496442797);
insert into OWNS (serial_number, soldier_id)
values (3739214383, 408958649);
insert into OWNS (serial_number, soldier_id)
values (6788615513, 147105179);
insert into OWNS (serial_number, soldier_id)
values (9528830090, 344417887);
insert into OWNS (serial_number, soldier_id)
values (5990448028, 58230132);
insert into OWNS (serial_number, soldier_id)
values (9918192368, 8310165);
insert into OWNS (serial_number, soldier_id)
values (8638171133, 506038648);
insert into OWNS (serial_number, soldier_id)
values (1123396738, 873879832);
insert into OWNS (serial_number, soldier_id)
values (6915106091, 141017923);
insert into OWNS (serial_number, soldier_id)
values (6192309066, 787617930);
insert into OWNS (serial_number, soldier_id)
values (820431040, 38809955);
insert into OWNS (serial_number, soldier_id)
values (10666183, 61751992);
insert into OWNS (serial_number, soldier_id)
values (9361021734, 617020936);
insert into OWNS (serial_number, soldier_id)
values (2231117282, 679255217);
insert into OWNS (serial_number, soldier_id)
values (2639500814, 59689472);
insert into OWNS (serial_number, soldier_id)
values (3589290562, 302239238);
insert into OWNS (serial_number, soldier_id)
values (1943603908, 14859674);
insert into OWNS (serial_number, soldier_id)
values (3876469407, 623560716);
insert into OWNS (serial_number, soldier_id)
values (2591365316, 807157955);
commit;
prompt 365 records loaded
prompt Loading STOREMAN...
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (918922079, 37, 3220487253);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (939435895, 38, 8015551792);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (876816056, 8, 4473030814);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (894326216, 19, 4094829436);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (863879911, 60, 8741317356);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (78008934, 33, 3029221199);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (276412817, 10, 7272891544);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (707520332, 13, 3558617930);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (257132733, 22, 6640968939);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (895727331, 39, 7434237718);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (398012055, 37, 5504829974);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (227809174, 51, 3379209368);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (539272033, 28, 6909820646);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (58230132, 5, 9912916709);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (161094854, 14, 7857194612);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (100823687, 37, 2051033117);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (787377762, 54, 9560385514);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (553773429, 56, 5882221317);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (472264837, 34, 7873678207);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (211911905, 1, 4382214167);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (688544625, 1, 4193257857);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (19900422, 49, 8978310700);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (938695176, 17, 5755503158);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (204735426, 11, 6606838009);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (27309463, 23, 9947274359);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (119324186, 54, 4993512060);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (516903398, 12, 1627572129);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (390303866, 60, 7159771341);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (14859674, 44, 7934300986);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (772344246, 57, 1009400256);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (33348831, 34, 711915037);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (678156612, 4, 9851046040);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (775186259, 15, 4068531670);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (791356613, 60, 9018685179);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (580744813, 23, 2073504657);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (990619358, 12, 5773732563);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (33519446, 37, 8527911504);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (353399272, 25, 8494880937);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (957293214, 29, 7162438431);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (268280838, 51, 3295113117);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (537542840, 22, 8763912363);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (791194510, 56, 44779413);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (693277640, 6, 560519940);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (521791185, 34, 7689428194);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (326217360, 53, 5094140215);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (528040682, 29, 9422744030);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (339156780, 52, 4456118071);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (528905573, 33, 7001159921);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (785530631, 30, 3490649377);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (47521761, 56, 4314102466);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (700051578, 44, 9603944310);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (658456825, 30, 8250848739);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (356782622, 28, 112043827);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (109746290, 8, 6484335275);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (139730663, 42, 131447274);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (138780621, 7, 1245195236);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (80299456, 23, 3079312747);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (640870770, 8, 5220721040);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (938341769, 33, 1674658590);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (515164706, 26, 4399125649);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (346165870, 36, 1281019521);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (344417887, 40, 373156598);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (27888027, 2, 9676309403);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (99392871, 18, 3048079767);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (979203046, 59, 362072609);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (63905300, 13, 5739282429);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (787617930, 28, 8357509128);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (621448955, 39, 4798387437);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (340818594, 23, 7717664071);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (601514113, 7, 7405919321);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (565195540, 36, 6517710118);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (597169972, 9, 5986847282);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (355518824, 42, 9139855618);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (480375782, 19, 5137393457);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (421861798, 35, 3671015115);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (22117822, 34, 9662472323);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (741528628, 5, 7183055861);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (219695867, 48, 7419201939);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (623560716, 21, 845393956);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (243993217, 42, 2255353139);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (61751992, 32, 3855948706);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (814858838, 50, 298592433);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (253020708, 28, 8951937158);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (958408916, 50, 1726567562);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (856555734, 8, 9929535518);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (739502967, 9, 1234693204);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (14962501, 37, 6224217074);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (354262773, 15, 8981396378);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (262774555, 2, 8356241074);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (388593835, 10, 4711622117);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (128587055, 29, 4740632252);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (777390005, 41, 272314523);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (445021747, 55, 3006393424);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (919730837, 3, 3462661594);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (921345792, 55, 8935672982);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (335043978, 14, 3469925177);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (533658209, 55, 1341843981);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (130230511, 13, 9055110599);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (559946127, 54, 4336329790);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (501339491, 7, 4440812047);
commit;
prompt 100 records committed...
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (951979571, 27, 6961077817);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (83424189, 33, 3824071590);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (48296139, 18, 28008819);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (852148646, 58, 9933450947);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (209537395, 31, 2366342534);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (765470455, 34, 2314952425);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (835614936, 35, 9322452254);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (86417259, 10, 5172408020);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (915186888, 24, 5499267131);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (940572982, 11, 2191549381);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (388851398, 49, 3519532740);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (33810605, 20, 8272317810);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (645592237, 29, 1438361279);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (668859191, 24, 4594720156);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (8310165, 12, 5247882929);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (954789903, 60, 3087552079);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (591654777, 39, 3380981990);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (922868636, 12, 7824424657);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (149955748, 19, 6586650711);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (132254189, 53, 7404015917);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (984292034, 48, 7468990299);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (222038979, 3, 6568010629);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (321863485, 48, 6361451930);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (426023600, 8, 4035042798);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (563250879, 36, 3012025231);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (146228453, 50, 7449507055);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (920665418, 14, 2023192352);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (42187495, 26, 2126843023);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (190685698, 34, 3756708831);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (633046823, 26, 353622213);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (678454411, 44, 5468834990);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (655441077, 50, 6042288054);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (913550787, 8, 2864156706);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (868116529, 43, 850149958);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (691870152, 6, 5442740858);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (705828591, 57, 3201043602);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (586503670, 24, 5038905616);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (141017923, 60, 6308448206);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (527623213, 31, 6649963460);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (223653476, 28, 9144536098);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (648570736, 55, 3746821747);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (103774210, 41, 1007528486);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (18313165, 13, 2740526322);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (262946526, 16, 3578687032);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (25744932, 29, 167476784);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (283254004, 42, 9353106044);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (843391891, 59, 1292917045);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (860944630, 53, 3466456849);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (970939234, 50, 5896707556);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (790597387, 59, 6414717976);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (449535616, 31, 9774061637);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (92384346, 17, 7597390758);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (96798324, 25, 3790288824);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (920019884, 1, 577535758);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (848876967, 19, 8840679769);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (86348597, 6, 3251223333);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (427633412, 47, 617915992);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (884802758, 33, 5903693783);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (368073352, 22, 4340842495);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (696164740, 54, 1556576479);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (509280185, 16, 5276367047);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (170428173, 59, 3023914742);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (128185588, 53, 3305391502);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (806039254, 41, 3799577075);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (427054136, 26, 839667416);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (366024509, 38, 4613136344);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (156074960, 27, 900496394);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (823226118, 50, 6537827757);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (100460095, 59, 9431365316);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (873879832, 33, 9974190274);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (392616556, 41, 7605192682);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (563546248, 44, 479735255);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (38809955, 47, 1457671959);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (496442797, 29, 1632587230);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (999169755, 27, 2650179284);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (31991919, 52, 7163319710);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (517005127, 23, 3213318404);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (676864100, 38, 5176914888);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (605232968, 18, 8959262012);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (975713400, 3, 2160440590);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (346162990, 18, 5150734028);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (648030699, 26, 3686348545);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (890501796, 2, 4024776489);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (864915460, 10, 6784021008);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (619446944, 42, 1217704657);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (309679728, 33, 1625879836);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (908940344, 0, 2089357011);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (309719029, 37, 6810415683);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (918298456, 37, 546285283);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (189616313, 5, 7148321307);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (59689472, 11, 1836771829);
commit;
prompt 191 records loaded
prompt Loading SUPPLIER...
insert into SUPPLIER (company_name, email, location, company_id)
values ('Apple', 'tpeddersen0@last.fm', 'Williston', 559146);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Microsoft', 'eortet1@prlog.org', 'Douz', 757260);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Amazon', 'fhaynes2@trellian.com', 'Pocito', 738303);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Google', 'ddenholm3@360.cn', 'Zaqatala', 366104);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Facebook', 'rmacgibbon4@nifty.com', 'Teberda', 143701);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Tesla', 'mlhommeau5@mail.ru', 'Maunatlala', 256875);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BerkshireHathaway', 'lhuccaby6@blogtalkradio.com', 'Langres', 732488);
insert into SUPPLIER (company_name, email, location, company_id)
values ('JohnsonJohnson', 'fhacket7@oaic.gov.au', 'Cibunar', 291669);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Walmart', 'rcomins8@ow.ly', 'Jiyukou', 581216);
insert into SUPPLIER (company_name, email, location, company_id)
values ('JPMorganChase', 'drenfield9@google.ca', 'Klyuchi', 277568);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ProcterGamble', 'gtomasza@hhs.gov', 'Oslo', 650634);
insert into SUPPLIER (company_name, email, location, company_id)
values ('NVIDIA', 'smattssonb@ovh.net', 'Ranot', 467493);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Visa', 'histonc@si.edu', 'Nyakhachava', 760359);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Mastercard', 'imainwaringd@cornell.edu', 'Boavista', 953422);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UnitedHealthGroup', 'hmettse@123-reg.co.uk', 'Hanyin Chengguanzhen', 717258);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Disney', 'gtresisef@paypal.com', 'Sakai', 275177);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PayPal', 'kshooterh@cmu.edu', 'Tsuen Wan', 444940);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intel', 'kmcalisteri@1und1.de', 'San Jose', 352410);
insert into SUPPLIER (company_name, email, location, company_id)
values ('HomeDepot', 'vshyresj@opensource.org', 'Kokopo', 252651);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Verizon', 'dcallacherk@ebay.com', 'Harjavalta', 759481);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Comcast', 'dhumbiel@opensource.org', 'Balayan', 262667);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PepsiCo', 'tjanecekm@yellowpages.com', 'Lleida', 418693);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Netflix', 'cmixn@g.co', 'San Simon', 948340);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Adobe', 'rmounceyo@diigo.com', 'Mocoa', 350517);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Salesforce', 'kstellep@wsj.com', 'Independence', 137689);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ATT', 'dtookillq@free.fr', 'Xibing', 151273);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Coca-Cola', 'cdunsr@tripod.com', 'Damaishan', 613036);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Oracle', 'dellenss@t.co', 'Gaplokan', 717610);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AbbVie', 'rrehnt@theatlantic.com', 'Kore', 666125);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Cisco', 'mkurdaniu@stumbleupon.com', 'Chandra', 570476);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Chevron', 'bedmonstonv@europa.eu', 'Huangjiazhai', 847731);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Merck', 'dphilippeauxw@odnoklassniki.ru', 'Izumi', 787809);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ExxonMobil', 'mkinnyx@arizona.edu', 'Manhush', 804009);
insert into SUPPLIER (company_name, email, location, company_id)
values ('WaltDisney', 'toscolleey@biglobe.ne.jp', 'Fenoarivo Atsinanana', 558872);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Costco', 'qyusupovz@nasa.gov', 'TlumaÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Âov', 240924);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AmericanExpress', 'fdrewe10@cisco.com', 'Kladanj', 351987);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AbbottLaboratories', 'wcomport11@gnu.org', 'SarÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Âqib', 712015);
insert into SUPPLIER (company_name, email, location, company_id)
values ('T-Mobile', 'fdrinkeld12@typepad.com', 'CholargÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³s', 494195);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Starbucks', 'rbursell13@vimeo.com', 'Krasnystaw', 154318);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GoldmanSachs', 'lgayle15@icq.com', 'Moville', 659073);
insert into SUPPLIER (company_name, email, location, company_id)
values ('LockheedMartin', 'jlightoller16@weibo.com', 'Campos Novos', 653216);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Bristol-MyersSquibb', 'pomohun17@cnn.com', 'Emiliano Zapata', 914579);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Qualcomm', 'aabbate18@flickr.com', 'VÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¤rmdÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¶', 290983);
insert into SUPPLIER (company_name, email, location, company_id)
values ('3M', 'emattock19@arizona.edu', 'Bunutan', 961642);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PhilipMorris', 'klittefair1a@ed.gov', 'Zhutang', 366070);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Medtronic', 'dbadsworth1b@clickbank.net', 'Olyka', 518248);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Boeing', 'ahandrok1c@xinhuanet.com', 'ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¢ubarjal', 466659);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GeneralElectric', 'cpieterick1d@theglobeandmail.com', 'Zbiroh', 880502);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Dow', 'dlongstaffe1e@netlog.com', 'Arras', 464893);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UnionPacific', 'mturmel1g@jigsy.com', 'Nanfeng', 904529);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Target', 'yenriques1h@over-blog.com', 'Sumberpitu', 102950);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BookingHoldings', 'whubber1i@forbes.com', 'Pereiras', 474785);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BankofAmerica', 'rleither1j@freewebs.com', 'Liwu', 226775);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Amgen', 'mlandsberg1k@devhub.com', 'Petrovskiy', 217990);
insert into SUPPLIER (company_name, email, location, company_id)
values ('EliLilly', 'tjoncic1l@unicef.org', 'Boavista', 717643);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Pfizer', 'wohingerty1m@icq.com', 'Pangushan', 891570);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UPS', 'tweekes1n@about.com', 'Bondo', 394537);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intuit', 'bmedford1o@wisc.edu', 'Ambulong', 706319);
insert into SUPPLIER (company_name, email, location, company_id)
values ('TexasInstruments', 'ssibun1p@miitbeian.gov.cn', 'Xianghuaqiao', 897337);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MicronTechnology', 'cchree1q@weibo.com', 'Xinxu', 293540);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Ford', 'klangstaff1r@privacy.gov.au', 'Margamukti', 774157);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GeneralMotors', 'cbalshen1s@weibo.com', 'Gannan', 976760);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Colgate-Palmolive', 'lbarkley1t@utexas.edu', 'Cajabamba', 299674);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Caterpillar', 'lbettinson1u@pen.io', 'Uliastay', 337426);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ConocoPhillips', 'naspland1v@123-reg.co.uk', 'Nanxia', 996972);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Lowe', 'mriditch1w@answers.com', 'Cinunjang', 528204);
insert into SUPPLIER (company_name, email, location, company_id)
values ('RaytheonTechnologies', 'dkahen1x@yale.edu', 'Jalupang Dua', 569968);
insert into SUPPLIER (company_name, email, location, company_id)
values ('KraftHeinz', 'spurvey1y@npr.org', 'Alto de la Estancia', 851759);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Exelon', 'csly1z@arstechnica.com', 'Jinrongjie', 888058);
insert into SUPPLIER (company_name, email, location, company_id)
values ('NextEraEnergy', 'rdawid20@constantcontact.com', 'ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€¦Ã¢â‚¬â„¢miya', 780947);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AmericanAirlines', 'gtestro21@ehow.com', 'Waterloo', 370213);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Honeywell', 'myegorkin22@jigsy.com', 'Digdig', 949816);
insert into SUPPLIER (company_name, email, location, company_id)
values ('McDonald', 'koffield23@bigcartel.com', 'PerdÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Âµes', 969562);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Citigroup', 'bivamy24@imageshack.us', 'Bielsk Podlaski', 362524);
insert into SUPPLIER (company_name, email, location, company_id)
values ('CardinalHealth', 'akloss25@abc.net.au', 'HamhÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â­ng', 756451);
insert into SUPPLIER (company_name, email, location, company_id)
values ('TheTravelersCompanies', 'hmcnab26@europa.eu', 'Clonskeagh', 758458);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Cigna', 'kmatthiesen27@jiathis.com', 'Balpyk BÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â«', 937171);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MarathonPetroleum', 'rdaulton28@sciencedaily.com', 'Qiziltepa Shahri', 840550);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Aflac', 'dshervil29@telegraph.co.uk', 'Voznesenskaya', 472841);
insert into SUPPLIER (company_name, email, location, company_id)
values ('StateFarm', 'olettley2a@blogspot.com', 'Budapest', 766704);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BestBuy', 'rkleine2d@constantcontact.com', 'Petaluma', 188026);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Paccar', 'pelsip2e@squarespace.com', 'Tsimlyansk', 611466);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BaxterInternational', 'eposer2f@merriam-webster.com', 'Longxian Chengguanzhen', 903261);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Broadcom', 'gikins2g@nps.gov', 'Ueno', 154618);
insert into SUPPLIER (company_name, email, location, company_id)
values ('DeereCompany', 'kkaine2h@reference.com', 'Denpasar', 173066);
insert into SUPPLIER (company_name, email, location, company_id)
values ('KelloggCompany', 'sfriel2i@biglobe.ne.jp', 'Campos', 413629);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Corning', 'chakonsen2j@deviantart.com', 'Sunduan', 795523);
insert into SUPPLIER (company_name, email, location, company_id)
values ('NorthropGrumman', 'mverdun2k@github.io', 'Kapenguria', 599908);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Halliburton', 'jbedbrough2l@blinklist.com', 'Grande RiviÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¨re Noire', 737743);
insert into SUPPLIER (company_name, email, location, company_id)
values ('FluorCorpora', 'slundbeck2m@about.com', 'Fujiayan', 304657);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Apple', 'myakhin2n@wordpress.com', 'Chouto', 574042);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Microsoft', 'bbowich2o@paginegialle.it', 'Georgiyevsk', 267262);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Amazon', 'ahawkings2p@rambler.ru', 'PinhÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o', 444896);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Google', 'acockton2q@opera.com', 'Haarlem', 358895);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Facebook', 'abratton2r@twitter.com', 'Bolkhov', 540808);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Tesla', 'lashfield2s@thetimes.co.uk', 'Noyon', 142586);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BerkshireHathaway', 'abruggen2t@sun.com', 'Oemollo', 759357);
insert into SUPPLIER (company_name, email, location, company_id)
values ('JohnsonJohnson', 'rgroombridge2u@usnews.com', 'Mascouche', 127323);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Walmart', 'nborder2v@naver.com', 'Busia', 936352);
insert into SUPPLIER (company_name, email, location, company_id)
values ('JPMorganChase', 'uraulston2w@latimes.com', 'Banjar Baleagung', 659492);
commit;
prompt 100 records committed...
insert into SUPPLIER (company_name, email, location, company_id)
values ('NVIDIA', 'gduff2y@slate.com', 'SÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o Paulo', 536781);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Visa', 'jwallwork2z@craigslist.org', 'Saint Joseph', 653673);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Mastercard', 'reaslea30@state.gov', 'KurÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³w', 803435);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UnitedHealthGroup', 'jlawful31@dailymotion.com', 'Wuping', 706700);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Disney', 'kbrundill32@flavors.me', 'Dzerzhinsk', 793799);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Nike', 'bpfaffel33@icio.us', 'Santo Domingo de los Colorados', 585005);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PayPal', 'pclark34@telegraph.co.uk', 'CubarÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡', 712051);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intel', 'asegge35@people.com.cn', 'Lutou', 732248);
insert into SUPPLIER (company_name, email, location, company_id)
values ('HomeDepot', 'jbyres36@wikispaces.com', 'Oslo', 128122);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Verizon', 'rlarkby37@icq.com', 'Babice', 433325);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PepsiCo', 'eenston39@ezinearticles.com', 'Baruta', 288228);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Netflix', 'idegan3a@ovh.net', 'Padangtikar', 525553);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Adobe', 'cdorgan3b@lycos.com', 'Fukiage-fujimi', 577314);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Salesforce', 'cmackaig3c@pen.io', 'Santa Fe', 539340);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ATT', 'dswapp3d@flickr.com', 'Nueva Arica', 111710);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Coca-Cola', 'glindstrom3e@surveymonkey.com', 'Safotu', 688945);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Oracle', 'abullick3f@netvibes.com', 'Novyy Oskol', 782335);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AbbVie', 'llantaff3g@yelp.com', 'Vera', 320561);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Cisco', 'dkatte3h@shop-pro.jp', 'Chuanxi', 573105);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Chevron', 'tbuckenham3i@tinypic.com', 'Dingshu', 103295);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Merck', 'lmcilherran3j@storify.com', 'Louiseville', 249582);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ExxonMobil', 'bderges3k@tripadvisor.com', 'Moroni', 934531);
insert into SUPPLIER (company_name, email, location, company_id)
values ('WaltDisney', 'ahearfield3l@google.es', 'Sindangsuka', 992140);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Costco', 'edelamaine3m@tripod.com', 'Qindu', 362308);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AmericanExpress', 'fdibner3n@arstechnica.com', 'Cipari Satu', 734519);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AbbottLaboratories', 'slemmertz3o@cpanel.net', 'MarÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Âdah', 146872);
insert into SUPPLIER (company_name, email, location, company_id)
values ('T-Mobile', 'ijudd3p@themeforest.net', 'Alaghsas', 878515);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Starbucks', 'emallord3q@columbia.edu', 'Pittsburgh', 429568);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GoldmanSachs', 'hishaki3s@mtv.com', 'Takum', 754902);
insert into SUPPLIER (company_name, email, location, company_id)
values ('LockheedMartin', 'jposse3t@foxnews.com', 'Weiting', 764883);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Bristol-MyersSquibb', 'mfothergill3u@jiathis.com', 'Valuyki', 846010);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Qualcomm', 'gmathew3v@ucla.edu', 'Cijoho', 295067);
insert into SUPPLIER (company_name, email, location, company_id)
values ('3M', 'gvasichev3w@wisc.edu', 'Shreveport', 102799);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PhilipMorris', 'vledingham3x@reference.com', 'Juru', 768879);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Medtronic', 'gzanetello3y@issuu.com', 'Mantingantengah', 352111);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Boeing', 'bkobpal3z@umich.edu', 'Xianyan', 161731);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GeneralElectric', 'ckewish40@ftc.gov', 'Gurinai', 165338);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Dow', 'iflindall41@google.nl', 'Barbosa', 720375);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MondelezInternational', 'zbates42@woothemes.com', 'Huangpu', 264639);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UnionPacific', 'trennix43@furl.net', 'Napoles', 672104);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Target', 'fhallsworth44@smh.com.au', 'Jieguanting', 705747);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BankofAmerica', 'rfeighney46@twitpic.com', 'Luyang', 818835);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Amgen', 'dollie47@apple.com', 'AlingsÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¥s', 728100);
insert into SUPPLIER (company_name, email, location, company_id)
values ('EliLilly', 'echarteris48@go.com', 'Lisui', 979383);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Pfizer', 'emenelaws49@jiathis.com', 'Fram', 371593);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UPS', 'ggiffon4a@sitemeter.com', 'New Yekepa', 238854);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intuit', 'csired4b@indiegogo.com', 'Tambaksari', 309700);
insert into SUPPLIER (company_name, email, location, company_id)
values ('TexasInstruments', 'kmeehan4c@nymag.com', 'Liuzikou', 328704);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MicronTechnology', 'dhadden4d@php.net', 'Yangcheng', 967143);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Ford', 'mmerrin4e@google.cn', 'Nanterre', 286769);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GeneralMotors', 'aprobetts4f@unblog.fr', 'Ciemas', 596991);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Colgate-Palmolive', 'fcluney4g@kickstarter.com', 'BÃƒÆ’Ã¢â‚¬Â¦ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢eclav', 389363);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Caterpillar', 'lberk4h@wisc.edu', 'Ashibetsu', 764186);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ConocoPhillips', 'ddeleek4i@usgs.gov', 'Louny', 415089);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Lowe', 'bodrought4j@upenn.edu', 'Xia Dawo', 330576);
insert into SUPPLIER (company_name, email, location, company_id)
values ('RaytheonTechnologies', 'bstellin4k@ovh.net', 'Cestas', 884471);
insert into SUPPLIER (company_name, email, location, company_id)
values ('KraftHeinz', 'njirzik4l@pagesperso-orange.fr', 'LibofshÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â«', 196742);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Exelon', 'lcapnerhurst4m@newsvine.com', 'Longgang', 934963);
insert into SUPPLIER (company_name, email, location, company_id)
values ('NextEraEnergy', 'awetwood4n@nasa.gov', 'Sarykemer', 399335);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AmericanAirlines', 'mlarrosa4o@mediafire.com', 'Huangbei', 122152);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Honeywell', 'ljochanany4p@businessweek.com', 'Xilin', 251203);
insert into SUPPLIER (company_name, email, location, company_id)
values ('McDonald', 'jtamplin4q@auda.org.au', 'Xudat', 233447);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Citigroup', 'caisbett4r@cbsnews.com', 'Panayagan', 653514);
insert into SUPPLIER (company_name, email, location, company_id)
values ('TheTravelersCompanies', 'saspin4t@ning.com', 'Hengshan', 711629);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Cigna', 'zmatuszkiewicz4u@unblog.fr', 'Liuyuan', 891266);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MarathonPetroleum', 'gelias4v@pinterest.com', 'Starotitarovskaya', 621996);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Aflac', 'ctudgay4w@unesco.org', 'MauÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©s', 303019);
insert into SUPPLIER (company_name, email, location, company_id)
values ('StateFarm', 'wgerrard4x@spotify.com', 'Rio das Pedras', 933010);
insert into SUPPLIER (company_name, email, location, company_id)
values ('LibertyMutual', 'mpetrello4y@netscape.com', 'Boa Vista', 143850);
insert into SUPPLIER (company_name, email, location, company_id)
values ('DeltaAirLines', 'rmcmurthy4z@imageshack.us', 'Hongjia', 207299);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BestBuy', 'awisker50@wordpress.org', 'Kwaluseni', 335000);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Paccar', 'aassinder51@360.cn', 'Zuya', 827718);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BaxterInternational', 'jkilvington52@barnesandnoble.com', 'Tuanshansi', 878400);
insert into SUPPLIER (company_name, email, location, company_id)
values ('DeereCompany', 'gknutsen54@scientificamerican.com', 'Lelystad', 599940);
insert into SUPPLIER (company_name, email, location, company_id)
values ('KelloggCompany', 'hitskovitz55@exblog.jp', 'Tanzhou', 530283);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Corning', 'wmurname56@lulu.com', 'Lagodekhi', 442131);
insert into SUPPLIER (company_name, email, location, company_id)
values ('NorthropGrumman', 'hobrogane57@wikimedia.org', 'Novogornyy', 849782);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Halliburton', 'lsilson58@is.gd', 'Balazar', 305632);
insert into SUPPLIER (company_name, email, location, company_id)
values ('FluorCorpora', 'pmaguire59@altervista.org', 'Longjin', 659229);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Apple', 'kspino5a@google.it', 'Belyye Stolby', 831697);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Microsoft', 'mgeharke5b@yandex.ru', 'Beidu', 711474);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Amazon', 'hrebanks5c@mlb.com', 'Damiao', 949691);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Google', 'ijennions5d@smugmug.com', 'Cabitan', 475805);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Facebook', 'bmilley5e@ocn.ne.jp', 'Woro', 916979);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Tesla', 'bbartoszewicz5f@kickstarter.com', 'Fukuoka-shi', 187878);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BerkshireHathaway', 'gdoerffer5g@gravatar.com', 'ParanavaÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­', 728989);
insert into SUPPLIER (company_name, email, location, company_id)
values ('JohnsonJohnson', 'flatus5h@gnu.org', 'Dzhiginka', 344353);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Walmart', 'dalekseev5i@google.com', 'Shejiang', 575635);
insert into SUPPLIER (company_name, email, location, company_id)
values ('JPMorganChase', 'mtayt5j@unblog.fr', 'Pasirangin Tiga', 463089);
insert into SUPPLIER (company_name, email, location, company_id)
values ('NVIDIA', 'twhitebread5l@oaic.gov.au', 'KokkinÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³choma', 713511);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Visa', 'bflobert5m@dell.com', 'Hedong', 469100);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Mastercard', 'fandreopolos5n@cnet.com', 'Mingjing', 375930);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UnitedHealthGroup', 'csmallcomb5o@tamu.edu', 'Tomepampa', 562628);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Disney', 'kstormonth5p@over-blog.com', 'Mariquita', 777373);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Nike', 'dlemin5q@princeton.edu', 'Taodian', 703871);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PayPal', 'nrohlfs5r@fotki.com', 'ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â½rnovnica', 778697);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intel', 'jransbury5s@mayoclinic.com', 'Gebre Guracha', 790484);
insert into SUPPLIER (company_name, email, location, company_id)
values ('HomeDepot', 'bmanuely5t@nasa.gov', 'Quimper', 518316);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Verizon', 'rricardot5u@aboutads.info', 'OmÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â«dcheh', 107803);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Comcast', 'thamlet5v@istockphoto.com', 'Karangtawar', 375773);
commit;
prompt 200 records committed...
insert into SUPPLIER (company_name, email, location, company_id)
values ('PepsiCo', 'fbasnett5w@smh.com.au', 'Staraya Kulatka', 807639);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Netflix', 'posmar5x@telegraph.co.uk', 'Masinloc', 237549);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Adobe', 'tagronski5y@smugmug.com', 'Umuahia', 841322);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Salesforce', 'anisco5z@hhs.gov', 'Xinfa', 873725);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ATT', 'nswaysland60@npr.org', 'Shanmu', 140250);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Coca-Cola', 'sbean61@marriott.com', 'MalanÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³w', 134885);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Oracle', 'abennoe62@tripod.com', 'Dayr MawÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Âs', 844889);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AbbVie', 'tcordsen63@twitter.com', 'Ust-Kamenogorsk', 157210);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Cisco', 'rbardill64@cdbaby.com', 'Qingyang', 369709);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Chevron', 'daldren65@businessweek.com', 'Yaodu', 356144);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Merck', 'eluesley66@weebly.com', 'Talisay', 917132);
insert into SUPPLIER (company_name, email, location, company_id)
values ('WaltDisney', 'aegginton68@webs.com', 'Bukui', 359634);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Costco', 'wbance69@dell.com', 'Yangcheng', 510324);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AmericanExpress', 'spursey6a@wufoo.com', 'Azteca', 910971);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AbbottLaboratories', 'xbidder6b@theguardian.com', 'RÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Âbigh', 985015);
insert into SUPPLIER (company_name, email, location, company_id)
values ('T-Mobile', 'hspellissy6c@yahoo.com', 'Dali', 722483);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Starbucks', 'sdayton6d@godaddy.com', 'Tanakbeak Daye', 416792);
insert into SUPPLIER (company_name, email, location, company_id)
values ('IBM', 'eloosemore6e@newsvine.com', 'Springfield', 189352);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GoldmanSachs', 'gwitheford6f@hud.gov', 'Washington', 177739);
insert into SUPPLIER (company_name, email, location, company_id)
values ('LockheedMartin', 'bcardus6g@disqus.com', 'Langley', 220223);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Bristol-MyersSquibb', 'nforst6h@tiny.cc', 'Bugko', 126717);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Qualcomm', 'msked6i@51.la', 'Skulsk', 427035);
insert into SUPPLIER (company_name, email, location, company_id)
values ('3M', 'sbeedom6j@flickr.com', 'CÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ndido Mota', 883539);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PhilipMorris', 'mhedworth6k@bloomberg.com', 'Vargem Grande', 224818);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Medtronic', 'izorer6l@imageshack.us', 'Chandra', 136018);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Boeing', 'jdonoghue6m@ebay.co.uk', 'Onsala', 528862);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GeneralElectric', 'ekolyagin6n@gnu.org', 'Simpang', 467904);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Dow', 'rpinwell6o@slate.com', 'Leleque', 198556);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MondelezInternational', 'gmacewan6p@mozilla.org', 'VasilikÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n', 595915);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UnionPacific', 'jdormand6q@nydailynews.com', 'Mosetse', 388265);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Target', 'mtottman6r@cloudflare.com', 'Juexi', 473182);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BookingHoldings', 'vwyke6s@behance.net', 'Panxi', 515680);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BankofAmerica', 'akeefe6t@comsenz.com', 'Hearst', 485562);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Amgen', 'gautry6u@squarespace.com', 'San Juan de Planes', 756963);
insert into SUPPLIER (company_name, email, location, company_id)
values ('EliLilly', 'rmccaffery6v@sbwire.com', 'Citangtu Kaler', 318440);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UPS', 'mdodimead6x@cloudflare.com', 'Xiatang', 629210);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intuit', 'cpreshaw6y@ucla.edu', 'DomanÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­n', 801194);
insert into SUPPLIER (company_name, email, location, company_id)
values ('TexasInstruments', 'dorehead6z@alexa.com', 'Durham', 694637);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MicronTechnology', 'tbickerdicke70@cafepress.com', 'Terny', 417309);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Ford', 'lkochlin71@uiuc.edu', 'Munsan', 241200);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GeneralMotors', 'mcarayol72@vinaora.com', 'Casilda', 556238);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Colgate-Palmolive', 'epapis73@g.co', 'Perosinho', 146614);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Caterpillar', 'skemmett74@google.fr', 'Enrekang', 102412);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ConocoPhillips', 'pwinkell75@bravesites.com', 'Jangheung', 830156);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Lowe', 'loluby76@friendfeed.com', 'Saratov', 189118);
insert into SUPPLIER (company_name, email, location, company_id)
values ('RaytheonTechnologies', 'bmerwe77@issuu.com', 'CiÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©naga de Oro', 879931);
insert into SUPPLIER (company_name, email, location, company_id)
values ('NextEraEnergy', 'lpikhno7a@artisteer.com', 'Jatirejo', 379050);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AmericanAirlines', 'nahrens7b@t.co', 'Hat Yai', 585434);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Honeywell', 'dsimnell7c@illinois.edu', 'Yosowilangun', 375067);
insert into SUPPLIER (company_name, email, location, company_id)
values ('McDonald', 'ymontes7d@mayoclinic.com', 'Sonorejo', 359030);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Citigroup', 'agresly7e@redcross.org', 'Lom Sak', 352413);
insert into SUPPLIER (company_name, email, location, company_id)
values ('CardinalHealth', 'olassetter7f@bbb.org', 'Pidvynohradiv', 315666);
insert into SUPPLIER (company_name, email, location, company_id)
values ('TheTravelersCompanies', 'alievesley7g@auda.org.au', 'Wodzierady', 295308);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Cigna', 'sbridat7h@seattletimes.com', 'Rufino', 681999);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MarathonPetroleum', 'mrumble7i@archive.org', 'Barcelona', 738308);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Aflac', 'tdick7j@is.gd', 'Marseille', 658633);
insert into SUPPLIER (company_name, email, location, company_id)
values ('StateFarm', 'scolston7k@geocities.com', 'Ronfe', 524906);
insert into SUPPLIER (company_name, email, location, company_id)
values ('LibertyMutual', 'fgulley7l@canalblog.com', 'ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¾ngelholm', 153254);
insert into SUPPLIER (company_name, email, location, company_id)
values ('DeltaAirLines', 'lahren7m@columbia.edu', 'Ageoshimo', 676756);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BestBuy', 'cbonnaire7n@naver.com', 'Jandayan', 907073);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Paccar', 'ljaneway7o@chron.com', 'Keruguya', 911536);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BaxterInternational', 'cperrins7p@ning.com', 'Las Varillas', 455682);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Broadcom', 'apople7q@dell.com', 'BeÃƒÆ’Ã¢â‚¬Â¦ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡sznica', 723943);
insert into SUPPLIER (company_name, email, location, company_id)
values ('DeereCompany', 'hcheer7r@so-net.ne.jp', 'Bilalang', 483074);
insert into SUPPLIER (company_name, email, location, company_id)
values ('KelloggCompany', 'wrounsefell7s@moonfruit.com', 'Futtsu', 964472);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Corning', 'shinchshaw7t@bravesites.com', 'Longde Chengguanzhen', 136522);
insert into SUPPLIER (company_name, email, location, company_id)
values ('NorthropGrumman', 'erenzo7u@csmonitor.com', 'Fresno', 812574);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Halliburton', 'hbrumbye7v@spiegel.de', 'Radviliskis', 222284);
insert into SUPPLIER (company_name, email, location, company_id)
values ('FluorCorpora', 'vdowne7w@berkeley.edu', 'Ipojuca', 288206);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Apple', 'cfosten7x@dropbox.com', 'Colombes', 690901);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Microsoft', 'crenison7y@imgur.com', 'Santa Cristina Couto', 843774);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Google', 'dbexon80@is.gd', 'Wajir', 526676);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Facebook', 'ltynewell81@hubpages.com', 'Pasanggrahan', 957368);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Tesla', 'mburless82@instagram.com', 'Vila Moreira', 246227);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BerkshireHathaway', 'mgemmill83@house.gov', 'Vreshtas', 524309);
insert into SUPPLIER (company_name, email, location, company_id)
values ('JohnsonJohnson', 'jrobrow84@google.co.jp', 'Porosozero', 652421);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Walmart', 'amcgregor85@stanford.edu', 'Sindangraja', 667423);
insert into SUPPLIER (company_name, email, location, company_id)
values ('JPMorganChase', 'rhaslewood86@fc2.com', 'Jenamas', 754612);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ProcterGamble', 'lfeatherbie87@nasa.gov', 'Penha Longa', 635306);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Visa', 'ctewkesbury89@jalbum.net', 'Belyy Gorodok', 884946);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Mastercard', 'gainslee8a@forbes.com', 'Xinchengzi', 636026);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UnitedHealthGroup', 'vartindale8b@virginia.edu', 'Praimarada', 953372);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Disney', 'lbon8c@photobucket.com', 'Minuwangoda', 230529);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Nike', 'uyewdall8d@census.gov', 'Maple Plain', 355134);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PayPal', 'wszimon8e@cmu.edu', 'Ovalle', 509699);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intel', 'gpurdey8f@reverbnation.com', 'Xiaodukou', 576239);
insert into SUPPLIER (company_name, email, location, company_id)
values ('HomeDepot', 'cfrick8g@bbc.co.uk', 'Estrada', 732871);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Verizon', 'tconre8h@google.nl', 'Guniushan', 502119);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Comcast', 'dcovil8i@columbia.edu', 'Nkhotakota', 484849);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PepsiCo', 'shilldrup8j@canalblog.com', 'Bogale', 234806);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Netflix', 'thatfull8k@home.pl', 'Paris La DÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©fense', 354355);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Adobe', 'ekennham8l@yellowbook.com', 'Roissy Charles-de-Gaulle', 347273);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Salesforce', 'mreidie8m@cornell.edu', 'Lysekil', 619896);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ATT', 'cyaneev8n@google.de', 'Lisovi Sorochyntsi', 443922);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Coca-Cola', 'cgytesham8o@wordpress.com', 'Greenland', 255638);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Oracle', 'goveral8p@devhub.com', 'Yutan', 320010);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AbbVie', 'lforsdyke8q@dell.com', 'SantarÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©m', 362220);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Cisco', 'kkarpe8r@biglobe.ne.jp', 'Priiskovyy', 293113);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Chevron', 'ashorten8s@dailymail.co.uk', 'Cikadu', 339228);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Merck', 'dscriven8t@ebay.com', 'Sadao', 799402);
commit;
prompt 300 records committed...
insert into SUPPLIER (company_name, email, location, company_id)
values ('ExxonMobil', 'jmogey8u@bizjournals.com', 'Shijie', 942713);
insert into SUPPLIER (company_name, email, location, company_id)
values ('WaltDisney', 'ccullagh8v@w3.org', 'Ozerki', 584594);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Costco', 'drown8w@csmonitor.com', 'SpÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡rti', 652389);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AmericanExpress', 'belphinston8x@huffingtonpost.com', 'Silago', 133266);
insert into SUPPLIER (company_name, email, location, company_id)
values ('T-Mobile', 'ghasselby8z@ameblo.jp', 'Yungaisi', 245601);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Starbucks', 'mcapnor90@squidoo.com', 'Zopilotepe', 947405);
insert into SUPPLIER (company_name, email, location, company_id)
values ('IBM', 'mgoadsby91@bizjournals.com', 'CotÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©-Lai', 934288);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GoldmanSachs', 'tbruinemann92@mapy.cz', 'Eirado', 259808);
insert into SUPPLIER (company_name, email, location, company_id)
values ('LockheedMartin', 'mkornyshev93@rambler.ru', 'Bang Ban', 845751);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Bristol-MyersSquibb', 'swetherald94@admin.ch', 'Corinto', 675098);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Qualcomm', 'tswaby95@yolasite.com', 'Shaoguan', 166526);
insert into SUPPLIER (company_name, email, location, company_id)
values ('3M', 'cfarebrother96@ed.gov', 'Karatau', 442497);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PhilipMorris', 'lculleton97@comsenz.com', 'Xinjian', 519742);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Medtronic', 'abroadis98@mashable.com', 'Barru', 206468);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Boeing', 'qesslemont99@marriott.com', 'Banjar Parekan', 993284);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GeneralElectric', 'tbaptist9a@51.la', 'Jiangna', 559041);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Dow', 'dferrolli9b@netscape.com', 'NÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡chod', 528287);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MondelezInternational', 'ttwigg9c@blogtalkradio.com', 'Macia', 922534);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UnionPacific', 'jjaffray9d@about.com', 'Marseille', 718919);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Target', 'amannooch9e@smh.com.au', 'Cicurug', 257597);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BookingHoldings', 'lmalitrott9f@google.co.jp', 'Baiyashi', 301206);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BankofAmerica', 'giannetti9g@telegraph.co.uk', 'Pesnica pri Mariboru', 541256);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Amgen', 'czylberdik9h@slate.com', 'Jianjiang', 874780);
insert into SUPPLIER (company_name, email, location, company_id)
values ('EliLilly', 'lflaxman9i@washingtonpost.com', 'Bulog', 359198);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Pfizer', 'mjockle9j@elegantthemes.com', 'BÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©lel', 506400);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UPS', 'mswadlin9k@bbb.org', 'Nongba', 354580);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intuit', 'daymes9l@ibm.com', 'Salcedo', 765169);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MicronTechnology', 'bpoli9n@printfriendly.com', 'Holma', 171309);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Ford', 'kfardy9o@prnewswire.com', 'Cruz Alta', 648923);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GeneralMotors', 'chaggidon9p@marriott.com', 'LinkÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¶ping', 770372);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Colgate-Palmolive', 'ljohnston9q@discuz.net', 'Jiangti', 267947);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ConocoPhillips', 'ctattersall9s@plala.or.jp', 'Maluso', 454847);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Lowe', 'lcapstick9t@zimbio.com', 'Malabago', 990532);
insert into SUPPLIER (company_name, email, location, company_id)
values ('RaytheonTechnologies', 'fcholerton9u@cdbaby.com', 'Erie', 106613);
insert into SUPPLIER (company_name, email, location, company_id)
values ('KraftHeinz', 'hbrookzie9v@edublogs.org', 'Njivice', 195760);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Exelon', 'mdegiorgi9w@upenn.edu', 'Kitami', 671136);
insert into SUPPLIER (company_name, email, location, company_id)
values ('NextEraEnergy', 'bfrankton9x@uiuc.edu', 'Romanovskaya', 787979);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AmericanAirlines', 'wdavidy9y@unc.edu', 'Flying Fish Cove', 647597);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Honeywell', 'nwhitfeld9z@dell.com', 'CaÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§apava do Sul', 309897);
insert into SUPPLIER (company_name, email, location, company_id)
values ('McDonald', 'eoddeya0@yale.edu', 'Shelabolikha', 836345);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Citigroup', 'vsimkoa1@hao123.com', 'Amboasary', 691010);
insert into SUPPLIER (company_name, email, location, company_id)
values ('CardinalHealth', 'aguessa2@joomla.org', 'BÃƒÆ’Ã¢â‚¬Â¦ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡aszki', 120778);
insert into SUPPLIER (company_name, email, location, company_id)
values ('TheTravelersCompanies', 'rstricka3@springer.com', 'Anuling', 591527);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Cigna', 'ntoderinia4@bloglines.com', 'Paris 17', 990890);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MarathonPetroleum', 'lthrowera5@over-blog.com', 'Nuevo ArraijÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡n', 987789);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Aflac', 'gcurra6@arstechnica.com', 'Changnyeong', 328041);
insert into SUPPLIER (company_name, email, location, company_id)
values ('StateFarm', 'fstiegera7@marketwatch.com', 'Carreira', 145155);
insert into SUPPLIER (company_name, email, location, company_id)
values ('LibertyMutual', 'omcilmorowa8@senate.gov', 'Stanari', 575252);
insert into SUPPLIER (company_name, email, location, company_id)
values ('DeltaAirLines', 'edurtnala9@ustream.tv', 'SÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o Francisco do Sul', 671990);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BestBuy', 'hwenmanaa@twitpic.com', 'Hamburg', 724069);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Paccar', 'kmcmichanab@amazon.de', 'Dieppe', 934583);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BaxterInternational', 'heickhoffac@newsvine.com', 'Marseille', 504234);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Broadcom', 'cmoodiead@dion.ne.jp', 'Dazi', 386877);
insert into SUPPLIER (company_name, email, location, company_id)
values ('DeereCompany', 'bevequeae@t-online.de', 'Maradi', 336683);
insert into SUPPLIER (company_name, email, location, company_id)
values ('KelloggCompany', 'tleithgoeaf@soundcloud.com', 'Alak', 647814);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Corning', 'ssnookag@histats.com', 'Sidaraja', 201649);
insert into SUPPLIER (company_name, email, location, company_id)
values ('NorthropGrumman', 'rwickrathah@berkeley.edu', 'Union', 401716);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Halliburton', 'kdebleai@liveinternet.ru', 'Seremban', 918505);
insert into SUPPLIER (company_name, email, location, company_id)
values ('FluorCorpora', 'leverilaj@time.com', 'MendÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â«', 968359);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Apple', 'jleverentzak@ovh.net', 'Hovtashen', 169308);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Amazon', 'rcromleyam@arizona.edu', 'Gnojnica', 195334);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Google', 'hearsmanan@edublogs.org', 'DobÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¡ice', 251729);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Facebook', 'mlortzingao@icio.us', 'Silae', 952724);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BerkshireHathaway', 'deveralaq@weather.com', 'KobeÃƒÆ’Ã¢â‚¬Â¦ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ice', 595057);
insert into SUPPLIER (company_name, email, location, company_id)
values ('JohnsonJohnson', 'emarkiear@over-blog.com', 'Kawasaki', 284202);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Walmart', 'lburrenas@imgur.com', 'Xinying', 838771);
insert into SUPPLIER (company_name, email, location, company_id)
values ('JPMorganChase', 'ttidyat@usgs.gov', 'Poshnje', 890546);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ProcterGamble', 'bbenziau@example.com', 'Tuohua', 210508);
insert into SUPPLIER (company_name, email, location, company_id)
values ('NVIDIA', 'ctaggettav@gravatar.com', 'Jiangduo', 442019);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Visa', 'umcomishaw@cafepress.com', 'San Antonio', 888797);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Mastercard', 'vneeshamax@woothemes.com', 'Carabamba', 473993);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UnitedHealthGroup', 'mendonay@networksolutions.com', 'Julita', 925759);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Disney', 'rseverwrightaz@admin.ch', 'Shreveport', 649517);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Nike', 'cberreclothb0@hugedomains.com', 'EnkÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¶ping', 163939);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PayPal', 'kwilliamsonb1@cdc.gov', 'Phichit', 366418);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intel', 'llapthorneb2@jimdo.com', 'Plasy', 574469);
insert into SUPPLIER (company_name, email, location, company_id)
values ('HomeDepot', 'fhogbourneb3@bloomberg.com', 'Firovo', 237629);
commit;
prompt 377 records loaded
prompt Loading SUPPLIES...
insert into SUPPLIES (company_id, store_id)
values (102412, 6586650711);
insert into SUPPLIES (company_id, store_id)
values (102799, 7094245914);
insert into SUPPLIES (company_id, store_id)
values (102950, 9947274359);
insert into SUPPLIES (company_id, store_id)
values (103295, 6958849171);
insert into SUPPLIES (company_id, store_id)
values (106613, 2619360974);
insert into SUPPLIES (company_id, store_id)
values (107803, 9055110599);
insert into SUPPLIES (company_id, store_id)
values (111710, 1695723512);
insert into SUPPLIES (company_id, store_id)
values (120778, 479735255);
insert into SUPPLIES (company_id, store_id)
values (122152, 2828855385);
insert into SUPPLIES (company_id, store_id)
values (126717, 6559900244);
insert into SUPPLIES (company_id, store_id)
values (127323, 7001159921);
insert into SUPPLIES (company_id, store_id)
values (128122, 8772493343);
insert into SUPPLIES (company_id, store_id)
values (133266, 9774061637);
insert into SUPPLIES (company_id, store_id)
values (134885, 8734165994);
insert into SUPPLIES (company_id, store_id)
values (136018, 1485190959);
insert into SUPPLIES (company_id, store_id)
values (136522, 1261413139);
insert into SUPPLIES (company_id, store_id)
values (137689, 8761922338);
insert into SUPPLIES (company_id, store_id)
values (140250, 3824071590);
insert into SUPPLIES (company_id, store_id)
values (142586, 7732712269);
insert into SUPPLIES (company_id, store_id)
values (143701, 3220487253);
insert into SUPPLIES (company_id, store_id)
values (143850, 3855948706);
insert into SUPPLIES (company_id, store_id)
values (145155, 6317605166);
insert into SUPPLIES (company_id, store_id)
values (146614, 7824424657);
insert into SUPPLIES (company_id, store_id)
values (146872, 1281019521);
insert into SUPPLIES (company_id, store_id)
values (151273, 127338072);
insert into SUPPLIES (company_id, store_id)
values (153254, 5740985568);
insert into SUPPLIES (company_id, store_id)
values (154318, 2996647879);
insert into SUPPLIES (company_id, store_id)
values (154618, 7689428194);
insert into SUPPLIES (company_id, store_id)
values (157210, 6310702033);
insert into SUPPLIES (company_id, store_id)
values (161731, 663483986);
insert into SUPPLIES (company_id, store_id)
values (163939, 265482596);
insert into SUPPLIES (company_id, store_id)
values (165338, 3048079767);
insert into SUPPLIES (company_id, store_id)
values (166526, 2081070241);
insert into SUPPLIES (company_id, store_id)
values (169308, 9832737195);
insert into SUPPLIES (company_id, store_id)
values (171309, 209254136);
insert into SUPPLIES (company_id, store_id)
values (173066, 5094140215);
insert into SUPPLIES (company_id, store_id)
values (177739, 9322452254);
insert into SUPPLIES (company_id, store_id)
values (187878, 3166073625);
insert into SUPPLIES (company_id, store_id)
values (188026, 44779413);
insert into SUPPLIES (company_id, store_id)
values (189118, 7404015917);
insert into SUPPLIES (company_id, store_id)
values (189352, 2314952425);
insert into SUPPLIES (company_id, store_id)
values (195334, 4024776489);
insert into SUPPLIES (company_id, store_id)
values (195760, 9893338138);
insert into SUPPLIES (company_id, store_id)
values (196742, 4615379066);
insert into SUPPLIES (company_id, store_id)
values (198556, 3749590920);
insert into SUPPLIES (company_id, store_id)
values (201649, 5150734028);
insert into SUPPLIES (company_id, store_id)
values (206468, 1556576479);
insert into SUPPLIES (company_id, store_id)
values (207299, 188126018);
insert into SUPPLIES (company_id, store_id)
values (210508, 5066853243);
insert into SUPPLIES (company_id, store_id)
values (217990, 1627572129);
insert into SUPPLIES (company_id, store_id)
values (220223, 5172408020);
insert into SUPPLIES (company_id, store_id)
values (222284, 8367450085);
insert into SUPPLIES (company_id, store_id)
values (224818, 3329377019);
insert into SUPPLIES (company_id, store_id)
values (226775, 6954833971);
insert into SUPPLIES (company_id, store_id)
values (230529, 2740526322);
insert into SUPPLIES (company_id, store_id)
values (233447, 9719981141);
insert into SUPPLIES (company_id, store_id)
values (234806, 9353106044);
insert into SUPPLIES (company_id, store_id)
values (237549, 4440812047);
insert into SUPPLIES (company_id, store_id)
values (237629, 3609675609);
insert into SUPPLIES (company_id, store_id)
values (238854, 7405919321);
insert into SUPPLIES (company_id, store_id)
values (240924, 5494311415);
insert into SUPPLIES (company_id, store_id)
values (241200, 4470308572);
insert into SUPPLIES (company_id, store_id)
values (245601, 7597390758);
insert into SUPPLIES (company_id, store_id)
values (246227, 1129019389);
insert into SUPPLIES (company_id, store_id)
values (249582, 4237643702);
insert into SUPPLIES (company_id, store_id)
values (251203, 9662472323);
insert into SUPPLIES (company_id, store_id)
values (251729, 6784021008);
insert into SUPPLIES (company_id, store_id)
values (252651, 684943291);
insert into SUPPLIES (company_id, store_id)
values (255638, 1493446177);
insert into SUPPLIES (company_id, store_id)
values (256875, 8994723781);
insert into SUPPLIES (company_id, store_id)
values (257597, 1368073561);
insert into SUPPLIES (company_id, store_id)
values (259808, 8840679769);
insert into SUPPLIES (company_id, store_id)
values (262667, 261407387);
insert into SUPPLIES (company_id, store_id)
values (264639, 1489063880);
insert into SUPPLIES (company_id, store_id)
values (267262, 9709423948);
insert into SUPPLIES (company_id, store_id)
values (267947, 900496394);
insert into SUPPLIES (company_id, store_id)
values (275177, 3029221199);
insert into SUPPLIES (company_id, store_id)
values (277568, 7323150268);
insert into SUPPLIES (company_id, store_id)
values (284202, 6810415683);
insert into SUPPLIES (company_id, store_id)
values (286769, 8171193171);
insert into SUPPLIES (company_id, store_id)
values (288206, 850149958);
insert into SUPPLIES (company_id, store_id)
values (288228, 131447274);
insert into SUPPLIES (company_id, store_id)
values (290983, 5882221317);
insert into SUPPLIES (company_id, store_id)
values (291669, 4309160419);
insert into SUPPLIES (company_id, store_id)
values (293113, 3466456849);
insert into SUPPLIES (company_id, store_id)
values (293540, 8057578690);
insert into SUPPLIES (company_id, store_id)
values (295067, 9676309403);
insert into SUPPLIES (company_id, store_id)
values (295308, 3910656292);
insert into SUPPLIES (company_id, store_id)
values (299674, 711915037);
insert into SUPPLIES (company_id, store_id)
values (301206, 3799577075);
insert into SUPPLIES (company_id, store_id)
values (303019, 2255353139);
insert into SUPPLIES (company_id, store_id)
values (304657, 198493237);
insert into SUPPLIES (company_id, store_id)
values (305632, 7194272436);
insert into SUPPLIES (company_id, store_id)
values (309700, 6517710118);
insert into SUPPLIES (company_id, store_id)
values (309897, 9974190274);
insert into SUPPLIES (company_id, store_id)
values (315666, 7449507055);
insert into SUPPLIES (company_id, store_id)
values (318440, 2759393);
insert into SUPPLIES (company_id, store_id)
values (320010, 8367317858);
insert into SUPPLIES (company_id, store_id)
values (320561, 4682958986);
insert into SUPPLIES (company_id, store_id)
values (328041, 2650179284);
commit;
prompt 100 records committed...
insert into SUPPLIES (company_id, store_id)
values (328704, 5986847282);
insert into SUPPLIES (company_id, store_id)
values (330576, 3671015115);
insert into SUPPLIES (company_id, store_id)
values (335000, 298592433);
insert into SUPPLIES (company_id, store_id)
values (336683, 3106691424);
insert into SUPPLIES (company_id, store_id)
values (337426, 9851046040);
insert into SUPPLIES (company_id, store_id)
values (339228, 5896707556);
insert into SUPPLIES (company_id, store_id)
values (344353, 272314523);
insert into SUPPLIES (company_id, store_id)
values (347273, 260155129);
insert into SUPPLIES (company_id, store_id)
values (350517, 7434237718);
insert into SUPPLIES (company_id, store_id)
values (351987, 9912916709);
insert into SUPPLIES (company_id, store_id)
values (352111, 8870701376);
insert into SUPPLIES (company_id, store_id)
values (352410, 6640968939);
insert into SUPPLIES (company_id, store_id)
values (352413, 3012025231);
insert into SUPPLIES (company_id, store_id)
values (354355, 9933939684);
insert into SUPPLIES (company_id, store_id)
values (354580, 1777614297);
insert into SUPPLIES (company_id, store_id)
values (355134, 1697357799);
insert into SUPPLIES (company_id, store_id)
values (356144, 3561117427);
insert into SUPPLIES (company_id, store_id)
values (358895, 9427109086);
insert into SUPPLIES (company_id, store_id)
values (359030, 4035042798);
insert into SUPPLIES (company_id, store_id)
values (359198, 4613136344);
insert into SUPPLIES (company_id, store_id)
values (359634, 6247731793);
insert into SUPPLIES (company_id, store_id)
values (362220, 8920688122);
insert into SUPPLIES (company_id, store_id)
values (362308, 1674658590);
insert into SUPPLIES (company_id, store_id)
values (362524, 5773732563);
insert into SUPPLIES (company_id, store_id)
values (366070, 4382214167);
insert into SUPPLIES (company_id, store_id)
values (366104, 8719506268);
insert into SUPPLIES (company_id, store_id)
values (366418, 2313663892);
insert into SUPPLIES (company_id, store_id)
values (369709, 28008819);
insert into SUPPLIES (company_id, store_id)
values (370213, 6064937749);
insert into SUPPLIES (company_id, store_id)
values (371593, 5281120135);
insert into SUPPLIES (company_id, store_id)
values (375067, 7706462827);
insert into SUPPLIES (company_id, store_id)
values (375773, 8889599837);
insert into SUPPLIES (company_id, store_id)
values (375930, 8935672982);
insert into SUPPLIES (company_id, store_id)
values (379050, 4081165844);
insert into SUPPLIES (company_id, store_id)
values (386877, 6226352815);
insert into SUPPLIES (company_id, store_id)
values (388265, 5355522402);
insert into SUPPLIES (company_id, store_id)
values (389363, 1925464105);
insert into SUPPLIES (company_id, store_id)
values (394537, 1009400256);
insert into SUPPLIES (company_id, store_id)
values (399335, 9691746383);
insert into SUPPLIES (company_id, store_id)
values (401716, 4046490551);
insert into SUPPLIES (company_id, store_id)
values (413629, 9422744030);
insert into SUPPLIES (company_id, store_id)
values (415089, 5137393457);
insert into SUPPLIES (company_id, store_id)
values (416792, 2366342534);
insert into SUPPLIES (company_id, store_id)
values (417309, 3087552079);
insert into SUPPLIES (company_id, store_id)
values (418693, 8008467226);
insert into SUPPLIES (company_id, store_id)
values (427035, 3975703508);
insert into SUPPLIES (company_id, store_id)
values (429568, 373156598);
insert into SUPPLIES (company_id, store_id)
values (433325, 9718088970);
insert into SUPPLIES (company_id, store_id)
values (442019, 546285283);
insert into SUPPLIES (company_id, store_id)
values (442131, 4743275322);
insert into SUPPLIES (company_id, store_id)
values (442497, 5903693783);
insert into SUPPLIES (company_id, store_id)
values (443922, 1292917045);
insert into SUPPLIES (company_id, store_id)
values (444896, 9792008952);
insert into SUPPLIES (company_id, store_id)
values (444940, 3558617930);
insert into SUPPLIES (company_id, store_id)
values (454847, 8781434597);
insert into SUPPLIES (company_id, store_id)
values (455682, 5468834990);
insert into SUPPLIES (company_id, store_id)
values (463089, 6996515713);
insert into SUPPLIES (company_id, store_id)
values (464893, 5755503158);
insert into SUPPLIES (company_id, store_id)
values (466659, 8978310700);
insert into SUPPLIES (company_id, store_id)
values (467493, 4094829436);
insert into SUPPLIES (company_id, store_id)
values (467904, 3519532740);
insert into SUPPLIES (company_id, store_id)
values (469100, 3780928275);
insert into SUPPLIES (company_id, store_id)
values (472841, 3295113117);
insert into SUPPLIES (company_id, store_id)
values (473182, 799358136);
insert into SUPPLIES (company_id, store_id)
values (473993, 7148321307);
insert into SUPPLIES (company_id, store_id)
values (474785, 4993512060);
insert into SUPPLIES (company_id, store_id)
values (475805, 8356241074);
insert into SUPPLIES (company_id, store_id)
values (483074, 4092892706);
insert into SUPPLIES (company_id, store_id)
values (484849, 2771095897);
insert into SUPPLIES (company_id, store_id)
values (485562, 1438361279);
insert into SUPPLIES (company_id, store_id)
values (494195, 2051033117);
insert into SUPPLIES (company_id, store_id)
values (502119, 167476784);
insert into SUPPLIES (company_id, store_id)
values (504234, 2160440590);
insert into SUPPLIES (company_id, store_id)
values (506400, 7058052664);
insert into SUPPLIES (company_id, store_id)
values (509699, 6491145944);
insert into SUPPLIES (company_id, store_id)
values (510324, 7551884229);
insert into SUPPLIES (company_id, store_id)
values (515680, 8272317810);
insert into SUPPLIES (company_id, store_id)
values (518248, 4193257857);
insert into SUPPLIES (company_id, store_id)
values (518316, 1341843981);
insert into SUPPLIES (company_id, store_id)
values (519742, 4340842495);
insert into SUPPLIES (company_id, store_id)
values (524309, 2746852182);
insert into SUPPLIES (company_id, store_id)
values (524906, 7703434216);
insert into SUPPLIES (company_id, store_id)
values (525553, 7442771353);
insert into SUPPLIES (company_id, store_id)
values (526676, 3201043602);
insert into SUPPLIES (company_id, store_id)
values (528204, 4532819678);
insert into SUPPLIES (company_id, store_id)
values (528287, 3023914742);
insert into SUPPLIES (company_id, store_id)
values (528862, 2191549381);
insert into SUPPLIES (company_id, store_id)
values (530283, 6224217074);
insert into SUPPLIES (company_id, store_id)
values (536781, 9603944310);
insert into SUPPLIES (company_id, store_id)
values (539340, 1245195236);
insert into SUPPLIES (company_id, store_id)
values (540808, 4456118071);
insert into SUPPLIES (company_id, store_id)
values (541256, 208465955);
insert into SUPPLIES (company_id, store_id)
values (556238, 3380981990);
insert into SUPPLIES (company_id, store_id)
values (558872, 3033908172);
insert into SUPPLIES (company_id, store_id)
values (559041, 1488574064);
insert into SUPPLIES (company_id, store_id)
values (559146, 7998045433);
insert into SUPPLIES (company_id, store_id)
values (562628, 1985703929);
insert into SUPPLIES (company_id, store_id)
values (569968, 9542897224);
insert into SUPPLIES (company_id, store_id)
values (570476, 7989090403);
insert into SUPPLIES (company_id, store_id)
values (573105, 3079312747);
commit;
prompt 200 records committed...
insert into SUPPLIES (company_id, store_id)
values (574042, 7752406588);
insert into SUPPLIES (company_id, store_id)
values (574469, 1836771829);
insert into SUPPLIES (company_id, store_id)
values (575252, 7163319710);
insert into SUPPLIES (company_id, store_id)
values (575635, 2853209284);
insert into SUPPLIES (company_id, store_id)
values (576239, 4034737735);
insert into SUPPLIES (company_id, store_id)
values (577314, 1649583078);
insert into SUPPLIES (company_id, store_id)
values (581216, 4473030814);
insert into SUPPLIES (company_id, store_id)
values (584594, 6414717976);
insert into SUPPLIES (company_id, store_id)
values (585005, 9398613622);
insert into SUPPLIES (company_id, store_id)
values (585434, 6361451930);
insert into SUPPLIES (company_id, store_id)
values (591527, 1457671959);
insert into SUPPLIES (company_id, store_id)
values (595057, 2089357011);
insert into SUPPLIES (company_id, store_id)
values (595915, 8640946841);
insert into SUPPLIES (company_id, store_id)
values (596991, 4942167703);
insert into SUPPLIES (company_id, store_id)
values (599908, 2635359704);
insert into SUPPLIES (company_id, store_id)
values (599940, 1234693204);
insert into SUPPLIES (company_id, store_id)
values (611466, 560519940);
insert into SUPPLIES (company_id, store_id)
values (613036, 5504829974);
insert into SUPPLIES (company_id, store_id)
values (619896, 9098809595);
insert into SUPPLIES (company_id, store_id)
values (621996, 2505310704);
insert into SUPPLIES (company_id, store_id)
values (629210, 2893899139);
insert into SUPPLIES (company_id, store_id)
values (635306, 9144536098);
insert into SUPPLIES (company_id, store_id)
values (636026, 1007528486);
insert into SUPPLIES (company_id, store_id)
values (647597, 8746782320);
insert into SUPPLIES (company_id, store_id)
values (647814, 7455337253);
insert into SUPPLIES (company_id, store_id)
values (648923, 7268923610);
insert into SUPPLIES (company_id, store_id)
values (649517, 2480992828);
insert into SUPPLIES (company_id, store_id)
values (650634, 4305773626);
insert into SUPPLIES (company_id, store_id)
values (652389, 9271702664);
insert into SUPPLIES (company_id, store_id)
values (652421, 9478531595);
insert into SUPPLIES (company_id, store_id)
values (653216, 9560385514);
insert into SUPPLIES (company_id, store_id)
values (653514, 7183055861);
insert into SUPPLIES (company_id, store_id)
values (653673, 8250848739);
insert into SUPPLIES (company_id, store_id)
values (658633, 2126843023);
insert into SUPPLIES (company_id, store_id)
values (659073, 43859418);
insert into SUPPLIES (company_id, store_id)
values (659229, 8981396378);
insert into SUPPLIES (company_id, store_id)
values (659492, 4314102466);
insert into SUPPLIES (company_id, store_id)
values (666125, 3379209368);
insert into SUPPLIES (company_id, store_id)
values (667423, 6308448206);
insert into SUPPLIES (company_id, store_id)
values (671136, 9975891720);
insert into SUPPLIES (company_id, store_id)
values (671990, 3213318404);
insert into SUPPLIES (company_id, store_id)
values (672104, 362072609);
insert into SUPPLIES (company_id, store_id)
values (675098, 617915992);
insert into SUPPLIES (company_id, store_id)
values (676756, 3756708831);
insert into SUPPLIES (company_id, store_id)
values (681999, 2023192352);
insert into SUPPLIES (company_id, store_id)
values (688945, 9010351513);
insert into SUPPLIES (company_id, store_id)
values (690901, 2864089839);
insert into SUPPLIES (company_id, store_id)
values (691010, 7605192682);
insert into SUPPLIES (company_id, store_id)
values (694637, 5247882929);
insert into SUPPLIES (company_id, store_id)
values (703871, 3469925177);
insert into SUPPLIES (company_id, store_id)
values (705747, 5739282429);
insert into SUPPLIES (company_id, store_id)
values (706319, 3432086456);
insert into SUPPLIES (company_id, store_id)
values (706700, 3199368328);
insert into SUPPLIES (company_id, store_id)
values (711474, 1310384304);
insert into SUPPLIES (company_id, store_id)
values (711629, 7419201939);
insert into SUPPLIES (company_id, store_id)
values (712015, 7857194612);
insert into SUPPLIES (company_id, store_id)
values (712051, 112043827);
insert into SUPPLIES (company_id, store_id)
values (713511, 3462661594);
insert into SUPPLIES (company_id, store_id)
values (717258, 8741317356);
insert into SUPPLIES (company_id, store_id)
values (717610, 1069660621);
insert into SUPPLIES (company_id, store_id)
values (717643, 7159771341);
insert into SUPPLIES (company_id, store_id)
values (718919, 1770851029);
insert into SUPPLIES (company_id, store_id)
values (720375, 1015657414);
insert into SUPPLIES (company_id, store_id)
values (722483, 1962143604);
insert into SUPPLIES (company_id, store_id)
values (723943, 6042288054);
insert into SUPPLIES (company_id, store_id)
values (724069, 5176914888);
insert into SUPPLIES (company_id, store_id)
values (728100, 7717664071);
insert into SUPPLIES (company_id, store_id)
values (728989, 4740632252);
insert into SUPPLIES (company_id, store_id)
values (732248, 6484335275);
insert into SUPPLIES (company_id, store_id)
values (732488, 8015551792);
insert into SUPPLIES (company_id, store_id)
values (732871, 3578687032);
insert into SUPPLIES (company_id, store_id)
values (734519, 4399125649);
insert into SUPPLIES (company_id, store_id)
values (737743, 1434253358);
insert into SUPPLIES (company_id, store_id)
values (738303, 5381021633);
insert into SUPPLIES (company_id, store_id)
values (738308, 4196055991);
insert into SUPPLIES (company_id, store_id)
values (754612, 6649963460);
insert into SUPPLIES (company_id, store_id)
values (754902, 3130013219);
insert into SUPPLIES (company_id, store_id)
values (756451, 8527911504);
insert into SUPPLIES (company_id, store_id)
values (756963, 9005316961);
insert into SUPPLIES (company_id, store_id)
values (757260, 5260113197);
insert into SUPPLIES (company_id, store_id)
values (758458, 3472501279);
insert into SUPPLIES (company_id, store_id)
values (759357, 9862505986);
insert into SUPPLIES (company_id, store_id)
values (759481, 3824994328);
insert into SUPPLIES (company_id, store_id)
values (760359, 4041541856);
insert into SUPPLIES (company_id, store_id)
values (764186, 3105156743);
insert into SUPPLIES (company_id, store_id)
values (764883, 9126746616);
insert into SUPPLIES (company_id, store_id)
values (765169, 9067753838);
insert into SUPPLIES (company_id, store_id)
values (766704, 8763912363);
insert into SUPPLIES (company_id, store_id)
values (768879, 6406506193);
insert into SUPPLIES (company_id, store_id)
values (770372, 2126725238);
insert into SUPPLIES (company_id, store_id)
values (774157, 1394366144);
insert into SUPPLIES (company_id, store_id)
values (777373, 6737760058);
insert into SUPPLIES (company_id, store_id)
values (778697, 6140354405);
insert into SUPPLIES (company_id, store_id)
values (780947, 9018685179);
insert into SUPPLIES (company_id, store_id)
values (782335, 9726857902);
insert into SUPPLIES (company_id, store_id)
values (787809, 6051015683);
insert into SUPPLIES (company_id, store_id)
values (787979, 9431365316);
insert into SUPPLIES (company_id, store_id)
values (790484, 3039337505);
insert into SUPPLIES (company_id, store_id)
values (793799, 4549105621);
insert into SUPPLIES (company_id, store_id)
values (795523, 7856772511);
commit;
prompt 300 records committed...
insert into SUPPLIES (company_id, store_id)
values (799402, 1236262640);
insert into SUPPLIES (company_id, store_id)
values (801194, 9470876840);
insert into SUPPLIES (company_id, store_id)
values (803435, 2863308060);
insert into SUPPLIES (company_id, store_id)
values (804009, 6909820646);
insert into SUPPLIES (company_id, store_id)
values (807639, 4336329790);
insert into SUPPLIES (company_id, store_id)
values (812574, 5025045083);
insert into SUPPLIES (company_id, store_id)
values (818835, 4798387437);
insert into SUPPLIES (company_id, store_id)
values (827718, 8951937158);
insert into SUPPLIES (company_id, store_id)
values (830156, 3497285055);
insert into SUPPLIES (company_id, store_id)
values (831697, 591700657);
insert into SUPPLIES (company_id, store_id)
values (836345, 8967262439);
insert into SUPPLIES (company_id, store_id)
values (838771, 3686259046);
insert into SUPPLIES (company_id, store_id)
values (840550, 7162438431);
insert into SUPPLIES (company_id, store_id)
values (841322, 6961077817);
insert into SUPPLIES (company_id, store_id)
values (843774, 5442740858);
insert into SUPPLIES (company_id, store_id)
values (844889, 3103587291);
insert into SUPPLIES (company_id, store_id)
values (845751, 3251223333);
insert into SUPPLIES (company_id, store_id)
values (846010, 8283282713);
insert into SUPPLIES (company_id, store_id)
values (847731, 7257468760);
insert into SUPPLIES (company_id, store_id)
values (849782, 1330820784);
insert into SUPPLIES (company_id, store_id)
values (851759, 3312919799);
insert into SUPPLIES (company_id, store_id)
values (873725, 9197008138);
insert into SUPPLIES (company_id, store_id)
values (874780, 839667416);
insert into SUPPLIES (company_id, store_id)
values (878400, 1726567562);
insert into SUPPLIES (company_id, store_id)
values (878515, 4732946988);
insert into SUPPLIES (company_id, store_id)
values (879931, 7468990299);
insert into SUPPLIES (company_id, store_id)
values (880502, 3532193164);
insert into SUPPLIES (company_id, store_id)
values (883539, 5499267131);
insert into SUPPLIES (company_id, store_id)
values (884471, 2378580045);
insert into SUPPLIES (company_id, store_id)
values (884946, 754274858);
insert into SUPPLIES (company_id, store_id)
values (888058, 1711577649);
insert into SUPPLIES (company_id, store_id)
values (888797, 4584810996);
insert into SUPPLIES (company_id, store_id)
values (890546, 7952258665);
insert into SUPPLIES (company_id, store_id)
values (891266, 845393956);
insert into SUPPLIES (company_id, store_id)
values (891570, 7934300986);
insert into SUPPLIES (company_id, store_id)
values (897337, 4840843889);
insert into SUPPLIES (company_id, store_id)
values (903261, 1126661700);
insert into SUPPLIES (company_id, store_id)
values (904529, 6606838009);
insert into SUPPLIES (company_id, store_id)
values (907073, 353622213);
insert into SUPPLIES (company_id, store_id)
values (910971, 525402490);
insert into SUPPLIES (company_id, store_id)
values (911536, 167134478);
insert into SUPPLIES (company_id, store_id)
values (914579, 9215297133);
insert into SUPPLIES (company_id, store_id)
values (916979, 4711622117);
insert into SUPPLIES (company_id, store_id)
values (917132, 9933450947);
insert into SUPPLIES (company_id, store_id)
values (918505, 3686348545);
insert into SUPPLIES (company_id, store_id)
values (922534, 3305391502);
insert into SUPPLIES (company_id, store_id)
values (925759, 9623978107);
insert into SUPPLIES (company_id, store_id)
values (933010, 803486996);
insert into SUPPLIES (company_id, store_id)
values (934288, 577535758);
insert into SUPPLIES (company_id, store_id)
values (934531, 5220721040);
insert into SUPPLIES (company_id, store_id)
values (934583, 8959262012);
insert into SUPPLIES (company_id, store_id)
values (934963, 1867855029);
insert into SUPPLIES (company_id, store_id)
values (936352, 3490649377);
insert into SUPPLIES (company_id, store_id)
values (937171, 8494880937);
insert into SUPPLIES (company_id, store_id)
values (942713, 8928426488);
insert into SUPPLIES (company_id, store_id)
values (947405, 3790288824);
insert into SUPPLIES (company_id, store_id)
values (948340, 6875389640);
insert into SUPPLIES (company_id, store_id)
values (949691, 2437887388);
insert into SUPPLIES (company_id, store_id)
values (949816, 900082013);
insert into SUPPLIES (company_id, store_id)
values (952724, 1217704657);
insert into SUPPLIES (company_id, store_id)
values (953372, 5114987385);
insert into SUPPLIES (company_id, store_id)
values (953422, 4254840602);
insert into SUPPLIES (company_id, store_id)
values (957368, 5038905616);
insert into SUPPLIES (company_id, store_id)
values (961642, 7873678207);
insert into SUPPLIES (company_id, store_id)
values (964472, 2864156706);
insert into SUPPLIES (company_id, store_id)
values (967143, 9139855618);
insert into SUPPLIES (company_id, store_id)
values (968359, 7207154142);
insert into SUPPLIES (company_id, store_id)
values (969562, 2073504657);
insert into SUPPLIES (company_id, store_id)
values (976760, 2195427266);
insert into SUPPLIES (company_id, store_id)
values (979383, 9456089279);
insert into SUPPLIES (company_id, store_id)
values (985015, 1630047150);
insert into SUPPLIES (company_id, store_id)
values (987789, 7712522193);
insert into SUPPLIES (company_id, store_id)
values (990532, 128193586);
insert into SUPPLIES (company_id, store_id)
values (990890, 1632587230);
insert into SUPPLIES (company_id, store_id)
values (992140, 2197776850);
insert into SUPPLIES (company_id, store_id)
values (993284, 5276367047);
insert into SUPPLIES (company_id, store_id)
values (996972, 4068531670);
commit;
prompt 377 records loaded
prompt Loading UNIFORM...
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 7053260187, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'M', 3680210664, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XXL', 5836903518, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 8451575436, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'L', 1834828258, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XXL', 3330706469, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XXL', 5756394082, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'L', 38179425, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'S', 390672970, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'S', 9676581907, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'S', 3873774387, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XXL', 5642982211, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XL', 692110927, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'L', 1582602210, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'XXL', 4389875876, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XXL', 2263419287, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XXL', 7467542023, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 7345415381, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XXL', 891758819, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'L', 5571303439, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'S', 6335074087, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XXL', 4344305082, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'L', 266082722, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'M', 7086336983, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XXL', 5175251649, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 1228578944, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XL', 8581056579, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'M', 9883327420, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XL', 9479295798, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'L', 9580220237, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'S', 5591685868, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'S', 2405274223, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'S', 5834352081, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 6370510168, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XXL', 2031234946, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'L', 7370138655, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XXL', 926515357, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'M', 7009406097, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XL', 2482072218, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 1184275527, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 3630705803, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'XS', 4681615236, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'M', 1948558566, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'L', 2226913709, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'S', 4125438016, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'M', 158656062, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XXL', 3417211848, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'M', 1908773791, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'M', 1872734501, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XL', 3558094170, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'S', 422483010, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 6014854779, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'M', 230008394, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'L', 641561064, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XXL', 478856073, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XL', 9632072596, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XL', 6099078632, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XL', 1400241095, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XL', 8551873597, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XS', 8941236223, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XXL', 9895127078, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'S', 3749861360, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'M', 761388688, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'L', 4665817453, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 7460591027, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'M', 7571405649, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'M', 4451001713, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'L', 2646421433, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XL', 1776030317, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 5514472868, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'L', 994233393, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XXL', 2556513514, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 2812510629, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'L', 6295860053, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XL', 622407240, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'M', 3620098614, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'M', 2230371298, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 8883230783, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'L', 8314172401, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'L', 4994635416, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'M', 902675271, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XXL', 385429535, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'S', 3155084673, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 6888304187, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 2510433061, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XXL', 8809827074, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 232904835, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XXL', 4335331780, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'M', 1010831716, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 938811084, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XXL', 9924387366, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XL', 4293757346, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XXL', 587490820, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XL', 4385037561, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'M', 3509868672, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XXL', 6097157700, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'S', 6464037187, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'M', 204684713, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 2715127502, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 6571298521, 'A');
commit;
prompt 100 records committed...
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'L', 2893599072, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'M', 3160515194, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XL', 747316484, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'M', 4177899180, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'XXL', 4346861955, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 2683868188, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XXL', 4265394667, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'S', 2778432526, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'S', 1528435879, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'L', 4879294859, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XL', 1785298805, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XL', 8321627394, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'S', 7427208123, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 3702815764, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'M', 9820336654, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XS', 6075899124, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XXL', 2976639701, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XL', 9205556849, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'S', 8878444019, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'M', 2470087389, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'S', 5833378046, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 315142032, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XL', 8223248730, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XXL', 1408371941, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'M', 2824010364, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'S', 2009814228, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 325655207, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'XL', 3057183134, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'L', 8936946513, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'XS', 9931713814, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'M', 9176613838, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'S', 3970933202, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'XXL', 529209147, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XL', 8907998716, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'L', 7550791935, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 5855194343, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'M', 9670792326, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'S', 8853811992, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'XL', 2311582629, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'XS', 6948275372, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'L', 4013596334, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 5124048563, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 5090139576, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'S', 7650357697, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XS', 1680834889, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'XS', 328732672, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XXL', 2723762727, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'XL', 4051540212, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'L', 8362138857, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'L', 1717369028, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'L', 5444782353, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XS', 5416239837, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'M', 3483363493, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'M', 4129827174, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'S', 8061050411, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'M', 6429015335, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 5003249514, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'L', 2854977328, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'XXL', 8993860800, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XL', 3842884879, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'L', 9333939838, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'S', 3245910012, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XL', 2773902643, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'M', 1731323314, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 5929446631, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'L', 7154987675, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'S', 9018714735, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'S', 9454735786, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'M', 8645482576, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'L', 7111194518, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XL', 9584655068, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'S', 1977854324, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'L', 1769138498, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XXL', 9540178816, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'M', 7124291017, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XS', 2277124599, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'S', 1333311341, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'S', 285160749, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'M', 3876762268, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'S', 892037875, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 1929631780, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'S', 5091022909, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'L', 6652019407, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'XXL', 8562475536, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'S', 5642591639, 'A');
commit;
prompt 185 records loaded
prompt Loading WEAPON...
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 88.31, 9575266503, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 83.66, 1803488600, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 78.54, 2210819525, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 10.35, 739009819, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 58.32, 5007486095, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 60.42, 9237887302, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 16.35, 8492082501, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 33.12, 6743868091, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 11.49, 7999946869, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 51.33, 5165544117, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 57.72, 6049262641, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 12.78, 2324699039, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 32.5, 2629501774, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 41.13, 4758040032, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 84.75, 1262299833, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ekdach', 71.6, 9523148241, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 87.69, 7014455172, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 80.82, 2140841427, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 90.71, 1200615407, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 78.82, 482885185, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 2.32, 9409136868, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 51.44, 9204521715, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 65.6, 3824151839, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 40.38, 8616378236, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 66.52, 3877381022, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 85.13, 3936947312, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 84, 1298410592, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 80.36, 5265579556, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 53.09, 5629509802, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 54.33, 1110601567, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 65.97, 6087940051, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 12.8, 5699999772, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ekdach', 75.16, 2957564496, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 11.55, 8970363792, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 31.69, 6895769343, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 47.43, 1999868858, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 5.89, 3111200179, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 41.45, 7356040892, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 71.91, 8376578566, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 82.33, 4745226508, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 3.73, 3093322757, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ekdach', 98.17, 6838547615, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 10.48, 3826165229, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 77.3, 8453732359, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 79.55, 5937258864, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 27.25, 3980061818, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 2.03, 2654978152, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 3.83, 8785584565, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ekdach', 42.36, 5891750537, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 39.78, 7811237309, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 47.84, 7805191905, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 20.75, 8889502433, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ekdach', 12.66, 260730540, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 71.26, 942877337, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 5.98, 4282853791, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 85.99, 9350915849, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 8.55, 7648787738, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 85.79, 1503426516, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 31.99, 860388597, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 30.73, 5765653102, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 17.04, 3512221536, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 36.79, 9232725334, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 20.38, 1415593509, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 53.36, 3209891703, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 84.03, 6983230755, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 91.84, 3071654574, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 68.96, 4577691416, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 63.96, 7760305070, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 90.79, 9430521484, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 49.92, 9133040940, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 43.29, 908979604, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 51.32, 5355726709, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 97.08, 3390750082, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 97.84, 4457245265, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 38.67, 4849937660, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 8.59, 6495295562, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 90.18, 483302118, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 22.99, 6815959712, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 69.59, 9081084175, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 78.78, 2173913130, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 32.47, 2254129654, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 27, 866097764, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 55.54, 1164029589, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 55.55, 955629631, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 29.47, 683348723, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 18.25, 3667968980, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 65.97, 3897040961, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 98.59, 1280240574, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 98.44, 543820185, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 85.89, 2838153407, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 69.48, 5781075011, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 10.51, 2195341596, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 11.12, 5021473481, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 47.23, 9680612994, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 40.56, 5624202797, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 85.78, 7192383516, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 54.22, 1573851561, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 97.47, 7982327048, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 16.38, 3854171921, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 35.1, 3275996479, 5);
commit;
prompt 100 records committed...
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 67.75, 3325538218, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 90.45, 543568112, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 71.47, 8321964413, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 83.51, 2164950368, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 44.35, 7252212975, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 38.25, 9528784025, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 94.07, 1450848120, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 37.89, 251857345, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 86.59, 1415456917, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 56.5, 3924559881, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 78.26, 6398597844, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 82.69, 7828420631, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 38.3, 1242459170, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 9.4, 4114119921, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 33.14, 778431398, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 83.88, 6439774971, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 56.19, 9073260014, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 95.51, 5977343407, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 50.78, 2512363797, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ekdach', 6.93, 998751341, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 6.05, 6958086779, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 32.89, 6540687170, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 50.86, 9359418172, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 79.39, 7374716055, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 70.69, 1475863296, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 19.27, 1435507476, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 92.23, 8568175602, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 3.92, 1079825445, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 11.78, 933290972, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 41.14, 4102448880, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 86.51, 2589020774, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 8.96, 673214350, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 49.24, 4135878550, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 3.86, 8526305078, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 48.9, 3036573687, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 48.84, 774580020, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 86.74, 3293025958, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 95.22, 4152220811, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 48.62, 5210986503, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 24.07, 7184224880, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 61.71, 6998256864, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 55.13, 6961578331, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 86.23, 6759189070, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 9.15, 1606707193, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 4.38, 9187893375, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 22.91, 8655033031, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 57.27, 5452670529, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 14.58, 798188194, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 25.33, 6941805533, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 77.98, 2750118238, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 4.47, 8897890075, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 47.23, 1372061954, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 98.27, 878905313, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 76.25, 5696934493, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 61.31, 4522656863, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 67.73, 8164614079, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 5.48, 8260501471, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 78.54, 7444300184, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 17.99, 6949933028, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 41.31, 2307184703, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 40.35, 7447089392, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 65.62, 9305240493, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 67.27, 3739214383, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 50.69, 6788615513, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 9.93, 9528830090, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 74.46, 5990448028, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 92, 9918192368, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 66.66, 8638171133, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 58.86, 1123396738, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 48.9, 6915106091, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 2.56, 6192309066, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ktav''m', 19.81, 820431040, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 94.24, 10666183, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 14.57, 9361021734, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 92.56, 2231117282, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ekdach', 6.42, 2639500814, 2);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 16.47, 3589290562, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 62.61, 1943603908, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ekdach', 7.15, 3876469407, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 72.77, 2591365316, 8);
commit;
prompt 180 records loaded

set feedback on
set define on
prompt Done
