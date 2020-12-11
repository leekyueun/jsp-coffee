CREATE TABLE TBL_PRODUCT_01 (
    PCODE VARCHAR2(10) NOT NULL,
    NAME VARCHAR2(20),
    COST NUMBER(10),
    CONSTRAINT PK_PRODUCT PRIMARY KEY (PCODE)
);

CREATE TABLE TBL_SHOP_01 (
    SCODE VARCHAR2(10) NOT NULL,
    SNAME VARCHAR2(20),
    CONSTRAINT PK_SHOP PRIMARY KEY (SCODE)
);

CREATE TABLE TBL_SALELIST_01 (
    SALENO NUMBER(10) NOT NULL,
    PCODE VARCHAR2(10) NOT NULL,
    SALEDATE DATE,
    SCODE VARCHAR2(10) NOT NULL,
    AMOUNT NUMBER(10),
    CONSTRAINT PK_SALELIST PRIMARY KEY (SALENO)
);

insert into tbl_product_01 values ( 'AA01', '아메리카노', 3000)
insert into tbl_product_01 values ( 'AA02', '에스프레소', 3500)
insert into tbl_product_01 values ( 'AA03', '카페라떼', 4000)
insert into tbl_product_01 values ( 'AA04', '카라멜마끼', 4500)
insert into tbl_product_01 values ( 'AA05', '카푸치노', 5000)
insert into tbl_product_01 values ( 'AA06', '초코롤케익', 6000)
insert into tbl_product_01 values ( 'AA07', '녹차롤케익', 6500)
insert into tbl_product_01 values ( 'AA08', '망고쥬스', 7000)
insert into tbl_product_01 values ( 'AA09', '핫초코', 2500)


insert into tbl_shop_01 values ( 'S001', '강남점')
insert into tbl_shop_01 values ( 'S002', '강서점')
insert into tbl_shop_01 values ( 'S003', '강동점')
insert into tbl_shop_01 values ( 'S004', '강북점')
insert into tbl_shop_01 values ( 'S005', '동대문점')
insert into tbl_shop_01 values ( 'S006', '인천점')


insert into tbl_salelist_01 values ( '100001', 'AA01', '20180902', 'S001', 50)
insert into tbl_salelist_01 values ( '100002', 'AA03', '20180902', 'S002', 40)
insert into tbl_salelist_01 values ( '100003', 'AA04', '20180902', 'S002', 20)
insert into tbl_salelist_01 values ( '100004', 'AA04', '20180902', 'S001', 30)
insert into tbl_salelist_01 values ( '100005', 'AA05', '20180902', 'S004', 40)
insert into tbl_salelist_01 values ( '100006', 'AA03', '20180902', 'S004', 30)
insert into tbl_salelist_01 values ( '100007', 'AA01', '20180902', 'S003', 40)
insert into tbl_salelist_01 values ( '100008', 'AA04', '20180902', 'S004', 10)
insert into tbl_salelist_01 values ( '100009', 'AA01', '20180902', 'S003', 20)
insert into tbl_salelist_01 values ( '100010', 'A005', '20180902', 'S003', 30)
insert into tbl_salelist_01 values ( '100011', 'AA01', '20180902', 'S001', 40)
insert into tbl_salelist_01 values ( '100012', 'AA03', '20180902', 'S002', 50)
insert into tbl_salelist_01 values ( '100013', 'AA04', '20180902', 'S002', 50)
insert into tbl_salelist_01 values ( '100014', 'AA05', '20180902', 'S004', 20)
insert into tbl_salelist_01 values ( '100015', 'AA01', '20180902', 'S003', 30)
