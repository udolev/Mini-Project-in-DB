prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by ADMIN on יום חמישי 23 מאי 2024
set feedback off
set define off

prompt Creating STORES...
create table STORES
(
  store_id INTEGER not null,
  base     VARCHAR2(40) not null,
  capacity INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STORES
  add primary key (STORE_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ITEM...
create table ITEM
(
  serial_number INTEGER not null,
  manufact_date DATE not null,
  price         FLOAT not null,
  store_id      INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ITEM
  add primary key (SERIAL_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ITEM
  add foreign key (STORE_ID)
  references STORES (STORE_ID);

prompt Creating SOLDIER...
create table SOLDIER
(
  soldier_id   INTEGER not null,
  birth_date   DATE not null,
  soldier_rank VARCHAR2(20) not null,
  first_name   VARCHAR2(20) not null,
  last_name    VARCHAR2(20) not null,
  unit         VARCHAR2(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SOLDIER
  add primary key (SOLDIER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating OWNS...
create table OWNS
(
  serial_number INTEGER not null,
  soldier_id    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table OWNS
  add primary key (SERIAL_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table OWNS
  add foreign key (SERIAL_NUMBER)
  references ITEM (SERIAL_NUMBER);
alter table OWNS
  add foreign key (SOLDIER_ID)
  references SOLDIER (SOLDIER_ID);

prompt Creating STOREMAN...
create table STOREMAN
(
  soldier_id     INTEGER not null,
  hours_per_week FLOAT not null,
  store_id       INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STOREMAN
  add primary key (SOLDIER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STOREMAN
  add foreign key (SOLDIER_ID)
  references SOLDIER (SOLDIER_ID);
alter table STOREMAN
  add foreign key (STORE_ID)
  references STORES (STORE_ID);

prompt Creating SUPPLIER...
create table SUPPLIER
(
  company_name VARCHAR2(40) not null,
  email        VARCHAR2(40) not null,
  location     VARCHAR2(40) not null,
  company_id   INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SUPPLIER
  add primary key (COMPANY_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SUPPLIES...
create table SUPPLIES
(
  company_id INTEGER not null,
  store_id   INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SUPPLIES
  add primary key (COMPANY_ID, STORE_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
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
  officiality   VARCHAR2(10)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table UNIFORM
  add primary key (SERIAL_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table UNIFORM
  add foreign key (SERIAL_NUMBER)
  references ITEM (SERIAL_NUMBER);

prompt Creating WEAPON...
create table WEAPON
(
  weapon_type   VARCHAR2(40) not null,
  weight        FLOAT,
  serial_number INTEGER not null,
  reliability   INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WEAPON
  add primary key (SERIAL_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WEAPON
  add foreign key (SERIAL_NUMBER)
  references ITEM (SERIAL_NUMBER);

prompt Disabling triggers for STORES...
alter table STORES disable all triggers;
prompt Disabling triggers for ITEM...
alter table ITEM disable all triggers;
prompt Disabling triggers for SOLDIER...
alter table SOLDIER disable all triggers;
prompt Disabling triggers for OWNS...
alter table OWNS disable all triggers;
prompt Disabling triggers for STOREMAN...
alter table STOREMAN disable all triggers;
prompt Disabling triggers for SUPPLIER...
alter table SUPPLIER disable all triggers;
prompt Disabling triggers for SUPPLIES...
alter table SUPPLIES disable all triggers;
prompt Disabling triggers for UNIFORM...
alter table UNIFORM disable all triggers;
prompt Disabling triggers for WEAPON...
alter table WEAPON disable all triggers;
prompt Disabling foreign key constraints for ITEM...
alter table ITEM disable constraint SYS_C009535;
prompt Disabling foreign key constraints for OWNS...
alter table OWNS disable constraint SYS_C009566;
alter table OWNS disable constraint SYS_C009567;
prompt Disabling foreign key constraints for STOREMAN...
alter table STOREMAN disable constraint SYS_C009546;
alter table STOREMAN disable constraint SYS_C009547;
prompt Disabling foreign key constraints for SUPPLIES...
alter table SUPPLIES disable constraint SYS_C009571;
alter table SUPPLIES disable constraint SYS_C009572;
prompt Disabling foreign key constraints for UNIFORM...
alter table UNIFORM disable constraint SYS_C009562;
prompt Disabling foreign key constraints for WEAPON...
alter table WEAPON disable constraint SYS_C009557;
prompt Deleting WEAPON...
delete from WEAPON;
commit;
prompt Deleting UNIFORM...
delete from UNIFORM;
commit;
prompt Deleting SUPPLIES...
delete from SUPPLIES;
commit;
prompt Deleting SUPPLIER...
delete from SUPPLIER;
commit;
prompt Deleting STOREMAN...
delete from STOREMAN;
commit;
prompt Deleting OWNS...
delete from OWNS;
commit;
prompt Deleting SOLDIER...
delete from SOLDIER;
commit;
prompt Deleting ITEM...
delete from ITEM;
commit;
prompt Deleting STORES...
delete from STORES;
commit;
prompt Loading STORES...
insert into STORES (store_id, base, capacity)
values (7998045433, 'Efraim', 423);
insert into STORES (store_id, base, capacity)
values (5260113197, 'Yadin', 808);
insert into STORES (store_id, base, capacity)
values (5381021633, 'Katif', 4167);
insert into STORES (store_id, base, capacity)
values (8719506268, 'RamatDavid', 2069);
insert into STORES (store_id, base, capacity)
values (3220487253, 'Palmachim', 4264);
insert into STORES (store_id, base, capacity)
values (8994723781, 'Nevatim', 1168);
insert into STORES (store_id, base, capacity)
values (8015551792, 'Julis', 2318);
insert into STORES (store_id, base, capacity)
values (4309160419, 'Dotan', 4401);
insert into STORES (store_id, base, capacity)
values (4473030814, 'TelHashomer', 3277);
insert into STORES (store_id, base, capacity)
values (7323150268, 'Efraim', 4535);
insert into STORES (store_id, base, capacity)
values (4305773626, 'Dotan', 1037);
insert into STORES (store_id, base, capacity)
values (4094829436, 'Katif', 557);
insert into STORES (store_id, base, capacity)
values (4041541856, 'HaKirya', 4748);
insert into STORES (store_id, base, capacity)
values (4254840602, 'Yadin', 541);
insert into STORES (store_id, base, capacity)
values (8741317356, 'Zikim', 4187);
insert into STORES (store_id, base, capacity)
values (3029221199, 'TelHashomer', 1054);
insert into STORES (store_id, base, capacity)
values (7272891544, 'RamatDavid', 2179);
insert into STORES (store_id, base, capacity)
values (3558617930, 'MachanehYokneam', 4675);
insert into STORES (store_id, base, capacity)
values (6640968939, 'MachanehYokneam', 1856);
insert into STORES (store_id, base, capacity)
values (684943291, 'RamatDavid', 4969);
insert into STORES (store_id, base, capacity)
values (3824994328, 'HaKirya', 4940);
insert into STORES (store_id, base, capacity)
values (261407387, 'Julis', 2900);
insert into STORES (store_id, base, capacity)
values (8008467226, 'Katif', 4257);
insert into STORES (store_id, base, capacity)
values (6875389640, 'BeitEl', 815);
insert into STORES (store_id, base, capacity)
values (7434237718, 'Adan', 3296);
insert into STORES (store_id, base, capacity)
values (8761922338, 'Tzeelim', 4826);
insert into STORES (store_id, base, capacity)
values (127338072, 'TelHashomer', 3309);
insert into STORES (store_id, base, capacity)
values (5504829974, 'Yadin', 1246);
insert into STORES (store_id, base, capacity)
values (1069660621, 'Yadin', 128);
insert into STORES (store_id, base, capacity)
values (3379209368, 'BeitEl', 1218);
insert into STORES (store_id, base, capacity)
values (7989090403, 'RamatDavid', 2911);
insert into STORES (store_id, base, capacity)
values (7257468760, 'BeitEl', 3155);
insert into STORES (store_id, base, capacity)
values (6051015683, 'Dotan', 4617);
insert into STORES (store_id, base, capacity)
values (6909820646, 'Katif', 2278);
insert into STORES (store_id, base, capacity)
values (3033908172, 'MachanehYokneam', 3782);
insert into STORES (store_id, base, capacity)
values (5494311415, 'Zikim', 3705);
insert into STORES (store_id, base, capacity)
values (9912916709, 'Yiftah', 4660);
insert into STORES (store_id, base, capacity)
values (7857194612, 'BeitEl', 382);
insert into STORES (store_id, base, capacity)
values (2051033117, 'Adan', 4610);
insert into STORES (store_id, base, capacity)
values (2996647879, 'MachanehYokneam', 2181);
insert into STORES (store_id, base, capacity)
values (2362984114, 'MachanehYokneam', 3138);
insert into STORES (store_id, base, capacity)
values (43859418, 'Palmachim', 1506);
insert into STORES (store_id, base, capacity)
values (9560385514, 'KiryatMalakhi', 3546);
insert into STORES (store_id, base, capacity)
values (9215297133, 'MachanehYokneam', 4917);
insert into STORES (store_id, base, capacity)
values (5882221317, 'Yadin', 2014);
insert into STORES (store_id, base, capacity)
values (7873678207, 'HaKirya', 1582);
insert into STORES (store_id, base, capacity)
values (4382214167, 'Nevatim', 424);
insert into STORES (store_id, base, capacity)
values (4193257857, 'Dotan', 350);
insert into STORES (store_id, base, capacity)
values (8978310700, 'Yadin', 4152);
insert into STORES (store_id, base, capacity)
values (3532193164, 'Nevatim', 1578);
insert into STORES (store_id, base, capacity)
values (5755503158, 'Nevatim', 3787);
insert into STORES (store_id, base, capacity)
values (6213785118, 'Nevatim', 1993);
insert into STORES (store_id, base, capacity)
values (6606838009, 'Katif', 2753);
insert into STORES (store_id, base, capacity)
values (9947274359, 'TelHashomer', 23);
insert into STORES (store_id, base, capacity)
values (4993512060, 'Tzeelim', 4892);
insert into STORES (store_id, base, capacity)
values (6954833971, 'Adan', 4542);
insert into STORES (store_id, base, capacity)
values (1627572129, 'HaKirya', 4834);
insert into STORES (store_id, base, capacity)
values (7159771341, 'KiryatMalakhi', 211);
insert into STORES (store_id, base, capacity)
values (7934300986, 'KiryatMalakhi', 974);
insert into STORES (store_id, base, capacity)
values (1009400256, 'Palmachim', 4982);
insert into STORES (store_id, base, capacity)
values (3432086456, 'Dotan', 4618);
insert into STORES (store_id, base, capacity)
values (4840843889, 'Zikim', 4119);
insert into STORES (store_id, base, capacity)
values (8057578690, 'RamatDavid', 2588);
insert into STORES (store_id, base, capacity)
values (1394366144, 'HaKirya', 1063);
insert into STORES (store_id, base, capacity)
values (2195427266, 'RamatDavid', 185);
insert into STORES (store_id, base, capacity)
values (711915037, 'Julis', 245);
insert into STORES (store_id, base, capacity)
values (9851046040, 'Adan', 4715);
insert into STORES (store_id, base, capacity)
values (4068531670, 'Nevatim', 2503);
insert into STORES (store_id, base, capacity)
values (4532819678, 'Katif', 1965);
insert into STORES (store_id, base, capacity)
values (9542897224, 'RamatDavid', 966);
insert into STORES (store_id, base, capacity)
values (3312919799, 'Adan', 2636);
insert into STORES (store_id, base, capacity)
values (1711577649, 'KiryatMalakhi', 4484);
insert into STORES (store_id, base, capacity)
values (9018685179, 'Zikim', 4125);
insert into STORES (store_id, base, capacity)
values (6064937749, 'Palmachim', 2672);
insert into STORES (store_id, base, capacity)
values (900082013, 'Dotan', 1972);
insert into STORES (store_id, base, capacity)
values (2073504657, 'Zikim', 1706);
insert into STORES (store_id, base, capacity)
values (5773732563, 'Dotan', 4813);
insert into STORES (store_id, base, capacity)
values (8527911504, 'KiryatMalakhi', 4428);
insert into STORES (store_id, base, capacity)
values (3472501279, 'Yiftah', 3536);
insert into STORES (store_id, base, capacity)
values (8494880937, 'Yiftah', 4165);
insert into STORES (store_id, base, capacity)
values (7162438431, 'MachanehYokneam', 1082);
insert into STORES (store_id, base, capacity)
values (3295113117, 'Palmachim', 4114);
insert into STORES (store_id, base, capacity)
values (8763912363, 'Yadin', 1248);
insert into STORES (store_id, base, capacity)
values (8014422314, 'KiryatMalakhi', 655);
insert into STORES (store_id, base, capacity)
values (8828866526, 'RamatDavid', 1094);
insert into STORES (store_id, base, capacity)
values (44779413, 'RamatDavid', 2250);
insert into STORES (store_id, base, capacity)
values (560519940, 'Adan', 4869);
insert into STORES (store_id, base, capacity)
values (1126661700, 'KiryatMalakhi', 1452);
insert into STORES (store_id, base, capacity)
values (7689428194, 'Tzeelim', 3565);
insert into STORES (store_id, base, capacity)
values (5094140215, 'Yiftah', 3765);
insert into STORES (store_id, base, capacity)
values (9422744030, 'Tzeelim', 4937);
insert into STORES (store_id, base, capacity)
values (7856772511, 'Yiftah', 4399);
insert into STORES (store_id, base, capacity)
values (2635359704, 'BeitEl', 2704);
insert into STORES (store_id, base, capacity)
values (1434253358, 'BeitEl', 480);
insert into STORES (store_id, base, capacity)
values (198493237, 'Tzeelim', 90);
insert into STORES (store_id, base, capacity)
values (7752406588, 'MachanehYokneam', 2158);
insert into STORES (store_id, base, capacity)
values (9709423948, 'HaKirya', 2722);
insert into STORES (store_id, base, capacity)
values (9792008952, 'Yadin', 86);
insert into STORES (store_id, base, capacity)
values (9427109086, 'RamatDavid', 1308);
insert into STORES (store_id, base, capacity)
values (4456118071, 'BeitEl', 433);
commit;
prompt 100 records committed...
insert into STORES (store_id, base, capacity)
values (7732712269, 'Julis', 1447);
insert into STORES (store_id, base, capacity)
values (9862505986, 'Dotan', 3004);
insert into STORES (store_id, base, capacity)
values (7001159921, 'Adan', 2117);
insert into STORES (store_id, base, capacity)
values (3490649377, 'Nevatim', 1822);
insert into STORES (store_id, base, capacity)
values (4314102466, 'Efraim', 4685);
insert into STORES (store_id, base, capacity)
values (415522799, 'HaKirya', 351);
insert into STORES (store_id, base, capacity)
values (9603944310, 'Adan', 798);
insert into STORES (store_id, base, capacity)
values (8250848739, 'Dotan', 2451);
insert into STORES (store_id, base, capacity)
values (2863308060, 'HaKirya', 3955);
insert into STORES (store_id, base, capacity)
values (3199368328, 'Palmachim', 1800);
insert into STORES (store_id, base, capacity)
values (4549105621, 'Tzeelim', 3065);
insert into STORES (store_id, base, capacity)
values (9398613622, 'RamatDavid', 3631);
insert into STORES (store_id, base, capacity)
values (112043827, 'RamatDavid', 2139);
insert into STORES (store_id, base, capacity)
values (6484335275, 'Adan', 3112);
insert into STORES (store_id, base, capacity)
values (8772493343, 'Palmachim', 759);
insert into STORES (store_id, base, capacity)
values (9718088970, 'Nevatim', 1416);
insert into STORES (store_id, base, capacity)
values (3692035034, 'Katif', 4387);
insert into STORES (store_id, base, capacity)
values (131447274, 'Palmachim', 1954);
insert into STORES (store_id, base, capacity)
values (7442771353, 'KiryatMalakhi', 2018);
insert into STORES (store_id, base, capacity)
values (1649583078, 'KiryatMalakhi', 2003);
insert into STORES (store_id, base, capacity)
values (1245195236, 'HaKirya', 996);
insert into STORES (store_id, base, capacity)
values (1695723512, 'RamatDavid', 570);
insert into STORES (store_id, base, capacity)
values (9010351513, 'Zikim', 4013);
insert into STORES (store_id, base, capacity)
values (9726857902, 'Tzeelim', 544);
insert into STORES (store_id, base, capacity)
values (4682958986, 'MachanehYokneam', 1641);
insert into STORES (store_id, base, capacity)
values (3079312747, 'Palmachim', 2504);
insert into STORES (store_id, base, capacity)
values (6958849171, 'Palmachim', 2058);
insert into STORES (store_id, base, capacity)
values (4237643702, 'KiryatMalakhi', 3137);
insert into STORES (store_id, base, capacity)
values (5220721040, 'HaKirya', 1176);
insert into STORES (store_id, base, capacity)
values (2197776850, 'Dotan', 4461);
insert into STORES (store_id, base, capacity)
values (1674658590, 'Zikim', 3033);
insert into STORES (store_id, base, capacity)
values (4399125649, 'Julis', 476);
insert into STORES (store_id, base, capacity)
values (1281019521, 'KiryatMalakhi', 3791);
insert into STORES (store_id, base, capacity)
values (4732946988, 'TelHashomer', 4247);
insert into STORES (store_id, base, capacity)
values (373156598, 'Katif', 3617);
insert into STORES (store_id, base, capacity)
values (6245206047, 'Adan', 677);
insert into STORES (store_id, base, capacity)
values (3130013219, 'Yiftah', 2485);
insert into STORES (store_id, base, capacity)
values (9126746616, 'Palmachim', 4633);
insert into STORES (store_id, base, capacity)
values (8283282713, 'MachanehYokneam', 3027);
insert into STORES (store_id, base, capacity)
values (9676309403, 'Nevatim', 1195);
insert into STORES (store_id, base, capacity)
values (7094245914, 'RamatDavid', 3236);
insert into STORES (store_id, base, capacity)
values (6406506193, 'KiryatMalakhi', 4355);
insert into STORES (store_id, base, capacity)
values (8870701376, 'Yiftah', 960);
insert into STORES (store_id, base, capacity)
values (663483986, 'Julis', 757);
insert into STORES (store_id, base, capacity)
values (3048079767, 'Dotan', 1480);
insert into STORES (store_id, base, capacity)
values (1015657414, 'Nevatim', 3888);
insert into STORES (store_id, base, capacity)
values (1489063880, 'MachanehYokneam', 190);
insert into STORES (store_id, base, capacity)
values (362072609, 'Efraim', 815);
insert into STORES (store_id, base, capacity)
values (5739282429, 'Tzeelim', 1502);
insert into STORES (store_id, base, capacity)
values (8357509128, 'Nevatim', 369);
insert into STORES (store_id, base, capacity)
values (4798387437, 'Zikim', 2222);
insert into STORES (store_id, base, capacity)
values (7717664071, 'Efraim', 4017);
insert into STORES (store_id, base, capacity)
values (9456089279, 'Efraim', 2702);
insert into STORES (store_id, base, capacity)
values (5281120135, 'Dotan', 1053);
insert into STORES (store_id, base, capacity)
values (7405919321, 'Yadin', 2041);
insert into STORES (store_id, base, capacity)
values (6517710118, 'Efraim', 2626);
insert into STORES (store_id, base, capacity)
values (5986847282, 'Yiftah', 2449);
insert into STORES (store_id, base, capacity)
values (9139855618, 'RamatDavid', 3328);
insert into STORES (store_id, base, capacity)
values (8171193171, 'Yadin', 414);
insert into STORES (store_id, base, capacity)
values (4942167703, 'Nevatim', 4845);
insert into STORES (store_id, base, capacity)
values (1925464105, 'KiryatMalakhi', 434);
insert into STORES (store_id, base, capacity)
values (3105156743, 'Palmachim', 3529);
insert into STORES (store_id, base, capacity)
values (5137393457, 'Yiftah', 1958);
insert into STORES (store_id, base, capacity)
values (3671015115, 'Julis', 1016);
insert into STORES (store_id, base, capacity)
values (2378580045, 'Yadin', 3531);
insert into STORES (store_id, base, capacity)
values (4615379066, 'Nevatim', 4046);
insert into STORES (store_id, base, capacity)
values (1867855029, 'Katif', 504);
insert into STORES (store_id, base, capacity)
values (9691746383, 'Katif', 4555);
insert into STORES (store_id, base, capacity)
values (2828855385, 'Nevatim', 1425);
insert into STORES (store_id, base, capacity)
values (9662472323, 'Tzeelim', 1946);
insert into STORES (store_id, base, capacity)
values (9719981141, 'Dotan', 465);
insert into STORES (store_id, base, capacity)
values (7183055861, 'Tzeelim', 4118);
insert into STORES (store_id, base, capacity)
values (2300617388, 'KiryatMalakhi', 3881);
insert into STORES (store_id, base, capacity)
values (7419201939, 'BeitEl', 1164);
insert into STORES (store_id, base, capacity)
values (845393956, 'KiryatMalakhi', 1333);
insert into STORES (store_id, base, capacity)
values (2505310704, 'Tzeelim', 4761);
insert into STORES (store_id, base, capacity)
values (2255353139, 'TelHashomer', 1023);
insert into STORES (store_id, base, capacity)
values (803486996, 'Julis', 223);
insert into STORES (store_id, base, capacity)
values (3855948706, 'BeitEl', 4637);
insert into STORES (store_id, base, capacity)
values (188126018, 'Yadin', 1244);
insert into STORES (store_id, base, capacity)
values (298592433, 'Julis', 3882);
insert into STORES (store_id, base, capacity)
values (8951937158, 'Yiftah', 1985);
insert into STORES (store_id, base, capacity)
values (1726567562, 'Julis', 1059);
insert into STORES (store_id, base, capacity)
values (9929535518, 'Dotan', 1944);
insert into STORES (store_id, base, capacity)
values (1234693204, 'Tzeelim', 10);
insert into STORES (store_id, base, capacity)
values (6224217074, 'Nevatim', 3515);
insert into STORES (store_id, base, capacity)
values (4743275322, 'Yadin', 2008);
insert into STORES (store_id, base, capacity)
values (1330820784, 'Zikim', 4582);
insert into STORES (store_id, base, capacity)
values (7194272436, 'TelHashomer', 853);
insert into STORES (store_id, base, capacity)
values (8981396378, 'Julis', 1008);
insert into STORES (store_id, base, capacity)
values (591700657, 'Tzeelim', 3103);
insert into STORES (store_id, base, capacity)
values (1310384304, 'Palmachim', 3638);
insert into STORES (store_id, base, capacity)
values (2437887388, 'Tzeelim', 319);
insert into STORES (store_id, base, capacity)
values (8356241074, 'KiryatMalakhi', 1697);
insert into STORES (store_id, base, capacity)
values (4711622117, 'Nevatim', 572);
insert into STORES (store_id, base, capacity)
values (3166073625, 'BeitEl', 2907);
insert into STORES (store_id, base, capacity)
values (4740632252, 'Adan', 3704);
insert into STORES (store_id, base, capacity)
values (272314523, 'Zikim', 3485);
insert into STORES (store_id, base, capacity)
values (2853209284, 'KiryatMalakhi', 3435);
insert into STORES (store_id, base, capacity)
values (6996515713, 'TelHashomer', 3534);
commit;
prompt 200 records committed...
insert into STORES (store_id, base, capacity)
values (3006393424, 'BeitEl', 2983);
insert into STORES (store_id, base, capacity)
values (3462661594, 'KiryatMalakhi', 1039);
insert into STORES (store_id, base, capacity)
values (3780928275, 'Zikim', 1461);
insert into STORES (store_id, base, capacity)
values (8935672982, 'Adan', 3514);
insert into STORES (store_id, base, capacity)
values (1985703929, 'Efraim', 1387);
insert into STORES (store_id, base, capacity)
values (6737760058, 'Tzeelim', 4349);
insert into STORES (store_id, base, capacity)
values (3469925177, 'Palmachim', 2703);
insert into STORES (store_id, base, capacity)
values (6140354405, 'Julis', 4091);
insert into STORES (store_id, base, capacity)
values (3039337505, 'Efraim', 4233);
insert into STORES (store_id, base, capacity)
values (1341843981, 'Nevatim', 36);
insert into STORES (store_id, base, capacity)
values (9055110599, 'Yiftah', 1814);
insert into STORES (store_id, base, capacity)
values (8889599837, 'Adan', 3254);
insert into STORES (store_id, base, capacity)
values (4336329790, 'Julis', 2110);
insert into STORES (store_id, base, capacity)
values (4440812047, 'Julis', 1763);
insert into STORES (store_id, base, capacity)
values (6961077817, 'KiryatMalakhi', 1056);
insert into STORES (store_id, base, capacity)
values (9197008138, 'Yadin', 4355);
insert into STORES (store_id, base, capacity)
values (3824071590, 'MachanehYokneam', 4431);
insert into STORES (store_id, base, capacity)
values (8734165994, 'Yadin', 399);
insert into STORES (store_id, base, capacity)
values (3103587291, 'Nevatim', 4936);
insert into STORES (store_id, base, capacity)
values (6310702033, 'Efraim', 4245);
insert into STORES (store_id, base, capacity)
values (28008819, 'HaKirya', 2082);
insert into STORES (store_id, base, capacity)
values (3561117427, 'KiryatMalakhi', 907);
insert into STORES (store_id, base, capacity)
values (9933450947, 'HaKirya', 3753);
insert into STORES (store_id, base, capacity)
values (4054632455, 'Katif', 3171);
insert into STORES (store_id, base, capacity)
values (6247731793, 'Dotan', 906);
insert into STORES (store_id, base, capacity)
values (7551884229, 'HaKirya', 1068);
insert into STORES (store_id, base, capacity)
values (525402490, 'Efraim', 3571);
insert into STORES (store_id, base, capacity)
values (1630047150, 'RamatDavid', 4576);
insert into STORES (store_id, base, capacity)
values (1962143604, 'HaKirya', 4005);
insert into STORES (store_id, base, capacity)
values (2366342534, 'MachanehYokneam', 3813);
insert into STORES (store_id, base, capacity)
values (2314952425, 'Tzeelim', 58);
insert into STORES (store_id, base, capacity)
values (9322452254, 'Julis', 2909);
insert into STORES (store_id, base, capacity)
values (5172408020, 'Dotan', 2879);
insert into STORES (store_id, base, capacity)
values (6559900244, 'Yadin', 1193);
insert into STORES (store_id, base, capacity)
values (3975703508, 'Yiftah', 2508);
insert into STORES (store_id, base, capacity)
values (5499267131, 'MachanehYokneam', 769);
insert into STORES (store_id, base, capacity)
values (3329377019, 'Palmachim', 3865);
insert into STORES (store_id, base, capacity)
values (1485190959, 'Adan', 1842);
insert into STORES (store_id, base, capacity)
values (2191549381, 'Efraim', 3244);
insert into STORES (store_id, base, capacity)
values (3519532740, 'KiryatMalakhi', 2698);
insert into STORES (store_id, base, capacity)
values (3749590920, 'TelHashomer', 2830);
insert into STORES (store_id, base, capacity)
values (8640946841, 'Nevatim', 3229);
insert into STORES (store_id, base, capacity)
values (5355522402, 'BeitEl', 3556);
insert into STORES (store_id, base, capacity)
values (799358136, 'Zikim', 763);
insert into STORES (store_id, base, capacity)
values (8272317810, 'Efraim', 2629);
insert into STORES (store_id, base, capacity)
values (1438361279, 'HaKirya', 1215);
insert into STORES (store_id, base, capacity)
values (9005316961, 'RamatDavid', 2099);
insert into STORES (store_id, base, capacity)
values (2759393, 'Zikim', 3113);
insert into STORES (store_id, base, capacity)
values (4594720156, 'TelHashomer', 436);
insert into STORES (store_id, base, capacity)
values (2893899139, 'Palmachim', 1871);
insert into STORES (store_id, base, capacity)
values (9470876840, 'Dotan', 253);
insert into STORES (store_id, base, capacity)
values (5247882929, 'HaKirya', 2072);
insert into STORES (store_id, base, capacity)
values (3087552079, 'Katif', 3420);
insert into STORES (store_id, base, capacity)
values (4470308572, 'HaKirya', 2824);
insert into STORES (store_id, base, capacity)
values (3380981990, 'Dotan', 3884);
insert into STORES (store_id, base, capacity)
values (7824424657, 'Efraim', 3597);
insert into STORES (store_id, base, capacity)
values (6586650711, 'Efraim', 3715);
insert into STORES (store_id, base, capacity)
values (3497285055, 'Julis', 1752);
insert into STORES (store_id, base, capacity)
values (7404015917, 'BeitEl', 468);
insert into STORES (store_id, base, capacity)
values (7468990299, 'KiryatMalakhi', 3038);
insert into STORES (store_id, base, capacity)
values (6942159379, 'RamatDavid', 1968);
insert into STORES (store_id, base, capacity)
values (6568010629, 'Yiftah', 3076);
insert into STORES (store_id, base, capacity)
values (4081165844, 'TelHashomer', 3441);
insert into STORES (store_id, base, capacity)
values (6361451930, 'Nevatim', 1661);
insert into STORES (store_id, base, capacity)
values (7706462827, 'Nevatim', 1635);
insert into STORES (store_id, base, capacity)
values (4035042798, 'Adan', 547);
insert into STORES (store_id, base, capacity)
values (3012025231, 'Palmachim', 2920);
insert into STORES (store_id, base, capacity)
values (7449507055, 'RamatDavid', 2367);
insert into STORES (store_id, base, capacity)
values (3910656292, 'BeitEl', 1471);
insert into STORES (store_id, base, capacity)
values (2023192352, 'Tzeelim', 1591);
insert into STORES (store_id, base, capacity)
values (4196055991, 'Zikim', 953);
insert into STORES (store_id, base, capacity)
values (2126843023, 'Katif', 3999);
insert into STORES (store_id, base, capacity)
values (7703434216, 'TelHashomer', 1031);
insert into STORES (store_id, base, capacity)
values (5740985568, 'TelHashomer', 3090);
insert into STORES (store_id, base, capacity)
values (3756708831, 'Zikim', 2735);
insert into STORES (store_id, base, capacity)
values (353622213, 'Tzeelim', 3851);
insert into STORES (store_id, base, capacity)
values (167134478, 'Julis', 1732);
insert into STORES (store_id, base, capacity)
values (5468834990, 'Efraim', 4076);
insert into STORES (store_id, base, capacity)
values (6042288054, 'Julis', 4330);
insert into STORES (store_id, base, capacity)
values (4092892706, 'TelHashomer', 4581);
insert into STORES (store_id, base, capacity)
values (2864156706, 'BeitEl', 1717);
insert into STORES (store_id, base, capacity)
values (1261413139, 'BeitEl', 3313);
insert into STORES (store_id, base, capacity)
values (5025045083, 'Dotan', 2878);
insert into STORES (store_id, base, capacity)
values (8367450085, 'KiryatMalakhi', 3878);
insert into STORES (store_id, base, capacity)
values (850149958, 'HaKirya', 103);
insert into STORES (store_id, base, capacity)
values (2864089839, 'Zikim', 2485);
insert into STORES (store_id, base, capacity)
values (5442740858, 'KiryatMalakhi', 3443);
insert into STORES (store_id, base, capacity)
values (8887758405, 'TelHashomer', 4490);
insert into STORES (store_id, base, capacity)
values (3201043602, 'Nevatim', 3310);
insert into STORES (store_id, base, capacity)
values (5038905616, 'KiryatMalakhi', 231);
insert into STORES (store_id, base, capacity)
values (1129019389, 'Dotan', 1288);
insert into STORES (store_id, base, capacity)
values (2746852182, 'Efraim', 2906);
insert into STORES (store_id, base, capacity)
values (9478531595, 'Yadin', 2637);
insert into STORES (store_id, base, capacity)
values (6308448206, 'BeitEl', 3342);
insert into STORES (store_id, base, capacity)
values (6649963460, 'MachanehYokneam', 2902);
insert into STORES (store_id, base, capacity)
values (9144536098, 'Efraim', 4367);
insert into STORES (store_id, base, capacity)
values (3746821747, 'Palmachim', 757);
insert into STORES (store_id, base, capacity)
values (754274858, 'Dotan', 3638);
insert into STORES (store_id, base, capacity)
values (1007528486, 'Nevatim', 1924);
insert into STORES (store_id, base, capacity)
values (5114987385, 'Nevatim', 3553);
commit;
prompt 300 records committed...
insert into STORES (store_id, base, capacity)
values (2740526322, 'BeitEl', 3218);
insert into STORES (store_id, base, capacity)
values (1697357799, 'Tzeelim', 3658);
insert into STORES (store_id, base, capacity)
values (6491145944, 'HaKirya', 4595);
insert into STORES (store_id, base, capacity)
values (4034737735, 'Palmachim', 2108);
insert into STORES (store_id, base, capacity)
values (3578687032, 'Tzeelim', 4259);
insert into STORES (store_id, base, capacity)
values (167476784, 'Yiftah', 4757);
insert into STORES (store_id, base, capacity)
values (2771095897, 'Tzeelim', 2380);
insert into STORES (store_id, base, capacity)
values (9353106044, 'Palmachim', 653);
insert into STORES (store_id, base, capacity)
values (9933939684, 'KiryatMalakhi', 1643);
insert into STORES (store_id, base, capacity)
values (260155129, 'Adan', 3923);
insert into STORES (store_id, base, capacity)
values (9098809595, 'Yadin', 3140);
insert into STORES (store_id, base, capacity)
values (1292917045, 'Zikim', 682);
insert into STORES (store_id, base, capacity)
values (1493446177, 'Katif', 322);
insert into STORES (store_id, base, capacity)
values (8367317858, 'RamatDavid', 4897);
insert into STORES (store_id, base, capacity)
values (8920688122, 'Yiftah', 4618);
insert into STORES (store_id, base, capacity)
values (3466456849, 'Julis', 3586);
insert into STORES (store_id, base, capacity)
values (5896707556, 'Zikim', 4956);
insert into STORES (store_id, base, capacity)
values (1236262640, 'Yiftah', 1209);
insert into STORES (store_id, base, capacity)
values (8928426488, 'Efraim', 4690);
insert into STORES (store_id, base, capacity)
values (6414717976, 'Palmachim', 1964);
insert into STORES (store_id, base, capacity)
values (9271702664, 'Palmachim', 3967);
insert into STORES (store_id, base, capacity)
values (9774061637, 'Adan', 4103);
insert into STORES (store_id, base, capacity)
values (9195231798, 'Julis', 3910);
insert into STORES (store_id, base, capacity)
values (7597390758, 'Nevatim', 3940);
insert into STORES (store_id, base, capacity)
values (3790288824, 'TelHashomer', 4416);
insert into STORES (store_id, base, capacity)
values (577535758, 'Julis', 2371);
insert into STORES (store_id, base, capacity)
values (8840679769, 'TelHashomer', 1191);
insert into STORES (store_id, base, capacity)
values (3251223333, 'Adan', 571);
insert into STORES (store_id, base, capacity)
values (617915992, 'Zikim', 4613);
insert into STORES (store_id, base, capacity)
values (2081070241, 'Yadin', 1251);
insert into STORES (store_id, base, capacity)
values (5903693783, 'BeitEl', 3172);
insert into STORES (store_id, base, capacity)
values (4340842495, 'Julis', 967);
insert into STORES (store_id, base, capacity)
values (1556576479, 'RamatDavid', 434);
insert into STORES (store_id, base, capacity)
values (5276367047, 'Adan', 1089);
insert into STORES (store_id, base, capacity)
values (1488574064, 'Nevatim', 3230);
insert into STORES (store_id, base, capacity)
values (3023914742, 'Palmachim', 209);
insert into STORES (store_id, base, capacity)
values (3305391502, 'Yiftah', 2303);
insert into STORES (store_id, base, capacity)
values (1770851029, 'Yadin', 3146);
insert into STORES (store_id, base, capacity)
values (1368073561, 'Yiftah', 1115);
insert into STORES (store_id, base, capacity)
values (3799577075, 'Palmachim', 2969);
insert into STORES (store_id, base, capacity)
values (208465955, 'Tzeelim', 3223);
insert into STORES (store_id, base, capacity)
values (839667416, 'Julis', 1669);
insert into STORES (store_id, base, capacity)
values (4613136344, 'Nevatim', 3988);
insert into STORES (store_id, base, capacity)
values (7058052664, 'Adan', 1571);
insert into STORES (store_id, base, capacity)
values (1777614297, 'Efraim', 2503);
insert into STORES (store_id, base, capacity)
values (9067753838, 'Yiftah', 804);
insert into STORES (store_id, base, capacity)
values (6336812574, 'Katif', 1658);
insert into STORES (store_id, base, capacity)
values (209254136, 'Tzeelim', 2310);
insert into STORES (store_id, base, capacity)
values (7268923610, 'BeitEl', 4730);
insert into STORES (store_id, base, capacity)
values (2126725238, 'MachanehYokneam', 1434);
insert into STORES (store_id, base, capacity)
values (900496394, 'Dotan', 3144);
insert into STORES (store_id, base, capacity)
values (6537827757, 'MachanehYokneam', 4734);
insert into STORES (store_id, base, capacity)
values (8781434597, 'Julis', 3621);
insert into STORES (store_id, base, capacity)
values (128193586, 'RamatDavid', 2500);
insert into STORES (store_id, base, capacity)
values (2619360974, 'TelHashomer', 2382);
insert into STORES (store_id, base, capacity)
values (9893338138, 'Zikim', 914);
insert into STORES (store_id, base, capacity)
values (9975891720, 'KiryatMalakhi', 2211);
insert into STORES (store_id, base, capacity)
values (9431365316, 'Adan', 2108);
insert into STORES (store_id, base, capacity)
values (8746782320, 'Yadin', 1021);
insert into STORES (store_id, base, capacity)
values (9974190274, 'TelHashomer', 1279);
insert into STORES (store_id, base, capacity)
values (8967262439, 'Dotan', 3219);
insert into STORES (store_id, base, capacity)
values (7605192682, 'MachanehYokneam', 3319);
insert into STORES (store_id, base, capacity)
values (479735255, 'MachanehYokneam', 3652);
insert into STORES (store_id, base, capacity)
values (1457671959, 'Nevatim', 707);
insert into STORES (store_id, base, capacity)
values (1632587230, 'Dotan', 4248);
insert into STORES (store_id, base, capacity)
values (7712522193, 'Zikim', 4058);
insert into STORES (store_id, base, capacity)
values (2650179284, 'Katif', 1011);
insert into STORES (store_id, base, capacity)
values (6317605166, 'MachanehYokneam', 4012);
insert into STORES (store_id, base, capacity)
values (7163319710, 'BeitEl', 1564);
insert into STORES (store_id, base, capacity)
values (3213318404, 'Julis', 4007);
insert into STORES (store_id, base, capacity)
values (5176914888, 'Efraim', 2406);
insert into STORES (store_id, base, capacity)
values (8959262012, 'Zikim', 1604);
insert into STORES (store_id, base, capacity)
values (2160440590, 'BeitEl', 1014);
insert into STORES (store_id, base, capacity)
values (6226352815, 'TelHashomer', 1481);
insert into STORES (store_id, base, capacity)
values (3106691424, 'KiryatMalakhi', 519);
insert into STORES (store_id, base, capacity)
values (7455337253, 'Palmachim', 3686);
insert into STORES (store_id, base, capacity)
values (5150734028, 'MachanehYokneam', 876);
insert into STORES (store_id, base, capacity)
values (4046490551, 'BeitEl', 3910);
insert into STORES (store_id, base, capacity)
values (3686348545, 'Dotan', 1305);
insert into STORES (store_id, base, capacity)
values (7207154142, 'Efraim', 1219);
insert into STORES (store_id, base, capacity)
values (9832737195, 'Adan', 1920);
insert into STORES (store_id, base, capacity)
values (8679296847, 'MachanehYokneam', 4773);
insert into STORES (store_id, base, capacity)
values (4024776489, 'MachanehYokneam', 1600);
insert into STORES (store_id, base, capacity)
values (6784021008, 'Zikim', 1179);
insert into STORES (store_id, base, capacity)
values (1217704657, 'BeitEl', 2578);
insert into STORES (store_id, base, capacity)
values (1625879836, 'BeitEl', 3765);
insert into STORES (store_id, base, capacity)
values (2089357011, 'Adan', 295);
insert into STORES (store_id, base, capacity)
values (6810415683, 'Dotan', 3373);
insert into STORES (store_id, base, capacity)
values (3686259046, 'MachanehYokneam', 620);
insert into STORES (store_id, base, capacity)
values (7952258665, 'Yiftah', 2186);
insert into STORES (store_id, base, capacity)
values (5066853243, 'Julis', 3534);
insert into STORES (store_id, base, capacity)
values (546285283, 'TelHashomer', 1468);
insert into STORES (store_id, base, capacity)
values (4584810996, 'Yiftah', 4751);
insert into STORES (store_id, base, capacity)
values (7148321307, 'KiryatMalakhi', 2574);
insert into STORES (store_id, base, capacity)
values (9623978107, 'Yiftah', 4147);
insert into STORES (store_id, base, capacity)
values (2480992828, 'Dotan', 176);
insert into STORES (store_id, base, capacity)
values (265482596, 'Palmachim', 1987);
insert into STORES (store_id, base, capacity)
values (2313663892, 'Dotan', 1996);
insert into STORES (store_id, base, capacity)
values (1836771829, 'Dotan', 2408);
insert into STORES (store_id, base, capacity)
values (3609675609, 'BeitEl', 722);
commit;
prompt 400 records loaded
prompt Loading ITEM...
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7053260187, to_date('08-11-2017', 'dd-mm-yyyy'), 138380.49, 2051033117);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3680210664, to_date('30-06-1997', 'dd-mm-yyyy'), 110537.22, 3199368328);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5836903518, to_date('04-08-2007', 'dd-mm-yyyy'), 76494.52, 1697357799);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8451575436, to_date('10-12-2017', 'dd-mm-yyyy'), 116264.28, 5499267131);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9726764684, to_date('30-11-1996', 'dd-mm-yyyy'), 197955.3, 198493237);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1834828258, to_date('08-10-2001', 'dd-mm-yyyy'), 196973.01, 4993512060);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3330706469, to_date('06-09-2021', 'dd-mm-yyyy'), 40299.62, 3466456849);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5756394082, to_date('19-01-2011', 'dd-mm-yyyy'), 83506.78, 3006393424);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (38179425, to_date('26-03-2023', 'dd-mm-yyyy'), 10228.39, 7194272436);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (390672970, to_date('25-07-2023', 'dd-mm-yyyy'), 194493.57, 9691746383);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9676581907, to_date('04-11-2007', 'dd-mm-yyyy'), 62612.84, 6954833971);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3873774387, to_date('10-06-1997', 'dd-mm-yyyy'), 16237.58, 112043827);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5642982211, to_date('15-05-1991', 'dd-mm-yyyy'), 20700.99, 5025045083);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (692110927, to_date('16-05-2019', 'dd-mm-yyyy'), 171674.36, 6996515713);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1582602210, to_date('30-08-1994', 'dd-mm-yyyy'), 161882.65, 9322452254);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4389875876, to_date('29-09-1997', 'dd-mm-yyyy'), 62208.95, 9662472323);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2263419287, to_date('14-06-2016', 'dd-mm-yyyy'), 65216.24, 7873678207);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7467542023, to_date('23-11-2005', 'dd-mm-yyyy'), 10925.42, 4798387437);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7345415381, to_date('07-09-2017', 'dd-mm-yyyy'), 104836.37, 5172408020);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (891758819, to_date('28-05-1992', 'dd-mm-yyyy'), 62961.76, 3105156743);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5571303439, to_date('23-11-2008', 'dd-mm-yyyy'), 23361.28, 1129019389);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6335074087, to_date('11-12-2015', 'dd-mm-yyyy'), 149224.85, 5176914888);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6306204823, to_date('25-06-1998', 'dd-mm-yyyy'), 191166.12, 8171193171);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4344305082, to_date('02-05-2006', 'dd-mm-yyyy'), 15265.72, 8887758405);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (266082722, to_date('16-08-2003', 'dd-mm-yyyy'), 199720.22, 7934300986);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7086336983, to_date('05-04-2013', 'dd-mm-yyyy'), 51441.14, 3466456849);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5175251649, to_date('11-11-2006', 'dd-mm-yyyy'), 153586.95, 2160440590);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1228578944, to_date('13-04-1994', 'dd-mm-yyyy'), 85191.32, 9431365316);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8581056579, to_date('31-12-2019', 'dd-mm-yyyy'), 52322.25, 7605192682);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9883327420, to_date('18-07-1994', 'dd-mm-yyyy'), 45262.04, 6961077817);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9479295798, to_date('30-12-2020', 'dd-mm-yyyy'), 129274, 1777614297);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9580220237, to_date('08-09-2020', 'dd-mm-yyyy'), 136271.21, 5882221317);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5591685868, to_date('23-09-2016', 'dd-mm-yyyy'), 135731.87, 684943291);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2405274223, to_date('31-05-1991', 'dd-mm-yyyy'), 101088.87, 7272891544);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5834352081, to_date('02-02-2012', 'dd-mm-yyyy'), 111770.15, 3103587291);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6370510168, to_date('20-06-1991', 'dd-mm-yyyy'), 40153.02, 6310702033);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2031234946, to_date('16-01-2010', 'dd-mm-yyyy'), 12010.19, 7268923610);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7370138655, to_date('05-05-1992', 'dd-mm-yyyy'), 134595.8, 9662472323);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (926515357, to_date('01-05-2009', 'dd-mm-yyyy'), 177207.38, 1627572129);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7009406097, to_date('21-08-2013', 'dd-mm-yyyy'), 17627.65, 9144536098);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2482072218, to_date('31-08-2020', 'dd-mm-yyyy'), 54182.12, 4711622117);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1184275527, to_date('30-03-2012', 'dd-mm-yyyy'), 16567.61, 2619360974);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (645407922, to_date('09-06-2002', 'dd-mm-yyyy'), 114792.58, 9719981141);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3630705803, to_date('23-07-2003', 'dd-mm-yyyy'), 83165.18, 1245195236);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4681615236, to_date('23-01-1994', 'dd-mm-yyyy'), 57086.54, 1438361279);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1948558566, to_date('26-10-1991', 'dd-mm-yyyy'), 154865.88, 4035042798);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2226913709, to_date('06-08-2016', 'dd-mm-yyyy'), 193281.67, 3532193164);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4125438016, to_date('18-08-2018', 'dd-mm-yyyy'), 168716.05, 7689428194);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (158656062, to_date('11-02-2023', 'dd-mm-yyyy'), 110828.58, 3199368328);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3417211848, to_date('07-12-2023', 'dd-mm-yyyy'), 120362.45, 6406506193);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1908773791, to_date('07-08-1999', 'dd-mm-yyyy'), 143425.23, 3220487253);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1872734501, to_date('02-04-2007', 'dd-mm-yyyy'), 8319.02, 3103587291);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3558094170, to_date('01-08-2021', 'dd-mm-yyyy'), 145239.61, 5220721040);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3641201795, to_date('12-07-2009', 'dd-mm-yyyy'), 171609.99, 2437887388);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (422483010, to_date('03-06-2011', 'dd-mm-yyyy'), 40252.58, 9542897224);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6014854779, to_date('11-11-1996', 'dd-mm-yyyy'), 165346.87, 188126018);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (230008394, to_date('26-03-1999', 'dd-mm-yyyy'), 142221.52, 2126725238);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (641561064, to_date('05-10-2018', 'dd-mm-yyyy'), 185886.16, 3130013219);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2751141724, to_date('02-02-1991', 'dd-mm-yyyy'), 24229.67, 850149958);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (478856073, to_date('24-10-2008', 'dd-mm-yyyy'), 133464.66, 5281120135);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9632072596, to_date('11-05-2006', 'dd-mm-yyyy'), 101160.14, 4081165844);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6099078632, to_date('26-03-2023', 'dd-mm-yyyy'), 56592.88, 3305391502);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1400241095, to_date('12-03-1991', 'dd-mm-yyyy'), 88982.27, 9933939684);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8551873597, to_date('25-07-1990', 'dd-mm-yyyy'), 116341.78, 2863308060);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2549303948, to_date('17-10-2002', 'dd-mm-yyyy'), 146885.4, 4193257857);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8941236223, to_date('06-09-2012', 'dd-mm-yyyy'), 79339.41, 8367450085);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2272506156, to_date('23-12-2023', 'dd-mm-yyyy'), 48941.99, 8357509128);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9895127078, to_date('16-02-2023', 'dd-mm-yyyy'), 106954.26, 6140354405);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3749861360, to_date('10-09-2003', 'dd-mm-yyyy'), 87854.78, 3469925177);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (761388688, to_date('14-08-2010', 'dd-mm-yyyy'), 162221, 7183055861);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4665817453, to_date('09-08-2015', 'dd-mm-yyyy'), 91705.34, 5260113197);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7460591027, to_date('28-07-2020', 'dd-mm-yyyy'), 168704.56, 3039337505);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7571405649, to_date('14-04-1994', 'dd-mm-yyyy'), 139460.6, 8741317356);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4451001713, to_date('03-01-2000', 'dd-mm-yyyy'), 24278.36, 7605192682);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2646421433, to_date('07-09-2004', 'dd-mm-yyyy'), 121070.18, 9010351513);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1776030317, to_date('11-02-2016', 'dd-mm-yyyy'), 196828.09, 3910656292);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5514472868, to_date('02-05-1992', 'dd-mm-yyyy'), 140866.42, 8935672982);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (994233393, to_date('30-05-2019', 'dd-mm-yyyy'), 71408.39, 1649583078);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2556513514, to_date('02-12-2020', 'dd-mm-yyyy'), 151215.74, 9144536098);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2812510629, to_date('03-02-2000', 'dd-mm-yyyy'), 43030.1, 1985703929);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6295860053, to_date('25-03-2004', 'dd-mm-yyyy'), 143761.17, 1985703929);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (622407240, to_date('31-12-1990', 'dd-mm-yyyy'), 97842.8, 1368073561);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3620098614, to_date('30-11-2005', 'dd-mm-yyyy'), 20973.65, 5220721040);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2230371298, to_date('21-09-2011', 'dd-mm-yyyy'), 168613.21, 3087552079);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8883230783, to_date('09-06-2018', 'dd-mm-yyyy'), 110254.49, 9718088970);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8314172401, to_date('29-03-2023', 'dd-mm-yyyy'), 50787.15, 8014422314);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8436946271, to_date('15-05-1993', 'dd-mm-yyyy'), 58549.03, 4594720156);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4994635416, to_date('07-04-1998', 'dd-mm-yyyy'), 80196.01, 6226352815);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (902675271, to_date('06-02-2021', 'dd-mm-yyyy'), 184463.65, 6484335275);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (385429535, to_date('04-10-1991', 'dd-mm-yyyy'), 61000.83, 5739282429);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3155084673, to_date('23-07-2022', 'dd-mm-yyyy'), 157788.99, 4054632455);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6888304187, to_date('30-08-2015', 'dd-mm-yyyy'), 35194.88, 6361451930);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2510433061, to_date('17-07-2020', 'dd-mm-yyyy'), 166809.72, 9478531595);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8809827074, to_date('28-02-2018', 'dd-mm-yyyy'), 101020.69, 8494880937);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (232904835, to_date('28-09-2016', 'dd-mm-yyyy'), 149557.8, 9197008138);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4335331780, to_date('20-05-2020', 'dd-mm-yyyy'), 196026.69, 8763912363);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1010831716, to_date('13-10-2015', 'dd-mm-yyyy'), 185165.28, 4237643702);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (938811084, to_date('09-12-2015', 'dd-mm-yyyy'), 110880.67, 2650179284);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9924387366, to_date('05-03-2012', 'dd-mm-yyyy'), 110888.25, 6517710118);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4293757346, to_date('28-03-2005', 'dd-mm-yyyy'), 179744.71, 6606838009);
commit;
prompt 100 records committed...
insert into ITEM (serial_number, manufact_date, price, store_id)
values (587490820, to_date('07-08-1991', 'dd-mm-yyyy'), 123335.54, 2023192352);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4385037561, to_date('30-12-2013', 'dd-mm-yyyy'), 7995.23, 2366342534);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3509868672, to_date('20-04-1997', 'dd-mm-yyyy'), 71244.26, 3472501279);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6097157700, to_date('09-06-2016', 'dd-mm-yyyy'), 153412.03, 1457671959);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6464037187, to_date('16-09-2014', 'dd-mm-yyyy'), 167193.82, 3432086456);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (204684713, to_date('26-02-2000', 'dd-mm-yyyy'), 27911.71, 1627572129);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2715127502, to_date('08-03-2003', 'dd-mm-yyyy'), 188477.86, 8887758405);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6571298521, to_date('15-07-2010', 'dd-mm-yyyy'), 48879.72, 209254136);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2893599072, to_date('01-07-2021', 'dd-mm-yyyy'), 25309.85, 3910656292);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3160515194, to_date('24-05-2006', 'dd-mm-yyyy'), 138049.79, 9893338138);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (747316484, to_date('18-03-2016', 'dd-mm-yyyy'), 179573.99, 3490649377);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4177899180, to_date('23-03-2015', 'dd-mm-yyyy'), 164201.88, 8772493343);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4346861955, to_date('17-05-2018', 'dd-mm-yyyy'), 65809.43, 2023192352);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2683868188, to_date('18-07-1997', 'dd-mm-yyyy'), 100011.74, 4440812047);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4265394667, to_date('09-01-2022', 'dd-mm-yyyy'), 160659.22, 1245195236);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2778432526, to_date('12-03-2004', 'dd-mm-yyyy'), 186330.57, 6649963460);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1528435879, to_date('29-10-2023', 'dd-mm-yyyy'), 110711.08, 7268923610);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4879294859, to_date('10-02-2011', 'dd-mm-yyyy'), 123216.59, 3087552079);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1785298805, to_date('15-07-2011', 'dd-mm-yyyy'), 42220.6, 839667416);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8321627394, to_date('08-09-2019', 'dd-mm-yyyy'), 144972.99, 2864089839);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5023198951, to_date('07-01-1999', 'dd-mm-yyyy'), 95466.04, 7857194612);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7427208123, to_date('27-01-1999', 'dd-mm-yyyy'), 143213.32, 8640946841);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3702815764, to_date('02-12-2006', 'dd-mm-yyyy'), 109801.13, 3329377019);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8545467179, to_date('05-06-1990', 'dd-mm-yyyy'), 26576.51, 2314952425);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9820336654, to_date('24-09-2017', 'dd-mm-yyyy'), 136090.31, 6640968939);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6075899124, to_date('18-08-1996', 'dd-mm-yyyy'), 141385.29, 3910656292);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2976639701, to_date('02-01-2020', 'dd-mm-yyyy'), 157163.66, 3855948706);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9205556849, to_date('31-07-2017', 'dd-mm-yyyy'), 17025.1, 7194272436);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8878444019, to_date('16-04-2019', 'dd-mm-yyyy'), 27170.35, 9933450947);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2470087389, to_date('01-02-2017', 'dd-mm-yyyy'), 117896.02, 5504829974);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5833378046, to_date('02-01-2008', 'dd-mm-yyyy'), 151751.89, 3532193164);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (315142032, to_date('11-12-2004', 'dd-mm-yyyy'), 60839.99, 1630047150);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8223248730, to_date('24-08-2021', 'dd-mm-yyyy'), 18397.23, 9055110599);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1408371941, to_date('22-11-2008', 'dd-mm-yyyy'), 88242.09, 6875389640);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2824010364, to_date('04-08-2001', 'dd-mm-yyyy'), 95923.69, 5504829974);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7067267583, to_date('13-02-2000', 'dd-mm-yyyy'), 92049.89, 3023914742);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2009814228, to_date('26-04-2000', 'dd-mm-yyyy'), 109727.72, 2893899139);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (325655207, to_date('03-08-2014', 'dd-mm-yyyy'), 72183.77, 2650179284);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3057183134, to_date('05-05-2020', 'dd-mm-yyyy'), 103494.94, 4034737735);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8936946513, to_date('17-04-1991', 'dd-mm-yyyy'), 104364.61, 3201043602);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9931713814, to_date('29-04-2004', 'dd-mm-yyyy'), 155194.06, 577535758);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9176613838, to_date('24-11-1997', 'dd-mm-yyyy'), 185556.4, 5220721040);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3970933202, to_date('05-05-2012', 'dd-mm-yyyy'), 181535.14, 5739282429);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (529209147, to_date('19-04-2016', 'dd-mm-yyyy'), 95544.74, 6406506193);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8907998716, to_date('24-01-2004', 'dd-mm-yyyy'), 178471.01, 7163319710);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7550791935, to_date('24-12-2011', 'dd-mm-yyyy'), 89010.41, 2023192352);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5855194343, to_date('10-07-2004', 'dd-mm-yyyy'), 173008.05, 5281120135);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9670792326, to_date('08-11-2006', 'dd-mm-yyyy'), 159153.46, 7163319710);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8853811992, to_date('20-10-2002', 'dd-mm-yyyy'), 45984, 5276367047);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1235292391, to_date('26-11-2002', 'dd-mm-yyyy'), 29444.31, 4399125649);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2311582629, to_date('03-09-2009', 'dd-mm-yyyy'), 32653.54, 5381021633);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6948275372, to_date('29-08-2008', 'dd-mm-yyyy'), 50835.13, 9676309403);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4013596334, to_date('05-06-2008', 'dd-mm-yyyy'), 87496.54, 7268923610);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5124048563, to_date('16-08-1991', 'dd-mm-yyyy'), 162158.28, 128193586);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5090139576, to_date('13-09-2003', 'dd-mm-yyyy'), 110181.94, 362072609);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2507653405, to_date('06-02-2013', 'dd-mm-yyyy'), 107009.63, 9719981141);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7650357697, to_date('30-09-2007', 'dd-mm-yyyy'), 20978.09, 5903693783);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1680834889, to_date('05-08-2022', 'dd-mm-yyyy'), 149114.95, 9974190274);
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
values (5003249514, to_date('21-06-2023', 'dd-mm-yyyy'), 104246.23, 3305391502);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2854977328, to_date('10-04-2015', 'dd-mm-yyyy'), 69954.08, 373156598);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8993860800, to_date('05-05-2003', 'dd-mm-yyyy'), 69652.02, 6361451930);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3842884879, to_date('16-11-2023', 'dd-mm-yyyy'), 154080.53, 8283282713);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9333939838, to_date('20-10-2008', 'dd-mm-yyyy'), 5032.76, 8828866526);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3245910012, to_date('11-05-2005', 'dd-mm-yyyy'), 41556.91, 7824424657);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2773902643, to_date('23-01-2004', 'dd-mm-yyyy'), 195840.68, 9603944310);
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
values (3638226067, to_date('31-08-1993', 'dd-mm-yyyy'), 92122.41, 198493237);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9584655068, to_date('29-01-2009', 'dd-mm-yyyy'), 35955.13, 2864089839);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1977854324, to_date('10-06-1991', 'dd-mm-yyyy'), 190916.35, 2300617388);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1769138498, to_date('23-01-2022', 'dd-mm-yyyy'), 92306.96, 4615379066);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9540178816, to_date('11-08-2009', 'dd-mm-yyyy'), 145204.99, 4196055991);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7124291017, to_date('17-07-2011', 'dd-mm-yyyy'), 37869.16, 6640968939);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2277124599, to_date('30-11-2018', 'dd-mm-yyyy'), 191224.53, 2300617388);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1333311341, to_date('16-08-1991', 'dd-mm-yyyy'), 90581.46, 5114987385);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9572959789, to_date('03-08-2002', 'dd-mm-yyyy'), 56651.95, 711915037);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (285160749, to_date('05-01-1992', 'dd-mm-yyyy'), 3512.9, 7183055861);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3876762268, to_date('11-09-2010', 'dd-mm-yyyy'), 198911.85, 9709423948);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (892037875, to_date('24-07-1997', 'dd-mm-yyyy'), 83824.48, 43859418);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1929631780, to_date('02-04-2020', 'dd-mm-yyyy'), 190001.19, 1962143604);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5091022909, to_date('04-08-2018', 'dd-mm-yyyy'), 176168.74, 1962143604);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6652019407, to_date('22-04-1990', 'dd-mm-yyyy'), 91108.79, 3105156743);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8562475536, to_date('10-12-1991', 'dd-mm-yyyy'), 162849.63, 8935672982);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5642591639, to_date('09-05-2018', 'dd-mm-yyyy'), 189092.44, 5504829974);
commit;
prompt 200 records committed...
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9575266503, to_date('11-03-1994', 'dd-mm-yyyy'), 54268.86, 3497285055);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1803488600, to_date('26-01-2021', 'dd-mm-yyyy'), 152497.09, 8981396378);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2210819525, to_date('14-09-2011', 'dd-mm-yyyy'), 145997.53, 9271702664);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (739009819, to_date('26-11-2012', 'dd-mm-yyyy'), 106308.92, 5499267131);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5007486095, to_date('12-08-2003', 'dd-mm-yyyy'), 30692.65, 7148321307);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9237887302, to_date('14-09-2017', 'dd-mm-yyyy'), 114066.23, 3532193164);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3163000447, to_date('24-06-2021', 'dd-mm-yyyy'), 132960.58, 1493446177);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1988266166, to_date('18-04-2005', 'dd-mm-yyyy'), 149172.05, 9792008952);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8492082501, to_date('28-09-2002', 'dd-mm-yyyy'), 40714.3, 6245206047);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6743868091, to_date('18-04-2013', 'dd-mm-yyyy'), 10098.39, 8772493343);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7999946869, to_date('10-01-2020', 'dd-mm-yyyy'), 180847.07, 8679296847);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5165544117, to_date('20-10-2007', 'dd-mm-yyyy'), 31775.74, 2864089839);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6049262641, to_date('01-09-2019', 'dd-mm-yyyy'), 116082.6, 3462661594);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2324699039, to_date('26-12-2011', 'dd-mm-yyyy'), 155526.04, 7272891544);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2629501774, to_date('30-07-2009', 'dd-mm-yyyy'), 33881.95, 6784021008);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4758040032, to_date('08-01-2019', 'dd-mm-yyyy'), 81024.95, 6875389640);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1262299833, to_date('26-06-2013', 'dd-mm-yyyy'), 3646.25, 9832737195);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9523148241, to_date('18-05-1995', 'dd-mm-yyyy'), 49277.42, 2619360974);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7014455172, to_date('23-07-2001', 'dd-mm-yyyy'), 20772.34, 5220721040);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2140841427, to_date('09-12-2007', 'dd-mm-yyyy'), 73348.18, 2300617388);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1200615407, to_date('24-03-2020', 'dd-mm-yyyy'), 13374.99, 9431365316);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (482885185, to_date('13-11-2000', 'dd-mm-yyyy'), 112298.94, 3380981990);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9409136868, to_date('23-05-2016', 'dd-mm-yyyy'), 155401.26, 1726567562);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9204521715, to_date('30-06-2006', 'dd-mm-yyyy'), 118891.56, 3006393424);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3824151839, to_date('18-09-1997', 'dd-mm-yyyy'), 89669.65, 5381021633);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8616378236, to_date('29-08-2010', 'dd-mm-yyyy'), 102068.57, 4309160419);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3877381022, to_date('21-08-2001', 'dd-mm-yyyy'), 61687.22, 128193586);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3936947312, to_date('27-10-2005', 'dd-mm-yyyy'), 157602.31, 591700657);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1298410592, to_date('30-07-2006', 'dd-mm-yyyy'), 101437.58, 5247882929);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5265579556, to_date('14-11-2012', 'dd-mm-yyyy'), 9153.41, 4068531670);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5629509802, to_date('08-06-2021', 'dd-mm-yyyy'), 170132.44, 265482596);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1110601567, to_date('13-11-1996', 'dd-mm-yyyy'), 25585.37, 3251223333);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6087940051, to_date('11-08-2023', 'dd-mm-yyyy'), 139385.51, 2023192352);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5699999772, to_date('12-08-1998', 'dd-mm-yyyy'), 119061.63, 5494311415);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2957564496, to_date('15-08-2013', 'dd-mm-yyyy'), 36394.83, 2313663892);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8970363792, to_date('21-12-1998', 'dd-mm-yyyy'), 122768.92, 7194272436);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9848509232, to_date('05-11-2022', 'dd-mm-yyyy'), 146523.51, 415522799);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6895769343, to_date('04-09-2016', 'dd-mm-yyyy'), 182445.88, 6308448206);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1999868858, to_date('07-04-2012', 'dd-mm-yyyy'), 49578.77, 9933939684);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3111200179, to_date('28-08-2015', 'dd-mm-yyyy'), 182675.75, 8640946841);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7356040892, to_date('28-10-2019', 'dd-mm-yyyy'), 60016.3, 373156598);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8376578566, to_date('08-10-2010', 'dd-mm-yyyy'), 69330.01, 3532193164);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4745226508, to_date('18-11-2023', 'dd-mm-yyyy'), 169979.34, 4092892706);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3093322757, to_date('24-08-2011', 'dd-mm-yyyy'), 96132.98, 5114987385);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6838547615, to_date('07-12-2003', 'dd-mm-yyyy'), 163041.12, 845393956);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3826165229, to_date('26-06-2004', 'dd-mm-yyyy'), 38506.37, 9603944310);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8453732359, to_date('04-01-2015', 'dd-mm-yyyy'), 80087.35, 3519532740);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5937258864, to_date('08-07-2014', 'dd-mm-yyyy'), 125761.84, 4309160419);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3980061818, to_date('14-12-2017', 'dd-mm-yyyy'), 40299.85, 8959262012);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2654978152, to_date('04-04-2002', 'dd-mm-yyyy'), 83403.85, 1281019521);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8785584565, to_date('14-09-2014', 'dd-mm-yyyy'), 32303.11, 8356241074);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2052756423, to_date('07-04-1996', 'dd-mm-yyyy'), 106595.18, 1493446177);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5891750537, to_date('14-12-2001', 'dd-mm-yyyy'), 190229.51, 2313663892);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7811237309, to_date('15-09-2010', 'dd-mm-yyyy'), 30077.11, 3130013219);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7805191905, to_date('23-03-1999', 'dd-mm-yyyy'), 29341.72, 3033908172);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8889502433, to_date('06-10-2018', 'dd-mm-yyyy'), 156883.37, 6517710118);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (260730540, to_date('10-01-2005', 'dd-mm-yyyy'), 19027.67, 7712522193);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (942877337, to_date('02-10-2017', 'dd-mm-yyyy'), 4537.94, 1129019389);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4282853791, to_date('11-10-1994', 'dd-mm-yyyy'), 131747.31, 9271702664);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9350915849, to_date('02-04-2011', 'dd-mm-yyyy'), 62705.15, 8928426488);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7648787738, to_date('18-07-1990', 'dd-mm-yyyy'), 178073.71, 9912916709);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (201481553, to_date('21-12-2017', 'dd-mm-yyyy'), 135071.49, 4456118071);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1503426516, to_date('30-09-2003', 'dd-mm-yyyy'), 18837.65, 5276367047);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (860388597, to_date('26-04-1996', 'dd-mm-yyyy'), 84964.2, 9197008138);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5765653102, to_date('23-08-1992', 'dd-mm-yyyy'), 29707.78, 8283282713);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3512221536, to_date('10-07-1993', 'dd-mm-yyyy'), 129964.87, 5494311415);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (655266610, to_date('20-05-2020', 'dd-mm-yyyy'), 183912.42, 2437887388);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9232725334, to_date('21-10-1994', 'dd-mm-yyyy'), 16380.38, 5499267131);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1415593509, to_date('31-01-2022', 'dd-mm-yyyy'), 122960.86, 9851046040);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3209891703, to_date('20-09-2015', 'dd-mm-yyyy'), 52791.37, 7257468760);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5851355145, to_date('29-09-2005', 'dd-mm-yyyy'), 188413.45, 4399125649);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6983230755, to_date('04-12-1995', 'dd-mm-yyyy'), 197547.11, 3006393424);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3071654574, to_date('20-01-1993', 'dd-mm-yyyy'), 77503.08, 9005316961);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4577691416, to_date('25-04-2022', 'dd-mm-yyyy'), 154551.76, 9144536098);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7760305070, to_date('02-06-2002', 'dd-mm-yyyy'), 14192.19, 2619360974);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9430521484, to_date('21-12-1999', 'dd-mm-yyyy'), 109959.2, 9018685179);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9133040940, to_date('27-04-2020', 'dd-mm-yyyy'), 196074.95, 9851046040);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (908979604, to_date('24-01-2010', 'dd-mm-yyyy'), 10465.67, 6051015683);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5355726709, to_date('19-11-2014', 'dd-mm-yyyy'), 87867.45, 7207154142);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8163829791, to_date('12-12-2010', 'dd-mm-yyyy'), 92334.34, 3023914742);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3390750082, to_date('09-01-2010', 'dd-mm-yyyy'), 161426.52, 9726857902);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4457245265, to_date('23-10-2023', 'dd-mm-yyyy'), 65444.5, 3213318404);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4849937660, to_date('29-09-1998', 'dd-mm-yyyy'), 83136.75, 9933939684);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8899279252, to_date('24-12-1990', 'dd-mm-yyyy'), 111592.95, 7404015917);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6495295562, to_date('22-09-1994', 'dd-mm-yyyy'), 187190.39, 9623978107);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (483302118, to_date('11-03-2020', 'dd-mm-yyyy'), 67339.38, 6361451930);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6815959712, to_date('04-09-2020', 'dd-mm-yyyy'), 103814.28, 6640968939);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9081084175, to_date('01-07-1998', 'dd-mm-yyyy'), 91521.22, 6213785118);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2173913130, to_date('22-01-2008', 'dd-mm-yyyy'), 45185.76, 8250848739);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2254129654, to_date('14-08-2001', 'dd-mm-yyyy'), 116389.95, 1695723512);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (866097764, to_date('21-01-1999', 'dd-mm-yyyy'), 198073.45, 3749590920);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1164029589, to_date('02-02-2002', 'dd-mm-yyyy'), 72266.78, 8828866526);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (955629631, to_date('05-07-2008', 'dd-mm-yyyy'), 71427.4, 8959262012);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (683348723, to_date('04-06-2008', 'dd-mm-yyyy'), 152309.46, 9422744030);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3667968980, to_date('23-06-2013', 'dd-mm-yyyy'), 86861.56, 8527911504);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3897040961, to_date('18-08-2009', 'dd-mm-yyyy'), 78841.28, 362072609);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1280240574, to_date('09-04-2001', 'dd-mm-yyyy'), 101945.03, 1777614297);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8343971343, to_date('27-07-1997', 'dd-mm-yyyy'), 195011.5, 9792008952);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (543820185, to_date('13-06-2006', 'dd-mm-yyyy'), 52832.44, 4237643702);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2838153407, to_date('08-10-2000', 'dd-mm-yyyy'), 115021.34, 4711622117);
commit;
prompt 300 records committed...
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5781075011, to_date('26-04-2011', 'dd-mm-yyyy'), 88760.39, 2378580045);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2195341596, to_date('09-12-2023', 'dd-mm-yyyy'), 58093.53, 7952258665);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5021473481, to_date('31-10-2004', 'dd-mm-yyyy'), 176785.67, 3561117427);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9680612994, to_date('22-09-2005', 'dd-mm-yyyy'), 101025.1, 2996647879);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5624202797, to_date('23-01-2001', 'dd-mm-yyyy'), 82434.12, 9067753838);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7192383516, to_date('09-08-2006', 'dd-mm-yyyy'), 39108.48, 2073504657);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1573851561, to_date('07-11-2005', 'dd-mm-yyyy'), 76118.41, 9893338138);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7982327048, to_date('20-10-1990', 'dd-mm-yyyy'), 64730.43, 4094829436);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3854171921, to_date('02-02-2008', 'dd-mm-yyyy'), 185260.83, 6308448206);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3275996479, to_date('16-10-1997', 'dd-mm-yyyy'), 97393.49, 3039337505);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3325538218, to_date('03-05-2007', 'dd-mm-yyyy'), 33896.9, 546285283);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4495799564, to_date('08-10-2010', 'dd-mm-yyyy'), 71327.53, 415522799);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (543568112, to_date('23-06-1998', 'dd-mm-yyyy'), 7114.39, 5468834990);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8321964413, to_date('01-07-2015', 'dd-mm-yyyy'), 23875.75, 6484335275);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2164950368, to_date('05-01-1996', 'dd-mm-yyyy'), 157998.08, 6491145944);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7252212975, to_date('07-08-2013', 'dd-mm-yyyy'), 94479.82, 7873678207);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9528784025, to_date('30-01-1994', 'dd-mm-yyyy'), 73053.52, 1632587230);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1450848120, to_date('30-03-2019', 'dd-mm-yyyy'), 58173.64, 3012025231);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (251857345, to_date('14-06-2014', 'dd-mm-yyyy'), 54653.94, 1281019521);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1415456917, to_date('06-07-2014', 'dd-mm-yyyy'), 191409.55, 9010351513);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3924559881, to_date('23-03-1998', 'dd-mm-yyyy'), 135503.49, 6942159379);
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
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8340853932, to_date('12-09-1998', 'dd-mm-yyyy'), 196906.55, 2480992828);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6439774971, to_date('18-01-1998', 'dd-mm-yyyy'), 92568.24, 3686259046);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9073260014, to_date('30-07-2005', 'dd-mm-yyyy'), 86829.66, 9067753838);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5977343407, to_date('18-10-2015', 'dd-mm-yyyy'), 11496.95, 4305773626);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2512363797, to_date('18-06-2001', 'dd-mm-yyyy'), 128368.38, 9456089279);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (998751341, to_date('04-06-2002', 'dd-mm-yyyy'), 64540.11, 8994723781);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6958086779, to_date('22-01-2019', 'dd-mm-yyyy'), 137804.98, 8928426488);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5386635504, to_date('27-03-1990', 'dd-mm-yyyy'), 96145, 9470876840);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6540687170, to_date('11-09-2022', 'dd-mm-yyyy'), 41493.3, 8057578690);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9359418172, to_date('11-07-2006', 'dd-mm-yyyy'), 148847.85, 617915992);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7374716055, to_date('21-12-2000', 'dd-mm-yyyy'), 187800, 3329377019);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1475863296, to_date('19-12-2003', 'dd-mm-yyyy'), 137826.29, 4340842495);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1435507476, to_date('15-12-2019', 'dd-mm-yyyy'), 19867.9, 188126018);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8568175602, to_date('30-11-2010', 'dd-mm-yyyy'), 136746.77, 2081070241);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1079825445, to_date('10-10-2005', 'dd-mm-yyyy'), 161991.07, 4196055991);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (933290972, to_date('28-08-2008', 'dd-mm-yyyy'), 175692.09, 617915992);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4102448880, to_date('22-05-2003', 'dd-mm-yyyy'), 102151.1, 9676309403);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2589020774, to_date('10-11-2009', 'dd-mm-yyyy'), 153526.92, 2864156706);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (673214350, to_date('14-03-2001', 'dd-mm-yyyy'), 185384.45, 1261413139);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8848122298, to_date('03-03-2015', 'dd-mm-yyyy'), 66715.36, 3023914742);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4135878550, to_date('21-11-2014', 'dd-mm-yyyy'), 58420.62, 265482596);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8526305078, to_date('04-06-2004', 'dd-mm-yyyy'), 190032.77, 9603944310);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3036573687, to_date('25-10-2003', 'dd-mm-yyyy'), 177710.95, 4196055991);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (774580020, to_date('10-10-2005', 'dd-mm-yyyy'), 119289.72, 5381021633);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3293025958, to_date('08-09-2015', 'dd-mm-yyyy'), 78913.01, 167476784);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4152220811, to_date('29-06-2015', 'dd-mm-yyyy'), 3491.07, 6810415683);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5210986503, to_date('05-12-2009', 'dd-mm-yyyy'), 87223.02, 9422744030);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7184224880, to_date('22-06-1994', 'dd-mm-yyyy'), 146072.72, 4081165844);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6998256864, to_date('16-08-2007', 'dd-mm-yyyy'), 131071.61, 5903693783);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6961578331, to_date('16-01-1990', 'dd-mm-yyyy'), 126305.4, 2378580045);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6759189070, to_date('05-12-1991', 'dd-mm-yyyy'), 87211.76, 9933939684);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1606707193, to_date('13-01-2015', 'dd-mm-yyyy'), 149300.7, 167476784);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9187893375, to_date('10-09-1999', 'dd-mm-yyyy'), 101882.92, 7163319710);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5465795150, to_date('27-11-1999', 'dd-mm-yyyy'), 54159.77, 7998045433);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8655033031, to_date('14-02-1995', 'dd-mm-yyyy'), 52927.42, 9005316961);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5452670529, to_date('30-07-1993', 'dd-mm-yyyy'), 43217.78, 6042288054);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3050012091, to_date('12-12-2019', 'dd-mm-yyyy'), 118728.85, 5038905616);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (798188194, to_date('03-10-1999', 'dd-mm-yyyy'), 53211.87, 1836771829);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6941805533, to_date('04-03-2014', 'dd-mm-yyyy'), 148302.25, 2740526322);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2750118238, to_date('07-05-1990', 'dd-mm-yyyy'), 144054.39, 7732712269);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8897890075, to_date('17-10-2006', 'dd-mm-yyyy'), 123916.1, 6961077817);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8758416804, to_date('02-08-1992', 'dd-mm-yyyy'), 78260.22, 8171193171);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1372061954, to_date('21-02-2013', 'dd-mm-yyyy'), 171251.88, 4732946988);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (878905313, to_date('26-08-2014', 'dd-mm-yyyy'), 102170.11, 6737760058);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4114272739, to_date('04-10-2011', 'dd-mm-yyyy'), 17058.09, 2437887388);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5696934493, to_date('24-02-1993', 'dd-mm-yyyy'), 99130.69, 8994723781);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (4522656863, to_date('02-12-1995', 'dd-mm-yyyy'), 165107.78, 9098809595);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8164614079, to_date('09-02-2019', 'dd-mm-yyyy'), 151418.61, 9774061637);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8260501471, to_date('09-05-1996', 'dd-mm-yyyy'), 26232.81, 9478531595);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7444300184, to_date('26-01-2019', 'dd-mm-yyyy'), 13662.15, 3166073625);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6949933028, to_date('30-08-2007', 'dd-mm-yyyy'), 70772.13, 3824994328);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2307184703, to_date('11-10-2002', 'dd-mm-yyyy'), 132909.17, 1217704657);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (7447089392, to_date('24-04-2020', 'dd-mm-yyyy'), 11564.89, 5773732563);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9305240493, to_date('31-07-2006', 'dd-mm-yyyy'), 185560.6, 8959262012);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3739214383, to_date('15-03-2020', 'dd-mm-yyyy'), 190377.71, 260155129);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6788615513, to_date('03-11-2008', 'dd-mm-yyyy'), 60503.91, 1697357799);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9528830090, to_date('16-02-2013', 'dd-mm-yyyy'), 105679.84, 5150734028);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5990448028, to_date('01-12-2012', 'dd-mm-yyyy'), 158804.26, 1674658590);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9918192368, to_date('03-06-1995', 'dd-mm-yyyy'), 198515.14, 2759393);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9201709199, to_date('14-05-2022', 'dd-mm-yyyy'), 70882.27, 415522799);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (8638171133, to_date('23-01-2017', 'dd-mm-yyyy'), 60124.98, 9929535518);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1123396738, to_date('09-11-2015', 'dd-mm-yyyy'), 109790.72, 1625879836);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6915106091, to_date('23-12-1990', 'dd-mm-yyyy'), 130562.72, 2126725238);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (6192309066, to_date('30-07-2015', 'dd-mm-yyyy'), 75247.85, 3029221199);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (820431040, to_date('10-02-2006', 'dd-mm-yyyy'), 176855.54, 2378580045);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (10666183, to_date('28-09-1993', 'dd-mm-yyyy'), 13757.21, 1292917045);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (9361021734, to_date('10-01-1999', 'dd-mm-yyyy'), 30951.9, 617915992);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2231117282, to_date('16-04-2008', 'dd-mm-yyyy'), 150532.92, 4840843889);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2639500814, to_date('19-02-1995', 'dd-mm-yyyy'), 127063.41, 9215297133);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3589290562, to_date('17-02-2006', 'dd-mm-yyyy'), 121592.98, 8920688122);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (5577018152, to_date('27-09-1994', 'dd-mm-yyyy'), 85088.6, 7159771341);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (1943603908, to_date('27-07-2022', 'dd-mm-yyyy'), 194699.44, 2378580045);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (3876469407, to_date('19-10-2004', 'dd-mm-yyyy'), 125758.33, 7752406588);
insert into ITEM (serial_number, manufact_date, price, store_id)
values (2591365316, to_date('10-12-2023', 'dd-mm-yyyy'), 97404.55, 6954833971);
commit;
prompt 400 records loaded
prompt Loading SOLDIER...
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (807378623, to_date('09-07-1973', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Gal', 'Levi', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (349984301, to_date('23-10-1952', 'dd-mm-yyyy'), 'Rotem', 'Alon', 'Mizrahi', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (328124739, to_date('09-11-1967', 'dd-mm-yyyy'), 'RavSamal', 'Alon', 'Malka', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (867539907, to_date('17-05-1983', 'dd-mm-yyyy'), 'RavSamal', 'Ronen', 'Mor', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (918922079, to_date('19-07-1975', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Lia', 'Dayan', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (655001398, to_date('12-07-1983', 'dd-mm-yyyy'), 'RavAluf', 'Ziv', 'Ben-Avraham', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (939435895, to_date('13-01-1972', 'dd-mm-yyyy'), 'SegenMishneh', 'Galit', 'Mizrahi', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (597520467, to_date('02-09-1982', 'dd-mm-yyyy'), 'RavAlufBait', 'Shira', 'Amar', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (876816056, to_date('10-03-1962', 'dd-mm-yyyy'), 'RavTurai', 'Dana', 'Levi', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (896592730, to_date('13-02-1984', 'dd-mm-yyyy'), 'SegenMishneh', 'Erez', 'Azoulay', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (270641945, to_date('03-09-1963', 'dd-mm-yyyy'), 'Aluf', 'Matan', 'Ben-Haim', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (894326216, to_date('31-01-1978', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Ziv', 'Dayan', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (330583188, to_date('28-03-1990', 'dd-mm-yyyy'), 'RavAluf', 'Elad', 'David', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (412660931, to_date('07-03-1955', 'dd-mm-yyyy'), 'Turai', 'Noga', 'Mizrahi', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (863879911, to_date('01-01-1951', 'dd-mm-yyyy'), 'RavTurai', 'Yonatan', 'Ben-Avraham', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (78008934, to_date('15-02-1967', 'dd-mm-yyyy'), 'RavAlufBait', 'Oren', 'Azoulay', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (276412817, to_date('09-01-1959', 'dd-mm-yyyy'), 'RavAluf', 'Dana', 'Azulay', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (707520332, to_date('19-07-1998', 'dd-mm-yyyy'), 'SamalRishon', 'Eitan', 'Mor', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (257132733, to_date('01-06-1968', 'dd-mm-yyyy'), 'TatAluf', 'Tal', 'Mizrahi', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (303278765, to_date('30-01-1997', 'dd-mm-yyyy'), 'SamalRishon', 'Oren', 'Amar', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (192279463, to_date('30-12-1996', 'dd-mm-yyyy'), 'Segen', 'Amir', 'Bitton', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (717915866, to_date('01-09-1957', 'dd-mm-yyyy'), 'Segen', 'Aviv', 'Mizrahi', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (891969849, to_date('27-04-1968', 'dd-mm-yyyy'), 'AlufMishne', 'Nir', 'Mor', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (191031722, to_date('01-10-1956', 'dd-mm-yyyy'), 'RavTurai', 'Ronen', 'Amar', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (895727331, to_date('17-10-1960', 'dd-mm-yyyy'), 'ReshoomSitum', 'Nir', 'Avraham', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (244887596, to_date('01-09-1992', 'dd-mm-yyyy'), 'AlufMishne', 'Maya', 'Mor', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (699278615, to_date('18-07-1968', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Roni', 'Ben-Haim', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (398012055, to_date('26-11-1987', 'dd-mm-yyyy'), 'SegenMishneh', 'Elad', 'Levi', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (602849931, to_date('22-09-1974', 'dd-mm-yyyy'), 'Segen', 'Ronen', 'Mizrahi', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (227809174, to_date('23-04-1980', 'dd-mm-yyyy'), 'SamalRishon', 'Maya', 'Cohen', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (732272262, to_date('07-08-2002', 'dd-mm-yyyy'), 'Rotem', 'Roni', 'Cohen', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (444519972, to_date('01-01-1974', 'dd-mm-yyyy'), 'ReshoomSitum', 'Shachar', 'Bitton', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (276265447, to_date('03-12-1994', 'dd-mm-yyyy'), 'AlufMishne', 'Erez', 'Dayan', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (539272033, to_date('24-11-1993', 'dd-mm-yyyy'), 'Rotem', 'Nir', 'Ben-Haim', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (612604610, to_date('28-07-1988', 'dd-mm-yyyy'), 'TatAluf', 'Boaz', 'Levy', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (936770252, to_date('29-01-1964', 'dd-mm-yyyy'), 'Turai', 'Michal', 'Mizrahi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (58230132, to_date('08-05-1968', 'dd-mm-yyyy'), 'AlufMishne', 'Yonatan', 'Mizrahi', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (161094854, to_date('19-03-1996', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Or', 'Azoulay', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (100823687, to_date('14-01-1975', 'dd-mm-yyyy'), 'TatAluf', 'Yotam', 'Barak', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (832489706, to_date('13-07-1988', 'dd-mm-yyyy'), 'Turai', 'Dalia', 'Levi', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (983287625, to_date('13-03-1989', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Yuval', 'Bitton', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (312889486, to_date('01-04-1953', 'dd-mm-yyyy'), 'Aluf', 'Yotam', 'Cohen', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (787377762, to_date('15-01-1990', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Ayelet', 'Cohen', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (720918778, to_date('27-03-1951', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Dana', 'Levi', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (553773429, to_date('02-05-1954', 'dd-mm-yyyy'), 'SegenMishneh', 'Alon', 'Peretz', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (472264837, to_date('27-05-1957', 'dd-mm-yyyy'), 'Aluf', 'Tal', 'Mizrahi', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (211911905, to_date('26-05-1993', 'dd-mm-yyyy'), 'Turai', 'Hila', 'Malka', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (688544625, to_date('01-08-1971', 'dd-mm-yyyy'), 'SamalRishon', 'Yaara', 'Mor', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (19900422, to_date('03-03-2002', 'dd-mm-yyyy'), 'RavSamal', 'Aviv', 'Ben-Shlomo', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (866499908, to_date('21-05-2003', 'dd-mm-yyyy'), 'RavAluf', 'Gilad', 'Ben-Avraham', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (938695176, to_date('15-12-1985', 'dd-mm-yyyy'), 'SamalRishon', 'Gal', 'Ben-Avraham', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (39473808, to_date('02-07-1972', 'dd-mm-yyyy'), 'ReshoomSitum', 'Ilana', 'Mizrahi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (204735426, to_date('02-09-1999', 'dd-mm-yyyy'), 'RavTurai', 'Amit', 'Levi', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (27309463, to_date('19-05-1984', 'dd-mm-yyyy'), 'Samal', 'Ilana', 'Ben-David', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (119324186, to_date('01-03-1995', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Yaara', 'Malka', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (331077128, to_date('02-10-1988', 'dd-mm-yyyy'), 'RavAlufBait', 'Yaara', 'Mizrahi', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (516903398, to_date('08-11-1957', 'dd-mm-yyyy'), 'RavAlufBait', 'Or', 'Bitton', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (390303866, to_date('09-04-1969', 'dd-mm-yyyy'), 'Turai', 'Hila', 'Cohen', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (14859674, to_date('09-02-1956', 'dd-mm-yyyy'), 'RavSamal', 'Dana', 'Cohen', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (772344246, to_date('05-07-2001', 'dd-mm-yyyy'), 'TatAluf', 'Keren', 'Ben-Shlomo', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (373081583, to_date('28-05-1965', 'dd-mm-yyyy'), 'Turai', 'Boaz', 'Levi', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (476904103, to_date('02-11-1972', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Itai', 'Azoulay', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (387530015, to_date('20-04-1994', 'dd-mm-yyyy'), 'RavTurai', 'Eitan', 'Ben-Avraham', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (102730015, to_date('22-11-1959', 'dd-mm-yyyy'), 'ReshoomSitum', 'Michal', 'Cohen', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (747916114, to_date('28-02-1963', 'dd-mm-yyyy'), 'ReshoomSitum', 'Shani', 'Azoulay', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (33348831, to_date('24-02-2000', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Amit', 'Ben-Avraham', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (678156612, to_date('18-02-1979', 'dd-mm-yyyy'), 'Segen', 'Or', 'Levi', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (775186259, to_date('12-12-2000', 'dd-mm-yyyy'), 'SegenMishneh', 'Shira', 'Malka', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (466176151, to_date('06-12-1980', 'dd-mm-yyyy'), 'Segen', 'Dana', 'Dayan', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (715654050, to_date('22-04-1978', 'dd-mm-yyyy'), 'Turai', 'Dalia', 'Azulay', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (873355614, to_date('28-02-1990', 'dd-mm-yyyy'), 'SegenMishneh', 'Amir', 'Mizrahi', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (292475023, to_date('23-11-1959', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Aviv', 'David', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (791356613, to_date('25-12-1951', 'dd-mm-yyyy'), 'Samal', 'Nadav', 'Peretz', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (203457656, to_date('27-09-1983', 'dd-mm-yyyy'), 'RavAlufBait', 'Yael', 'Mizrahi', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (867006633, to_date('03-11-1982', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Elad', 'Mizrahi', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (580744813, to_date('24-09-1975', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Galit', 'Barak', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (990619358, to_date('02-08-1985', 'dd-mm-yyyy'), 'Rotem', 'Dalia', 'Ben-Shalom', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (33519446, to_date('08-08-1965', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Aviv', 'Malka', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (343124943, to_date('28-08-1970', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Tamar', 'Avraham', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (353399272, to_date('08-09-1956', 'dd-mm-yyyy'), 'RavAluf', 'Tamar', 'Malka', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (957293214, to_date('02-04-1988', 'dd-mm-yyyy'), 'Rotem', 'Nadav', 'Bitton', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (268280838, to_date('08-04-1987', 'dd-mm-yyyy'), 'RavSamal', 'Itai', 'Mizrahi', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (537542840, to_date('06-01-1992', 'dd-mm-yyyy'), 'ReshoomSitum', 'Shachar', 'Cohen', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (864922144, to_date('08-02-1987', 'dd-mm-yyyy'), 'Rotem', 'Erez', 'Malka', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (913704515, to_date('20-04-1953', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Galit', 'Peretz', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (791194510, to_date('01-05-1973', 'dd-mm-yyyy'), 'AlufMishne', 'Barak', 'Cohen', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (693277640, to_date('26-02-1994', 'dd-mm-yyyy'), 'AlufMishne', 'Nadav', 'Cohen', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (931857166, to_date('29-12-1983', 'dd-mm-yyyy'), 'SamalRishon', 'Yuval', 'Cohen', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (521791185, to_date('14-10-1997', 'dd-mm-yyyy'), 'RavTurai', 'Yael', 'Ben-Avraham', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (326217360, to_date('04-05-1958', 'dd-mm-yyyy'), 'TatAluf', 'Ilana', 'Mizrahi', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (528040682, to_date('06-09-1958', 'dd-mm-yyyy'), 'RavSamal', 'Yonatan', 'Levy', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (279346974, to_date('07-03-1972', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Maya', 'Mizrahi', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (48759591, to_date('23-05-1963', 'dd-mm-yyyy'), 'SegenMishneh', 'Shachar', 'Mizrahi', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (57175840, to_date('24-09-1960', 'dd-mm-yyyy'), 'AlufMishne', 'Yuval', 'Ben-Haim', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (730746211, to_date('11-01-1984', 'dd-mm-yyyy'), 'RavAluf', 'Gal', 'Malka', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (182734548, to_date('23-07-1970', 'dd-mm-yyyy'), 'RavAluf', 'Galit', 'Ben-Avraham', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (461465926, to_date('12-02-1957', 'dd-mm-yyyy'), 'Turai', 'Erez', 'Levy', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (911363560, to_date('14-12-2003', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Keren', 'Barak', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (376270328, to_date('09-01-1954', 'dd-mm-yyyy'), 'AlufMishne', 'Keren', 'Azulay', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (339156780, to_date('01-06-1960', 'dd-mm-yyyy'), 'SamalRishon', 'Aviv', 'Mizrahi', 'DavidsSlingBattery');
commit;
prompt 100 records committed...
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (455310909, to_date('15-04-1989', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Amit', 'Mizrahi', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (155040268, to_date('17-06-1971', 'dd-mm-yyyy'), 'RavSamal', 'Amir', 'Mor', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (528905573, to_date('15-10-1986', 'dd-mm-yyyy'), 'Aluf', 'Maya', 'Malka', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (785530631, to_date('12-03-1996', 'dd-mm-yyyy'), 'RavAluf', 'Matan', 'Dayan', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (47521761, to_date('04-10-1953', 'dd-mm-yyyy'), 'SegenMishneh', 'Roni', 'Levy', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (586805875, to_date('01-09-1955', 'dd-mm-yyyy'), 'Segen', 'Dalia', 'Malka', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (700051578, to_date('20-03-1980', 'dd-mm-yyyy'), 'SegenMishneh', 'Galit', 'Azulay', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (658456825, to_date('08-08-1997', 'dd-mm-yyyy'), 'RavAlufBait', 'Galit', 'Cohen', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (314361230, to_date('11-10-1958', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Yonatan', 'Cohen', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (104582770, to_date('21-01-1988', 'dd-mm-yyyy'), 'AlufMishne', 'Yaara', 'Ben-Haim', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (53371115, to_date('20-04-1994', 'dd-mm-yyyy'), 'ReshoomSitum', 'Tamar', 'Mor', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (793125656, to_date('06-12-1980', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Noga', 'David', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (356782622, to_date('22-12-1983', 'dd-mm-yyyy'), 'Turai', 'Dalia', 'Malka', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (109746290, to_date('04-03-1966', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Shira', 'Barak', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (896684281, to_date('01-02-1986', 'dd-mm-yyyy'), 'ReshoomSitum', 'Dana', 'Mizrahi', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (727289966, to_date('23-04-1996', 'dd-mm-yyyy'), 'SegenMishneh', 'Shani', 'Mor', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (965008250, to_date('13-07-1967', 'dd-mm-yyyy'), 'Rotem', 'Tamar', 'Peretz', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (139730663, to_date('16-10-1995', 'dd-mm-yyyy'), 'RavSamal', 'Shani', 'Ben-Avraham', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (376413837, to_date('24-12-1952', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Shira', 'Azulay', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (329924597, to_date('27-09-2002', 'dd-mm-yyyy'), 'TatAluf', 'Amir', 'Cohen', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (138780621, to_date('01-03-1986', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Itai', 'Biton', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (761898540, to_date('22-08-1972', 'dd-mm-yyyy'), 'AlufMishne', 'Yael', 'Mizrahi', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (804277125, to_date('01-01-1983', 'dd-mm-yyyy'), 'Samal', 'Tal', 'Mizrahi', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (541783735, to_date('17-05-1979', 'dd-mm-yyyy'), 'AlufMishne', 'Eitan', 'Mizrahi', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (887772795, to_date('04-06-1970', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Yuval', 'David', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (80299456, to_date('16-01-1954', 'dd-mm-yyyy'), 'TatAluf', 'Galit', 'Ben-Shlomo', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (168718379, to_date('24-08-2000', 'dd-mm-yyyy'), 'RavAlufBait', 'Ziv', 'Bitton', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (191938280, to_date('29-08-1971', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Tamar', 'Levy', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (640870770, to_date('18-10-1970', 'dd-mm-yyyy'), 'SegenMishneh', 'Galit', 'Malka', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (838568375, to_date('08-03-1975', 'dd-mm-yyyy'), 'RavAlufBait', 'Elad', 'Mor', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (938341769, to_date('26-09-1967', 'dd-mm-yyyy'), 'TatAluf', 'Shani', 'Bitton', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (515164706, to_date('06-02-1965', 'dd-mm-yyyy'), 'RavAlufBait', 'Matan', 'Mizrahi', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (346165870, to_date('29-03-1970', 'dd-mm-yyyy'), 'RavSamal', 'Gal', 'Ben-Avraham', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (657252513, to_date('22-07-1962', 'dd-mm-yyyy'), 'Turai', 'Ilana', 'Levi', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (344417887, to_date('13-02-1990', 'dd-mm-yyyy'), 'RavSamal', 'Keren', 'Levi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (246690436, to_date('05-05-1984', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Gal', 'Mizrahi', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (238846598, to_date('14-04-1988', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Yuval', 'Levy', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (403598163, to_date('07-08-1990', 'dd-mm-yyyy'), 'Samal', 'Yael', 'Barak', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (781343075, to_date('22-07-1975', 'dd-mm-yyyy'), 'RavSamal', 'Lior', 'Levi', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (27888027, to_date('21-09-1973', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Gal', 'Cohen', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (701994756, to_date('13-08-2003', 'dd-mm-yyyy'), 'ReshoomSitum', 'Inbar', 'Levi', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (210711448, to_date('08-07-1972', 'dd-mm-yyyy'), 'ReshoomSitum', 'Shira', 'Ben-David', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (438377933, to_date('22-04-1959', 'dd-mm-yyyy'), 'Turai', 'Lia', 'Amar', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (804857652, to_date('20-01-1985', 'dd-mm-yyyy'), 'SegenMishneh', 'Galit', 'Biton', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (99392871, to_date('03-01-1970', 'dd-mm-yyyy'), 'Segen', 'Erez', 'Malka', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (531468297, to_date('06-10-1958', 'dd-mm-yyyy'), 'Samal', 'Erez', 'Mizrahi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (574276437, to_date('01-05-1965', 'dd-mm-yyyy'), 'SamalRishon', 'Eitan', 'Cohen', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (979203046, to_date('13-06-1959', 'dd-mm-yyyy'), 'RavTurai', 'Yonatan', 'Mizrahi', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (63905300, to_date('19-08-2000', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Matan', 'Amar', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (787617930, to_date('11-04-1971', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Noga', 'Mizrahi', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (621448955, to_date('05-02-1987', 'dd-mm-yyyy'), 'Aluf', 'Dalia', 'Levy', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (340818594, to_date('15-06-1974', 'dd-mm-yyyy'), 'RavTurai', 'Maya', 'Levi', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (679496495, to_date('31-01-1953', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Tal', 'Cohen', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (930637594, to_date('25-07-1985', 'dd-mm-yyyy'), 'Turai', 'Dana', 'Azulay', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (601514113, to_date('23-08-1965', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Yotam', 'Barak', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (565195540, to_date('08-11-1996', 'dd-mm-yyyy'), 'Samal', 'Avital', 'Biton', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (597169972, to_date('14-12-1955', 'dd-mm-yyyy'), 'Aluf', 'Alon', 'Barak', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (355518824, to_date('01-07-1958', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Eitan', 'Azulay', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (910068434, to_date('14-07-1953', 'dd-mm-yyyy'), 'Samal', 'Eitan', 'Biton', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (281358641, to_date('07-03-1995', 'dd-mm-yyyy'), 'Rotem', 'Nadav', 'Mizrahi', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (756083129, to_date('17-06-1998', 'dd-mm-yyyy'), 'RavSamal', 'Maya', 'Mizrahi', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (355790687, to_date('12-05-1966', 'dd-mm-yyyy'), 'RavTurai', 'Yuval', 'Levi', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (480375782, to_date('13-08-1954', 'dd-mm-yyyy'), 'Turai', 'Maya', 'Cohen', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (421861798, to_date('06-08-2001', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Or', 'Cohen', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (622971217, to_date('12-03-2003', 'dd-mm-yyyy'), 'RavAluf', 'Yonatan', 'Azulay', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (267972116, to_date('09-02-1970', 'dd-mm-yyyy'), 'TatAluf', 'Amir', 'Bitton', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (553836456, to_date('22-05-1985', 'dd-mm-yyyy'), 'ReshoomSitum', 'Ilana', 'Cohen', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (196799171, to_date('23-06-1971', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Lior', 'Amar', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (753964090, to_date('27-12-1998', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Gal', 'Mor', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (22117822, to_date('18-11-1971', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Eitan', 'Mor', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (5643774, to_date('18-05-1960', 'dd-mm-yyyy'), 'Segen', 'Ziv', 'Biton', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (741528628, to_date('06-01-1974', 'dd-mm-yyyy'), 'AlufMishne', 'Maya', 'Ben-Avraham', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (343688505, to_date('09-03-1960', 'dd-mm-yyyy'), 'Aluf', 'Lior', 'Levi', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (219695867, to_date('14-11-1952', 'dd-mm-yyyy'), 'Aluf', 'Eitan', 'Cohen', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (623560716, to_date('11-12-1951', 'dd-mm-yyyy'), 'ReshoomSitum', 'Dana', 'Mizrahi', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (407735882, to_date('02-10-1998', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Shachar', 'Levy', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (243993217, to_date('06-12-1992', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Liat', 'Levi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (553215905, to_date('27-02-1955', 'dd-mm-yyyy'), 'RavTurai', 'Elad', 'Amar', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (61751992, to_date('28-06-1994', 'dd-mm-yyyy'), 'RavTurai', 'Inbar', 'Avraham', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (773269978, to_date('09-10-2004', 'dd-mm-yyyy'), 'AlufMishne', 'Erez', 'Bitton', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (814858838, to_date('04-12-1980', 'dd-mm-yyyy'), 'ReshoomSitum', 'Matan', 'Levy', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (253020708, to_date('17-08-1950', 'dd-mm-yyyy'), 'TatAluf', 'Roni', 'Levy', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (958408916, to_date('16-02-1974', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Roni', 'Ben-Haim', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (856555734, to_date('20-06-1991', 'dd-mm-yyyy'), 'TatAluf', 'Lia', 'Levi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (739502967, to_date('19-06-1986', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Lia', 'Amar', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (14962501, to_date('29-09-1968', 'dd-mm-yyyy'), 'Samal', 'Erez', 'Mizrahi', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (465488713, to_date('27-05-1961', 'dd-mm-yyyy'), 'RavSamal', 'Alon', 'Bitton', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (33021469, to_date('09-02-1964', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Amir', 'Bitton', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (216863674, to_date('30-08-1970', 'dd-mm-yyyy'), 'RavSamal', 'Boaz', 'Ben-Avraham', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (354262773, to_date('14-05-1998', 'dd-mm-yyyy'), 'RavTurai', 'Avital', 'Barak', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (888607213, to_date('28-10-1979', 'dd-mm-yyyy'), 'Aluf', 'Galit', 'Cohen', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (478023481, to_date('23-04-1964', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Dana', 'Ben-Shalom', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (366227449, to_date('18-07-1950', 'dd-mm-yyyy'), 'Aluf', 'Noa', 'Azulay', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (262774555, to_date('30-03-1964', 'dd-mm-yyyy'), 'RavAlufBait', 'Barak', 'Mizrahi', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (388593835, to_date('05-02-1956', 'dd-mm-yyyy'), 'Rotem', 'Yuval', 'Mizrahi', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (378591419, to_date('01-10-1974', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Alon', 'Mizrahi', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (128587055, to_date('14-08-1959', 'dd-mm-yyyy'), 'Rotem', 'Noga', 'Mizrahi', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (777390005, to_date('27-09-1977', 'dd-mm-yyyy'), 'RavSamal', 'Maya', 'Cohen', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (985893149, to_date('17-10-1989', 'dd-mm-yyyy'), 'AlufMishne', 'Keren', 'Ben-David', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (122242117, to_date('10-04-1976', 'dd-mm-yyyy'), 'RavAluf', 'Alon', 'Mor', 'IronDomeBattery');
commit;
prompt 200 records committed...
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (445021747, to_date('24-10-1993', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Shira', 'Levy', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (919730837, to_date('31-05-1976', 'dd-mm-yyyy'), 'Aluf', 'Maya', 'Azoulay', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (850282407, to_date('12-05-1986', 'dd-mm-yyyy'), 'ReshoomSitum', 'Boaz', 'Mizrahi', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (921345792, to_date('12-05-1956', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Michal', 'Levi', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (559402057, to_date('21-06-1988', 'dd-mm-yyyy'), 'Samal', 'Amir', 'Biton', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (740844669, to_date('17-07-1957', 'dd-mm-yyyy'), 'ReshoomSitum', 'Yonatan', 'Azoulay', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (335043978, to_date('06-01-1999', 'dd-mm-yyyy'), 'RavAluf', 'Noa', 'Mizrahi', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (387145855, to_date('04-11-1997', 'dd-mm-yyyy'), 'SegenMishneh', 'Erez', 'Mor', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (107148939, to_date('01-12-1985', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Inbar', 'Mizrahi', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (533658209, to_date('03-01-1965', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Galit', 'Ben-Shalom', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (130230511, to_date('01-09-1950', 'dd-mm-yyyy'), 'Turai', 'Dana', 'Azulay', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (54570439, to_date('05-03-1981', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Erez', 'Avraham', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (559946127, to_date('22-01-1957', 'dd-mm-yyyy'), 'RavSamal', 'Michal', 'Cohen', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (501339491, to_date('10-07-1955', 'dd-mm-yyyy'), 'RavTurai', 'Dalia', 'Malka', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (951979571, to_date('10-04-1971', 'dd-mm-yyyy'), 'Segen', 'Omri', 'Ben-Haim', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (668381973, to_date('13-01-2002', 'dd-mm-yyyy'), 'TatAluf', 'Nadav', 'Levi', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (83424189, to_date('09-09-2000', 'dd-mm-yyyy'), 'SegenMishneh', 'Shani', 'Levi', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (296869674, to_date('15-12-1976', 'dd-mm-yyyy'), 'AlufMishne', 'Inbar', 'Mizrahi', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (160369451, to_date('14-12-1999', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Yair', 'Ben-Avraham', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (513646118, to_date('09-07-1968', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Alon', 'Biton', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (48296139, to_date('04-06-1968', 'dd-mm-yyyy'), 'Aluf', 'Shani', 'Bitton', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (333050151, to_date('17-12-1971', 'dd-mm-yyyy'), 'Segen', 'Ziv', 'Mizrahi', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (852148646, to_date('10-11-1959', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Amit', 'Ben-David', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (871311793, to_date('10-10-1950', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Hila', 'Mizrahi', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (941212586, to_date('09-09-2003', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Boaz', 'Bitton', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (373304496, to_date('03-03-1982', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Nir', 'Cohen', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (757557624, to_date('21-08-1976', 'dd-mm-yyyy'), 'SamalRishon', 'Shira', 'Ben-Shalom', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (413672321, to_date('14-06-1983', 'dd-mm-yyyy'), 'RavSamal', 'Hila', 'Levi', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (610752820, to_date('18-03-1972', 'dd-mm-yyyy'), 'Segen', 'Gilad', 'Malka', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (209537395, to_date('18-02-1992', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Lia', 'Ben-David', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (765470455, to_date('17-06-1956', 'dd-mm-yyyy'), 'RavSamal', 'Avital', 'Mor', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (835614936, to_date('08-03-1993', 'dd-mm-yyyy'), 'Samal', 'Maya', 'Mizrahi', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (86417259, to_date('25-05-1981', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Oren', 'Biton', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (49467423, to_date('02-12-1990', 'dd-mm-yyyy'), 'Aluf', 'Itai', 'Levy', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (567228871, to_date('12-11-1960', 'dd-mm-yyyy'), 'TatAluf', 'Lior', 'Ben-David', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (915186888, to_date('06-03-2004', 'dd-mm-yyyy'), 'Turai', 'Roni', 'Ben-Shalom', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (299431806, to_date('15-12-1955', 'dd-mm-yyyy'), 'RavAlufBait', 'Keren', 'Ben-Shlomo', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (635409007, to_date('07-02-1990', 'dd-mm-yyyy'), 'RavAlufBait', 'Nadav', 'Bitton', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (940572982, to_date('06-07-2004', 'dd-mm-yyyy'), 'Rotem', 'Shani', 'Cohen', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (388851398, to_date('13-04-1953', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Eitan', 'Levy', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (335623712, to_date('02-12-1981', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Noga', 'Biton', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (221812681, to_date('17-01-1992', 'dd-mm-yyyy'), 'AlufMishne', 'Avital', 'Bitton', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (724740823, to_date('16-04-1980', 'dd-mm-yyyy'), 'SamalRishon', 'Shani', 'Mizrahi', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (199470536, to_date('11-05-1985', 'dd-mm-yyyy'), 'SegenMishneh', 'Galit', 'Dayan', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (33810605, to_date('28-04-1954', 'dd-mm-yyyy'), 'SamalRishon', 'Amir', 'Amar', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (645592237, to_date('08-01-1965', 'dd-mm-yyyy'), 'SamalRishon', 'Amit', 'Amar', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (825444945, to_date('25-01-2000', 'dd-mm-yyyy'), 'RavAluf', 'Ayelet', 'Mizrahi', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (665303515, to_date('28-02-1985', 'dd-mm-yyyy'), 'SamalRishon', 'Yaara', 'Barak', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (668859191, to_date('11-10-1955', 'dd-mm-yyyy'), 'RavAlufBait', 'Tamar', 'Levi', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (889592594, to_date('09-03-1976', 'dd-mm-yyyy'), 'RavSamal', 'Shachar', 'Levi', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (96409187, to_date('14-02-1953', 'dd-mm-yyyy'), 'Rotem', 'Aviv', 'Ben-Shalom', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (8310165, to_date('16-04-1971', 'dd-mm-yyyy'), 'SamalRishon', 'Talia', 'Azulay', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (954789903, to_date('08-11-1958', 'dd-mm-yyyy'), 'Rotem', 'Tamar', 'Dayan', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (691846022, to_date('14-06-2000', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Ziv', 'Ben-Shlomo', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (591654777, to_date('06-05-1974', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Lia', 'Malka', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (922868636, to_date('07-08-1971', 'dd-mm-yyyy'), 'RavAlufBait', 'Yael', 'Ben-Avraham', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (149955748, to_date('16-03-1961', 'dd-mm-yyyy'), 'ReshoomSitum', 'Matan', 'Amar', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (337253964, to_date('29-08-1952', 'dd-mm-yyyy'), 'Turai', 'Hila', 'Levy', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (132254189, to_date('29-03-1981', 'dd-mm-yyyy'), 'RavSamal', 'Shani', 'Cohen', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (984292034, to_date('17-01-1960', 'dd-mm-yyyy'), 'Rotem', 'Tamar', 'Bitton', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (468373911, to_date('06-01-1992', 'dd-mm-yyyy'), 'RavTurai', 'Yair', 'Amar', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (222038979, to_date('31-12-1999', 'dd-mm-yyyy'), 'Rotem', 'Lia', 'Barak', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (951531351, to_date('06-06-1974', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Yonatan', 'Mizrahi', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (321863485, to_date('21-02-1965', 'dd-mm-yyyy'), 'RavTurai', 'Omri', 'Cohen', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (376761441, to_date('07-06-1950', 'dd-mm-yyyy'), 'TatAluf', 'Yair', 'Bitton', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (426023600, to_date('31-01-2000', 'dd-mm-yyyy'), 'Samal', 'Shachar', 'Mor', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (563250879, to_date('26-01-1990', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Omri', 'Cohen', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (146228453, to_date('01-03-1999', 'dd-mm-yyyy'), 'Samal', 'Dana', 'Mor', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (731341816, to_date('20-07-1958', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Nadav', 'Bitton', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (920665418, to_date('08-01-1997', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Hila', 'Barak', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (356116182, to_date('21-11-1984', 'dd-mm-yyyy'), 'RavAlufBait', 'Avital', 'Levy', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (42187495, to_date('05-08-1982', 'dd-mm-yyyy'), 'SamalRishon', 'Eitan', 'Azoulay', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (941052879, to_date('07-10-1979', 'dd-mm-yyyy'), 'RavTurai', 'Lior', 'Mizrahi', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (151470617, to_date('19-09-1995', 'dd-mm-yyyy'), 'Turai', 'Dalia', 'Azoulay', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (190685698, to_date('14-04-1979', 'dd-mm-yyyy'), 'RavSamal', 'Or', 'Mizrahi', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (633046823, to_date('18-05-1969', 'dd-mm-yyyy'), 'Turai', 'Barak', 'Mizrahi', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (948970642, to_date('17-05-1984', 'dd-mm-yyyy'), 'Samal', 'Yaara', 'Cohen', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (678454411, to_date('02-06-2004', 'dd-mm-yyyy'), 'AlufMishne', 'Gal', 'Ben-Shlomo', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (655441077, to_date('13-07-1970', 'dd-mm-yyyy'), 'RavSamal', 'Ziv', 'Ben-Shlomo', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (328281804, to_date('20-09-1999', 'dd-mm-yyyy'), 'AlufMishne', 'Barak', 'Mizrahi', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (913550787, to_date('02-07-1967', 'dd-mm-yyyy'), 'RavAluf', 'Galit', 'Barak', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (373194046, to_date('05-03-1961', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Gilad', 'Avraham', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (564251959, to_date('15-06-1955', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Michal', 'Bitton', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (772282863, to_date('18-07-1964', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Hila', 'Malka', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (868116529, to_date('31-12-1951', 'dd-mm-yyyy'), 'SegenMishneh', 'Omri', 'Bitton', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (736579790, to_date('18-01-1971', 'dd-mm-yyyy'), 'Aluf', 'Galit', 'Bitton', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (691870152, to_date('14-02-1951', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Ziv', 'Levy', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (752120149, to_date('08-10-1979', 'dd-mm-yyyy'), 'AlufMishne', 'Adi', 'Amar', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (705828591, to_date('06-03-1998', 'dd-mm-yyyy'), 'RavAlufBait', 'Lior', 'Ben-David', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (586503670, to_date('22-08-1966', 'dd-mm-yyyy'), 'Samal', 'Boaz', 'Levi', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (894988803, to_date('06-01-1966', 'dd-mm-yyyy'), 'Aluf', 'Talia', 'Mizrahi', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (285743737, to_date('12-01-1994', 'dd-mm-yyyy'), 'ReshoomSitum', 'Liat', 'Ben-Shalom', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (749498412, to_date('26-08-1978', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Tal', 'Mizrahi', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (141017923, to_date('05-12-1983', 'dd-mm-yyyy'), 'AlufMishne', 'Liat', 'Avraham', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (527623213, to_date('22-09-1952', 'dd-mm-yyyy'), 'SegenMishneh', 'Gilad', 'Cohen', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (223653476, to_date('18-06-1981', 'dd-mm-yyyy'), 'Segen', 'Avital', 'Peretz', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (648570736, to_date('21-11-1985', 'dd-mm-yyyy'), 'RavAluf', 'Amit', 'Mizrahi', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (389089321, to_date('24-08-1970', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Matan', 'Biton', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (103774210, to_date('01-05-1955', 'dd-mm-yyyy'), 'ReshoomSitum', 'Dalia', 'David', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (615551152, to_date('23-02-1998', 'dd-mm-yyyy'), 'RavAluf', 'Amit', 'Levy', 'Yahalom');
commit;
prompt 300 records committed...
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (18313165, to_date('30-10-1992', 'dd-mm-yyyy'), 'Samal', 'Amit', 'Amar', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (408657848, to_date('25-08-1998', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Adi', 'Cohen', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (112779016, to_date('13-05-1988', 'dd-mm-yyyy'), 'Turai', 'Matan', 'Ben-David', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (189082064, to_date('14-04-1982', 'dd-mm-yyyy'), 'SamalRishon', 'Omri', 'Mizrahi', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (262946526, to_date('03-07-1964', 'dd-mm-yyyy'), 'RavTurai', 'Boaz', 'Amar', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (25744932, to_date('30-11-1971', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Alon', 'Mizrahi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (465816994, to_date('11-04-2000', 'dd-mm-yyyy'), 'RavAluf', 'Yair', 'Cohen', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (283254004, to_date('21-02-1992', 'dd-mm-yyyy'), 'RavSamal', 'Adi', 'Ben-David', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (160015012, to_date('09-04-1957', 'dd-mm-yyyy'), 'Samal', 'Keren', 'Bitton', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (228408513, to_date('16-07-1974', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Barak', 'Ben-David', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (441097158, to_date('31-07-1982', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Oren', 'Bitton', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (843391891, to_date('01-09-1964', 'dd-mm-yyyy'), 'RavSamal', 'Barak', 'Mor', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (211923036, to_date('26-09-1963', 'dd-mm-yyyy'), 'Turai', 'Maya', 'Azoulay', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (23523001, to_date('04-01-1974', 'dd-mm-yyyy'), 'Turai', 'Shira', 'Malka', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (239498476, to_date('20-06-1993', 'dd-mm-yyyy'), 'SegenMishneh', 'Gal', 'Levi', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (860944630, to_date('31-08-1993', 'dd-mm-yyyy'), 'RavTurai', 'Dalia', 'Malka', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (970939234, to_date('19-07-1998', 'dd-mm-yyyy'), 'RavTurai', 'Michal', 'Mor', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (835652409, to_date('28-09-1969', 'dd-mm-yyyy'), 'Aluf', 'Ziv', 'Cohen', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (862298076, to_date('27-10-1956', 'dd-mm-yyyy'), 'RavAlufBait', 'Ziv', 'Mizrahi', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (790597387, to_date('07-06-1951', 'dd-mm-yyyy'), 'Rotem', 'Gilad', 'Ben-David', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (810976664, to_date('07-04-1986', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Talia', 'Ben-Shalom', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (449535616, to_date('13-10-1996', 'dd-mm-yyyy'), 'RavSamal', 'Shira', 'Azoulay', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (953772043, to_date('06-04-1978', 'dd-mm-yyyy'), 'SamalRishon', 'Boaz', 'Cohen', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (92384346, to_date('06-12-1991', 'dd-mm-yyyy'), 'ReshoomSitum', 'Shani', 'Dayan', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (96798324, to_date('03-12-1959', 'dd-mm-yyyy'), 'SamalRishon', 'Dana', 'Malka', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (920019884, to_date('31-05-1991', 'dd-mm-yyyy'), 'Segen', 'Yair', 'Mizrahi', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (848876967, to_date('24-09-1997', 'dd-mm-yyyy'), 'RavAluf', 'Ziv', 'Levy', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (86348597, to_date('13-02-2004', 'dd-mm-yyyy'), 'SamalRishon', 'Eitan', 'Cohen', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (427633412, to_date('01-09-1976', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Itai', 'Amar', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (628952606, to_date('10-05-1999', 'dd-mm-yyyy'), 'SegenMishneh', 'Omri', 'Mor', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (884802758, to_date('04-07-1971', 'dd-mm-yyyy'), 'ReshoomSitum', 'Dalia', 'Ben-David', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (368073352, to_date('05-09-1954', 'dd-mm-yyyy'), 'RavSamal', 'Yael', 'Malka', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (696164740, to_date('27-11-1981', 'dd-mm-yyyy'), 'RavSamal', 'Alon', 'Ben-Avraham', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (509280185, to_date('30-09-1984', 'dd-mm-yyyy'), 'SegenMishneh', 'Inbar', 'Biton', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (366049885, to_date('13-09-1981', 'dd-mm-yyyy'), 'RavAlufBait', 'Ilana', 'Ben-Avraham', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (170428173, to_date('15-06-1967', 'dd-mm-yyyy'), 'Turai', 'Erez', 'Cohen', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (128185588, to_date('26-01-1977', 'dd-mm-yyyy'), 'RavSamal', 'Boaz', 'Avraham', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (858504819, to_date('08-08-1964', 'dd-mm-yyyy'), 'RavAluf', 'Gilad', 'Ben-Avraham', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (214263880, to_date('23-02-1997', 'dd-mm-yyyy'), 'ReshoomSitum', 'Ronen', 'David', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (806039254, to_date('03-12-1985', 'dd-mm-yyyy'), 'ReshoomSitum', 'Eitan', 'Levy', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (683400930, to_date('27-10-1953', 'dd-mm-yyyy'), 'ReshoomSitum', 'Ronen', 'Dayan', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (427054136, to_date('17-07-1979', 'dd-mm-yyyy'), 'SamalRishon', 'Shachar', 'Barak', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (366024509, to_date('05-10-1953', 'dd-mm-yyyy'), 'TatAluf', 'Shira', 'Azoulay', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (734007993, to_date('15-09-1965', 'dd-mm-yyyy'), 'RavTurai', 'Michal', 'Levi', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (419780086, to_date('14-03-1959', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Gal', 'Peretz', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (2545162, to_date('20-12-1977', 'dd-mm-yyyy'), 'RavTurai', 'Itai', 'Mizrahi', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (993519677, to_date('16-10-1957', 'dd-mm-yyyy'), 'RavAluf', 'Tamar', 'Mizrahi', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (170584684, to_date('21-12-1992', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Barak', 'Ben-Shlomo', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (412890041, to_date('21-07-1999', 'dd-mm-yyyy'), 'Samal', 'Dalia', 'Ben-Shalom', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (346198032, to_date('19-04-1956', 'dd-mm-yyyy'), 'Aluf', 'Inbar', 'Azulay', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (156074960, to_date('12-09-1950', 'dd-mm-yyyy'), 'TatAluf', 'Nir', 'Cohen', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (823226118, to_date('02-03-1962', 'dd-mm-yyyy'), 'Turai', 'Yonatan', 'Amar', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (946483541, to_date('02-05-2003', 'dd-mm-yyyy'), 'SegenMishneh', 'Nir', 'Levy', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (312800764, to_date('26-08-1966', 'dd-mm-yyyy'), 'RavAlufBait', 'Gal', 'Amar', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (738131178, to_date('01-08-1984', 'dd-mm-yyyy'), 'Samal', 'Galit', 'Mizrahi', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (103850003, to_date('26-11-1999', 'dd-mm-yyyy'), 'Aluf', 'Dana', 'Barak', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (341714156, to_date('10-08-2000', 'dd-mm-yyyy'), 'Samal', 'Adi', 'Ben-Avraham', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (100460095, to_date('27-05-1986', 'dd-mm-yyyy'), 'Aluf', 'Yael', 'Mor', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (372913295, to_date('06-10-1973', 'dd-mm-yyyy'), 'Aluf', 'Inbar', 'Levy', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (873879832, to_date('25-01-1971', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Elad', 'Levi', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (769384835, to_date('19-04-1959', 'dd-mm-yyyy'), 'RavAlufBait', 'Yotam', 'Levi', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (392616556, to_date('17-12-1954', 'dd-mm-yyyy'), 'AlufMishne', 'Ronen', 'David', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (563546248, to_date('16-05-1999', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Matan', 'Bitton', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (38809955, to_date('05-07-1953', 'dd-mm-yyyy'), 'Aluf', 'Yuval', 'David', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (496442797, to_date('03-02-1985', 'dd-mm-yyyy'), 'SamalRishon', 'Adi', 'Levy', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (436523058, to_date('07-04-1953', 'dd-mm-yyyy'), 'RavSamal', 'Alon', 'Peretz', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (999169755, to_date('17-06-1982', 'dd-mm-yyyy'), 'Rotem', 'Amit', 'Cohen', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (437263445, to_date('01-04-1964', 'dd-mm-yyyy'), 'ReshoomSitum', 'Elad', 'Cohen', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (31991919, to_date('07-05-1961', 'dd-mm-yyyy'), 'Segen', 'Barak', 'Malka', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (517005127, to_date('11-03-2004', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Shira', 'Ben-Avraham', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (676864100, to_date('30-09-1964', 'dd-mm-yyyy'), 'RavTurai', 'Amir', 'Levy', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (605232968, to_date('30-12-1954', 'dd-mm-yyyy'), 'RavAlufBait', 'Shachar', 'Barak', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (975713400, to_date('16-03-1992', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Yonatan', 'Mizrahi', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (324661638, to_date('06-08-1999', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Nir', 'Levy', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (133048262, to_date('18-07-2002', 'dd-mm-yyyy'), 'SamalRishon', 'Boaz', 'Mizrahi', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (590200382, to_date('05-08-1989', 'dd-mm-yyyy'), 'SegenMishneh', 'Talia', 'Mor', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (346162990, to_date('01-10-1954', 'dd-mm-yyyy'), 'RavAlufBait', 'Ayelet', 'Ben-David', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (652670680, to_date('30-06-1973', 'dd-mm-yyyy'), 'AlufMishne', 'Ayelet', 'Ben-Avraham', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (648030699, to_date('10-06-1951', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Omri', 'Dayan', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (420748865, to_date('25-08-1991', 'dd-mm-yyyy'), 'ReshoomSitum', 'Elad', 'Ben-Avraham', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (229730153, to_date('27-04-1995', 'dd-mm-yyyy'), 'TatAluf', 'Amit', 'Azulay', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (104873666, to_date('02-03-1972', 'dd-mm-yyyy'), 'TatAluf', 'Tamar', 'Ben-Shlomo', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (890501796, to_date('05-01-1972', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Talia', 'Levy', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (864915460, to_date('25-02-1982', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Tal', 'Mor', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (619446944, to_date('11-05-1978', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Yaara', 'Ben-Shlomo', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (309679728, to_date('04-06-1955', 'dd-mm-yyyy'), 'Aluf', 'Yael', 'Ben-David', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (908940344, to_date('04-03-1987', 'dd-mm-yyyy'), 'TatAluf', 'Talia', 'Ben-David', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (309719029, to_date('09-08-1988', 'dd-mm-yyyy'), 'RavAlufBait', 'Noa', 'Malka', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (629136134, to_date('14-01-1975', 'dd-mm-yyyy'), 'Samal', 'Ronen', 'Mizrahi', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (63275440, to_date('16-12-1993', 'dd-mm-yyyy'), 'RavAluf', 'Or', 'Mizrahi', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (610541521, to_date('19-12-1980', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Shachar', 'Ben-Shalom', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (918298456, to_date('05-02-1963', 'dd-mm-yyyy'), 'Rotem', 'Oren', 'Barak', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (650457925, to_date('27-02-1954', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Maya', 'Biton', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (189616313, to_date('04-07-1989', 'dd-mm-yyyy'), 'TatAluf', 'Noga', 'Biton', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (104160558, to_date('10-11-1979', 'dd-mm-yyyy'), 'RavAluf', 'Itai', 'Ben-David', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (894361403, to_date('11-03-2003', 'dd-mm-yyyy'), 'Rotem', 'Talia', 'Malka', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (123219821, to_date('01-04-1967', 'dd-mm-yyyy'), 'ReshoomSitum', 'Shani', 'Mor', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (81298698, to_date('27-06-1954', 'dd-mm-yyyy'), 'RavAlufBait', 'Yaara', 'Mizrahi', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (59689472, to_date('31-10-1985', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Erez', 'Dayan', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (335042023, to_date('31-01-1988', 'dd-mm-yyyy'), 'AlufMishne', 'Gilad', 'Ben-Haim', 'NetzahYehuda');
commit;
prompt 400 records committed...
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (121457219, to_date('22-05-2003', 'dd-mm-yyyy'), 'Turai', 'Amir', 'Cohen', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (646722572, to_date('28-04-1994', 'dd-mm-yyyy'), 'Segen', 'Adi', 'Ben-David', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (804656953, to_date('25-07-1989', 'dd-mm-yyyy'), 'SamalRishon', 'Ziv', 'Malka', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (933905106, to_date('29-07-1952', 'dd-mm-yyyy'), 'RavSamal', 'Avital', 'Mizrahi', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (506038648, to_date('21-02-1971', 'dd-mm-yyyy'), 'SamalRishon', 'Liat', 'Ben-David', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (457905244, to_date('02-11-1951', 'dd-mm-yyyy'), 'SamalRishon', 'Nir', 'Azulay', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (359931013, to_date('12-10-1964', 'dd-mm-yyyy'), 'SamalRishon', 'Aviv', 'Cohen', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (304072316, to_date('23-08-1988', 'dd-mm-yyyy'), 'Aluf', 'Inbar', 'Levy', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (896601848, to_date('25-07-1970', 'dd-mm-yyyy'), 'TatAluf', 'Itai', 'Biton', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (357980431, to_date('22-03-1955', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Tal', 'Malka', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (769370865, to_date('07-10-2004', 'dd-mm-yyyy'), 'Turai', 'Gilad', 'Ben-Haim', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (462615818, to_date('06-03-1994', 'dd-mm-yyyy'), 'ReshoomSitum', 'Lia', 'Dayan', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (199630950, to_date('26-10-1954', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Maya', 'Bitton', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (62623345, to_date('26-02-1981', 'dd-mm-yyyy'), 'SegenMishneh', 'Keren', 'Cohen', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (501199684, to_date('21-03-1957', 'dd-mm-yyyy'), 'ReshoomSitum', 'Shachar', 'Barak', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (180886131, to_date('14-12-1975', 'dd-mm-yyyy'), 'Aluf', 'Shani', 'Mor', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (195146138, to_date('23-12-1990', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Gilad', 'Ben-Shalom', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (824919862, to_date('15-02-1983', 'dd-mm-yyyy'), 'ReshoomSitum', 'Tamar', 'Ben-Avraham', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (173486842, to_date('04-02-1977', 'dd-mm-yyyy'), 'Samal', 'Amit', 'Azulay', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (120023260, to_date('19-01-1984', 'dd-mm-yyyy'), 'TatAluf', 'Avital', 'Mizrahi', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (646489866, to_date('25-12-2000', 'dd-mm-yyyy'), 'SamalRishon', 'Omri', 'David', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (877685288, to_date('08-06-1975', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Gal', 'Levy', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (878772373, to_date('22-10-1981', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Hila', 'Mor', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (123915433, to_date('22-02-1998', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Ronen', 'Amar', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (310353663, to_date('15-08-1989', 'dd-mm-yyyy'), 'Turai', 'Talia', 'Biton', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (482562090, to_date('06-11-2002', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Hila', 'Bitton', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (369868185, to_date('28-05-1977', 'dd-mm-yyyy'), 'RavAluf', 'Oren', 'Ben-Avraham', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (882391029, to_date('25-11-1959', 'dd-mm-yyyy'), 'RavTurai', 'Adi', 'Ben-Shalom', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (123200075, to_date('12-12-2001', 'dd-mm-yyyy'), 'SamalRishon', 'Elad', 'David', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (968836246, to_date('04-10-1963', 'dd-mm-yyyy'), 'Aluf', 'Amir', 'Amar', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (575072922, to_date('13-03-1993', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Ayelet', 'Azulay', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (66252816, to_date('21-07-1981', 'dd-mm-yyyy'), 'TatAluf', 'Ronen', 'Malka', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (581726284, to_date('02-01-1983', 'dd-mm-yyyy'), 'SegenMishneh', 'Inbar', 'Amar', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (14379081, to_date('23-08-1954', 'dd-mm-yyyy'), 'Segen', 'Erez', 'Biton', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (886513759, to_date('11-10-1988', 'dd-mm-yyyy'), 'Aluf', 'Maya', 'Biton', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (845819816, to_date('21-06-1963', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Inbar', 'Levy', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (395169869, to_date('31-05-2002', 'dd-mm-yyyy'), 'Aluf', 'Liat', 'Ben-Shalom', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (582141023, to_date('07-01-1971', 'dd-mm-yyyy'), 'Rotem', 'Hila', 'Mor', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (830627057, to_date('10-01-1995', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Or', 'Azulay', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (350294285, to_date('01-06-1953', 'dd-mm-yyyy'), 'Rotem', 'Lior', 'Amar', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (874017696, to_date('02-08-1997', 'dd-mm-yyyy'), 'Turai', 'Boaz', 'Malka', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (112279471, to_date('05-02-1989', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Eitan', 'Avraham', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (443298922, to_date('21-06-2001', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Avital', 'Mor', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (549867969, to_date('04-09-1995', 'dd-mm-yyyy'), 'ReshoomSitum', 'Alon', 'Bitton', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (497829544, to_date('02-02-1977', 'dd-mm-yyyy'), 'RavSamal', 'Galit', 'Malka', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (9893408, to_date('25-02-1957', 'dd-mm-yyyy'), 'SamalRishon', 'Adi', 'Mizrahi', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (84777329, to_date('05-04-1974', 'dd-mm-yyyy'), 'RavAlufBait', 'Tamar', 'Amar', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (703258636, to_date('11-06-1962', 'dd-mm-yyyy'), 'RavAluf', 'Noa', 'Biton', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (636656726, to_date('09-04-1995', 'dd-mm-yyyy'), 'RavSamal', 'Keren', 'Mor', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (279522844, to_date('02-01-1957', 'dd-mm-yyyy'), 'Samal', 'Ronen', 'Cohen', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (176298527, to_date('08-03-1975', 'dd-mm-yyyy'), 'RavAluf', 'Noga', 'Ben-Shalom', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (301683965, to_date('14-12-1965', 'dd-mm-yyyy'), 'AlufMishne', 'Yair', 'Mizrahi', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (625586353, to_date('20-01-1984', 'dd-mm-yyyy'), 'ReshoomSitum', 'Ayelet', 'Bitton', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (434786453, to_date('23-06-1950', 'dd-mm-yyyy'), 'RavSamal', 'Amit', 'David', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (706176017, to_date('08-02-1995', 'dd-mm-yyyy'), 'RavAluf', 'Barak', 'Avraham', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (226706494, to_date('18-11-1981', 'dd-mm-yyyy'), 'Rotem', 'Barak', 'Cohen', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (482241644, to_date('26-02-1987', 'dd-mm-yyyy'), 'Samal', 'Barak', 'Biton', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (590776766, to_date('26-11-1973', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Or', 'Mor', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (751210162, to_date('24-12-1983', 'dd-mm-yyyy'), 'RavAlufBait', 'Galit', 'Azulay', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (834515525, to_date('24-08-1987', 'dd-mm-yyyy'), 'AlufMishne', 'Amir', 'Bitton', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (204518921, to_date('10-07-1981', 'dd-mm-yyyy'), 'Samal', 'Matan', 'Ben-Avraham', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (29703599, to_date('08-06-1953', 'dd-mm-yyyy'), 'RavAluf', 'Maya', 'Azoulay', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (919330389, to_date('30-09-1984', 'dd-mm-yyyy'), 'Aluf', 'Amir', 'Azoulay', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (955866475, to_date('15-01-1989', 'dd-mm-yyyy'), 'RavTurai', 'Barak', 'Mizrahi', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (207700677, to_date('06-08-1950', 'dd-mm-yyyy'), 'Turai', 'Talia', 'Mizrahi', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (612528800, to_date('14-09-1983', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Liat', 'Dayan', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (452407341, to_date('19-02-1967', 'dd-mm-yyyy'), 'Aluf', 'Lior', 'Azulay', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (480407319, to_date('25-09-1996', 'dd-mm-yyyy'), 'RavTurai', 'Itai', 'Malka', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (169511690, to_date('03-08-2003', 'dd-mm-yyyy'), 'TatAluf', 'Oren', 'Cohen', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (2786419, to_date('25-02-1988', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Roni', 'Mor', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (660745563, to_date('12-03-1965', 'dd-mm-yyyy'), 'Turai', 'Tal', 'Malka', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (869804722, to_date('18-06-1988', 'dd-mm-yyyy'), 'AlufMishne', 'Nadav', 'Mizrahi', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (828357556, to_date('02-11-1993', 'dd-mm-yyyy'), 'Aluf', 'Yuval', 'Amar', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (973268078, to_date('23-09-1971', 'dd-mm-yyyy'), 'Aluf', 'Galit', 'Cohen', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (187950724, to_date('11-07-2002', 'dd-mm-yyyy'), 'SegenMishneh', 'Tamar', 'Mizrahi', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (147105179, to_date('21-05-1963', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Noga', 'Ben-David', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (617704986, to_date('12-07-1957', 'dd-mm-yyyy'), 'RavTurai', 'Lia', 'Ben-Shlomo', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (836459058, to_date('14-07-1973', 'dd-mm-yyyy'), 'AlufMishne', 'Lia', 'Bitton', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (181765494, to_date('28-12-1973', 'dd-mm-yyyy'), 'Aluf', 'Yaara', 'Cohen', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (54769211, to_date('03-01-1963', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Ziv', 'Levy', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (617020936, to_date('31-01-1980', 'dd-mm-yyyy'), 'RavAluf', 'Ronen', 'Azoulay', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (636916520, to_date('04-06-2001', 'dd-mm-yyyy'), 'Turai', 'Talia', 'Levy', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (56661540, to_date('12-01-1996', 'dd-mm-yyyy'), 'SamalRishon', 'Oren', 'Mizrahi', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (338354276, to_date('09-01-1956', 'dd-mm-yyyy'), 'RavTurai', 'Noga', 'Azulay', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (849488690, to_date('13-02-2002', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Adi', 'Ben-Avraham', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (716887752, to_date('07-10-1968', 'dd-mm-yyyy'), 'Turai', 'Talia', 'Levy', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (896099346, to_date('02-12-1976', 'dd-mm-yyyy'), 'SegenMishneh', 'Shachar', 'Mizrahi', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (586606762, to_date('24-04-1979', 'dd-mm-yyyy'), 'RavAluf', 'Noa', 'Mizrahi', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (520736113, to_date('04-06-1994', 'dd-mm-yyyy'), 'Aluf', 'Lia', 'Barak', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (414776236, to_date('05-09-1989', 'dd-mm-yyyy'), 'TatAluf', 'Shachar', 'Mizrahi', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (573622712, to_date('15-03-1977', 'dd-mm-yyyy'), 'SamalRishon', 'Shachar', 'Ben-David', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (987796969, to_date('01-03-1966', 'dd-mm-yyyy'), 'ReshoomSitum', 'Yuval', 'Ben-Avraham', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (194073891, to_date('28-08-1990', 'dd-mm-yyyy'), 'RavSamal', 'Gilad', 'Levy', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (471791446, to_date('07-04-1951', 'dd-mm-yyyy'), 'SegenMishneh', 'Tal', 'David', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (544464209, to_date('11-03-1994', 'dd-mm-yyyy'), 'ReshoomSitum', 'Amir', 'Levi', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (451854589, to_date('01-03-2000', 'dd-mm-yyyy'), 'RavSamal', 'Yair', 'Biton', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (157629293, to_date('11-12-1973', 'dd-mm-yyyy'), 'Segen', 'Michal', 'Ben-Shalom', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (899177615, to_date('11-01-1988', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Nir', 'Amar', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (500504737, to_date('18-10-1952', 'dd-mm-yyyy'), 'Segen', 'Omri', 'Malka', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (320632243, to_date('20-04-1963', 'dd-mm-yyyy'), 'TatAluf', 'Gal', 'Ben-Avraham', 'Golani');
commit;
prompt 500 records committed...
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (415751183, to_date('22-01-1955', 'dd-mm-yyyy'), 'SamalRishon', 'Gal', 'Mor', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (659409755, to_date('05-11-1991', 'dd-mm-yyyy'), 'RavAlufBait', 'Omri', 'Cohen', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (120870438, to_date('21-05-1955', 'dd-mm-yyyy'), 'TatAluf', 'Yonatan', 'Cohen', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (71872931, to_date('11-05-1950', 'dd-mm-yyyy'), 'TatAluf', 'Shira', 'Levy', 'NetzahYehuda');
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
values (620669972, to_date('06-10-1954', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Keren', 'Azoulay', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (206940749, to_date('02-07-1989', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Dana', 'Biton', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (61967524, to_date('29-04-1982', 'dd-mm-yyyy'), 'TatAluf', 'Dana', 'Mizrahi', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (224953763, to_date('01-07-1953', 'dd-mm-yyyy'), 'Segen', 'Nir', 'Mizrahi', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (807157955, to_date('24-12-1984', 'dd-mm-yyyy'), 'Turai', 'Dalia', 'Mizrahi', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (967598581, to_date('21-10-1976', 'dd-mm-yyyy'), 'AlufMishne', 'Dalia', 'Ben-David', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (577952863, to_date('02-04-1964', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Ilana', 'Ben-Shalom', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (780471285, to_date('18-02-1990', 'dd-mm-yyyy'), 'Samal', 'Yuval', 'Cohen', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (59907258, to_date('17-10-1965', 'dd-mm-yyyy'), 'RavSamal', 'Gal', 'Mizrahi', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (711151482, to_date('02-07-2000', 'dd-mm-yyyy'), 'SegenMishneh', 'Hila', 'Azulay', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (897283325, to_date('05-01-1988', 'dd-mm-yyyy'), 'RavSamal', 'Tal', 'Mizrahi', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (346966703, to_date('05-07-1950', 'dd-mm-yyyy'), 'Rotem', 'Roni', 'Levy', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (57462063, to_date('21-05-1981', 'dd-mm-yyyy'), 'Turai', 'Maya', 'Bitton', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (756561905, to_date('17-03-1976', 'dd-mm-yyyy'), 'SegenMishneh', 'Shira', 'Ben-David', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (201057337, to_date('28-10-1956', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Galit', 'Mizrahi', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (70035565, to_date('20-11-1963', 'dd-mm-yyyy'), 'RavAlufBait', 'Ronen', 'Dayan', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (544994839, to_date('16-07-1955', 'dd-mm-yyyy'), 'RavSamal', 'Shani', 'Barak', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (790742163, to_date('08-07-1952', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Dalia', 'Barak', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (634820250, to_date('02-02-2002', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Shani', 'Azoulay', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (357317693, to_date('01-02-1996', 'dd-mm-yyyy'), 'RavTurai', 'Ayelet', 'Mizrahi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (425109690, to_date('29-11-1974', 'dd-mm-yyyy'), 'SegenMishneh', 'Shira', 'Malka', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (457338493, to_date('10-10-1951', 'dd-mm-yyyy'), 'Rotem', 'Talia', 'Bitton', 'Kochav');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (419050330, to_date('16-02-1981', 'dd-mm-yyyy'), 'RavAlufBait', 'Gal', 'Ben-Haim', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (452846871, to_date('09-12-2004', 'dd-mm-yyyy'), 'SamalRishon', 'Oren', 'Barak', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (342976481, to_date('21-01-1984', 'dd-mm-yyyy'), 'RavAluf', 'Shani', 'Mizrahi', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (243360154, to_date('24-08-2003', 'dd-mm-yyyy'), 'AlufMishne', 'Yael', 'David', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (401210905, to_date('11-05-1954', 'dd-mm-yyyy'), 'Rotem', 'Alon', 'Levi', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (416281433, to_date('20-05-1989', 'dd-mm-yyyy'), 'Rotem', 'Inbar', 'Barak', 'IronDomeBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (83980733, to_date('29-02-1996', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Gal', 'Malka', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (331354231, to_date('26-03-1975', 'dd-mm-yyyy'), 'Rotem', 'Or', 'Mor', 'Nahal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (659217051, to_date('18-08-1952', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Ziv', 'Levi', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (394675954, to_date('10-02-1993', 'dd-mm-yyyy'), 'RavSamal', 'Liat', 'Malka', 'LionsofJordanValley');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (891248785, to_date('14-09-1954', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Or', 'Ben-Shlomo', 'Duvdevan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (819273671, to_date('02-09-1985', 'dd-mm-yyyy'), 'RavSamal', 'Liat', 'Dayan', 'NetzahYehuda');
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
values (69752166, to_date('22-02-2001', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Amir', 'Azulay', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (833350883, to_date('05-10-1961', 'dd-mm-yyyy'), 'SegenMishneh', 'Elad', 'Bitton', 'Carmeli');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (838807727, to_date('30-07-1960', 'dd-mm-yyyy'), 'SegenMishneh', 'Ilana', 'Amar', 'C4I');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (338339069, to_date('12-04-1976', 'dd-mm-yyyy'), 'RavAluf', 'Tal', 'David', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (400907822, to_date('08-07-2001', 'dd-mm-yyyy'), 'Samal', 'Ziv', 'Mizrahi', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (83331943, to_date('19-05-1952', 'dd-mm-yyyy'), 'RavAlufBait', 'Roni', 'Dayan', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (223163717, to_date('07-04-1995', 'dd-mm-yyyy'), 'Samal', 'Barak', 'Ben-Shlomo', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (151672394, to_date('26-04-1999', 'dd-mm-yyyy'), 'TatAluf', 'Barak', 'Malka', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (596551478, to_date('15-05-1971', 'dd-mm-yyyy'), 'Segen', 'Yair', 'Amar', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (452324229, to_date('17-07-1988', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Liat', 'Barak', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (746365119, to_date('29-03-1985', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Oren', 'Dayan', 'DavidsSlingBattery');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (804543339, to_date('25-03-1991', 'dd-mm-yyyy'), 'Turai', 'Ziv', 'Malka', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (5854726, to_date('01-04-1966', 'dd-mm-yyyy'), 'RavTurai', 'Alon', 'Bitton', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (279369077, to_date('10-03-1974', 'dd-mm-yyyy'), 'RavAluf', 'Itai', 'Cohen', 'Egoz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (847895668, to_date('12-10-1974', 'dd-mm-yyyy'), 'SamalRishon', 'Yotam', 'Ben-David', 'Yahalom');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (953566820, to_date('21-06-2002', 'dd-mm-yyyy'), 'RavSamal', 'Shira', 'Mizrahi', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (80689390, to_date('27-05-1950', 'dd-mm-yyyy'), 'Rotem', 'Amir', 'Amar', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (888332016, to_date('24-02-2001', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Gilad', 'Ben-Haim', 'Kidon');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (986563698, to_date('15-02-1974', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Nadav', 'Mizrahi', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (948068148, to_date('18-11-1956', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Dalia', 'Barak', 'Givati');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (75565027, to_date('13-06-1958', 'dd-mm-yyyy'), 'RavReshoomSitum', 'Boaz', 'Malka', '669');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (146663147, to_date('28-10-1965', 'dd-mm-yyyy'), 'Aluf', 'Inbar', 'Malka', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (302239238, to_date('04-12-1950', 'dd-mm-yyyy'), 'SamalRishon', 'Lia', 'Ben-David', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (681621255, to_date('10-05-1957', 'dd-mm-yyyy'), 'Segen', 'Dalia', 'Malka', 'Kidon');
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
values (17894662, to_date('13-05-1956', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Erez', 'Mor', 'NetzahYehuda');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (970573543, to_date('09-04-1950', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Alon', 'Mizrahi', 'Caracal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (567221457, to_date('11-08-1958', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Shachar', 'Cohen', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (832414823, to_date('26-11-1989', 'dd-mm-yyyy'), 'RavSamalMishneh', 'Liat', 'Cohen', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (987435024, to_date('19-12-1967', 'dd-mm-yyyy'), 'RavAluf', 'Boaz', 'Levi', 'Alpinist');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (129030975, to_date('09-04-1955', 'dd-mm-yyyy'), 'RavAluf', 'Lia', 'Peretz', 'Golani');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (803077494, to_date('19-05-1954', 'dd-mm-yyyy'), 'RoshHamatehHaklali.', 'Alon', 'Biton', 'Maglan');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (429856314, to_date('28-12-1960', 'dd-mm-yyyy'), 'AlufMishne', 'Alon', 'Ben-Shlomo', 'Oketz');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (434703552, to_date('03-03-1963', 'dd-mm-yyyy'), 'Samal', 'Yaara', 'Mizrahi', '8200');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (249755717, to_date('16-11-1950', 'dd-mm-yyyy'), 'SamalRishon', 'Keren', 'Mizrahi', 'SayeretMatkal');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (743021164, to_date('19-12-1971', 'dd-mm-yyyy'), 'SamalRishonMishneh', 'Matan', 'Levi', 'Shayetet13');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (13800815, to_date('19-04-1971', 'dd-mm-yyyy'), 'RavTurai', 'Noa', 'Amar', 'Bardelas');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (807717422, to_date('24-04-1952', 'dd-mm-yyyy'), 'Rotem', 'Tal', 'Levi', 'Kfir');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (408958649, to_date('07-10-1953', 'dd-mm-yyyy'), 'AlufMishne', 'Talia', 'Cohen', 'Paratroopers');
insert into SOLDIER (soldier_id, birth_date, soldier_rank, first_name, last_name, unit)
values (124517445, to_date('26-10-1997', 'dd-mm-yyyy'), 'Turai', 'Gilad', 'Amar', 'SayeretMatkal');
commit;
prompt 600 records loaded
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
values (9726764684, 301683965);
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
values (6306204823, 918922079);
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
values (645407922, 824919862);
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
values (3641201795, 61751992);
insert into OWNS (serial_number, soldier_id)
values (422483010, 33519446);
insert into OWNS (serial_number, soldier_id)
values (6014854779, 222038979);
insert into OWNS (serial_number, soldier_id)
values (230008394, 777390005);
insert into OWNS (serial_number, soldier_id)
values (641561064, 427633412);
insert into OWNS (serial_number, soldier_id)
values (2751141724, 528905573);
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
values (2549303948, 544464209);
insert into OWNS (serial_number, soldier_id)
values (8941236223, 211911905);
insert into OWNS (serial_number, soldier_id)
values (2272506156, 340818594);
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
values (8436946271, 331077128);
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
commit;
prompt 100 records committed...
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
values (5023198951, 141017923);
insert into OWNS (serial_number, soldier_id)
values (7427208123, 42187495);
insert into OWNS (serial_number, soldier_id)
values (3702815764, 283254004);
insert into OWNS (serial_number, soldier_id)
values (8545467179, 373194046);
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
values (7067267583, 620669972);
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
values (1235292391, 679496495);
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
values (2507653405, 596551478);
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
values (3638226067, 217702278);
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
values (9572959789, 408657848);
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
commit;
prompt 200 records committed...
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
values (3163000447, 544994839);
insert into OWNS (serial_number, soldier_id)
values (1988266166, 513646118);
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
values (9848509232, 790597387);
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
values (2052756423, 515164706);
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
values (201481553, 181765494);
insert into OWNS (serial_number, soldier_id)
values (1503426516, 633915592);
insert into OWNS (serial_number, soldier_id)
values (860388597, 823226118);
insert into OWNS (serial_number, soldier_id)
values (5765653102, 243993217);
insert into OWNS (serial_number, soldier_id)
values (3512221536, 807717422);
insert into OWNS (serial_number, soldier_id)
values (655266610, 337253964);
insert into OWNS (serial_number, soldier_id)
values (9232725334, 253020708);
insert into OWNS (serial_number, soldier_id)
values (1415593509, 30314782);
insert into OWNS (serial_number, soldier_id)
values (3209891703, 679255217);
insert into OWNS (serial_number, soldier_id)
values (5851355145, 100823687);
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
values (8163829791, 975713400);
insert into OWNS (serial_number, soldier_id)
values (3390750082, 346162990);
insert into OWNS (serial_number, soldier_id)
values (4457245265, 516903398);
insert into OWNS (serial_number, soldier_id)
values (4849937660, 913550787);
insert into OWNS (serial_number, soldier_id)
values (8899279252, 457905244);
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
values (8343971343, 891248785);
insert into OWNS (serial_number, soldier_id)
values (543820185, 304753010);
insert into OWNS (serial_number, soldier_id)
values (2838153407, 344105739);
commit;
prompt 300 records committed...
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
values (4495799564, 342976481);
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
insert into OWNS (serial_number, soldier_id)
values (8340853932, 457338493);
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
values (5386635504, 896684281);
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
values (8848122298, 559946127);
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
values (5465795150, 415751183);
insert into OWNS (serial_number, soldier_id)
values (8655033031, 219695867);
insert into OWNS (serial_number, soldier_id)
values (5452670529, 190685698);
insert into OWNS (serial_number, soldier_id)
values (3050012091, 388593835);
insert into OWNS (serial_number, soldier_id)
values (798188194, 257132733);
insert into OWNS (serial_number, soldier_id)
values (6941805533, 14962501);
insert into OWNS (serial_number, soldier_id)
values (2750118238, 645592237);
insert into OWNS (serial_number, soldier_id)
values (8897890075, 173486842);
insert into OWNS (serial_number, soldier_id)
values (8758416804, 876816056);
insert into OWNS (serial_number, soldier_id)
values (1372061954, 939435895);
insert into OWNS (serial_number, soldier_id)
values (878905313, 92384346);
insert into OWNS (serial_number, soldier_id)
values (4114272739, 169511690);
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
values (9201709199, 896684281);
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
values (5577018152, 482241644);
insert into OWNS (serial_number, soldier_id)
values (1943603908, 14859674);
insert into OWNS (serial_number, soldier_id)
values (3876469407, 623560716);
insert into OWNS (serial_number, soldier_id)
values (2591365316, 807157955);
commit;
prompt 400 records loaded
prompt Loading STOREMAN...
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (807378623, 43, 7998045433);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (349984301, 51, 5260113197);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (328124739, 23, 5381021633);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (867539907, 27, 8719506268);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (918922079, 37, 3220487253);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (655001398, 27, 8994723781);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (939435895, 38, 8015551792);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (597520467, 35, 4309160419);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (876816056, 8, 4473030814);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (896592730, 3, 7323150268);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (270641945, 34, 4305773626);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (894326216, 19, 4094829436);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (330583188, 21, 4041541856);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (412660931, 12, 4254840602);
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
values (303278765, 48, 684943291);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (192279463, 9, 3824994328);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (717915866, 21, 261407387);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (891969849, 27, 8008467226);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (191031722, 60, 6875389640);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (895727331, 39, 7434237718);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (244887596, 11, 8761922338);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (699278615, 22, 127338072);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (398012055, 37, 5504829974);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (602849931, 27, 1069660621);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (227809174, 51, 3379209368);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (732272262, 37, 7989090403);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (444519972, 42, 7257468760);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (276265447, 21, 6051015683);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (539272033, 28, 6909820646);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (612604610, 35, 3033908172);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (936770252, 54, 5494311415);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (58230132, 5, 9912916709);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (161094854, 14, 7857194612);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (100823687, 37, 2051033117);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (832489706, 45, 2996647879);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (983287625, 52, 2362984114);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (312889486, 27, 43859418);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (787377762, 54, 9560385514);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (720918778, 30, 9215297133);
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
values (866499908, 41, 3532193164);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (938695176, 17, 5755503158);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (39473808, 45, 6213785118);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (204735426, 11, 6606838009);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (27309463, 23, 9947274359);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (119324186, 54, 4993512060);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (331077128, 13, 6954833971);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (516903398, 12, 1627572129);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (390303866, 60, 7159771341);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (14859674, 44, 7934300986);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (772344246, 57, 1009400256);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (373081583, 27, 3432086456);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (476904103, 49, 4840843889);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (387530015, 11, 8057578690);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (102730015, 30, 1394366144);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (747916114, 48, 2195427266);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (33348831, 34, 711915037);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (678156612, 4, 9851046040);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (775186259, 15, 4068531670);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (466176151, 59, 4532819678);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (715654050, 12, 9542897224);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (873355614, 20, 3312919799);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (292475023, 45, 1711577649);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (791356613, 60, 9018685179);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (203457656, 59, 6064937749);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (867006633, 48, 900082013);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (580744813, 23, 2073504657);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (990619358, 12, 5773732563);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (33519446, 37, 8527911504);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (343124943, 24, 3472501279);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (353399272, 25, 8494880937);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (957293214, 29, 7162438431);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (268280838, 51, 3295113117);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (537542840, 22, 8763912363);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (864922144, 25, 8014422314);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (913704515, 57, 8828866526);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (791194510, 56, 44779413);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (693277640, 6, 560519940);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (931857166, 34, 1126661700);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (521791185, 34, 7689428194);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (326217360, 53, 5094140215);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (528040682, 29, 9422744030);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (279346974, 42, 7856772511);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (48759591, 11, 2635359704);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (57175840, 37, 1434253358);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (730746211, 21, 198493237);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (182734548, 51, 7752406588);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (461465926, 41, 9709423948);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (911363560, 33, 9792008952);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (376270328, 23, 9427109086);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (339156780, 52, 4456118071);
commit;
prompt 100 records committed...
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (455310909, 1, 7732712269);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (155040268, 21, 9862505986);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (528905573, 33, 7001159921);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (785530631, 30, 3490649377);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (47521761, 56, 4314102466);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (586805875, 3, 415522799);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (700051578, 44, 9603944310);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (658456825, 30, 8250848739);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (314361230, 34, 2863308060);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (104582770, 34, 3199368328);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (53371115, 8, 4549105621);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (793125656, 10, 9398613622);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (356782622, 28, 112043827);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (109746290, 8, 6484335275);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (896684281, 12, 8772493343);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (727289966, 28, 9718088970);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (965008250, 2, 3692035034);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (139730663, 42, 131447274);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (376413837, 54, 7442771353);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (329924597, 6, 1649583078);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (138780621, 7, 1245195236);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (761898540, 12, 1695723512);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (804277125, 34, 9010351513);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (541783735, 31, 9726857902);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (887772795, 52, 4682958986);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (80299456, 23, 3079312747);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (168718379, 56, 6958849171);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (191938280, 52, 4237643702);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (640870770, 8, 5220721040);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (838568375, 53, 2197776850);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (938341769, 33, 1674658590);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (515164706, 26, 4399125649);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (346165870, 36, 1281019521);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (657252513, 8, 4732946988);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (344417887, 40, 373156598);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (246690436, 19, 6245206047);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (238846598, 53, 3130013219);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (403598163, 57, 9126746616);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (781343075, 55, 8283282713);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (27888027, 2, 9676309403);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (701994756, 58, 7094245914);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (210711448, 11, 6406506193);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (438377933, 30, 8870701376);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (804857652, 41, 663483986);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (99392871, 18, 3048079767);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (531468297, 58, 1015657414);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (574276437, 2, 1489063880);
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
values (679496495, 2, 9456089279);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (930637594, 23, 5281120135);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (601514113, 7, 7405919321);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (565195540, 36, 6517710118);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (597169972, 9, 5986847282);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (355518824, 42, 9139855618);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (910068434, 15, 8171193171);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (281358641, 8, 4942167703);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (756083129, 46, 1925464105);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (355790687, 8, 3105156743);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (480375782, 19, 5137393457);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (421861798, 35, 3671015115);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (622971217, 0, 2378580045);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (267972116, 41, 4615379066);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (553836456, 47, 1867855029);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (196799171, 24, 9691746383);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (753964090, 24, 2828855385);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (22117822, 34, 9662472323);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (5643774, 8, 9719981141);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (741528628, 5, 7183055861);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (343688505, 31, 2300617388);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (219695867, 48, 7419201939);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (623560716, 21, 845393956);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (407735882, 24, 2505310704);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (243993217, 42, 2255353139);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (553215905, 56, 803486996);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (61751992, 32, 3855948706);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (773269978, 46, 188126018);
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
values (465488713, 18, 4743275322);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (33021469, 10, 1330820784);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (216863674, 59, 7194272436);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (354262773, 15, 8981396378);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (888607213, 1, 591700657);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (478023481, 31, 1310384304);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (366227449, 31, 2437887388);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (262774555, 2, 8356241074);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (388593835, 10, 4711622117);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (378591419, 23, 3166073625);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (128587055, 29, 4740632252);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (777390005, 41, 272314523);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (985893149, 52, 2853209284);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (122242117, 44, 6996515713);
commit;
prompt 200 records committed...
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (445021747, 55, 3006393424);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (919730837, 3, 3462661594);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (850282407, 51, 3780928275);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (921345792, 55, 8935672982);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (559402057, 10, 1985703929);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (740844669, 54, 6737760058);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (335043978, 14, 3469925177);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (387145855, 60, 6140354405);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (107148939, 38, 3039337505);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (533658209, 55, 1341843981);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (130230511, 13, 9055110599);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (54570439, 46, 8889599837);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (559946127, 54, 4336329790);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (501339491, 7, 4440812047);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (951979571, 27, 6961077817);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (668381973, 29, 9197008138);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (83424189, 33, 3824071590);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (296869674, 43, 8734165994);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (160369451, 55, 3103587291);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (513646118, 28, 6310702033);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (48296139, 18, 28008819);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (333050151, 18, 3561117427);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (852148646, 58, 9933450947);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (871311793, 18, 4054632455);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (941212586, 1, 6247731793);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (373304496, 4, 7551884229);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (757557624, 52, 525402490);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (413672321, 18, 1630047150);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (610752820, 24, 1962143604);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (209537395, 31, 2366342534);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (765470455, 34, 2314952425);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (835614936, 35, 9322452254);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (86417259, 10, 5172408020);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (49467423, 46, 6559900244);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (567228871, 50, 3975703508);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (915186888, 24, 5499267131);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (299431806, 14, 3329377019);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (635409007, 17, 1485190959);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (940572982, 11, 2191549381);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (388851398, 49, 3519532740);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (335623712, 44, 3749590920);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (221812681, 2, 8640946841);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (724740823, 45, 5355522402);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (199470536, 45, 799358136);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (33810605, 20, 8272317810);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (645592237, 29, 1438361279);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (825444945, 26, 9005316961);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (665303515, 11, 2759393);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (668859191, 24, 4594720156);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (889592594, 15, 2893899139);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (96409187, 37, 9470876840);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (8310165, 12, 5247882929);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (954789903, 60, 3087552079);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (691846022, 21, 4470308572);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (591654777, 39, 3380981990);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (922868636, 12, 7824424657);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (149955748, 19, 6586650711);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (337253964, 46, 3497285055);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (132254189, 53, 7404015917);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (984292034, 48, 7468990299);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (468373911, 47, 6942159379);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (222038979, 3, 6568010629);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (951531351, 9, 4081165844);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (321863485, 48, 6361451930);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (376761441, 6, 7706462827);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (426023600, 8, 4035042798);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (563250879, 36, 3012025231);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (146228453, 50, 7449507055);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (731341816, 26, 3910656292);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (920665418, 14, 2023192352);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (356116182, 53, 4196055991);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (42187495, 26, 2126843023);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (941052879, 38, 7703434216);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (151470617, 11, 5740985568);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (190685698, 34, 3756708831);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (633046823, 26, 353622213);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (948970642, 27, 167134478);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (678454411, 44, 5468834990);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (655441077, 50, 6042288054);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (328281804, 52, 4092892706);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (913550787, 8, 2864156706);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (373194046, 50, 1261413139);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (564251959, 29, 5025045083);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (772282863, 20, 8367450085);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (868116529, 43, 850149958);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (736579790, 10, 2864089839);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (691870152, 6, 5442740858);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (752120149, 6, 8887758405);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (705828591, 57, 3201043602);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (586503670, 24, 5038905616);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (894988803, 57, 1129019389);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (285743737, 39, 2746852182);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (749498412, 23, 9478531595);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (141017923, 60, 6308448206);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (527623213, 31, 6649963460);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (223653476, 28, 9144536098);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (648570736, 55, 3746821747);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (389089321, 46, 754274858);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (103774210, 41, 1007528486);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (615551152, 45, 5114987385);
commit;
prompt 300 records committed...
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (18313165, 13, 2740526322);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (408657848, 48, 1697357799);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (112779016, 29, 6491145944);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (189082064, 30, 4034737735);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (262946526, 16, 3578687032);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (25744932, 29, 167476784);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (465816994, 38, 2771095897);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (283254004, 42, 9353106044);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (160015012, 12, 9933939684);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (228408513, 31, 260155129);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (441097158, 43, 9098809595);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (843391891, 59, 1292917045);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (211923036, 47, 1493446177);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (23523001, 55, 8367317858);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (239498476, 24, 8920688122);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (860944630, 53, 3466456849);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (970939234, 50, 5896707556);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (835652409, 44, 1236262640);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (862298076, 33, 8928426488);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (790597387, 59, 6414717976);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (810976664, 37, 9271702664);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (449535616, 31, 9774061637);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (953772043, 2, 9195231798);
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
values (628952606, 48, 2081070241);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (884802758, 33, 5903693783);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (368073352, 22, 4340842495);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (696164740, 54, 1556576479);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (509280185, 16, 5276367047);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (366049885, 42, 1488574064);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (170428173, 59, 3023914742);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (128185588, 53, 3305391502);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (858504819, 16, 1770851029);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (214263880, 32, 1368073561);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (806039254, 41, 3799577075);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (683400930, 36, 208465955);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (427054136, 26, 839667416);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (366024509, 38, 4613136344);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (734007993, 41, 7058052664);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (419780086, 47, 1777614297);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (2545162, 42, 9067753838);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (993519677, 14, 6336812574);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (170584684, 11, 209254136);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (412890041, 28, 7268923610);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (346198032, 26, 2126725238);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (156074960, 27, 900496394);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (823226118, 50, 6537827757);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (946483541, 6, 8781434597);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (312800764, 26, 128193586);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (738131178, 59, 2619360974);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (103850003, 58, 9893338138);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (341714156, 37, 9975891720);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (100460095, 59, 9431365316);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (372913295, 52, 8746782320);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (873879832, 33, 9974190274);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (769384835, 37, 8967262439);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (392616556, 41, 7605192682);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (563546248, 44, 479735255);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (38809955, 47, 1457671959);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (496442797, 29, 1632587230);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (436523058, 1, 7712522193);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (999169755, 27, 2650179284);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (437263445, 18, 6317605166);
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
values (324661638, 34, 6226352815);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (133048262, 36, 3106691424);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (590200382, 8, 7455337253);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (346162990, 18, 5150734028);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (652670680, 46, 4046490551);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (648030699, 26, 3686348545);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (420748865, 17, 7207154142);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (229730153, 37, 9832737195);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (104873666, 4, 8679296847);
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
values (629136134, 58, 3686259046);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (63275440, 42, 7952258665);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (610541521, 2, 5066853243);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (918298456, 37, 546285283);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (650457925, 8, 4584810996);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (189616313, 5, 7148321307);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (104160558, 57, 9623978107);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (894361403, 16, 2480992828);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (123219821, 17, 265482596);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (81298698, 58, 2313663892);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (59689472, 11, 1836771829);
insert into STOREMAN (soldier_id, hours_per_week, store_id)
values (335042023, 19, 3609675609);
commit;
prompt 400 records loaded
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
values ('Nike', 'pbutteg@cloudflare.com', 'Saiâ€™erlong Xiang', 859667);
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
values ('Costco', 'qyusupovz@nasa.gov', 'TlumaÄov', 240924);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AmericanExpress', 'fdrewe10@cisco.com', 'Kladanj', 351987);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AbbottLaboratories', 'wcomport11@gnu.org', 'SarÄqib', 712015);
insert into SUPPLIER (company_name, email, location, company_id)
values ('T-Mobile', 'fdrinkeld12@typepad.com', 'CholargÃ³s', 494195);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Starbucks', 'rbursell13@vimeo.com', 'Krasnystaw', 154318);
insert into SUPPLIER (company_name, email, location, company_id)
values ('IBM', 'lmorley14@fotki.com', 'ÅÄ™czyce', 491794);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GoldmanSachs', 'lgayle15@icq.com', 'Moville', 659073);
insert into SUPPLIER (company_name, email, location, company_id)
values ('LockheedMartin', 'jlightoller16@weibo.com', 'Campos Novos', 653216);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Bristol-MyersSquibb', 'pomohun17@cnn.com', 'Emiliano Zapata', 914579);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Qualcomm', 'aabbate18@flickr.com', 'VÃ¤rmdÃ¶', 290983);
insert into SUPPLIER (company_name, email, location, company_id)
values ('3M', 'emattock19@arizona.edu', 'Bunutan', 961642);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PhilipMorris', 'klittefair1a@ed.gov', 'Zhutang', 366070);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Medtronic', 'dbadsworth1b@clickbank.net', 'Olyka', 518248);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Boeing', 'ahandrok1c@xinhuanet.com', 'Å¢ubarjal', 466659);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GeneralElectric', 'cpieterick1d@theglobeandmail.com', 'Zbiroh', 880502);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Dow', 'dlongstaffe1e@netlog.com', 'Arras', 464893);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MondelezInternational', 'pgarrettson1f@woothemes.com', 'Kostrzyn nad OdrÄ…', 154459);
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
values ('NextEraEnergy', 'rdawid20@constantcontact.com', 'ÅŒmiya', 780947);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AmericanAirlines', 'gtestro21@ehow.com', 'Waterloo', 370213);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Honeywell', 'myegorkin22@jigsy.com', 'Digdig', 949816);
insert into SUPPLIER (company_name, email, location, company_id)
values ('McDonald', 'koffield23@bigcartel.com', 'PerdÃµes', 969562);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Citigroup', 'bivamy24@imageshack.us', 'Bielsk Podlaski', 362524);
insert into SUPPLIER (company_name, email, location, company_id)
values ('CardinalHealth', 'akloss25@abc.net.au', 'HamhÅ­ng', 756451);
insert into SUPPLIER (company_name, email, location, company_id)
values ('TheTravelersCompanies', 'hmcnab26@europa.eu', 'Clonskeagh', 758458);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Cigna', 'kmatthiesen27@jiathis.com', 'Balpyk BÄ«', 937171);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MarathonPetroleum', 'rdaulton28@sciencedaily.com', 'Qiziltepa Shahri', 840550);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Aflac', 'dshervil29@telegraph.co.uk', 'Voznesenskaya', 472841);
insert into SUPPLIER (company_name, email, location, company_id)
values ('StateFarm', 'olettley2a@blogspot.com', 'Budapest', 766704);
insert into SUPPLIER (company_name, email, location, company_id)
values ('LibertyMutual', 'rbordman2b@berkeley.edu', 'ViÅ¡Åˆova', 387901);
insert into SUPPLIER (company_name, email, location, company_id)
values ('DeltaAirLines', 'ipowter2c@sina.com.cn', 'PieniÄ™Å¼no', 914553);
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
values ('Halliburton', 'jbedbrough2l@blinklist.com', 'Grande RiviÃ¨re Noire', 737743);
insert into SUPPLIER (company_name, email, location, company_id)
values ('FluorCorpora', 'slundbeck2m@about.com', 'Fujiayan', 304657);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Apple', 'myakhin2n@wordpress.com', 'Chouto', 574042);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Microsoft', 'bbowich2o@paginegialle.it', 'Georgiyevsk', 267262);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Amazon', 'ahawkings2p@rambler.ru', 'PinhÃ£o', 444896);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Google', 'acockton2q@opera.com', 'Haarlem', 358895);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Facebook', 'abratton2r@twitter.com', 'Bolkhov', 540808);
commit;
prompt 100 records committed...
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
insert into SUPPLIER (company_name, email, location, company_id)
values ('ProcterGamble', 'gdosedale2x@patch.com', 'Guangâ€™an', 730512);
insert into SUPPLIER (company_name, email, location, company_id)
values ('NVIDIA', 'gduff2y@slate.com', 'SÃ£o Paulo', 536781);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Visa', 'jwallwork2z@craigslist.org', 'Saint Joseph', 653673);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Mastercard', 'reaslea30@state.gov', 'KurÃ³w', 803435);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UnitedHealthGroup', 'jlawful31@dailymotion.com', 'Wuping', 706700);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Disney', 'kbrundill32@flavors.me', 'Dzerzhinsk', 793799);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Nike', 'bpfaffel33@icio.us', 'Santo Domingo de los Colorados', 585005);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PayPal', 'pclark34@telegraph.co.uk', 'CubarÃ¡', 712051);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intel', 'asegge35@people.com.cn', 'Lutou', 732248);
insert into SUPPLIER (company_name, email, location, company_id)
values ('HomeDepot', 'jbyres36@wikispaces.com', 'Oslo', 128122);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Verizon', 'rlarkby37@icq.com', 'Babice', 433325);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Comcast', 'oitskovitz38@oracle.com', 'SÃ£o JoÃ£o del Rei', 765402);
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
values ('AbbottLaboratories', 'slemmertz3o@cpanel.net', 'MarÄdah', 146872);
insert into SUPPLIER (company_name, email, location, company_id)
values ('T-Mobile', 'ijudd3p@themeforest.net', 'Alaghsas', 878515);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Starbucks', 'emallord3q@columbia.edu', 'Pittsburgh', 429568);
insert into SUPPLIER (company_name, email, location, company_id)
values ('IBM', 'ctimbs3r@gravatar.com', 'Báº±ng LÅ©ng', 978762);
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
values ('BookingHoldings', 'clivock45@cnn.com', 'AzÌ§ ZÌ§aâ€˜Äyin', 258870);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BankofAmerica', 'rfeighney46@twitpic.com', 'Luyang', 818835);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Amgen', 'dollie47@apple.com', 'AlingsÃ¥s', 728100);
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
values ('Colgate-Palmolive', 'fcluney4g@kickstarter.com', 'BÅ™eclav', 389363);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Caterpillar', 'lberk4h@wisc.edu', 'Ashibetsu', 764186);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ConocoPhillips', 'ddeleek4i@usgs.gov', 'Louny', 415089);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Lowe', 'bodrought4j@upenn.edu', 'Xia Dawo', 330576);
insert into SUPPLIER (company_name, email, location, company_id)
values ('RaytheonTechnologies', 'bstellin4k@ovh.net', 'Cestas', 884471);
insert into SUPPLIER (company_name, email, location, company_id)
values ('KraftHeinz', 'njirzik4l@pagesperso-orange.fr', 'LibofshÃ«', 196742);
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
values ('CardinalHealth', 'cdossantos4s@msu.edu', 'NÃ©a PÃ©lla', 866245);
insert into SUPPLIER (company_name, email, location, company_id)
values ('TheTravelersCompanies', 'saspin4t@ning.com', 'Hengshan', 711629);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Cigna', 'zmatuszkiewicz4u@unblog.fr', 'Liuyuan', 891266);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MarathonPetroleum', 'gelias4v@pinterest.com', 'Starotitarovskaya', 621996);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Aflac', 'ctudgay4w@unesco.org', 'MauÃ©s', 303019);
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
values ('Broadcom', 'cgregol53@google.nl', 'ZaÅ¡ovÃ¡', 214746);
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
values ('BerkshireHathaway', 'gdoerffer5g@gravatar.com', 'ParanavaÃ­', 728989);
insert into SUPPLIER (company_name, email, location, company_id)
values ('JohnsonJohnson', 'flatus5h@gnu.org', 'Dzhiginka', 344353);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Walmart', 'dalekseev5i@google.com', 'Shejiang', 575635);
insert into SUPPLIER (company_name, email, location, company_id)
values ('JPMorganChase', 'mtayt5j@unblog.fr', 'Pasirangin Tiga', 463089);
commit;
prompt 200 records committed...
insert into SUPPLIER (company_name, email, location, company_id)
values ('ProcterGamble', 'dfoottit5k@nps.gov', 'KrÃ¡snÃ¡ LÃ­pa', 975640);
insert into SUPPLIER (company_name, email, location, company_id)
values ('NVIDIA', 'twhitebread5l@oaic.gov.au', 'KokkinÃ³choma', 713511);
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
values ('PayPal', 'nrohlfs5r@fotki.com', 'Å½rnovnica', 778697);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intel', 'jransbury5s@mayoclinic.com', 'Gebre Guracha', 790484);
insert into SUPPLIER (company_name, email, location, company_id)
values ('HomeDepot', 'bmanuely5t@nasa.gov', 'Quimper', 518316);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Verizon', 'rricardot5u@aboutads.info', 'OmÄ«dcheh', 107803);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Comcast', 'thamlet5v@istockphoto.com', 'Karangtawar', 375773);
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
values ('Coca-Cola', 'sbean61@marriott.com', 'MalanÃ³w', 134885);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Oracle', 'abennoe62@tripod.com', 'Dayr MawÄs', 844889);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AbbVie', 'tcordsen63@twitter.com', 'Ust-Kamenogorsk', 157210);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Cisco', 'rbardill64@cdbaby.com', 'Qingyang', 369709);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Chevron', 'daldren65@businessweek.com', 'Yaodu', 356144);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Merck', 'eluesley66@weebly.com', 'Talisay', 917132);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ExxonMobil', 'sorto67@disqus.com', 'BÃ¹ Äá»‘p', 988842);
insert into SUPPLIER (company_name, email, location, company_id)
values ('WaltDisney', 'aegginton68@webs.com', 'Bukui', 359634);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Costco', 'wbance69@dell.com', 'Yangcheng', 510324);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AmericanExpress', 'spursey6a@wufoo.com', 'Azteca', 910971);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AbbottLaboratories', 'xbidder6b@theguardian.com', 'RÄbigh', 985015);
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
values ('3M', 'sbeedom6j@flickr.com', 'CÃ¢ndido Mota', 883539);
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
values ('MondelezInternational', 'gmacewan6p@mozilla.org', 'VasilikÃ³n', 595915);
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
values ('Pfizer', 'dfuente6w@aboutads.info', 'VelkÃ¡ BystÅ™ice', 625400);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UPS', 'mdodimead6x@cloudflare.com', 'Xiatang', 629210);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intuit', 'cpreshaw6y@ucla.edu', 'DomanÃ­n', 801194);
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
values ('RaytheonTechnologies', 'bmerwe77@issuu.com', 'CiÃ©naga de Oro', 879931);
insert into SUPPLIER (company_name, email, location, company_id)
values ('KraftHeinz', 'tlabadini78@jugem.jp', 'JÃ¶nkÃ¶ping', 573003);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Exelon', 'wbowhey79@usgs.gov', 'KÄ…ty WrocÅ‚awskie', 143082);
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
values ('LibertyMutual', 'fgulley7l@canalblog.com', 'Ã„ngelholm', 153254);
insert into SUPPLIER (company_name, email, location, company_id)
values ('DeltaAirLines', 'lahren7m@columbia.edu', 'Ageoshimo', 676756);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BestBuy', 'cbonnaire7n@naver.com', 'Jandayan', 907073);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Paccar', 'ljaneway7o@chron.com', 'Keruguya', 911536);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BaxterInternational', 'cperrins7p@ning.com', 'Las Varillas', 455682);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Broadcom', 'apople7q@dell.com', 'BeÅ‚sznica', 723943);
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
values ('Amazon', 'ktreend7z@quantcast.com', 'Al á¸¨umaydÄt', 737457);
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
values ('NVIDIA', 'sduiged88@walmart.com', 'HafnarfjÃ¶rÃ°ur', 810711);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Visa', 'ctewkesbury89@jalbum.net', 'Belyy Gorodok', 884946);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Mastercard', 'gainslee8a@forbes.com', 'Xinchengzi', 636026);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UnitedHealthGroup', 'vartindale8b@virginia.edu', 'Praimarada', 953372);
commit;
prompt 300 records committed...
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
values ('Netflix', 'thatfull8k@home.pl', 'Paris La DÃ©fense', 354355);
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
values ('AbbVie', 'lforsdyke8q@dell.com', 'SantarÃ©m', 362220);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Cisco', 'kkarpe8r@biglobe.ne.jp', 'Priiskovyy', 293113);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Chevron', 'ashorten8s@dailymail.co.uk', 'Cikadu', 339228);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Merck', 'dscriven8t@ebay.com', 'Sadao', 799402);
insert into SUPPLIER (company_name, email, location, company_id)
values ('ExxonMobil', 'jmogey8u@bizjournals.com', 'Shijie', 942713);
insert into SUPPLIER (company_name, email, location, company_id)
values ('WaltDisney', 'ccullagh8v@w3.org', 'Ozerki', 584594);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Costco', 'drown8w@csmonitor.com', 'SpÃ¡rti', 652389);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AmericanExpress', 'belphinston8x@huffingtonpost.com', 'Silago', 133266);
insert into SUPPLIER (company_name, email, location, company_id)
values ('AbbottLaboratories', 'wreddel8y@eventbrite.com', 'Praia das MaÃ§Ã£s', 957508);
insert into SUPPLIER (company_name, email, location, company_id)
values ('T-Mobile', 'ghasselby8z@ameblo.jp', 'Yungaisi', 245601);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Starbucks', 'mcapnor90@squidoo.com', 'Zopilotepe', 947405);
insert into SUPPLIER (company_name, email, location, company_id)
values ('IBM', 'mgoadsby91@bizjournals.com', 'CotÃ©-Lai', 934288);
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
values ('Dow', 'dferrolli9b@netscape.com', 'NÃ¡chod', 528287);
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
values ('Pfizer', 'mjockle9j@elegantthemes.com', 'BÃ©lel', 506400);
insert into SUPPLIER (company_name, email, location, company_id)
values ('UPS', 'mswadlin9k@bbb.org', 'Nongba', 354580);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intuit', 'daymes9l@ibm.com', 'Salcedo', 765169);
insert into SUPPLIER (company_name, email, location, company_id)
values ('TexasInstruments', 'mbrewett9m@ezinearticles.com', 'GrÄ™bkÃ³w', 909899);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MicronTechnology', 'bpoli9n@printfriendly.com', 'Holma', 171309);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Ford', 'kfardy9o@prnewswire.com', 'Cruz Alta', 648923);
insert into SUPPLIER (company_name, email, location, company_id)
values ('GeneralMotors', 'chaggidon9p@marriott.com', 'LinkÃ¶ping', 770372);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Colgate-Palmolive', 'ljohnston9q@discuz.net', 'Jiangti', 267947);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Caterpillar', 'csmallacombe9r@europa.eu', 'Yelatâ€™ma', 127488);
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
values ('Honeywell', 'nwhitfeld9z@dell.com', 'CaÃ§apava do Sul', 309897);
insert into SUPPLIER (company_name, email, location, company_id)
values ('McDonald', 'eoddeya0@yale.edu', 'Shelabolikha', 836345);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Citigroup', 'vsimkoa1@hao123.com', 'Amboasary', 691010);
insert into SUPPLIER (company_name, email, location, company_id)
values ('CardinalHealth', 'aguessa2@joomla.org', 'BÅ‚aszki', 120778);
insert into SUPPLIER (company_name, email, location, company_id)
values ('TheTravelersCompanies', 'rstricka3@springer.com', 'Anuling', 591527);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Cigna', 'ntoderinia4@bloglines.com', 'Paris 17', 990890);
insert into SUPPLIER (company_name, email, location, company_id)
values ('MarathonPetroleum', 'lthrowera5@over-blog.com', 'Nuevo ArraijÃ¡n', 987789);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Aflac', 'gcurra6@arstechnica.com', 'Changnyeong', 328041);
insert into SUPPLIER (company_name, email, location, company_id)
values ('StateFarm', 'fstiegera7@marketwatch.com', 'Carreira', 145155);
insert into SUPPLIER (company_name, email, location, company_id)
values ('LibertyMutual', 'omcilmorowa8@senate.gov', 'Stanari', 575252);
insert into SUPPLIER (company_name, email, location, company_id)
values ('DeltaAirLines', 'edurtnala9@ustream.tv', 'SÃ£o Francisco do Sul', 671990);
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
values ('FluorCorpora', 'leverilaj@time.com', 'MendÄ«', 968359);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Apple', 'jleverentzak@ovh.net', 'Hovtashen', 169308);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Microsoft', 'vvantal@twitter.com', 'â€˜Izbat al Burj', 160748);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Amazon', 'rcromleyam@arizona.edu', 'Gnojnica', 195334);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Google', 'hearsmanan@edublogs.org', 'DobÅ¡ice', 251729);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Facebook', 'mlortzingao@icio.us', 'Silae', 952724);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Tesla', 'cstonebanksap@bizjournals.com', 'HavlÃ­ÄkÅ¯v Brod', 879526);
insert into SUPPLIER (company_name, email, location, company_id)
values ('BerkshireHathaway', 'deveralaq@weather.com', 'KobeÅ™ice', 595057);
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
values ('Nike', 'cberreclothb0@hugedomains.com', 'EnkÃ¶ping', 163939);
insert into SUPPLIER (company_name, email, location, company_id)
values ('PayPal', 'kwilliamsonb1@cdc.gov', 'Phichit', 366418);
insert into SUPPLIER (company_name, email, location, company_id)
values ('Intel', 'llapthorneb2@jimdo.com', 'Plasy', 574469);
insert into SUPPLIER (company_name, email, location, company_id)
values ('HomeDepot', 'fhogbourneb3@bloomberg.com', 'Firovo', 237629);
commit;
prompt 400 records loaded
prompt Loading SUPPLIES...
insert into SUPPLIES (company_id, store_id)
values (559146, 7998045433);
insert into SUPPLIES (company_id, store_id)
values (757260, 5260113197);
insert into SUPPLIES (company_id, store_id)
values (738303, 5381021633);
insert into SUPPLIES (company_id, store_id)
values (366104, 8719506268);
insert into SUPPLIES (company_id, store_id)
values (143701, 3220487253);
insert into SUPPLIES (company_id, store_id)
values (256875, 8994723781);
insert into SUPPLIES (company_id, store_id)
values (732488, 8015551792);
insert into SUPPLIES (company_id, store_id)
values (291669, 4309160419);
insert into SUPPLIES (company_id, store_id)
values (581216, 4473030814);
insert into SUPPLIES (company_id, store_id)
values (277568, 7323150268);
insert into SUPPLIES (company_id, store_id)
values (650634, 4305773626);
insert into SUPPLIES (company_id, store_id)
values (467493, 4094829436);
insert into SUPPLIES (company_id, store_id)
values (760359, 4041541856);
insert into SUPPLIES (company_id, store_id)
values (953422, 4254840602);
insert into SUPPLIES (company_id, store_id)
values (717258, 8741317356);
insert into SUPPLIES (company_id, store_id)
values (275177, 3029221199);
insert into SUPPLIES (company_id, store_id)
values (859667, 7272891544);
insert into SUPPLIES (company_id, store_id)
values (444940, 3558617930);
insert into SUPPLIES (company_id, store_id)
values (352410, 6640968939);
insert into SUPPLIES (company_id, store_id)
values (252651, 684943291);
insert into SUPPLIES (company_id, store_id)
values (759481, 3824994328);
insert into SUPPLIES (company_id, store_id)
values (262667, 261407387);
insert into SUPPLIES (company_id, store_id)
values (418693, 8008467226);
insert into SUPPLIES (company_id, store_id)
values (948340, 6875389640);
insert into SUPPLIES (company_id, store_id)
values (350517, 7434237718);
insert into SUPPLIES (company_id, store_id)
values (137689, 8761922338);
insert into SUPPLIES (company_id, store_id)
values (151273, 127338072);
insert into SUPPLIES (company_id, store_id)
values (613036, 5504829974);
insert into SUPPLIES (company_id, store_id)
values (717610, 1069660621);
insert into SUPPLIES (company_id, store_id)
values (666125, 3379209368);
insert into SUPPLIES (company_id, store_id)
values (570476, 7989090403);
insert into SUPPLIES (company_id, store_id)
values (847731, 7257468760);
insert into SUPPLIES (company_id, store_id)
values (787809, 6051015683);
insert into SUPPLIES (company_id, store_id)
values (804009, 6909820646);
insert into SUPPLIES (company_id, store_id)
values (558872, 3033908172);
insert into SUPPLIES (company_id, store_id)
values (240924, 5494311415);
insert into SUPPLIES (company_id, store_id)
values (351987, 9912916709);
insert into SUPPLIES (company_id, store_id)
values (712015, 7857194612);
insert into SUPPLIES (company_id, store_id)
values (494195, 2051033117);
insert into SUPPLIES (company_id, store_id)
values (154318, 2996647879);
insert into SUPPLIES (company_id, store_id)
values (491794, 2362984114);
insert into SUPPLIES (company_id, store_id)
values (659073, 43859418);
insert into SUPPLIES (company_id, store_id)
values (653216, 9560385514);
insert into SUPPLIES (company_id, store_id)
values (914579, 9215297133);
insert into SUPPLIES (company_id, store_id)
values (290983, 5882221317);
insert into SUPPLIES (company_id, store_id)
values (961642, 7873678207);
insert into SUPPLIES (company_id, store_id)
values (366070, 4382214167);
insert into SUPPLIES (company_id, store_id)
values (518248, 4193257857);
insert into SUPPLIES (company_id, store_id)
values (466659, 8978310700);
insert into SUPPLIES (company_id, store_id)
values (880502, 3532193164);
insert into SUPPLIES (company_id, store_id)
values (464893, 5755503158);
insert into SUPPLIES (company_id, store_id)
values (154459, 6213785118);
insert into SUPPLIES (company_id, store_id)
values (904529, 6606838009);
insert into SUPPLIES (company_id, store_id)
values (102950, 9947274359);
insert into SUPPLIES (company_id, store_id)
values (474785, 4993512060);
insert into SUPPLIES (company_id, store_id)
values (226775, 6954833971);
insert into SUPPLIES (company_id, store_id)
values (217990, 1627572129);
insert into SUPPLIES (company_id, store_id)
values (717643, 7159771341);
insert into SUPPLIES (company_id, store_id)
values (891570, 7934300986);
insert into SUPPLIES (company_id, store_id)
values (394537, 1009400256);
insert into SUPPLIES (company_id, store_id)
values (706319, 3432086456);
insert into SUPPLIES (company_id, store_id)
values (897337, 4840843889);
insert into SUPPLIES (company_id, store_id)
values (293540, 8057578690);
insert into SUPPLIES (company_id, store_id)
values (774157, 1394366144);
insert into SUPPLIES (company_id, store_id)
values (976760, 2195427266);
insert into SUPPLIES (company_id, store_id)
values (299674, 711915037);
insert into SUPPLIES (company_id, store_id)
values (337426, 9851046040);
insert into SUPPLIES (company_id, store_id)
values (996972, 4068531670);
insert into SUPPLIES (company_id, store_id)
values (528204, 4532819678);
insert into SUPPLIES (company_id, store_id)
values (569968, 9542897224);
insert into SUPPLIES (company_id, store_id)
values (851759, 3312919799);
insert into SUPPLIES (company_id, store_id)
values (888058, 1711577649);
insert into SUPPLIES (company_id, store_id)
values (780947, 9018685179);
insert into SUPPLIES (company_id, store_id)
values (370213, 6064937749);
insert into SUPPLIES (company_id, store_id)
values (949816, 900082013);
insert into SUPPLIES (company_id, store_id)
values (969562, 2073504657);
insert into SUPPLIES (company_id, store_id)
values (362524, 5773732563);
insert into SUPPLIES (company_id, store_id)
values (756451, 8527911504);
insert into SUPPLIES (company_id, store_id)
values (758458, 3472501279);
insert into SUPPLIES (company_id, store_id)
values (937171, 8494880937);
insert into SUPPLIES (company_id, store_id)
values (840550, 7162438431);
insert into SUPPLIES (company_id, store_id)
values (472841, 3295113117);
insert into SUPPLIES (company_id, store_id)
values (766704, 8763912363);
insert into SUPPLIES (company_id, store_id)
values (387901, 8014422314);
insert into SUPPLIES (company_id, store_id)
values (914553, 8828866526);
insert into SUPPLIES (company_id, store_id)
values (188026, 44779413);
insert into SUPPLIES (company_id, store_id)
values (611466, 560519940);
insert into SUPPLIES (company_id, store_id)
values (903261, 1126661700);
insert into SUPPLIES (company_id, store_id)
values (154618, 7689428194);
insert into SUPPLIES (company_id, store_id)
values (173066, 5094140215);
insert into SUPPLIES (company_id, store_id)
values (413629, 9422744030);
insert into SUPPLIES (company_id, store_id)
values (795523, 7856772511);
insert into SUPPLIES (company_id, store_id)
values (599908, 2635359704);
insert into SUPPLIES (company_id, store_id)
values (737743, 1434253358);
insert into SUPPLIES (company_id, store_id)
values (304657, 198493237);
insert into SUPPLIES (company_id, store_id)
values (574042, 7752406588);
insert into SUPPLIES (company_id, store_id)
values (267262, 9709423948);
insert into SUPPLIES (company_id, store_id)
values (444896, 9792008952);
insert into SUPPLIES (company_id, store_id)
values (358895, 9427109086);
insert into SUPPLIES (company_id, store_id)
values (540808, 4456118071);
commit;
prompt 100 records committed...
insert into SUPPLIES (company_id, store_id)
values (142586, 7732712269);
insert into SUPPLIES (company_id, store_id)
values (759357, 9862505986);
insert into SUPPLIES (company_id, store_id)
values (127323, 7001159921);
insert into SUPPLIES (company_id, store_id)
values (936352, 3490649377);
insert into SUPPLIES (company_id, store_id)
values (659492, 4314102466);
insert into SUPPLIES (company_id, store_id)
values (730512, 415522799);
insert into SUPPLIES (company_id, store_id)
values (536781, 9603944310);
insert into SUPPLIES (company_id, store_id)
values (653673, 8250848739);
insert into SUPPLIES (company_id, store_id)
values (803435, 2863308060);
insert into SUPPLIES (company_id, store_id)
values (706700, 3199368328);
insert into SUPPLIES (company_id, store_id)
values (793799, 4549105621);
insert into SUPPLIES (company_id, store_id)
values (585005, 9398613622);
insert into SUPPLIES (company_id, store_id)
values (712051, 112043827);
insert into SUPPLIES (company_id, store_id)
values (732248, 6484335275);
insert into SUPPLIES (company_id, store_id)
values (128122, 8772493343);
insert into SUPPLIES (company_id, store_id)
values (433325, 9718088970);
insert into SUPPLIES (company_id, store_id)
values (765402, 3692035034);
insert into SUPPLIES (company_id, store_id)
values (288228, 131447274);
insert into SUPPLIES (company_id, store_id)
values (525553, 7442771353);
insert into SUPPLIES (company_id, store_id)
values (577314, 1649583078);
insert into SUPPLIES (company_id, store_id)
values (539340, 1245195236);
insert into SUPPLIES (company_id, store_id)
values (111710, 1695723512);
insert into SUPPLIES (company_id, store_id)
values (688945, 9010351513);
insert into SUPPLIES (company_id, store_id)
values (782335, 9726857902);
insert into SUPPLIES (company_id, store_id)
values (320561, 4682958986);
insert into SUPPLIES (company_id, store_id)
values (573105, 3079312747);
insert into SUPPLIES (company_id, store_id)
values (103295, 6958849171);
insert into SUPPLIES (company_id, store_id)
values (249582, 4237643702);
insert into SUPPLIES (company_id, store_id)
values (934531, 5220721040);
insert into SUPPLIES (company_id, store_id)
values (992140, 2197776850);
insert into SUPPLIES (company_id, store_id)
values (362308, 1674658590);
insert into SUPPLIES (company_id, store_id)
values (734519, 4399125649);
insert into SUPPLIES (company_id, store_id)
values (146872, 1281019521);
insert into SUPPLIES (company_id, store_id)
values (878515, 4732946988);
insert into SUPPLIES (company_id, store_id)
values (429568, 373156598);
insert into SUPPLIES (company_id, store_id)
values (978762, 6245206047);
insert into SUPPLIES (company_id, store_id)
values (754902, 3130013219);
insert into SUPPLIES (company_id, store_id)
values (764883, 9126746616);
insert into SUPPLIES (company_id, store_id)
values (846010, 8283282713);
insert into SUPPLIES (company_id, store_id)
values (295067, 9676309403);
insert into SUPPLIES (company_id, store_id)
values (102799, 7094245914);
insert into SUPPLIES (company_id, store_id)
values (768879, 6406506193);
insert into SUPPLIES (company_id, store_id)
values (352111, 8870701376);
insert into SUPPLIES (company_id, store_id)
values (161731, 663483986);
insert into SUPPLIES (company_id, store_id)
values (165338, 3048079767);
insert into SUPPLIES (company_id, store_id)
values (720375, 1015657414);
insert into SUPPLIES (company_id, store_id)
values (264639, 1489063880);
insert into SUPPLIES (company_id, store_id)
values (672104, 362072609);
insert into SUPPLIES (company_id, store_id)
values (705747, 5739282429);
insert into SUPPLIES (company_id, store_id)
values (258870, 8357509128);
insert into SUPPLIES (company_id, store_id)
values (818835, 4798387437);
insert into SUPPLIES (company_id, store_id)
values (728100, 7717664071);
insert into SUPPLIES (company_id, store_id)
values (979383, 9456089279);
insert into SUPPLIES (company_id, store_id)
values (371593, 5281120135);
insert into SUPPLIES (company_id, store_id)
values (238854, 7405919321);
insert into SUPPLIES (company_id, store_id)
values (309700, 6517710118);
insert into SUPPLIES (company_id, store_id)
values (328704, 5986847282);
insert into SUPPLIES (company_id, store_id)
values (967143, 9139855618);
insert into SUPPLIES (company_id, store_id)
values (286769, 8171193171);
insert into SUPPLIES (company_id, store_id)
values (596991, 4942167703);
insert into SUPPLIES (company_id, store_id)
values (389363, 1925464105);
insert into SUPPLIES (company_id, store_id)
values (764186, 3105156743);
insert into SUPPLIES (company_id, store_id)
values (415089, 5137393457);
insert into SUPPLIES (company_id, store_id)
values (330576, 3671015115);
insert into SUPPLIES (company_id, store_id)
values (884471, 2378580045);
insert into SUPPLIES (company_id, store_id)
values (196742, 4615379066);
insert into SUPPLIES (company_id, store_id)
values (934963, 1867855029);
insert into SUPPLIES (company_id, store_id)
values (399335, 9691746383);
insert into SUPPLIES (company_id, store_id)
values (122152, 2828855385);
insert into SUPPLIES (company_id, store_id)
values (251203, 9662472323);
insert into SUPPLIES (company_id, store_id)
values (233447, 9719981141);
insert into SUPPLIES (company_id, store_id)
values (653514, 7183055861);
insert into SUPPLIES (company_id, store_id)
values (866245, 2300617388);
insert into SUPPLIES (company_id, store_id)
values (711629, 7419201939);
insert into SUPPLIES (company_id, store_id)
values (891266, 845393956);
insert into SUPPLIES (company_id, store_id)
values (621996, 2505310704);
insert into SUPPLIES (company_id, store_id)
values (303019, 2255353139);
insert into SUPPLIES (company_id, store_id)
values (933010, 803486996);
insert into SUPPLIES (company_id, store_id)
values (143850, 3855948706);
insert into SUPPLIES (company_id, store_id)
values (207299, 188126018);
insert into SUPPLIES (company_id, store_id)
values (335000, 298592433);
insert into SUPPLIES (company_id, store_id)
values (827718, 8951937158);
insert into SUPPLIES (company_id, store_id)
values (878400, 1726567562);
insert into SUPPLIES (company_id, store_id)
values (214746, 9929535518);
insert into SUPPLIES (company_id, store_id)
values (599940, 1234693204);
insert into SUPPLIES (company_id, store_id)
values (530283, 6224217074);
insert into SUPPLIES (company_id, store_id)
values (442131, 4743275322);
insert into SUPPLIES (company_id, store_id)
values (849782, 1330820784);
insert into SUPPLIES (company_id, store_id)
values (305632, 7194272436);
insert into SUPPLIES (company_id, store_id)
values (659229, 8981396378);
insert into SUPPLIES (company_id, store_id)
values (831697, 591700657);
insert into SUPPLIES (company_id, store_id)
values (711474, 1310384304);
insert into SUPPLIES (company_id, store_id)
values (949691, 2437887388);
insert into SUPPLIES (company_id, store_id)
values (475805, 8356241074);
insert into SUPPLIES (company_id, store_id)
values (916979, 4711622117);
insert into SUPPLIES (company_id, store_id)
values (187878, 3166073625);
insert into SUPPLIES (company_id, store_id)
values (728989, 4740632252);
insert into SUPPLIES (company_id, store_id)
values (344353, 272314523);
insert into SUPPLIES (company_id, store_id)
values (575635, 2853209284);
insert into SUPPLIES (company_id, store_id)
values (463089, 6996515713);
commit;
prompt 200 records committed...
insert into SUPPLIES (company_id, store_id)
values (975640, 3006393424);
insert into SUPPLIES (company_id, store_id)
values (713511, 3462661594);
insert into SUPPLIES (company_id, store_id)
values (469100, 3780928275);
insert into SUPPLIES (company_id, store_id)
values (375930, 8935672982);
insert into SUPPLIES (company_id, store_id)
values (562628, 1985703929);
insert into SUPPLIES (company_id, store_id)
values (777373, 6737760058);
insert into SUPPLIES (company_id, store_id)
values (703871, 3469925177);
insert into SUPPLIES (company_id, store_id)
values (778697, 6140354405);
insert into SUPPLIES (company_id, store_id)
values (790484, 3039337505);
insert into SUPPLIES (company_id, store_id)
values (518316, 1341843981);
insert into SUPPLIES (company_id, store_id)
values (107803, 9055110599);
insert into SUPPLIES (company_id, store_id)
values (375773, 8889599837);
insert into SUPPLIES (company_id, store_id)
values (807639, 4336329790);
insert into SUPPLIES (company_id, store_id)
values (237549, 4440812047);
insert into SUPPLIES (company_id, store_id)
values (841322, 6961077817);
insert into SUPPLIES (company_id, store_id)
values (873725, 9197008138);
insert into SUPPLIES (company_id, store_id)
values (140250, 3824071590);
insert into SUPPLIES (company_id, store_id)
values (134885, 8734165994);
insert into SUPPLIES (company_id, store_id)
values (844889, 3103587291);
insert into SUPPLIES (company_id, store_id)
values (157210, 6310702033);
insert into SUPPLIES (company_id, store_id)
values (369709, 28008819);
insert into SUPPLIES (company_id, store_id)
values (356144, 3561117427);
insert into SUPPLIES (company_id, store_id)
values (917132, 9933450947);
insert into SUPPLIES (company_id, store_id)
values (988842, 4054632455);
insert into SUPPLIES (company_id, store_id)
values (359634, 6247731793);
insert into SUPPLIES (company_id, store_id)
values (510324, 7551884229);
insert into SUPPLIES (company_id, store_id)
values (910971, 525402490);
insert into SUPPLIES (company_id, store_id)
values (985015, 1630047150);
insert into SUPPLIES (company_id, store_id)
values (722483, 1962143604);
insert into SUPPLIES (company_id, store_id)
values (416792, 2366342534);
insert into SUPPLIES (company_id, store_id)
values (189352, 2314952425);
insert into SUPPLIES (company_id, store_id)
values (177739, 9322452254);
insert into SUPPLIES (company_id, store_id)
values (220223, 5172408020);
insert into SUPPLIES (company_id, store_id)
values (126717, 6559900244);
insert into SUPPLIES (company_id, store_id)
values (427035, 3975703508);
insert into SUPPLIES (company_id, store_id)
values (883539, 5499267131);
insert into SUPPLIES (company_id, store_id)
values (224818, 3329377019);
insert into SUPPLIES (company_id, store_id)
values (136018, 1485190959);
insert into SUPPLIES (company_id, store_id)
values (528862, 2191549381);
insert into SUPPLIES (company_id, store_id)
values (467904, 3519532740);
insert into SUPPLIES (company_id, store_id)
values (198556, 3749590920);
insert into SUPPLIES (company_id, store_id)
values (595915, 8640946841);
insert into SUPPLIES (company_id, store_id)
values (388265, 5355522402);
insert into SUPPLIES (company_id, store_id)
values (473182, 799358136);
insert into SUPPLIES (company_id, store_id)
values (515680, 8272317810);
insert into SUPPLIES (company_id, store_id)
values (485562, 1438361279);
insert into SUPPLIES (company_id, store_id)
values (756963, 9005316961);
insert into SUPPLIES (company_id, store_id)
values (318440, 2759393);
insert into SUPPLIES (company_id, store_id)
values (625400, 4594720156);
insert into SUPPLIES (company_id, store_id)
values (629210, 2893899139);
insert into SUPPLIES (company_id, store_id)
values (801194, 9470876840);
insert into SUPPLIES (company_id, store_id)
values (694637, 5247882929);
insert into SUPPLIES (company_id, store_id)
values (417309, 3087552079);
insert into SUPPLIES (company_id, store_id)
values (241200, 4470308572);
insert into SUPPLIES (company_id, store_id)
values (556238, 3380981990);
insert into SUPPLIES (company_id, store_id)
values (146614, 7824424657);
insert into SUPPLIES (company_id, store_id)
values (102412, 6586650711);
insert into SUPPLIES (company_id, store_id)
values (830156, 3497285055);
insert into SUPPLIES (company_id, store_id)
values (189118, 7404015917);
insert into SUPPLIES (company_id, store_id)
values (879931, 7468990299);
insert into SUPPLIES (company_id, store_id)
values (573003, 6942159379);
insert into SUPPLIES (company_id, store_id)
values (143082, 6568010629);
insert into SUPPLIES (company_id, store_id)
values (379050, 4081165844);
insert into SUPPLIES (company_id, store_id)
values (585434, 6361451930);
insert into SUPPLIES (company_id, store_id)
values (375067, 7706462827);
insert into SUPPLIES (company_id, store_id)
values (359030, 4035042798);
insert into SUPPLIES (company_id, store_id)
values (352413, 3012025231);
insert into SUPPLIES (company_id, store_id)
values (315666, 7449507055);
insert into SUPPLIES (company_id, store_id)
values (295308, 3910656292);
insert into SUPPLIES (company_id, store_id)
values (681999, 2023192352);
insert into SUPPLIES (company_id, store_id)
values (738308, 4196055991);
insert into SUPPLIES (company_id, store_id)
values (658633, 2126843023);
insert into SUPPLIES (company_id, store_id)
values (524906, 7703434216);
insert into SUPPLIES (company_id, store_id)
values (153254, 5740985568);
insert into SUPPLIES (company_id, store_id)
values (676756, 3756708831);
insert into SUPPLIES (company_id, store_id)
values (907073, 353622213);
insert into SUPPLIES (company_id, store_id)
values (911536, 167134478);
insert into SUPPLIES (company_id, store_id)
values (455682, 5468834990);
insert into SUPPLIES (company_id, store_id)
values (723943, 6042288054);
insert into SUPPLIES (company_id, store_id)
values (483074, 4092892706);
insert into SUPPLIES (company_id, store_id)
values (964472, 2864156706);
insert into SUPPLIES (company_id, store_id)
values (136522, 1261413139);
insert into SUPPLIES (company_id, store_id)
values (812574, 5025045083);
insert into SUPPLIES (company_id, store_id)
values (222284, 8367450085);
insert into SUPPLIES (company_id, store_id)
values (288206, 850149958);
insert into SUPPLIES (company_id, store_id)
values (690901, 2864089839);
insert into SUPPLIES (company_id, store_id)
values (843774, 5442740858);
insert into SUPPLIES (company_id, store_id)
values (737457, 8887758405);
insert into SUPPLIES (company_id, store_id)
values (526676, 3201043602);
insert into SUPPLIES (company_id, store_id)
values (957368, 5038905616);
insert into SUPPLIES (company_id, store_id)
values (246227, 1129019389);
insert into SUPPLIES (company_id, store_id)
values (524309, 2746852182);
insert into SUPPLIES (company_id, store_id)
values (652421, 9478531595);
insert into SUPPLIES (company_id, store_id)
values (667423, 6308448206);
insert into SUPPLIES (company_id, store_id)
values (754612, 6649963460);
insert into SUPPLIES (company_id, store_id)
values (635306, 9144536098);
insert into SUPPLIES (company_id, store_id)
values (810711, 3746821747);
insert into SUPPLIES (company_id, store_id)
values (884946, 754274858);
insert into SUPPLIES (company_id, store_id)
values (636026, 1007528486);
insert into SUPPLIES (company_id, store_id)
values (953372, 5114987385);
commit;
prompt 300 records committed...
insert into SUPPLIES (company_id, store_id)
values (230529, 2740526322);
insert into SUPPLIES (company_id, store_id)
values (355134, 1697357799);
insert into SUPPLIES (company_id, store_id)
values (509699, 6491145944);
insert into SUPPLIES (company_id, store_id)
values (576239, 4034737735);
insert into SUPPLIES (company_id, store_id)
values (732871, 3578687032);
insert into SUPPLIES (company_id, store_id)
values (502119, 167476784);
insert into SUPPLIES (company_id, store_id)
values (484849, 2771095897);
insert into SUPPLIES (company_id, store_id)
values (234806, 9353106044);
insert into SUPPLIES (company_id, store_id)
values (354355, 9933939684);
insert into SUPPLIES (company_id, store_id)
values (347273, 260155129);
insert into SUPPLIES (company_id, store_id)
values (619896, 9098809595);
insert into SUPPLIES (company_id, store_id)
values (443922, 1292917045);
insert into SUPPLIES (company_id, store_id)
values (255638, 1493446177);
insert into SUPPLIES (company_id, store_id)
values (320010, 8367317858);
insert into SUPPLIES (company_id, store_id)
values (362220, 8920688122);
insert into SUPPLIES (company_id, store_id)
values (293113, 3466456849);
insert into SUPPLIES (company_id, store_id)
values (339228, 5896707556);
insert into SUPPLIES (company_id, store_id)
values (799402, 1236262640);
insert into SUPPLIES (company_id, store_id)
values (942713, 8928426488);
insert into SUPPLIES (company_id, store_id)
values (584594, 6414717976);
insert into SUPPLIES (company_id, store_id)
values (652389, 9271702664);
insert into SUPPLIES (company_id, store_id)
values (133266, 9774061637);
insert into SUPPLIES (company_id, store_id)
values (957508, 9195231798);
insert into SUPPLIES (company_id, store_id)
values (245601, 7597390758);
insert into SUPPLIES (company_id, store_id)
values (947405, 3790288824);
insert into SUPPLIES (company_id, store_id)
values (934288, 577535758);
insert into SUPPLIES (company_id, store_id)
values (259808, 8840679769);
insert into SUPPLIES (company_id, store_id)
values (845751, 3251223333);
insert into SUPPLIES (company_id, store_id)
values (675098, 617915992);
insert into SUPPLIES (company_id, store_id)
values (166526, 2081070241);
insert into SUPPLIES (company_id, store_id)
values (442497, 5903693783);
insert into SUPPLIES (company_id, store_id)
values (519742, 4340842495);
insert into SUPPLIES (company_id, store_id)
values (206468, 1556576479);
insert into SUPPLIES (company_id, store_id)
values (993284, 5276367047);
insert into SUPPLIES (company_id, store_id)
values (559041, 1488574064);
insert into SUPPLIES (company_id, store_id)
values (528287, 3023914742);
insert into SUPPLIES (company_id, store_id)
values (922534, 3305391502);
insert into SUPPLIES (company_id, store_id)
values (718919, 1770851029);
insert into SUPPLIES (company_id, store_id)
values (257597, 1368073561);
insert into SUPPLIES (company_id, store_id)
values (301206, 3799577075);
insert into SUPPLIES (company_id, store_id)
values (541256, 208465955);
insert into SUPPLIES (company_id, store_id)
values (874780, 839667416);
insert into SUPPLIES (company_id, store_id)
values (359198, 4613136344);
insert into SUPPLIES (company_id, store_id)
values (506400, 7058052664);
insert into SUPPLIES (company_id, store_id)
values (354580, 1777614297);
insert into SUPPLIES (company_id, store_id)
values (765169, 9067753838);
insert into SUPPLIES (company_id, store_id)
values (909899, 6336812574);
insert into SUPPLIES (company_id, store_id)
values (171309, 209254136);
insert into SUPPLIES (company_id, store_id)
values (648923, 7268923610);
insert into SUPPLIES (company_id, store_id)
values (770372, 2126725238);
insert into SUPPLIES (company_id, store_id)
values (267947, 900496394);
insert into SUPPLIES (company_id, store_id)
values (127488, 6537827757);
insert into SUPPLIES (company_id, store_id)
values (454847, 8781434597);
insert into SUPPLIES (company_id, store_id)
values (990532, 128193586);
insert into SUPPLIES (company_id, store_id)
values (106613, 2619360974);
insert into SUPPLIES (company_id, store_id)
values (195760, 9893338138);
insert into SUPPLIES (company_id, store_id)
values (671136, 9975891720);
insert into SUPPLIES (company_id, store_id)
values (787979, 9431365316);
insert into SUPPLIES (company_id, store_id)
values (647597, 8746782320);
insert into SUPPLIES (company_id, store_id)
values (309897, 9974190274);
insert into SUPPLIES (company_id, store_id)
values (836345, 8967262439);
insert into SUPPLIES (company_id, store_id)
values (691010, 7605192682);
insert into SUPPLIES (company_id, store_id)
values (120778, 479735255);
insert into SUPPLIES (company_id, store_id)
values (591527, 1457671959);
insert into SUPPLIES (company_id, store_id)
values (990890, 1632587230);
insert into SUPPLIES (company_id, store_id)
values (987789, 7712522193);
insert into SUPPLIES (company_id, store_id)
values (328041, 2650179284);
insert into SUPPLIES (company_id, store_id)
values (145155, 6317605166);
insert into SUPPLIES (company_id, store_id)
values (575252, 7163319710);
insert into SUPPLIES (company_id, store_id)
values (671990, 3213318404);
insert into SUPPLIES (company_id, store_id)
values (724069, 5176914888);
insert into SUPPLIES (company_id, store_id)
values (934583, 8959262012);
insert into SUPPLIES (company_id, store_id)
values (504234, 2160440590);
insert into SUPPLIES (company_id, store_id)
values (386877, 6226352815);
insert into SUPPLIES (company_id, store_id)
values (336683, 3106691424);
insert into SUPPLIES (company_id, store_id)
values (647814, 7455337253);
insert into SUPPLIES (company_id, store_id)
values (201649, 5150734028);
insert into SUPPLIES (company_id, store_id)
values (401716, 4046490551);
insert into SUPPLIES (company_id, store_id)
values (918505, 3686348545);
insert into SUPPLIES (company_id, store_id)
values (968359, 7207154142);
insert into SUPPLIES (company_id, store_id)
values (169308, 9832737195);
insert into SUPPLIES (company_id, store_id)
values (160748, 8679296847);
insert into SUPPLIES (company_id, store_id)
values (195334, 4024776489);
insert into SUPPLIES (company_id, store_id)
values (251729, 6784021008);
insert into SUPPLIES (company_id, store_id)
values (952724, 1217704657);
insert into SUPPLIES (company_id, store_id)
values (879526, 1625879836);
insert into SUPPLIES (company_id, store_id)
values (595057, 2089357011);
insert into SUPPLIES (company_id, store_id)
values (284202, 6810415683);
insert into SUPPLIES (company_id, store_id)
values (838771, 3686259046);
insert into SUPPLIES (company_id, store_id)
values (890546, 7952258665);
insert into SUPPLIES (company_id, store_id)
values (210508, 5066853243);
insert into SUPPLIES (company_id, store_id)
values (442019, 546285283);
insert into SUPPLIES (company_id, store_id)
values (888797, 4584810996);
insert into SUPPLIES (company_id, store_id)
values (473993, 7148321307);
insert into SUPPLIES (company_id, store_id)
values (925759, 9623978107);
insert into SUPPLIES (company_id, store_id)
values (649517, 2480992828);
insert into SUPPLIES (company_id, store_id)
values (163939, 265482596);
insert into SUPPLIES (company_id, store_id)
values (366418, 2313663892);
insert into SUPPLIES (company_id, store_id)
values (574469, 1836771829);
insert into SUPPLIES (company_id, store_id)
values (237629, 3609675609);
commit;
prompt 400 records loaded
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
values ('shoes', 'XL', 9726764684, 'B');
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
values ('pants', 'S', 6306204823, 'A');
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
values ('belt', 'L', 645407922, 'B');
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
values ('pants', 'XXL', 3641201795, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'S', 422483010, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 6014854779, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'M', 230008394, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'L', 641561064, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XXL', 2751141724, 'B');
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
values ('belt', 'S', 2549303948, 'A');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('Shirt', 'XS', 8941236223, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XL', 2272506156, 'A');
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
values ('Shirt', 'XXL', 8436946271, 'B');
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
commit;
prompt 100 records committed...
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
values ('Shirt', 'M', 5023198951, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('shoes', 'S', 7427208123, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('belt', 'XS', 3702815764, 'B');
insert into UNIFORM (uniform_type, uniform_size, serial_number, officiality)
values ('pants', 'XS', 8545467179, 'A');
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
values ('shoes', 'S', 7067267583, 'B');
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
values ('pants', 'M', 1235292391, 'B');
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
values ('belt', 'S', 2507653405, 'A');
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
values ('belt', 'L', 3638226067, 'A');
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
values ('belt', 'S', 9572959789, 'A');
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
prompt 200 records loaded
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
values ('Til', 49.43, 3163000447, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 67.65, 1988266166, 4);
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
values ('Makle''a', 47.64, 9848509232, 8);
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
values ('Roveh', 31.04, 2052756423, 10);
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
values ('Til', 87.98, 201481553, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 85.79, 1503426516, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 31.99, 860388597, 6);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 30.73, 5765653102, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 17.04, 3512221536, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 6.32, 655266610, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 36.79, 9232725334, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Roveh', 20.38, 1415593509, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 53.36, 3209891703, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 12.37, 5851355145, 2);
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
values ('Roveh', 49.84, 8163829791, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 97.08, 3390750082, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 97.84, 4457245265, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 38.67, 4849937660, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 7.53, 8899279252, 4);
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
values ('Artillerya', 19.45, 8343971343, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 98.44, 543820185, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 85.89, 2838153407, 3);
commit;
prompt 100 records committed...
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
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 67.75, 3325538218, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 96.24, 4495799564, 5);
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
values ('RovehTzalafim', 39.19, 8340853932, 10);
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
values ('Roveh', 84.74, 5386635504, 7);
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
values ('Til', 7.84, 8848122298, 7);
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
values ('Roveh', 24.83, 5465795150, 10);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 22.91, 8655033031, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Til', 57.27, 5452670529, 7);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 2.09, 3050012091, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 14.58, 798188194, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 25.33, 6941805533, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 77.98, 2750118238, 3);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('MashgerRimonim', 4.47, 8897890075, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 86.08, 8758416804, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzalafim', 47.23, 1372061954, 4);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Artillerya', 98.27, 878905313, 8);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Makle''a', 10.4, 4114272739, 7);
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
values ('Til', 37.33, 9201709199, 5);
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
values ('RovehTzayid', 1.76, 5577018152, 5);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('RovehTzayid', 62.61, 1943603908, 1);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('Ekdach', 7.15, 3876469407, 9);
insert into WEAPON (weapon_type, weight, serial_number, reliability)
values ('TatMakle''a', 72.77, 2591365316, 8);
commit;
prompt 200 records loaded
prompt Enabling foreign key constraints for ITEM...
alter table ITEM enable constraint SYS_C009535;
prompt Enabling foreign key constraints for OWNS...
alter table OWNS enable constraint SYS_C009566;
alter table OWNS enable constraint SYS_C009567;
prompt Enabling foreign key constraints for STOREMAN...
alter table STOREMAN enable constraint SYS_C009546;
alter table STOREMAN enable constraint SYS_C009547;
prompt Enabling foreign key constraints for SUPPLIES...
alter table SUPPLIES enable constraint SYS_C009571;
alter table SUPPLIES enable constraint SYS_C009572;
prompt Enabling foreign key constraints for UNIFORM...
alter table UNIFORM enable constraint SYS_C009562;
prompt Enabling foreign key constraints for WEAPON...
alter table WEAPON enable constraint SYS_C009557;
prompt Enabling triggers for STORES...
alter table STORES enable all triggers;
prompt Enabling triggers for ITEM...
alter table ITEM enable all triggers;
prompt Enabling triggers for SOLDIER...
alter table SOLDIER enable all triggers;
prompt Enabling triggers for OWNS...
alter table OWNS enable all triggers;
prompt Enabling triggers for STOREMAN...
alter table STOREMAN enable all triggers;
prompt Enabling triggers for SUPPLIER...
alter table SUPPLIER enable all triggers;
prompt Enabling triggers for SUPPLIES...
alter table SUPPLIES enable all triggers;
prompt Enabling triggers for UNIFORM...
alter table UNIFORM enable all triggers;
prompt Enabling triggers for WEAPON...
alter table WEAPON enable all triggers;

set feedback on
set define on
prompt Done
