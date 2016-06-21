
--RecPriceMapper.java
-- public Map<String,Object> getOnShelveByStockId(@Param("stockId")long stockId,@Param("priceId")long priceId);
--RecPriceMapper.xml
<!--  获取库存上架页面信息-->
    <select id="getOnShelveByStockId"  resultType="map">
        select s.id as stockid, mark,(select NAME from VIEW_DICTYPE where eng='goodKind' and LEVELcode=g.goodKindCode)
        as goodKindName ,
        (select NAME from VIEW_DICTYPE where eng='mea' and LEVELcode=g.meaCode) as meaCodeName,
        (select name from DIC_REGION where id=e.PROVCODE)
        ||(select name from DIC_REGION where id=e.CITYCODE)|| (select name from DIC_REGION where id=e.COUNTYCODE) ||
        e.ADDRESS as address,p.num,p.pricenotax,p.priceHasTax
        from REC_STOCK s INNER JOIN DIC_GOOD g ON s.GOODID=g.ID INNER JOIN DIC_STORAGE e ON e.ID=s.STORAGEID LEFT JOIN
        REC_PRICE p ON p.STOCKID=s.ID WHERE s.ID=#{stockId}
        <if test="priceId != 0">
            and p.id=#{priceId}
        </if>
    </select>

--OrderGoodMapper.java
    /**
     * 订单详情页面数据查询
     */
--     public Map<String ,Object> getOrderDetail(Map<String,Object> map);
--OrderGoodMapper.xml
<!-- 订单详情页面数据查询-->
    <select id="getOrderDetail" parameterType="map" resultType="map">
  SELECT g.id as goodID, s.id as stockId,d.id as stockdetId,p.ID as priceId ,g.MARK,(select name from VIEW_DICTYPE where eng='goodKind' and LEVELCODE=g.GOODKINDCODE) as goodKindName,
  (SELECT  NAME  FROM VIEW_DICTYPE WHERE ENG='mea' AND LEVELCODE=G.MEACODE) AS MEACODENAME,
  s.num ,d.SURPLUSNUM,d.PRODUCER,e.NAME AS STORAGENAME,
 d.PRODUCINGAREA,(select name from DIC_REGION where id=e.PROVCODE)
||(select name from DIC_REGION where id=e.CITYCODE)|| (select name from DIC_REGION where id=e.COUNTYCODE) || e.ADDRESS as address
,p.PRICEHASTAX, p.PRICENOTAX,P.NUM AS ONSELLNUM,c.NAME as compayName,g.picurl
FROM  DIC_GOOD g INNER JOIN REC_STOCK  s ON g.ID=s.GOODID INNER JOIN REC_STOCKDET d on s.id=d.STOCKID
  INNER JOIN DIC_STORAGE e ON e.ID=s.STORAGEID INNER JOIN  REC_PRICE p ON s.ID = p.STOCKID INNER JOIN REC_COMPANY c ON c.ID = s.COMPANYID
   WHERE g.ID=#{goodId} and s.ID=#{stockId}
and d.ID=#{stockdetId} and p.id=#{priceId}
  </select>