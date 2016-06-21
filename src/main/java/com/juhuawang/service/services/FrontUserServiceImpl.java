package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.BaseMapper;
import com.juhuawang.dao.interfaces.FrontUserMapper;
import com.juhuawang.model.FrontUser;
import com.juhuawang.service.interfaces.IFrontUserService;
import com.juhuawang.util.datasource.DataSource;
import org.apache.ibatis.binding.BindingException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */

@Service("frontUserService")
public class FrontUserServiceImpl implements IFrontUserService {
    @Resource
    private FrontUserMapper frontUserMapper;
    @Resource
    private BaseMapper baseMapper;

    public int add(long id, String regType, String userName, String pwd, String companyName, String linkMan,
                   String linkTel, String email, String address) {
        FrontUser frontUser = new FrontUser();
        frontUser.setId(id);
        frontUser.setGuestcode(regType);
        frontUser.setLogin(userName);
        frontUser.setPassword(pwd);
        frontUser.setCompany(companyName);
        frontUser.setName(linkMan);
        frontUser.setMobphone(linkTel);
        frontUser.setEmail(email);
        frontUser.setAddress(address);

        return frontUserMapper.insertSelective(frontUser);
    }

    @Override
    public int addFrontUser(FrontUser user) {
        return frontUserMapper.insertSelective(user);
    }

    @Override
    public FrontUser getByUserName(String userName) {
        return frontUserMapper.getByUserName(userName);
    }

    @Override
    public int selectByUserNameAndPwd(String login, String password) {
        return frontUserMapper.selectByUserNameAndPwd(login, password);
    }

    @Override
    public FrontUser getByUserNameAndPwd(String login, String password) {
        return frontUserMapper.getByUserNameAndPwd(login, password);
    }

    @Override
    public int updateFrontUser(FrontUser user) {
        return frontUserMapper.updateByPrimaryKeySelective(user);
    }

    /**
     * 获取用户所在公司的id
     */
    @Override
    public long getCompayIdByUser(long userId) {
        try {
            return baseMapper.getCompayIdByUser(userId);
        } catch (BindingException e) {//用户没有绑定公司
            e.printStackTrace();
        }
        return 0;
    }

}
