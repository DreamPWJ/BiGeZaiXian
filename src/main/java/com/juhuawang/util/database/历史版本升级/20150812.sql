alter table rec_Order add SupplyId number(10) not null;
alter table rec_Order rename column frontUserId to GuestId;

alter table rec_Order
   add constraint fk_order_frontUser_supply foreign key (SupplyId)
      references rec_FrontUser (id);

COMMENT ON COLUMN REC_ORDER.SUPPLYID IS '卖方ID';

-- 命名冲突修订
alter table rec_collection
   drop constraint fk_collection_account;

alter table rec_collection
   add constraint fk_collection_virtualAccount foreign key (virtualAccountId)
      references rec_VirtualAccount (id);

-- 删除后台原有设计（只为进度）
alter table rec_Role_Auth
   drop constraint fk_roleAuth_authBackUser;

drop table DIC_AUTHBACKUSER cascade constraints;

drop table dic_Org cascade constraints;

drop table dic_Role cascade constraints;

drop table rec_BackUser cascade constraints;

drop table rec_Role_Auth cascade constraints;

-- 后台用户权限相关五个表（沿用之前命名，规则与新设计不一致）
create table account  (
   id                   number(10)                      not null,
   roleId               number(10),
   organizationId       number(10),
   name                 VARCHAR2(255)                   not null,
   username             VARCHAR2(255)                   not null,
   password             VARCHAR2(255)                   not null,
   codeNo               varchar2(50),
   ic                   char(18),
   beginTime            DATE,
   endTime              DATE,
   email                VARCHAR2(255)                   not null,
   registertime         DATE                            not null,
   version              NUMBER(11)                      not null,
   enable               NUMBER(4)                       not null,
   constraint pk_account_b primary key (id)
);

DROP TABLE account;

create table authority  (
   ID                   number(10)                      not null,
   version              NUMBER(11)                      not null,
   enable               NUMBER(4)                       not null,
   name                 VARCHAR2(255)                   not null,
   levelCode            VARCHAR2(255)                   not null,
   position             NUMBER(11)                      not null,
   theValue             VARCHAR2(255),
   url                  VARCHAR2(255)                   not null,
   matchUrl             VARCHAR2(255)                   not null,
   itemIcon             VARCHAR2(255),
   parentId             number(10),
   constraint pk_authority primary key (ID)
);

create table organization  (
   id                   number(10)                      not null,
   name                 VARCHAR2(255)                   not null,
   levelCode            VARCHAR2(255)                   not null,
   parentId             number(10),
   position             NUMBER(11)                      not null,
   theValue             VARCHAR2(255),
   version              NUMBER(11)                      not null,
   enable               NUMBER(4)                       not null,
   constraint pk_organization primary key (id)
);

create table role  (
   id                   number(10)                      not null,
   name                 VARCHAR2(255)                   not null,
   version              NUMBER(11)                      not null,
   enable               NUMBER(4)                       not null,
   constraint pk_role primary key (id)
);

create table role_authority  (
   authorityId          number(10)                      not null,
   roleId               number(10)                      not null,
   constraint pk_role_authority unique (authorityId, roleId)
);

alter table account
   add constraint fk_account_organization foreign key (organizationId)
      references organization (id);

alter table account
   add constraint fk_account_role foreign key (roleId)
      references role (id);

alter table authority
   add constraint SYS_C0013955 foreign key (parentId)
      references authority (ID);

alter table organization
   add constraint SYS_C0013960 foreign key (parentId)
      references organization (id);

alter table role_authority
   add constraint fk_authority_role foreign key (roleId)
      references role (id);

alter table role_authority
   add constraint fk_roleAuthority_Authority foreign key (authorityId)
      references authority (ID);
