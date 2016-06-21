--创建ORACLE数据库 表空间 用户等  创建人：pwj

/*分为四步 */
/*第1步：创建临时表空间  */
create temporary tablespace bigezaixian_temp
tempfile 'C:/app/Administrator/oradata/bigezaixian_temp.dbf'
size 200m
autoextend on
next 50m
extent management local;

/*第2步：创建数据表空间  */
create tablespace bigezaixian_data
logging
datafile 'C:/app/Administrator/oradata/bigezaixian_data.dbf'
size 600m
autoextend on
next 100m
extent management local;

/* 第3步：创建用户并指定表空间  */
create user bgzx identified by Bigezaixian001
default tablespace bigezaixian_data
temporary tablespace bigezaixian_temp;

/*第4步：给用户授予权限  */
grant connect,resource,dba to bgzx;

/*删除用户模式以及包含所有表等数据库对象 必须断开所有链接 （包括PL/SQL管理工具链接和tomcat的链接 等）*/
drop user rjds cascade


/*oracle数据库数据泵备份与还原*/
--1.创建备份的存储目录
create directory dump_dir as '/home/juhuawang/backupdatabase';
--select * from dba_directories;
--drop directory  dump_dir;
--2 .授权用户操作dump_dir目录的权限
grant read,write on directory dump_dir to rjds;

--3 导入导出 expdp expdp 数据泵备份还原  各种命令执行 命令后无;号

/*表：单独rjds用户下表的备份还原*/
--备份导出
expdp rjds/Rjdsjhw001@juhuawang  directory=dump_dir  dumpfile=juhuawangBackup.dmp  tables=emp,dept
--还原导入
expdp rjds/Rjdsjhw001@juhuawang  directory=dump_dir  dumpfile=juhuawangBackup.dmp  tables=emp,dept


/*用户模式：单独rjds用户的备份还原*/
--备份导出
expdp rjds/Rjdsjhw001@juhuawang  directory=dump_dir  dumpfile=juhuawangBackup.dmp  schemas=rjds
--还原导入
impdp rjds/Rjdsjhw001@juhuawang  directory=dump_dir  dumpfile=juhuawangBackup.dmp  schemas=rjds


/*表空间：表空间juhuawang_data 的备份还原*/
--备份导出
expdp rjds/Rjdsjhw001@juhuawang  directory=dump_dir  dumpfile=juhuawangBackup.dmp  tablespaces=juhuawang_data
--还原导入
impdp rjds/Rjdsjhw001@juhuawang  directory=dump_dir  dumpfile=juhuawangBackup.dmp  tablespaces=juhuawang_data

/*导出备份导入还原整个数据库*/
--备份导出
expdp rjds/Rjdsjhw001@juhuawang  directory=dump_dir  dumpfile=juhuawangBackup.dmp  full=y
--还原导入
impdp rjds/Rjdsjhw001@juhuawang  directory=dump_dir  dumpfile=juhuawangBackup.dmp  full=y


-- 注：目录是在服务端建立的，而不是在客户端
create or replace directory dump_dir  as '/home/juhuawang/backupdatabase';
--2 .授权用户操作dump_dir目录的权限
grant read,write on directory dump_dir to rjds;
--在win下dos命令窗口执行
-- 结束不要加分号，以免出现莫名其妙的错误
impdp rjds/Rjdsjhw001@192.168.0.31:1521/juhuawang  remap_schema=py2:rjds  directory=dump_dir dumpfile=rjds.dmp schemas=rjds

impdp rjds/Rjdsjhw001@juhuawang  file=rjds.dmp schemas=rjds

