--创建sequence
CREATE SEQUENCE seq_dic_authBackUser INCREMENT BY 1 --每次加1
START WITH 1;--序列从几开始
CREATE SEQUENCE seq_dic_authFrontUser INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_dic_dic INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_dic_dicType INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_dic_fare INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_dic_org INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_dic_production INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_dic_role INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_dic_storage INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_address INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_annex INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_authFrontUser INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_backUser INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_bankFrontUser INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_bill INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_buy INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_buyDet INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_cart INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_collection INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_comment INCREMENT BY 1 
START WITH 1;

--创建sequence
CREATE SEQUENCE seq_rec_company INCREMENT BY 1 
START WITH 1;--序列从几开始
CREATE SEQUENCE seq_rec_companyStorage INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_findGood INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_frontUser INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_goodApply INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_goodApplyOrderPro INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_goodCheck INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_goodTrack INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_log INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_news INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_order INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_orderProduction INCREMENT BY 1 
START WITH 1;
-- seq_rec_orderProduction改为seq_rec_order_good
DROP sequence seq_rec_orderProduction;
CREATE SEQUENCE seq_rec_order_good INCREMENT BY 1 --每次加几
START WITH 1;

CREATE SEQUENCE seq_rec_roleAuth INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_sell INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_sellDet INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_stock INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_stockDet INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_stockDetOrderPro INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_taxHis INCREMENT BY 1 
START WITH 1;
CREATE SEQUENCE seq_rec_virtualAccount INCREMENT BY 1 
START WITH 1;