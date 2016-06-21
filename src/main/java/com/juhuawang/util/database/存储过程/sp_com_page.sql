
 /**
  * Oracle系统通用分页存储过程
  * 创建人 ：潘维吉
  */
------------------------------------------------------------
--创建聚化网程序包  用来管理存储过程 函数 变量 常量 游标等PL/SQL程序
CREATE OR REPLACE package jhw_package AS
type jhw_cursor is ref cursor;  --定义 一个REF CURSOR数据类型
END jhw_package;

-- Oracle系统通用分页存储过程sp_com_page
CREATE OR REPLACE procedure sp_com_page
(
       tableName in varchar2, --表名 或者是多表连接查询部分  不可为空（必填）
       fields in varchar2,    --查询结果显示字段 可以为* 不可为空（必填）
       wherecase in varchar2, --分页查询条件 可以为空
       pageSize in number,  --一页显示记录数 不可为空（必填）
       pageNow in number,   --当前页数 不可为空（必填）
       orderField  in varchar2, --order by 后排序字段，为空表示不排序  可以多个,号分割
       orderFlag  in number,     --排序标识 0：正序 1：倒序 可以为空
       myrows out number,   --总记录数  输出参数
       myPageCount out number, --总分页数  输出参数
       p_cursor out jhw_package.jhw_cursor     --返回的程序包自定义的游标结果记录集
)
AS
  --定义部分变量
  --定义sql语句字符串
  v_sql varchar2(3000);
  --定义两个整数并且赋值
  v_begin number:=(pageNow-1)*pagesize+1; --开始记录数
  v_end number:=pageNow*pageSize;         --结束记录数

  v_orderSql varchar2(200):='';  --排序sql
  v_wherecase varchar2(600):=''; --where查询sql


--执行主体部分
BEGIN
  --SET NOCOUNT ON;  --不返回影响的行数 提高性能
  --如果orderField不为空，则进行排序，如果orderFlag=0为升序，1为降序
  if orderField is not null then
    if orderFlag=0 then
      v_orderSql:=' order by '||orderField;  --升序
    elsif orderFlag=1 then
      v_orderSql:=' order by '||orderField||' desc'; --降序
    else
      null;
    end if;
  end if;

  --条件判断语句
  if wherecase is not null then
    v_wherecase:='  where '||wherecase;
  end if;

  --拼接分页查询语句
  v_sql:='select * from (select t1.* ,rownum rn from(select '|| fields ||' from '|| tableName|| v_wherecase ||' '||v_orderSql ||') t1 where rownum<='|| v_end ||') where rn>='|| v_begin;

  --把返回结果集游标打开和sql关联
  open p_cursor for v_sql;

  --计算总的记录数(列也影响记录数 如去重复)
  v_sql:='select rownum rn from(select '|| fields ||' from '|| tableName|| v_wherecase ||' '||v_orderSql ||')  ';
  --计算myrows总记录数和myPageCount总的分页数
  --组织一个sql  统计总记录数
  v_sql:='select count(*) from ('|| v_sql||')';

  --执行sql,并把返回的值赋给myrows总记录数;
  execute immediate v_sql into myrows;

  --计算myPageCount总的分页数 mod函数是一个求余函数 MOD函数是用于返回两数相除的余数
  if mod(myrows,pagesize)=0 then
    myPageCount:=myrows/pagesize; --总的记录数和一页显示记录数是正好是整数关系 相除计算总页数
  else
    myPageCount:=trunc(myrows/pagesize)+1;--trunc()函数取整数截取 总的记录数和一页显示记录数不是整数关系 有剩余 相除计算总页数+1（剩余页）
  end if;

  --关闭游标 就获取不到返回数据（如果PL/SQL 调试查看返回结果集 要注释 此句）
  -- close p_cursor;
END ;
