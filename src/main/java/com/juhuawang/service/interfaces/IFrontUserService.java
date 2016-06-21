package com.juhuawang.service.interfaces;

import com.juhuawang.model.FrontUser;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
public interface IFrontUserService {
    public int add(long id, String regType, String userName, String pwd, String companyName, String linkMan, String linkTel,
                   String email, String address);

    public int addFrontUser(FrontUser user);

    // 根据用户名获取用户
    public FrontUser getByUserName(String userName);

    // 根据用户名和密码判断用户是否存在
    public int selectByUserNameAndPwd(String userName,String pwd);

    // 根据用户名个密码获取用户对象
    public FrontUser getByUserNameAndPwd(String login,String password);

    // 更新当前对象
    int updateFrontUser(FrontUser user);

    /**
     * 获取用户所在公司的id
     */
    public long getCompayIdByUser(long userId) ;

}
