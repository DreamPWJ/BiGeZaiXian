package com.juhuawang.service.interfaces;

import com.juhuawang.model.TestUser;

import java.util.List;
import java.util.Map;

/**
 * @author  pwj on 2015/6/23 0023.
 * 测试用的service接口
 */
public interface ITestService {
    public TestUser getUserById(int userId);
    public TestUser getUserById1(int userId);


    public List<Map<String,Object>> getALL();
    public List<Map<String,Object>> getALL1();


    public int deleteByPrimaryKey(int id);

    public  List<Map<String,Object>> getPageUserbyProcedure(int pageNo, int pageSize);

    public void  cascadeOperation();

    List<Map<String,Object>> execProcedure(Map map);
}
