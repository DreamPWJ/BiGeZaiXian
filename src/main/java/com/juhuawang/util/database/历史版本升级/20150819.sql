--库存明细_订单商品表添加三个字段，来自库存明细表，库存流水表删除
ALTER TABLE "RJDS"."REC_STOCKDET_ORDERGOOD"
ADD ( "STOCKCODE" VARCHAR2(30) NULL  )
ADD ( "NUMBER" NUMBER(19,3) NULL  )
ADD ( "AFFIRMNUMBER" NUMBER(19,3) NULL  ) ;
COMMENT ON COLUMN "RJDS"."REC_STOCKDET_ORDERGOOD"."STOCKCODE" IS '库存类型code';
COMMENT ON COLUMN "RJDS"."REC_STOCKDET_ORDERGOOD"."NUMBER" IS '数量';
COMMENT ON COLUMN "RJDS"."REC_STOCKDET_ORDERGOOD"."AFFIRMNUMBER" IS '确认数量';

--库存明细表修改
ALTER TABLE "RJDS"."REC_STOCKDET"
ADD ( "INITNUM" NUMBER(19,3) NULL  )
ADD ( "SURPLUSNUM" NUMBER(19,3) NULL  ) ;
COMMENT ON COLUMN "RJDS"."REC_STOCKDET"."INITNUM" IS '初始数量';
COMMENT ON COLUMN "RJDS"."REC_STOCKDET"."SURPLUSNUM" IS '剩余数量';
ALTER TABLE "RJDS"."REC_STOCKDET" DROP("STOCKCODE", "NUM", "PAYCODE", "PRICE", "RATE", "TAXMONEY","FINALMONEY", "FAREID", "MEMO2", "MEMO3", "MEMO4", "MEMO5");

--订单_商品表添加三个字段，来自库存流水表，库存流水表删除
ALTER TABLE "RJDS"."REC_ORDER_GOOD"
ADD ( "PAYWAYCODE" VARCHAR2(30) NULL  )
ADD ( "UNITPRICE" NUMBER(19,2) NULL  )
ADD ( "PRICETAX" NUMBER(19,2) NULL  ) ;
COMMENT ON COLUMN "RJDS"."REC_ORDER_GOOD"."PAYWAYCODE" IS '支付方式code';
COMMENT ON COLUMN "RJDS"."REC_ORDER_GOOD"."UNITPRICE" IS '单价';
COMMENT ON COLUMN "RJDS"."REC_ORDER_GOOD"."PRICETAX" IS '价税合计';

--提货申请_订单商品表添加七个字段，其中四个字段：仓库ID、收货地址ID、运费价格标准ID、配送code来自提货申请记录，其余三个为新增字段
ALTER TABLE "RJDS"."REC_GOODAPPLY_ORDERGOOD"
ADD ( "STORAGEID" NUMBER(10) NULL  )
ADD ( "ADDRESSID" NUMBER(10) NULL  )
ADD ( "STORAGEFEE" NUMBER(19,2) NULL  )
ADD ( "STORAGEOUTFEE" NUMBER(19,2) NULL  )
ADD ( "FAREID" NUMBER(10) NULL  )
ADD ( "DELIVERYCODE" VARCHAR2(30) NULL  )
ADD ( "FREIGHTPRICE" NUMBER(19,2) NULL  ) ;
COMMENT ON COLUMN "RJDS"."REC_GOODAPPLY_ORDERGOOD"."STORAGEID" IS '仓库ID';
COMMENT ON COLUMN "RJDS"."REC_GOODAPPLY_ORDERGOOD"."ADDRESSID" IS '收货地址ID';
COMMENT ON COLUMN "RJDS"."REC_GOODAPPLY_ORDERGOOD"."STORAGEFEE" IS '保管费';
COMMENT ON COLUMN "RJDS"."REC_GOODAPPLY_ORDERGOOD"."STORAGEOUTFEE" IS '出库费';
COMMENT ON COLUMN "RJDS"."REC_GOODAPPLY_ORDERGOOD"."FAREID" IS '运费价格标准ID';
COMMENT ON COLUMN "RJDS"."REC_GOODAPPLY_ORDERGOOD"."DELIVERYCODE" IS '配送code';
COMMENT ON COLUMN "RJDS"."REC_GOODAPPLY_ORDERGOOD"."FREIGHTPRICE" IS '运费价格';

ALTER TABLE "RJDS"."REC_GOODAPPLY_ORDERGOOD" ADD CONSTRAINT "FK_STORAGE" FOREIGN KEY ("STORAGEID") REFERENCES "RJDS"."DIC_STORAGE" ("ID");
ALTER TABLE "RJDS"."REC_GOODAPPLY_ORDERGOOD" ADD CONSTRAINT "FK_ADDRESS" FOREIGN KEY ("ADDRESSID") REFERENCES "RJDS"."REC_ADDRESS" ("ID");
ALTER TABLE "RJDS"."REC_GOODAPPLY_ORDERGOOD" ADD CONSTRAINT "FK_FARE" FOREIGN KEY ("FAREID") REFERENCES "RJDS"."DIC_FARE" ("ID");

--修改提货申请记录表，删除其中的四个字段
ALTER TABLE "RJDS"."REC_GOODAPPLY" DROP("STOCKID", "ADDRESSID", "PICKCODE", "FAREID");