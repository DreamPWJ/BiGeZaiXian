package com.juhuawang.dao.interfaces;

import com.juhuawang.model.RoleAuthority;

public interface RoleAuthorityMapper {
    int insert(RoleAuthority record);

    int insertSelective(RoleAuthority record);
}