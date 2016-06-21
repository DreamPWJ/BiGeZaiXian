ALTER TABLE "RJDS"."REC_ORDER_GOOD" RENAME COLUMN "PRICEPER" TO "PRICENOTAX";

ALTER TABLE "RJDS"."REC_ORDER_GOOD" RENAME COLUMN "PRICETAXPER" TO "PRICEHASTAX";

ALTER TABLE "RJDS"."REC_ORDER_GOOD"
MODIFY ( "PAYCODE" VARCHAR2(30 BYTE) NULL  ) ;
ALTER TABLE "RJDS"."REC_ORDER_GOOD" DROP("PRICE");

--修改价格变动表
alter table rec_price drop constraints FK_REC_PRIC_REFERENCE_REC_STOC
alter table rec_price drop column stockdetid

alter table rec_price add stockid number(10) not null

alter table rec_price add constraints FK_REC_PRIC_REC_STOCK  foreign key(stockid) references rec_stock(id)

