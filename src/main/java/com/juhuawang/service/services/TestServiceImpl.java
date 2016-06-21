package com.juhuawang.service.services;


import javax.annotation.Resource;

import com.alibaba.fastjson.JSON;
import com.juhuawang.dao.interfaces.ITestDao;
import com.juhuawang.model.TestUser;
import com.juhuawang.service.interfaces.ITestService;
import com.juhuawang.util.datasource.DataSource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author pwj  on 2015/6/23 0023.
 *         测试用service
 */
//@Transactional事务处理  propagation事务传播机制  REQUIRED是保证在事务中的代码只有在当前事务中运行，防止创建多个事务
@Transactional(propagation = Propagation.REQUIRED)
@Service("userService")
/*@DataSource(name = DataSource.INTRANET_DataSOURCE)*/
public class TestServiceImpl implements ITestService {
    @Resource
    private ITestDao userDao;


    @Override
/*    @DataSource(name=DataSource.DEFAULT_DataSOURCE)*/
    public TestUser getUserById(int userId) {
        return this.userDao.selectByPrimaryKey(userId);
    }

    @Override
    @DataSource(name = DataSource.INTRANET_DataSOURCE)
    public TestUser getUserById1(int userId) {
        return this.userDao.selectByPrimaryKey(userId);
    }


    @Override
/*
   @DataSource(name = DataSource.INTRANET_DataSOURCE)
*/
    public List<Map<String, Object>> getALL() {
        return this.userDao.getAll();
    }

    @Override
    @DataSource(name = DataSource.INTRANET_DataSOURCE)
    public List<Map<String, Object>> getALL1() {
        return this.userDao.getAll();
    }


    @Override
 /*  @DataSource(name = DataSource.INTRANET_DataSOURCE)*/
    public int deleteByPrimaryKey(int id) {
        return this.userDao.deleteByPrimaryKey(id);
    }

    /**
     * 分页存储过程
     *
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Override
    public List<Map<String, Object>> getPageUserbyProcedure(int pageNo, int pageSize) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("tableName", " account ");
        paramMap.put("fields", " * ");
  /*    paramMap.put("wherecase", " enable=0 ");*/
        paramMap.put("pageNow", pageNo);
        paramMap.put("pageSize", pageSize);
        paramMap.put("orderField", " ID ");
        paramMap.put("orderFlag", 1);

        this.userDao.getPageUserbyProcedure(paramMap);
        List list = (List) paramMap.get("p_cursor");
        int myrows = (Integer) paramMap.get("myrows");
/*        System.out.println("=======================" + JSON.toJSONString(list));
        System.out.println("=======================" + myrows);*/

        return  list;
    }

    @Override
    public void cascadeOperation() {
        this.userDao.cascadeOperation();
    }

    @Override
    public List<Map<String, Object>> execProcedure(Map paramMap) {
        return this.userDao.execProcedure(paramMap);
    }
}