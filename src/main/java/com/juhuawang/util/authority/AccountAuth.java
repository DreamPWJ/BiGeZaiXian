package com.juhuawang.util.authority;

/**
 * @author pwj  2015-07-20
 *         用户权限类
 */
public class AccountAuth {
    private Integer id;//用户id
    private String name;//用户名

    public AccountAuth(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }


    public Integer getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }
}
