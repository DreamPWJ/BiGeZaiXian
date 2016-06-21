package com.juhuawang.dao.interfaces;

import com.juhuawang.model.TestUser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author  pwj
 * 测试Dao接口
 */
public interface ITestDao {
    int deleteByPrimaryKey(Integer id);

    int insert(TestUser record);

    int insertSelective(TestUser record);

    TestUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TestUser record);

    int updateByPrimaryKey(TestUser record);

    List<Map<String,Object>> getAll();

    List<Map<String,Object>> getPageUserbyProcedure(Map paramMap);

    void  cascadeOperation();

    List<Map<String,Object>> execProcedure(Map paramMap);
}