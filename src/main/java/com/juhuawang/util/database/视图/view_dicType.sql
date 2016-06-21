
/**
 * 字典表视图 作用是方便根据层级码和英文名字查找 字典表信息（如名称等）已过虑无效的字典信息 并且 按主表id和字表层级码排序
 * 创建人：潘维吉
 * 初始版本1.0
 */

CREATE or REPLACE view view_dicType as
select  t.id as typeid ,t.name as typename,t.eng ,d.id ,d.name ,d.shortname,d.levelcode,d.parentId
from DIC_DICTYPE  t INNER JOIN DIC_DIC d on t.id=d.TYPEID  where t.statuscode='001' and d.statuscode='001'
ORDER by  t.id, d.levelcode