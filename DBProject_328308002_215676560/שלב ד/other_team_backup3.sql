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
  personnel_id    INTEGER not null,
  rank            VARCHAR2(25) not null,
  name_of_soldier VARCHAR2(25) not null
)
;
alter table SOLDIER
  add primary key (PERSONNEL_ID);

prompt Creating FLOWN_BY...
create table FLOWN_BY
(
  personnel_id INTEGER not null,
  aircraft_id  INTEGER not null
)
;
alter table FLOWN_BY
  add primary key (PERSONNEL_ID, AIRCRAFT_ID);
alter table FLOWN_BY
  add constraint FK_PERSONAL_ID foreign key (PERSONNEL_ID)
  references SOLDIER (PERSONNEL_ID);
alter table FLOWN_BY
  add foreign key (AIRCRAFT_ID)
  references AIRCRAFT (AIRCRAFT_ID);

prompt Creating SUPPLY...
create table SUPPLY
(
  supply_id   INTEGER not null,
  quantity    INTEGER not null,
  supply_name VARCHAR2(25) not null,
  base_id     INTEGER not null
)
;
alter table SUPPLY
  add primary key (SUPPLY_ID);
alter table SUPPLY
  add foreign key (BASE_ID)
  references BASE (BASE_ID);

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
values (5159719, 'South', 9351);
insert into BASE (base_id, location, capacity)
values (5516085, 'South', 2625);
insert into BASE (base_id, location, capacity)
values (2561075, 'North', 9440);
insert into BASE (base_id, location, capacity)
values (8829232, 'South', 4330);
insert into BASE (base_id, location, capacity)
values (3414667, 'South', 6023);
insert into BASE (base_id, location, capacity)
values (1621944, 'North', 9891);
insert into BASE (base_id, location, capacity)
values (5603515, 'South', 5419);
insert into BASE (base_id, location, capacity)
values (9621508, 'South', 8753);
insert into BASE (base_id, location, capacity)
values (6782058, 'North', 8884);
insert into BASE (base_id, location, capacity)
values (6522233, 'South', 8513);
insert into BASE (base_id, location, capacity)
values (2207468, 'South', 5579);
insert into BASE (base_id, location, capacity)
values (8155818, 'North', 8127);
insert into BASE (base_id, location, capacity)
values (2016907, 'North', 6915);
insert into BASE (base_id, location, capacity)
values (6950843, 'South', 2237);
insert into BASE (base_id, location, capacity)
values (6006500, 'South', 3737);
insert into BASE (base_id, location, capacity)
values (8029673, 'North', 2355);
insert into BASE (base_id, location, capacity)
values (5320367, 'South', 6771);
insert into BASE (base_id, location, capacity)
values (8358419, 'South', 8807);
insert into BASE (base_id, location, capacity)
values (4880879, 'South', 3225);
insert into BASE (base_id, location, capacity)
values (6222040, 'South', 2823);
insert into BASE (base_id, location, capacity)
values (3446973, 'North', 5050);
insert into BASE (base_id, location, capacity)
values (3254708, 'South', 9444);
insert into BASE (base_id, location, capacity)
values (5938360, 'South', 9466);
insert into BASE (base_id, location, capacity)
values (8127586, 'South', 3494);
insert into BASE (base_id, location, capacity)
values (7672225, 'North', 4572);
insert into BASE (base_id, location, capacity)
values (7094849, 'South', 7336);
insert into BASE (base_id, location, capacity)
values (9488116, 'South', 4615);
insert into BASE (base_id, location, capacity)
values (4736425, 'South', 6792);
insert into BASE (base_id, location, capacity)
values (1948663, 'North', 7295);
insert into BASE (base_id, location, capacity)
values (7725236, 'South', 5202);
insert into BASE (base_id, location, capacity)
values (4960965, 'North', 9901);
insert into BASE (base_id, location, capacity)
values (2100001, 'South', 3401);
insert into BASE (base_id, location, capacity)
values (9828531, 'North', 6479);
insert into BASE (base_id, location, capacity)
values (9654575, 'North', 2101);
insert into BASE (base_id, location, capacity)
values (2979017, 'South', 7278);
insert into BASE (base_id, location, capacity)
values (6473725, 'North', 7101);
insert into BASE (base_id, location, capacity)
values (2981171, 'South', 2745);
insert into BASE (base_id, location, capacity)
values (5665760, 'North', 7577);
insert into BASE (base_id, location, capacity)
values (3027847, 'North', 6038);
insert into BASE (base_id, location, capacity)
values (5776999, 'South', 7765);
insert into BASE (base_id, location, capacity)
values (6383273, 'South', 6637);
insert into BASE (base_id, location, capacity)
values (7534197, 'South', 9295);
insert into BASE (base_id, location, capacity)
values (5434342, 'North', 5982);
insert into BASE (base_id, location, capacity)
values (8261243, 'North', 3652);
insert into BASE (base_id, location, capacity)
values (1510097, 'North', 8309);
insert into BASE (base_id, location, capacity)
values (8868197, 'South', 8268);
insert into BASE (base_id, location, capacity)
values (7603338, 'North', 2786);
insert into BASE (base_id, location, capacity)
values (3526562, 'South', 4111);
insert into BASE (base_id, location, capacity)
values (5105795, 'North', 8982);
insert into BASE (base_id, location, capacity)
values (7337064, 'North', 5814);
insert into BASE (base_id, location, capacity)
values (7716161, 'South', 7195);
insert into BASE (base_id, location, capacity)
values (1277662, 'South', 7822);
insert into BASE (base_id, location, capacity)
values (1360966, 'North', 2776);
insert into BASE (base_id, location, capacity)
values (8802505, 'North', 4372);
insert into BASE (base_id, location, capacity)
values (5344218, 'South', 3658);
insert into BASE (base_id, location, capacity)
values (8459654, 'North', 3702);
insert into BASE (base_id, location, capacity)
values (1575557, 'South', 7558);
insert into BASE (base_id, location, capacity)
values (1118980, 'North', 6278);
insert into BASE (base_id, location, capacity)
values (8680745, 'North', 8032);
insert into BASE (base_id, location, capacity)
values (5664370, 'North', 3603);
insert into BASE (base_id, location, capacity)
values (3635244, 'North', 5407);
insert into BASE (base_id, location, capacity)
values (4618633, 'North', 4658);
insert into BASE (base_id, location, capacity)
values (6343849, 'North', 9984);
insert into BASE (base_id, location, capacity)
values (3947799, 'South', 5922);
insert into BASE (base_id, location, capacity)
values (3879408, 'North', 7356);
insert into BASE (base_id, location, capacity)
values (2546404, 'North', 2541);
insert into BASE (base_id, location, capacity)
values (7953959, 'North', 3709);
insert into BASE (base_id, location, capacity)
values (4449294, 'North', 7245);
insert into BASE (base_id, location, capacity)
values (9188851, 'North', 3003);
insert into BASE (base_id, location, capacity)
values (6960977, 'South', 2324);
commit;
prompt 300 records committed...
insert into BASE (base_id, location, capacity)
values (7938820, 'South', 8606);
insert into BASE (base_id, location, capacity)
values (9453155, 'North', 5169);
insert into BASE (base_id, location, capacity)
values (8371346, 'North', 5635);
insert into BASE (base_id, location, capacity)
values (4867157, 'North', 5712);
insert into BASE (base_id, location, capacity)
values (8269150, 'North', 7501);
insert into BASE (base_id, location, capacity)
values (1783223, 'North', 9394);
insert into BASE (base_id, location, capacity)
values (8173179, 'South', 5487);
insert into BASE (base_id, location, capacity)
values (8595332, 'North', 2265);
insert into BASE (base_id, location, capacity)
values (4078084, 'North', 4089);
insert into BASE (base_id, location, capacity)
values (9671100, 'North', 8247);
insert into BASE (base_id, location, capacity)
values (7494784, 'North', 5752);
insert into BASE (base_id, location, capacity)
values (4693621, 'South', 6667);
insert into BASE (base_id, location, capacity)
values (9367537, 'South', 3184);
insert into BASE (base_id, location, capacity)
values (7488637, 'South', 7733);
insert into BASE (base_id, location, capacity)
values (1638608, 'South', 5982);
insert into BASE (base_id, location, capacity)
values (2848346, 'North', 6843);
insert into BASE (base_id, location, capacity)
values (4254601, 'South', 7419);
insert into BASE (base_id, location, capacity)
values (7985300, 'South', 6255);
insert into BASE (base_id, location, capacity)
values (2667321, 'North', 7490);
insert into BASE (base_id, location, capacity)
values (1598446, 'South', 7064);
insert into BASE (base_id, location, capacity)
values (2461106, 'South', 6005);
insert into BASE (base_id, location, capacity)
values (1921039, 'North', 2123);
insert into BASE (base_id, location, capacity)
values (1200517, 'North', 5388);
insert into BASE (base_id, location, capacity)
values (4859469, 'North', 8143);
insert into BASE (base_id, location, capacity)
values (7999478, 'South', 5206);
insert into BASE (base_id, location, capacity)
values (6235298, 'North', 4978);
insert into BASE (base_id, location, capacity)
values (4228001, 'North', 5886);
insert into BASE (base_id, location, capacity)
values (9522749, 'South', 8863);
insert into BASE (base_id, location, capacity)
values (1257997, 'North', 8117);
insert into BASE (base_id, location, capacity)
values (7142778, 'South', 8248);
insert into BASE (base_id, location, capacity)
values (6767808, 'South', 5464);
insert into BASE (base_id, location, capacity)
values (3645412, 'North', 2750);
insert into BASE (base_id, location, capacity)
values (6938609, 'North', 5392);
insert into BASE (base_id, location, capacity)
values (9796583, 'South', 9778);
insert into BASE (base_id, location, capacity)
values (9447081, 'South', 6562);
insert into BASE (base_id, location, capacity)
values (7996821, 'North', 2336);
insert into BASE (base_id, location, capacity)
values (1550393, 'South', 8546);
insert into BASE (base_id, location, capacity)
values (3409378, 'North', 9745);
insert into BASE (base_id, location, capacity)
values (7333912, 'North', 2399);
insert into BASE (base_id, location, capacity)
values (6977097, 'South', 5008);
insert into BASE (base_id, location, capacity)
values (5411817, 'North', 7447);
insert into BASE (base_id, location, capacity)
values (3973174, 'South', 4982);
insert into BASE (base_id, location, capacity)
values (3598298, 'North', 9548);
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
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6646417, 'Rav Seren', 'Clint');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1411169, 'Seren', 'Bo');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4196548, 'Sgan Aluf', 'Rachid');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4101527, 'Sgan Aluf', 'Carrie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4094064, 'Seren', 'Oro');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1882389, 'Rav Seren', 'Machine');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4159499, 'Aluf Mishne', 'Ani');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9704794, 'Rav Seren', 'Colm');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2850208, 'Seren', 'Tcheky');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6314572, 'Aluf Mishne', 'Kris');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3239573, 'Rav Seren', 'Geoff');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4127809, 'Sgan Aluf', 'Darius');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4776589, 'Rav Seren', 'Beth');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8950386, 'Rav Seren', 'Rade');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6663628, 'Aluf Mishne', 'Rod');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3641807, 'Seren', 'Keith');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8254846, 'Aluf Mishne', 'Christian');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6406542, 'Seren', 'Clint');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4753682, 'Sgan Aluf', 'Billy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9893193, 'Seren', 'Dick');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4621669, 'Seren', 'Cuba');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1005397, 'Seren', 'Kathleen');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8564909, 'Rav Seren', 'Gena');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9091108, 'Rav Seren', 'Paula');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4301429, 'Aluf Mishne', 'Alice');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4291130, 'Aluf Mishne', 'Oded');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9594932, 'Seren', 'Kenneth');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2106116, 'Seren', 'Rachel');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2830409, 'Rav Seren', 'Andrew');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5996108, 'Sgan Aluf', 'Joseph');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3767525, 'Sgan Aluf', 'Buffy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4870662, 'Seren', 'Davy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5600761, 'Seren', 'Annette');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1973082, 'Seren', 'Forest');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6143856, 'Seren', 'Buddy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5721901, 'Seren', 'Gabrielle');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7402315, 'Seren', 'Louise');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5858816, 'Rav Seren', 'Merrilee');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3064394, 'Seren', 'Crystal');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3577547, 'Seren', 'Denny');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5090366, 'Aluf Mishne', 'David');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7484796, 'Sgan Aluf', 'Uma');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6674604, 'Aluf Mishne', 'Geraldine');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1085339, 'Aluf Mishne', 'Murray');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6957560, 'Seren', 'Milla');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5300630, 'Aluf Mishne', 'Greg');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1037558, 'Rav Seren', 'Delroy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9136783, 'Rav Seren', 'Burton');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4638006, 'Sgan Aluf', 'Tracy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8325770, 'Rav Seren', 'Rascal');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3286581, 'Sgan Aluf', 'Ed');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4385762, 'Rav Seren', 'Frank');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1621747, 'Sgan Aluf', 'Meredith');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4395176, 'Rav Seren', 'Debra');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6521070, 'Seren', 'Austin');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8662661, 'Sgan Aluf', 'Marisa');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5707695, 'Sgan Aluf', 'Catherine');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1714556, 'Aluf Mishne', 'Woody');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5398589, 'Rav Seren', 'Mint');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2424625, 'Sgan Aluf', 'Chazz');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2973180, 'Sgan Aluf', 'Giovanni');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9990798, 'Seren', 'Raul');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1626391, 'Aluf Mishne', 'Ty');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7632570, 'Sgan Aluf', 'Maxine');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5088216, 'Rav Seren', 'Glenn');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9653218, 'Seren', 'Rolando');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5805468, 'Aluf Mishne', 'Rob');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2695582, 'Aluf Mishne', 'Rachael');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3052624, 'Seren', 'Vanessa');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4931264, 'Rav Seren', 'Xander');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9330275, 'Aluf Mishne', 'Elvis');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9373323, 'Aluf Mishne', 'Darren');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4684133, 'Sgan Aluf', 'Walter');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6804278, 'Seren', 'Azucar');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1297236, 'Seren', 'Marty');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9777065, 'Aluf Mishne', 'Oliver');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2435574, 'Rav Seren', 'Vonda');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1088966, 'Aluf Mishne', 'Melanie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8625165, 'Sgan Aluf', 'Stevie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1859990, 'Sgan Aluf', 'Shawn');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8369312, 'Aluf Mishne', 'Karen');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4180175, 'Rav Seren', 'Miko');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4840730, 'Rav Seren', 'Micky');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9037363, 'Sgan Aluf', 'Harvey');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7367019, 'Aluf Mishne', 'Emily');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5210626, 'Seren', 'Gin');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3232077, 'Rav Seren', 'Tommy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5827222, 'Sgan Aluf', 'Dick');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5902933, 'Rav Seren', 'Roger');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9645213, 'Rav Seren', 'Taylor');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4323746, 'Aluf Mishne', 'Hector');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2652197, 'Seren', 'Stellan');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4958710, 'Seren', 'Dick');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5575496, 'Sgan Aluf', 'Lily');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9875997, 'Rav Seren', 'Fred');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4193082, 'Aluf Mishne', 'Betty');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6908007, 'Sgan Aluf', 'Mary-Louise');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9230019, 'Aluf Mishne', 'Loren');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2861681, 'Rav Seren', 'Darius');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7934801, 'Aluf Mishne', 'Lindsay');
commit;
prompt 100 records committed...
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6448921, 'Sgan Aluf', 'Shannyn');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6466065, 'Sgan Aluf', 'Goran');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2123768, 'Rav Seren', 'Milla');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4795371, 'Sgan Aluf', 'Jeffery');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7912391, 'Seren', 'Susan');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5258493, 'Aluf Mishne', 'Sarah');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5666672, 'Rav Seren', 'Xander');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8978501, 'Rav Seren', 'Marlon');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5524719, 'Sgan Aluf', 'Alan');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2451259, 'Aluf Mishne', 'Stephen');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7784481, 'Rav Seren', 'Tobey');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2440455, 'Aluf Mishne', 'Gabriel');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9452303, 'Sgan Aluf', 'Gaby');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3287263, 'Rav Seren', 'Walter');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7479237, 'Aluf Mishne', 'Catherine');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5611789, 'Sgan Aluf', 'Anita');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4706729, 'Sgan Aluf', 'Oliver');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9482143, 'Rav Seren', 'Shannyn');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8872368, 'Aluf Mishne', 'John');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2264600, 'Rav Seren', 'Larnelle');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2238339, 'Aluf Mishne', 'Vanessa');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1857635, 'Seren', 'Shelby');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7562418, 'Seren', 'Darius');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6665906, 'Seren', 'Wang');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1796398, 'Aluf Mishne', 'Lennie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8800130, 'Rav Seren', 'Nicholas');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4132188, 'Seren', 'Olympia');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5407789, 'Seren', 'Udo');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3383989, 'Seren', 'Robby');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3060051, 'Sgan Aluf', 'Isaac');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7258417, 'Rav Seren', 'Cyndi');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3554915, 'Sgan Aluf', 'Gaby');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8385761, 'Aluf Mishne', 'Willie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1657678, 'Rav Seren', 'Kid');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9127123, 'Rav Seren', 'Kate');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2000061, 'Seren', 'Timothy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7696650, 'Seren', 'Lauren');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7911039, 'Aluf Mishne', 'Maureen');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8107741, 'Aluf Mishne', 'Edwin');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5168284, 'Aluf Mishne', 'Marty');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1429707, 'Seren', 'Tim');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3851497, 'Aluf Mishne', 'Vondie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2889165, 'Rav Seren', 'Peter');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7460333, 'Sgan Aluf', 'Denise');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7031144, 'Aluf Mishne', 'Ellen');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5542663, 'Rav Seren', 'Mykelti');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1530839, 'Seren', 'Billy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8075961, 'Sgan Aluf', 'Gladys');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5880745, 'Aluf Mishne', 'Dave');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7068248, 'Seren', 'Selma');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1132007, 'Rav Seren', 'Tobey');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7107728, 'Seren', 'Carrie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5705735, 'Seren', 'George');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1204485, 'Sgan Aluf', 'Lynn');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4072248, 'Sgan Aluf', 'Ozzy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1045953, 'Aluf Mishne', 'Isabella');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2386269, 'Sgan Aluf', 'Donal');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6042751, 'Aluf Mishne', 'Lionel');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4026435, 'Rav Seren', 'Vickie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7085407, 'Rav Seren', 'Shannyn');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4980638, 'Sgan Aluf', 'Cyndi');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2078008, 'Sgan Aluf', 'Tea');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3207225, 'Rav Seren', 'Claude');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3874405, 'Aluf Mishne', 'Andre');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2048325, 'Seren', 'Miko');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1528686, 'Sgan Aluf', 'Gordie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7538217, 'Rav Seren', 'Nick');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2596893, 'Seren', 'Isaac');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1599043, 'Seren', 'Jane');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5903639, 'Seren', 'Anthony');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2710897, 'Sgan Aluf', 'Embeth');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5528176, 'Sgan Aluf', 'Tom');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9245874, 'Rav Seren', 'Alice');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6081795, 'Sgan Aluf', 'Glenn');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6328497, 'Sgan Aluf', 'Alannah');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7454901, 'Aluf Mishne', 'Lesley');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9390627, 'Seren', 'Maureen');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1420131, 'Rav Seren', 'Liam');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5589896, 'Aluf Mishne', 'Humberto');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8599920, 'Seren', 'Rip');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7519559, 'Aluf Mishne', 'Merrilee');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7655586, 'Sgan Aluf', 'Julianne');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6216681, 'Seren', 'Harrison');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9942668, 'Seren', 'Gary');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4937566, 'Rav Seren', 'Maxine');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7616547, 'Seren', 'Chris');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6576501, 'Aluf Mishne', 'Kyra');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9075663, 'Aluf Mishne', 'Brian');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4518973, 'Rav Seren', 'Jerry');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8009536, 'Seren', 'Coley');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1205830, 'Rav Seren', 'Benjamin');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7987776, 'Sgan Aluf', 'Martha');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4303057, 'Seren', 'Kimberly');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7796707, 'Aluf Mishne', 'Larry');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3185277, 'Rav Seren', 'Angela');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1414877, 'Aluf Mishne', 'Cloris');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1012419, 'Seren', 'Rupert');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9929797, 'Sgan Aluf', 'Roddy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5070551, 'Sgan Aluf', 'Tori');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6648486, 'Rav Seren', 'Faye');
commit;
prompt 200 records committed...
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9822330, 'Rav Seren', 'Spencer');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3456142, 'Seren', 'Benicio');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7332220, 'Seren', 'Sonny');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8943066, 'Seren', 'Nelly');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9959182, 'Seren', 'Olympia');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7262392, 'Sgan Aluf', 'April');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2507386, 'Sgan Aluf', 'Merrilee');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4912563, 'Aluf Mishne', 'Jonny');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6956165, 'Rav Seren', 'Anita');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7971546, 'Seren', 'Derrick');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3516394, 'Seren', 'Katrin');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4556838, 'Sgan Aluf', 'Gladys');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8644291, 'Aluf Mishne', 'Lee');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4758927, 'Rav Seren', 'Xander');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8847706, 'Rav Seren', 'Maggie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7808602, 'Aluf Mishne', 'Chris');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2206904, 'Sgan Aluf', 'Jackson');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7102734, 'Aluf Mishne', 'Trace');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6564070, 'Seren', 'Derrick');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9741486, 'Seren', 'Tommy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3875783, 'Rav Seren', 'Holland');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4734787, 'Aluf Mishne', 'Breckin');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4333095, 'Seren', 'Harrison');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9829863, 'Rav Seren', 'Dianne');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3096974, 'Sgan Aluf', 'Simon');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3307090, 'Rav Seren', 'Lorraine');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2935372, 'Aluf Mishne', 'Daryle');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2901063, 'Sgan Aluf', 'Neve');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3244474, 'Sgan Aluf', 'Bryan');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5539843, 'Seren', 'Tea');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3953250, 'Sgan Aluf', 'Michelle');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3670590, 'Sgan Aluf', 'Ossie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3209894, 'Aluf Mishne', 'Collective');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8866522, 'Aluf Mishne', 'Adrien');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9593414, 'Sgan Aluf', 'Tobey');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6000966, 'Seren', 'Alicia');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9446219, 'Sgan Aluf', 'Maggie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2841653, 'Seren', 'Morgan');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1846364, 'Aluf Mishne', 'Sara');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5274847, 'Aluf Mishne', 'Gates');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8293798, 'Rav Seren', 'Laura');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5826914, 'Sgan Aluf', 'Charlie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7435941, 'Seren', 'Gene');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7523007, 'Seren', 'Humberto');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1666683, 'Seren', 'Brian');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2721168, 'Seren', 'Mykelti');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6262018, 'Rav Seren', 'Dabney');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5197842, 'Seren', 'Grace');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4427446, 'Seren', 'Carrie-Anne');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7750082, 'Rav Seren', 'Merrill');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1289471, 'Seren', 'Joaquim');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9732997, 'Sgan Aluf', 'Patti');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3028600, 'Seren', 'Jude');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1580931, 'Aluf Mishne', 'Jimmie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3086575, 'Seren', 'Jeremy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8279757, 'Rav Seren', 'Trey');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3248740, 'Sgan Aluf', 'Patricia');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7278225, 'Seren', 'Chazz');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8465932, 'Sgan Aluf', 'Mena');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2260820, 'Rav Seren', 'Vincent');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9101545, 'Rav Seren', 'Owen');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4865783, 'Seren', 'Phoebe');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9931066, 'Sgan Aluf', 'Art');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8632074, 'Sgan Aluf', 'Kimberly');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2245744, 'Sgan Aluf', 'Julia');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7510877, 'Aluf Mishne', 'Jonatha');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2881808, 'Sgan Aluf', 'Gabriel');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5993014, 'Aluf Mishne', 'Vonda');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2474197, 'Rav Seren', 'Hex');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3596067, 'Aluf Mishne', 'Jaime');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4781587, 'Rav Seren', 'Bob');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7936406, 'Sgan Aluf', 'Neneh');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4110192, 'Seren', 'Lonnie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2194363, 'Seren', 'Lili');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3739775, 'Aluf Mishne', 'Gary');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7277847, 'Aluf Mishne', 'Ron');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8389103, 'Sgan Aluf', 'Brothers');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7713328, 'Seren', 'Ty');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8212182, 'Aluf Mishne', 'Karon');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5055821, 'Sgan Aluf', 'Gord');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5153512, 'Seren', 'Carol');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3723751, 'Aluf Mishne', 'Geggy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2772845, 'Rav Seren', 'Rueben');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7442897, 'Aluf Mishne', 'First');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2439947, 'Seren', 'Drew');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1238518, 'Seren', 'Wayman');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4160237, 'Rav Seren', 'Carl');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1958676, 'Sgan Aluf', 'Chalee');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6785335, 'Aluf Mishne', 'Yolanda');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1957303, 'Sgan Aluf', 'Claire');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9051004, 'Aluf Mishne', 'Remy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7625129, 'Seren', 'Roscoe');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3331313, 'Rav Seren', 'Liquid');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8242700, 'Aluf Mishne', 'King');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5264375, 'Sgan Aluf', 'Carl');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7954938, 'Sgan Aluf', 'Debi');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5054513, 'Aluf Mishne', 'Rose');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6843431, 'Seren', 'Javon');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4350355, 'Rav Seren', 'Toshiro');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9913472, 'Rav Seren', 'Leelee');
commit;
prompt 300 records committed...
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8700951, 'Aluf Mishne', 'Terence');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8630248, 'Sgan Aluf', 'Andie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1764838, 'Sgan Aluf', 'Betty');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6245019, 'Aluf Mishne', 'Gloria');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3252637, 'Sgan Aluf', 'Wang');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3860150, 'Sgan Aluf', 'Lynette');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7084755, 'Seren', 'Jim');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7803901, 'Rav Seren', 'Taryn');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8004545, 'Rav Seren', 'Alfred');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9734553, 'Rav Seren', 'Dustin');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9966385, 'Seren', 'Maggie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8781100, 'Aluf Mishne', 'Emma');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2580049, 'Seren', 'Max');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2267028, 'Rav Seren', 'Gord');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1799960, 'Rav Seren', 'Alfie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1967011, 'Seren', 'Graham');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9462974, 'Seren', 'Hex');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3726227, 'Sgan Aluf', 'Wayne');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4263679, 'Sgan Aluf', 'Kevn');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1440959, 'Seren', 'Johnnie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6874359, 'Seren', 'Tia');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5169643, 'Seren', 'Ivan');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4230263, 'Rav Seren', 'Madeline');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5328096, 'Rav Seren', 'Leon');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9072083, 'Rav Seren', 'Clay');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8833801, 'Sgan Aluf', 'Judd');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2729177, 'Rav Seren', 'Lloyd');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4514302, 'Sgan Aluf', 'Ashton');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5401461, 'Aluf Mishne', 'Cathy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9396533, 'Rav Seren', 'Christian');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9917635, 'Rav Seren', 'Nicky');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1459729, 'Rav Seren', 'Pam');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9674945, 'Aluf Mishne', 'Cornell');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5376935, 'Sgan Aluf', 'Seann');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9263525, 'Aluf Mishne', 'Rosanne');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5501589, 'Seren', 'Edwin');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5709048, 'Rav Seren', 'Tyrone');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8188653, 'Aluf Mishne', 'Christmas');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6393367, 'Sgan Aluf', 'Colin');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9286839, 'Rav Seren', 'Jeffrey');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9096626, 'Aluf Mishne', 'Tony');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9612114, 'Aluf Mishne', 'Christian');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1308442, 'Aluf Mishne', 'Hope');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7225362, 'Sgan Aluf', 'Wendy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8542629, 'Rav Seren', 'Rhett');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5701323, 'Seren', 'Janeane');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3922207, 'Sgan Aluf', 'Natacha');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2104288, 'Sgan Aluf', 'Malcolm');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2341456, 'Sgan Aluf', 'Nastassja');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6390858, 'Aluf Mishne', 'George');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8122118, 'Rav Seren', 'Albertina');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2254073, 'Aluf Mishne', 'Patrick');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5824041, 'Sgan Aluf', 'Coley');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7318686, 'Seren', 'Johnnie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3809005, 'Rav Seren', 'Luke');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4906952, 'Sgan Aluf', 'Ted');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6852787, 'Seren', 'Nancy');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1630421, 'Seren', 'Vickie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9617099, 'Sgan Aluf', 'Ty');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8638414, 'Sgan Aluf', 'Vondie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1692471, 'Rav Seren', 'Denny');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3780657, 'Seren', 'Emmylou');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3267853, 'Aluf Mishne', 'Larry');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1032296, 'Sgan Aluf', 'Jason');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2835264, 'Aluf Mishne', 'Goldie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5596992, 'Seren', 'Rosanna');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6760678, 'Aluf Mishne', 'Lindsey');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4960145, 'Rav Seren', 'Marlon');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2607965, 'Aluf Mishne', 'Bridget');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3122378, 'Aluf Mishne', 'Andre');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9853720, 'Seren', 'Kimberly');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8115454, 'Sgan Aluf', 'Matt');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (4639591, 'Sgan Aluf', 'Lou');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1001406, 'Sgan Aluf', 'Eric');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2537791, 'Seren', 'Kasey');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7693417, 'Rav Seren', 'Winona');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3517447, 'Sgan Aluf', 'Maceo');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2426174, 'Aluf Mishne', 'Lennie');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2456602, 'Rav Seren', 'Kirk');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8356805, 'Aluf Mishne', 'Nastassja');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2209791, 'Rav Seren', 'Carl');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3907339, 'Rav Seren', 'Kasey');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1476401, 'Seren', 'Dom');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2878608, 'Seren', 'Whoopi');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6083234, 'Aluf Mishne', 'Rosario');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (7386000, 'Seren', 'Powers');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9858154, 'Sgan Aluf', 'Pierce');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (3102055, 'Aluf Mishne', 'Betty');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6592979, 'Sgan Aluf', 'Terence');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1452016, 'Seren', 'Harry');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9735391, 'Aluf Mishne', 'Juice');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2108646, 'Rav Seren', 'Malcolm');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (5974052, 'Aluf Mishne', 'Rufus');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9684400, 'Aluf Mishne', 'Patrick');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9850836, 'Seren', 'Hugo');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (2734813, 'Sgan Aluf', 'Kazem');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (1511622, 'Sgan Aluf', 'Miriam');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (9379410, 'Aluf Mishne', 'Jaime');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (8754957, 'Aluf Mishne', 'Selma');
insert into SOLDIER (personnel_id, rank, name_of_soldier)
values (6827839, 'Seren', 'Richard');
commit;
prompt 400 records loaded
prompt Loading FLOWN_BY...
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9617099, 6554623);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4094064, 4178159);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2537791, 9482712);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8075961, 4163530);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9734553, 5062584);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3641807, 9826361);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8293798, 1920632);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8107741, 2572707);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6956165, 5369899);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6908007, 6029568);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1630421, 9866928);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1289471, 6614209);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7796707, 6438888);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4912563, 3117957);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6042751, 1107832);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6393367, 8729046);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9462974, 2934580);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6760678, 4910365);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2507386, 9651501);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8542629, 6869774);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1005397, 3156942);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1846364, 2109742);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9822330, 3127284);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7484796, 8907738);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1414877, 2637693);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6143856, 8163662);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9777065, 4049584);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5258493, 1204485);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2104288, 3250114);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6852787, 7672711);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9732997, 4705632);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2440455, 2880930);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7784481, 9965460);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5542663, 9876560);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3185277, 6530640);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1580931, 6438888);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3596067, 1699452);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2537791, 4273393);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5666672, 9772473);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9850836, 3127284);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7784481, 5349759);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5197842, 9094945);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3851497, 9340137);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3767525, 4121496);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8630248, 9965460);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7225362, 9069583);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8542629, 2639613);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9684400, 9228562);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9875997, 7857610);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2245744, 9504684);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8872368, 4868610);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7936406, 6614209);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3286581, 8728896);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5996108, 1699452);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6314572, 2883414);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2341456, 3157077);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5264375, 9228562);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1001406, 8327238);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2935372, 9482712);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7367019, 7984570);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7625129, 1266331);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6592979, 9938320);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7713328, 8737719);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3252637, 1920632);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5880745, 3286539);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1088966, 6734549);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5168284, 9230888);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5328096, 1839002);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5826914, 7991343);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8293798, 7620252);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1429707, 4121496);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9735391, 3433496);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8115454, 1889133);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4840730, 7568931);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3907339, 4695397);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9931066, 4273393);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7402315, 3580899);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5542663, 1386174);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4684133, 9149654);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5264375, 9958496);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9446219, 7374761);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2710897, 7592981);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6827839, 1862987);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3596067, 8599881);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4196548, 7782852);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8389103, 3429980);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2440455, 9083652);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5709048, 4695397);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6957560, 9089023);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7277847, 2613682);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5274847, 2109742);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3232077, 8450550);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9263525, 1809773);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4350355, 1216440);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1459729, 3678140);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5542663, 1620946);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4101527, 7958360);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8638414, 2865561);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4734787, 1220339);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4350355, 3910321);
commit;
prompt 100 records committed...
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8115454, 1662066);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5858816, 1629105);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9482143, 6348818);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1657678, 4049584);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9913472, 8684335);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1238518, 5062584);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7808602, 7912488);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8644291, 5299451);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5993014, 4178159);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3207225, 7991343);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8293798, 3479015);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2710897, 8008752);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7693417, 5248976);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5575496, 8429937);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9452303, 4048713);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3554915, 7247204);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4781587, 8907738);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6521070, 1756872);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1657678, 5467817);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2260820, 5118616);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7332220, 7228287);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8389103, 8572356);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3252637, 4472622);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2106116, 2168218);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1511622, 5408780);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7367019, 8770771);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2835264, 3286539);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8950386, 8893595);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9617099, 8853172);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1621747, 2135437);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2386269, 5277671);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3875783, 7924048);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2123768, 3594090);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6785335, 2827308);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1799960, 9938320);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8800130, 8043358);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6466065, 1488283);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1085339, 1266331);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4840730, 3374248);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8325770, 7844491);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5596992, 3828982);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7435941, 9513260);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1289471, 9866928);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1289471, 9876560);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7523007, 8729046);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1530839, 7356995);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1005397, 7197633);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5880745, 8106334);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7107728, 4910514);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9127123, 2867074);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9822330, 7515473);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4684133, 8770771);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4291130, 9149654);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4556838, 5056047);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9734553, 2883414);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8833801, 1513649);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9230019, 4121496);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1666683, 6284745);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2106116, 4101408);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3102055, 4121496);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9379410, 4654666);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9462974, 9075312);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2386269, 8721879);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3670590, 1107832);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7655586, 7515473);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8254846, 8833618);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8004545, 4051150);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9245874, 9989159);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5210626, 8582823);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8293798, 6312310);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7562418, 9089023);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5858816, 4755086);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6648486, 6084836);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9674945, 1215163);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4094064, 7725614);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7632570, 8983905);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4684133, 7046326);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7911039, 9172745);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1205830, 8355652);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2267028, 1073937);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5274847, 9402407);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1205830, 6554623);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8107741, 2568730);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3244474, 2493988);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9373323, 6693175);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6406542, 4152741);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7435941, 6477468);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5054513, 9971834);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1630421, 3433496);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9390627, 7781806);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7936406, 5074546);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6262018, 9453911);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9822330, 5369899);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8950386, 1809773);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2000061, 1012463);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9245874, 3728847);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9732997, 7782852);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7225362, 9613359);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6081795, 6882420);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1420131, 9744126);
commit;
prompt 200 records committed...
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7278225, 1220339);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9931066, 3157077);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9245874, 5248976);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5542663, 2637693);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5168284, 7046326);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8369312, 7551773);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8630248, 4910514);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3064394, 7924048);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1414877, 1026336);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8356805, 4556095);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1476401, 8729046);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9462974, 7197633);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2830409, 9856715);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9850836, 3479015);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7277847, 2639613);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9037363, 5655458);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9929797, 9860541);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3383989, 1012463);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7796707, 5369899);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6042751, 7140959);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1414877, 9989159);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8599920, 9929781);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5880745, 7725207);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7936406, 9961949);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2254073, 3594090);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2123768, 9504684);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5666672, 2851433);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9858154, 8882657);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5398589, 2934580);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5575496, 9083652);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5827222, 9720973);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7031144, 7565717);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2729177, 2367375);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1511622, 8248850);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5528176, 3250114);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3577547, 9313155);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8279757, 5118616);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7402315, 7112797);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5300630, 5596801);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7084755, 2367375);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1666683, 4755086);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8369312, 3678140);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1626391, 1386153);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2254073, 9597832);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1799960, 6084836);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3875783, 8711934);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6000966, 1025065);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9051004, 9402407);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1692471, 5689433);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5153512, 1268657);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2254073, 3743331);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3307090, 9340137);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9674945, 5604032);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7750082, 4549256);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2850208, 5056047);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3577547, 3767565);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9674945, 5056047);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6957560, 6259026);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7616547, 9253559);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3287263, 1756872);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5197842, 4123250);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8009536, 1920632);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2729177, 8981330);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8599920, 4556095);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2861681, 8503312);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3307090, 8983905);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7085407, 8684335);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1238518, 6826082);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4263679, 2260910);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1037558, 1205585);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6000966, 4152741);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7954938, 1808725);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5824041, 5475461);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1204485, 1009161);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5974052, 1386153);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7803901, 7197633);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5974052, 8623418);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6674604, 8466653);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1530839, 2346062);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4101527, 9083652);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9741486, 9230888);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9734553, 5248976);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8943066, 7912488);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9482143, 1518218);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3102055, 1067795);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3232077, 2168218);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6245019, 4247099);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3767525, 9254523);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8800130, 7592981);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9822330, 5408780);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9942668, 7725207);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6843431, 9453911);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1032296, 4216867);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6521070, 6113964);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9653218, 9958496);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5210626, 8097471);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2772845, 7857610);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2841653, 6898122);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2194363, 8450550);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2254073, 6951095);
commit;
prompt 300 records committed...
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1012419, 1882079);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2424625, 3127284);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1001406, 8907738);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9263525, 7420759);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5824041, 1776720);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9704794, 1776720);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2841653, 6948403);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5589896, 6515263);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5707695, 2467780);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1459729, 1776720);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8866522, 6084836);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8625165, 1220480);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9396533, 1776720);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1132007, 4654666);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5168284, 5847385);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6390858, 6693175);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4180175, 1513649);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1958676, 8146483);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6083234, 4247099);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4291130, 9860541);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8847706, 9961949);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3953250, 5446643);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3641807, 5604032);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2456602, 3374248);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3286581, 8853172);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4127809, 1662066);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7655586, 3897536);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2596893, 5467817);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7367019, 1170010);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2206904, 4082110);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5824041, 2374813);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8943066, 6113964);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9101545, 9826361);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6665906, 9230888);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2973180, 9313155);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4395176, 1882079);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7454901, 5277671);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7318686, 5893093);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4980638, 8106334);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8662661, 9453911);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4196548, 4654666);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9990798, 9938320);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8564909, 2243234);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2474197, 4152741);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1132007, 4284411);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1846364, 4049584);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6262018, 8804611);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6393367, 1920632);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1973082, 4729907);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2254073, 9149654);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4795371, 6693175);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8630248, 1067795);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8356805, 7944750);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7954938, 6438888);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4193082, 5959402);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9913472, 5378834);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1580931, 6252508);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4840730, 1862987);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3286581, 1450319);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2830409, 7725614);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4776589, 1776720);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8325770, 7578096);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5709048, 2949008);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8004545, 2613682);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7519559, 6312310);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9858154, 8429937);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9929797, 8946129);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1476401, 2383978);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1580931, 9551946);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4196548, 4048713);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4301429, 8305374);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3554915, 1513649);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3307090, 4216867);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3860150, 8623418);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9096626, 4273393);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2106116, 1067795);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5858816, 2277399);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9966385, 9860541);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1967011, 1026336);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (1411169, 7842823);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2048325, 1107832);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7277847, 6148550);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7971546, 4247099);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3577547, 8623418);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7912391, 4094736);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (8279757, 9929781);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2000061, 2266859);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2123768, 1023116);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4753682, 6519312);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (5974052, 2003618);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2341456, 7651871);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6328497, 7376163);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (3739775, 6113964);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2264600, 4037278);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (9931066, 5277671);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6143856, 7924048);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (4132188, 1025065);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (7954938, 1026336);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (6576501, 2243234);
insert into FLOWN_BY (personnel_id, aircraft_id)
values (2341456, 7719373);
commit;
prompt 400 records loaded
prompt Loading SUPPLY...
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3384312, 948, 'Engines', 9188851);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1662493, 456, 'Bombs', 6847949);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6371550, 369, 'Fuel', 6913701);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3433050, 512, 'Fuel', 9828531);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2845872, 772, 'Missiles', 3857827);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2661845, 212, 'Fuel', 5938360);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5855806, 884, 'Engines', 8371346);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4860699, 677, 'Bombs', 1043200);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6752075, 742, 'Aircraft spare parts', 2200056);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3316400, 303, 'Fuel', 1166918);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8487510, 891, 'Fuel', 1621944);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8885620, 305, 'Aircraft spare parts', 7534197);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8443230, 842, 'Bombs', 1783223);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8352339, 590, 'Fuel', 5344218);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8817306, 845, 'Bombs', 9632643);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4347765, 930, 'Engines', 3910956);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9575939, 975, 'Bombs', 9859836);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1832757, 454, 'Missiles', 1313329);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1967127, 522, 'Ammunition', 6528989);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4142748, 451, 'Ammunition', 9310665);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7596841, 708, 'Bombs', 3345502);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9595164, 483, 'Aircraft spare parts', 1227023);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1067694, 701, 'Aircraft spare parts', 3564288);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8659348, 817, 'Fuel', 1082097);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4180115, 955, 'Engines', 7131970);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8688982, 161, 'Engines', 7530416);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9696019, 852, 'Engines', 2882459);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5217008, 719, 'Aircraft spare parts', 5665760);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4664980, 666, 'Ammunition', 6644408);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7813049, 556, 'Bombs', 7094849);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3312902, 828, 'Fuel', 3345502);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3503334, 274, 'Missiles', 8836351);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8493193, 516, 'Fuel', 7999478);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1753117, 4, 'Ammunition', 7481871);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9700433, 548, 'Bombs', 3414667);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8011598, 711, 'Aircraft spare parts', 2492108);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8646550, 591, 'Bombs', 3997230);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6819350, 802, 'Engines', 3617094);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9399489, 685, 'Fuel', 3894143);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8478234, 63, 'Aircraft spare parts', 1719804);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9084386, 74, 'Missiles', 6522233);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6283828, 890, 'Ammunition', 1685902);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7147238, 355, 'Missiles', 2501279);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6320342, 851, 'Aircraft spare parts', 1227023);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6181076, 936, 'Aircraft spare parts', 8005820);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3818045, 543, 'Aircraft spare parts', 9842668);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4314637, 805, 'Bombs', 7494784);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5073184, 775, 'Aircraft spare parts', 1067132);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6163533, 619, 'Bombs', 2941446);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4930408, 55, 'Ammunition', 1489935);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7343930, 97, 'Fuel', 1082097);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9827687, 396, 'Missiles', 9778633);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6548710, 730, 'Aircraft spare parts', 1627194);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7403739, 429, 'Aircraft spare parts', 4693621);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9186153, 801, 'Ammunition', 7488637);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8667944, 830, 'Aircraft spare parts', 4383441);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4581099, 721, 'Missiles', 5663092);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9732773, 63, 'Bombs', 6222040);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6738628, 676, 'Ammunition', 3598298);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8108708, 430, 'Ammunition', 2979017);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5670229, 583, 'Aircraft spare parts', 5776999);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1561661, 438, 'Ammunition', 4211396);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9282469, 364, 'Engines', 1719804);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5532899, 476, 'Ammunition', 4216640);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4828171, 528, 'Missiles', 1604680);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8121466, 805, 'Fuel', 5740636);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1920078, 71, 'Missiles', 6475597);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6629101, 863, 'Bombs', 7499865);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4107033, 681, 'Engines', 5872898);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8667666, 875, 'Engines', 7094849);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8012645, 262, 'Bombs', 2607420);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6829062, 787, 'Fuel', 2245431);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3036464, 766, 'Ammunition', 9797811);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7917653, 503, 'Ammunition', 2006475);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7617650, 341, 'Engines', 3414667);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8745192, 435, 'Missiles', 2492108);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7061149, 791, 'Engines', 2492108);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8488234, 376, 'Bombs', 3894143);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8926362, 343, 'Fuel', 6522233);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3608067, 668, 'Ammunition', 1906749);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8978316, 739, 'Engines', 4573516);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1333127, 703, 'Fuel', 1277662);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2701339, 622, 'Ammunition', 3881087);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6703926, 714, 'Bombs', 1453003);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6375229, 254, 'Missiles', 9488672);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1180468, 901, 'Ammunition', 3812988);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6713928, 533, 'Missiles', 7042556);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2812175, 851, 'Bombs', 3183683);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1066692, 328, 'Ammunition', 3027847);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9970305, 282, 'Bombs', 7899860);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2181765, 127, 'Missiles', 7494784);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8642879, 96, 'Engines', 6938609);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7532549, 991, 'Bombs', 9895475);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7292099, 742, 'Aircraft spare parts', 2389852);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5206275, 833, 'Engines', 7783391);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9274272, 895, 'Bombs', 1200517);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7355181, 995, 'Engines', 1627194);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3822228, 446, 'Engines', 2667321);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3210173, 149, 'Bombs', 4457895);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2590248, 805, 'Aircraft spare parts', 2389852);
commit;
prompt 100 records committed...
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2657009, 504, 'Ammunition', 3598298);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4761481, 517, 'Aircraft spare parts', 4692725);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8374962, 327, 'Ammunition', 9194052);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7717868, 188, 'Fuel', 5918165);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6537995, 779, 'Bombs', 4023885);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9272564, 725, 'Ammunition', 9488116);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3078434, 60, 'Aircraft spare parts', 8357490);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1464856, 893, 'Bombs', 4996481);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6513137, 868, 'Fuel', 4253827);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9917593, 173, 'Fuel', 9488672);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2332170, 172, 'Aircraft spare parts', 2569477);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7757100, 947, 'Engines', 4173329);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8949975, 294, 'Missiles', 7026024);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1095604, 982, 'Fuel', 6644408);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8219042, 306, 'Aircraft spare parts', 1157014);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7076152, 240, 'Missiles', 7495137);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2506084, 740, 'Engines', 3329277);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5480041, 984, 'Bombs', 6632196);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9330708, 608, 'Engines', 5162677);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7896729, 215, 'Bombs', 5938360);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2566583, 737, 'Fuel', 8482110);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1456265, 405, 'Engines', 3564288);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7205117, 416, 'Ammunition', 8627871);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1124209, 554, 'Engines', 1840828);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5681627, 353, 'Ammunition', 2708504);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3559052, 554, 'Aircraft spare parts', 4693621);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6764008, 949, 'Bombs', 3598298);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4532139, 866, 'Engines', 1815039);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7003910, 879, 'Aircraft spare parts', 7617887);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7910090, 511, 'Aircraft spare parts', 6752205);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6750406, 993, 'Fuel', 3943663);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8199725, 373, 'Ammunition', 7783391);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8726166, 519, 'Missiles', 2627121);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9655482, 814, 'Bombs', 9488116);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8166127, 589, 'Missiles', 6522233);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9949341, 600, 'Bombs', 6475597);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1518668, 73, 'Missiles', 3880226);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2403246, 145, 'Engines', 4794509);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4709277, 721, 'Aircraft spare parts', 2391242);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5784024, 60, 'Aircraft spare parts', 2016907);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8966728, 629, 'Engines', 1150872);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4660811, 22, 'Bombs', 3879408);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9211749, 2, 'Engines', 3625535);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7324973, 945, 'Bombs', 7985300);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6008196, 247, 'Fuel', 1685902);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5272524, 480, 'Engines', 9488116);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8076726, 362, 'Bombs', 7783581);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5249053, 809, 'Bombs', 8127586);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8370964, 649, 'Aircraft spare parts', 4213017);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7857143, 765, 'Ammunition', 7127882);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5716180, 736, 'Fuel', 8280458);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4726293, 259, 'Missiles', 7292579);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9010459, 907, 'Engines', 3329277);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3245341, 18, 'Bombs', 1340571);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5988373, 753, 'Fuel', 2809855);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6857386, 640, 'Ammunition', 2649426);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4547151, 128, 'Fuel', 7486203);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4917207, 961, 'Bombs', 4214407);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2635354, 421, 'Aircraft spare parts', 4211396);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8111188, 726, 'Engines', 2006475);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3704046, 141, 'Missiles', 1598446);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3439740, 588, 'Ammunition', 1984347);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5720463, 813, 'Fuel', 8005820);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8762221, 403, 'Bombs', 2561075);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8744190, 188, 'Fuel', 6971394);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1904357, 851, 'Engines', 8269150);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5065828, 762, 'Aircraft spare parts', 7028691);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3328169, 359, 'Engines', 2707855);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5908169, 610, 'Bombs', 7028691);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6364388, 347, 'Missiles', 3345502);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5689866, 538, 'Ammunition', 4211396);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7007381, 774, 'Engines', 8896599);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9851607, 533, 'Missiles', 7028691);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7272574, 7, 'Aircraft spare parts', 1301115);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9244785, 544, 'Fuel', 1888478);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1116371, 1000, 'Engines', 3385937);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9082668, 557, 'Aircraft spare parts', 2206902);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5918575, 782, 'Bombs', 1150872);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4454078, 999, 'Fuel', 8623493);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4527315, 258, 'Bombs', 4491012);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1399555, 443, 'Fuel', 1840828);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4866462, 330, 'Aircraft spare parts', 2627121);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2550032, 630, 'Engines', 5079970);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1105555, 318, 'Missiles', 4527562);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2328008, 801, 'Missiles', 5344218);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7392221, 706, 'Missiles', 4996481);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9711218, 351, 'Bombs', 7292579);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2147096, 190, 'Missiles', 4491012);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8558808, 777, 'Missiles', 7495137);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7921250, 47, 'Bombs', 6222040);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8500002, 960, 'Engines', 5347409);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9816107, 810, 'Bombs', 2006475);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6385276, 741, 'Fuel', 1550393);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9465865, 261, 'Aircraft spare parts', 3656169);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2300032, 821, 'Aircraft spare parts', 2341058);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7582422, 730, 'Bombs', 4253827);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7140769, 972, 'Missiles', 1453003);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5062793, 714, 'Ammunition', 7142778);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5753752, 554, 'Aircraft spare parts', 6976065);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4659038, 802, 'Ammunition', 1510097);
commit;
prompt 200 records committed...
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1636186, 351, 'Aircraft spare parts', 8280458);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4210676, 918, 'Bombs', 9453155);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8199890, 719, 'Fuel', 9081656);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8439616, 869, 'Missiles', 3232451);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4597464, 43, 'Fuel', 4830313);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5307571, 216, 'Aircraft spare parts', 9778633);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9110966, 508, 'Fuel', 2200056);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5935983, 448, 'Missiles', 1033041);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9103079, 187, 'Engines', 5201831);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4088446, 474, 'Fuel', 1313329);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8530787, 430, 'Engines', 8005820);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8215627, 423, 'Missiles', 9675914);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4021545, 583, 'Fuel', 5492882);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2062687, 764, 'Ammunition', 9794238);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6511950, 999, 'Missiles', 5201831);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4839203, 729, 'Aircraft spare parts', 6752205);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9448916, 379, 'Missiles', 2667321);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5951591, 55, 'Missiles', 2607420);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2553342, 419, 'Ammunition', 7127882);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8298028, 39, 'Ammunition', 3880226);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4146287, 762, 'Bombs', 1984347);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9125871, 899, 'Fuel', 5272396);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4037638, 278, 'Missiles', 4173329);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8451583, 455, 'Ammunition', 6235298);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5977288, 640, 'Fuel', 8896599);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9043153, 118, 'Engines', 9609769);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7668802, 228, 'Aircraft spare parts', 2819021);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7965016, 191, 'Bombs', 6960681);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8345592, 332, 'Bombs', 1840828);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6685478, 490, 'Engines', 8934054);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7909587, 677, 'Engines', 2435008);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3746636, 265, 'Aircraft spare parts', 3879408);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6632408, 257, 'Engines', 3414667);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5996800, 443, 'Ammunition', 8161495);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5419036, 477, 'Ammunition', 3943663);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4385416, 181, 'Ammunition', 8029673);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6633986, 619, 'Ammunition', 6976065);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4320487, 733, 'Fuel', 6473725);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6489979, 607, 'Missiles', 3526562);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2588495, 624, 'Engines', 3292604);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5999115, 96, 'Bombs', 5269837);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9836823, 141, 'Ammunition', 4072115);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4486539, 865, 'Bombs', 4960965);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1618676, 139, 'Missiles', 5648560);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2666621, 528, 'Ammunition', 7802543);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5000503, 153, 'Bombs', 9488672);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6281623, 554, 'Bombs', 2245431);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5731923, 827, 'Bombs', 8173179);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3302872, 603, 'Bombs', 4254601);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8978139, 652, 'Missiles', 5278329);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4694431, 169, 'Aircraft spare parts', 1200517);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1614868, 24, 'Fuel', 1921039);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4739273, 544, 'Aircraft spare parts', 1200517);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5085756, 604, 'Engines', 1489935);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4927951, 85, 'Engines', 4299184);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2822305, 996, 'Aircraft spare parts', 7985300);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2409769, 800, 'Bombs', 9453155);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3226291, 743, 'Engines', 2667321);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6006459, 244, 'Bombs', 8357490);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4214691, 622, 'Aircraft spare parts', 8627871);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7788344, 728, 'Fuel', 1257997);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3327099, 265, 'Missiles', 2157015);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9213020, 843, 'Engines', 1948663);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8395650, 82, 'Bombs', 1719804);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2826520, 288, 'Aircraft spare parts', 8005820);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3777445, 508, 'Bombs', 3857827);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8526990, 22, 'Fuel', 7783581);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7149469, 547, 'Aircraft spare parts', 8887579);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2390860, 721, 'Engines', 5303110);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9866012, 646, 'Ammunition', 1840828);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8061513, 550, 'Missiles', 8887579);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7878597, 864, 'Fuel', 7432294);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8700464, 246, 'Bombs', 1184562);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6218394, 371, 'Fuel', 9609769);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3501022, 515, 'Aircraft spare parts', 9609769);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6041149, 243, 'Bombs', 5957349);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1764472, 741, 'Engines', 7996821);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1234600, 584, 'Aircraft spare parts', 9623832);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8538738, 7, 'Engines', 8934054);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2588404, 948, 'Fuel', 4409836);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1819563, 432, 'Fuel', 1118980);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8526554, 83, 'Missiles', 9522749);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9314174, 812, 'Ammunition', 2446905);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3402305, 981, 'Ammunition', 5895010);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5767456, 583, 'Ammunition', 7337064);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1355592, 246, 'Fuel', 4996481);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8850628, 92, 'Fuel', 5957349);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9732958, 769, 'Aircraft spare parts', 4364915);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4612408, 180, 'Ammunition', 2981171);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2069967, 723, 'Missiles', 2569477);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8492690, 80, 'Engines', 2154556);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8636134, 858, 'Ammunition', 4213017);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9898714, 622, 'Fuel', 2848346);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9542343, 123, 'Ammunition', 2245431);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7343739, 761, 'Ammunition', 2941446);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8410769, 591, 'Fuel', 5664370);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8148211, 405, 'Fuel', 3526562);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7607301, 700, 'Missiles', 1301115);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1703442, 565, 'Missiles', 5159434);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2036461, 803, 'Engines', 9194052);
commit;
prompt 300 records committed...
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5297773, 812, 'Aircraft spare parts', 3027847);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9498833, 39, 'Aircraft spare parts', 2667321);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2505255, 49, 'Aircraft spare parts', 3446973);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2610974, 504, 'Bombs', 6938609);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8136813, 598, 'Bombs', 1550393);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3287847, 748, 'Missiles', 7292579);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7753924, 590, 'Bombs', 4213017);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6787734, 571, 'Ammunition', 2245431);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5744784, 681, 'Ammunition', 8523816);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5319664, 142, 'Missiles', 4491012);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1962983, 69, 'Aircraft spare parts', 2848346);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3213333, 429, 'Bombs', 8701909);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4928676, 828, 'Ammunition', 2207468);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5651522, 932, 'Missiles', 2751730);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9592256, 558, 'Engines', 5663092);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7965025, 744, 'Bombs', 5835743);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2660522, 340, 'Missiles', 9675914);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3490068, 911, 'Ammunition', 9828531);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4485356, 11, 'Missiles', 1087305);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9988231, 111, 'Engines', 9794238);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3514890, 744, 'Engines', 8701909);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6628868, 644, 'Missiles', 1227023);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8307184, 948, 'Fuel', 1453003);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6534033, 736, 'Missiles', 1621944);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1106390, 475, 'Fuel', 7127882);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3885899, 152, 'Aircraft spare parts', 5994133);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8981431, 144, 'Missiles', 8459654);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2596680, 127, 'Fuel', 3617094);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4527169, 570, 'Engines', 2819021);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9541053, 603, 'Missiles', 2607420);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5128077, 317, 'Missiles', 3741554);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1351082, 784, 'Fuel', 6938326);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1784414, 351, 'Engines', 7499865);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8773636, 999, 'Aircraft spare parts', 1685902);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5500892, 815, 'Fuel', 5159434);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3590315, 881, 'Ammunition', 1678848);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4237851, 112, 'Bombs', 7438718);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2099868, 859, 'Missiles', 4780856);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1424932, 303, 'Ammunition', 5272396);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7163118, 957, 'Bombs', 1783223);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1037245, 811, 'Bombs', 2882459);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4810383, 913, 'Fuel', 2758821);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2234045, 450, 'Aircraft spare parts', 1888478);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6411397, 604, 'Engines', 3656169);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3559900, 752, 'Ammunition', 3617094);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1407730, 787, 'Fuel', 3801644);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7708367, 619, 'Aircraft spare parts', 7789746);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9607717, 152, 'Bombs', 8627871);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8848159, 277, 'Bombs', 3910956);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8043871, 687, 'Engines', 9859836);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7511823, 551, 'Missiles', 9797811);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2392811, 357, 'Engines', 6977097);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8046905, 450, 'Ammunition', 2006475);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8957682, 91, 'Engines', 6767808);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7629628, 57, 'Fuel', 3254708);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1213075, 91, 'Fuel', 1477365);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3841059, 747, 'Fuel', 5994133);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9912453, 437, 'Missiles', 6475597);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2805784, 701, 'Ammunition', 5603515);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7758069, 26, 'Fuel', 5201831);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9893080, 744, 'Bombs', 3027847);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1633390, 805, 'Engines', 8357490);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2980585, 489, 'Fuel', 4216640);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8398017, 326, 'Missiles', 2249892);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5280469, 800, 'Bombs', 5162677);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4245110, 611, 'Engines', 3635244);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5728111, 559, 'Engines', 9859836);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9621306, 330, 'Missiles', 5432571);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5933264, 751, 'Ammunition', 6383330);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3709146, 290, 'Bombs', 7617887);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4693733, 863, 'Aircraft spare parts', 3598298);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1471990, 239, 'Aircraft spare parts', 6373161);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1071542, 591, 'Ammunition', 7454917);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5261445, 984, 'Engines', 3596329);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (7031611, 861, 'Bombs', 4822423);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1987284, 811, 'Aircraft spare parts', 1360966);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6642921, 165, 'Engines', 8887579);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5849867, 233, 'Aircraft spare parts', 3183683);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (5842193, 205, 'Aircraft spare parts', 9188851);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2635068, 38, 'Ammunition', 8127586);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1760055, 854, 'Engines', 7588771);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2571688, 658, 'Ammunition', 4023885);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6609716, 425, 'Bombs', 4689005);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (3751386, 842, 'Bombs', 8623493);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9138139, 260, 'Missiles', 3183683);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1111096, 652, 'Aircraft spare parts', 9796583);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8639709, 621, 'Engines', 9675914);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4977948, 759, 'Engines', 6006500);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4532407, 900, 'Aircraft spare parts', 7245252);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6176694, 64, 'Missiles', 3449727);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4496485, 144, 'Engines', 4491012);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (4699625, 625, 'Fuel', 1962449);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6175633, 887, 'Missiles', 8482110);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2938999, 892, 'Bombs', 3881087);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (6440651, 292, 'Missiles', 6849552);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (8481955, 266, 'Fuel', 5648560);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (2215627, 620, 'Ammunition', 5835743);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1467942, 962, 'Bombs', 2211654);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (9866600, 990, 'Aircraft spare parts', 4715516);
insert into SUPPLY (supply_id, quantity, supply_name, base_id)
values (1508637, 186, 'Engines', 7603338);
commit;
prompt 400 records loaded

set feedback on
set define on
prompt Done
