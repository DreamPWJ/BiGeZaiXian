   /**
    * 下订单相关的触发器操作orderGoodTrigger  遍历比较订单数量和各批次剩余数量
    *  修改库存明细明细中的剩余余额数量同时增加库存明细和订单商品中间表添加记录  修改总库存表余量
    *  创建人：潘维吉
    *  初始版本 1.0
    */

  CREATE OR replace trigger orderGoodTrigger
  AFTER INSERT ON rec_Order_Good  --订单商品表增加数据后触发
  For each row  --行级触发
  DECLARE
  --声明一个游标变量 剩余数量不为0 才进行提取货物 按入库顺序排序
   CURSOR stockcursor IS  SELECT s.id as sId, d.id , d.SURPLUSNUM
   FROM  rec_stock  s INNER  JOIN  rec_stockdet d ON s.id=d.stockID
   WHERE  s.goodId=:NEW.goodId AND d.SURPLUSNUM <> 0  order by d.id; --:NEW.goodId新增的记录商品id
  --订单购买数量
    buyNum number(19,3) :=:NEW.num;
  --库存表id
    stockdId number;
  --库存明细表id
    stockdetId number;
  --库存明细剩余数量
    surpluNum number(19,3);

  BEGIN
  --打开游标
  OPEN stockcursor ;
  LOOP  --遍历表结果集
    FETCH stockcursor INTO stockdId, stockdetId,surpluNum ; --赋值给变量
    EXIT WHEN stockcursor%NOTFOUND;  --游标没有结果退出


    --剩余数量大于购买数量
   IF surpluNum > buyNum THEN
    --修改剩余数量  减去购买数量 等于新剩余数量
    UPDATE rec_stockdet SET SURPLUSNUM=SURPLUSNUM-buyNum WHERE id=stockdetId;
    --修改库存表的总余量
    UPDATE rec_stock SET NUM=NUM-buyNum WHERE id=stockdId;

    --增加库存明细和订单商品表
    INSERT INTO rec_StockDet_OrderGood(ID,STOCKDETID,ORDERGOODID,NUM) VALUES (seq_rec_stockDetOrderPro.nextval,stockdetId,:NEW.ID,buyNum);
       EXIT;--完成退出循环
   END IF;

    --剩余数量小于购买数量
  IF surpluNum < buyNum THEN
    --修改剩余数量为0 全部取走
    UPDATE rec_stockdet SET SURPLUSNUM=0 WHERE id=stockdetId;
    --修改库存表的总余量
    UPDATE rec_stock SET NUM=NUM-surpluNum WHERE id=stockdId;

    --增加库存明细和订单商品表
    INSERT INTO rec_StockDet_OrderGood(ID,STOCKDETID,ORDERGOODID,NUM) VALUES (seq_rec_stockDetOrderPro.nextval,stockdetId,:NEW.ID,surpluNum);
     buyNum :=buyNum-surpluNum;--订单数量减去剩余数量的到的结果和下一条记录剩余数量再比较
   END IF;

    END LOOP;--结束循环
    CLOSE stockcursor;--关闭游标

  END;