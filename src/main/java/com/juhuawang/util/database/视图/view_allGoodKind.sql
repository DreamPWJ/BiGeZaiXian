/**
 * 字典表中的品种视图 作用是方便根据按层级查询全部品种  通过SQL递归查询子类 基层关系 并且按层级排序
 * 创建人：潘维吉
 * 初始版本1.0
 */
CREATE or REPLACE view view_allGoodKind as
with goodKind(id,name,shortName,levelCode,parentid,leve) as (
select id,name,shortName,levelCode,parentid,1 as leve from view_dictype  where eng='goodKind' and  parentid is null
union all  select a.id,a.name,a.shortName,a.levelCode,a.parentid ,(g.leve+1) as leve  from goodKind  g ,view_dictype  a  where a.eng='goodKind' and  g.id=a.parentid
)
select * from goodKind order by levelcode ;