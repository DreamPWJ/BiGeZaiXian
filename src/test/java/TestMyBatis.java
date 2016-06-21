

import javax.annotation.Resource;

import com.alibaba.fastjson.JSON;
import com.juhuawang.dao.interfaces.ITestDao;
import com.juhuawang.model.TestUser;
import com.juhuawang.service.interfaces.IOrderGoodService;
import com.juhuawang.service.interfaces.ITestService;
import com.juhuawang.util.datasource.DataSourceEntry;
import org.apache.log4j.Logger;

import org.junit.Test;
import org.junit.runner.RunWith;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author pwj on 2015/6/23 0023.
 *         Junit4单元测试
 */

@RunWith(SpringJUnit4ClassRunner.class)        //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
public class TestMyBatis {
    //日志类
    private static Logger logger = Logger.getLogger(TestMyBatis.class);
    /* private ApplicationContext ac = null;*/
    @Resource
    private ITestService userService = null;
    @Resource
    private ITestDao testDao = null;
    @Resource
    private DataSourceEntry dataSourceEntry = null;
    @Resource
    public SqlSessionTemplate sqlSession;

    @Resource
    IOrderGoodService orderGoodService;

    /**
     * 注释掉的部分是不使用 Spring 时，一般情况下的一种测试方法  ；
     * 如果使用了 Spring 那么就可以使用注解的方式来引入配置文件和类，
     * 然后再将 service 接口对象注入，就可以进行测试
     */
/*	@Before
    public void before() {
		ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		userService = (ITestService) ac.getBean("userService");
	}*/
/*   @Test
    public void test1() {
        //至于程序里如何变换数据源,你可以在切面上检测哪些方法加入before方法,或者在程序里直接使用DataSourceEntry调用set方法
        //dataSourceEntry.set(DataSourceEntry.INTRANET_SOURCE);
        TestUser user = userService.getUserById(12);
        logger.info("=======================" + JSON.toJSONString(user));
        //mybatis二级缓存测试
        TestUser user1 = userService.getUserById(12);
        logger.info("=======================" + JSON.toJSONString(user1));

    }*/
/*
    @Test
    public void test2() {

        TestUser user = userService.getUserById1(12);
        logger.info("=======================" + JSON.toJSONString(user));

    }*/


/*
 @Test
    public void test3() {
        List<Map<String,Object>> list = userService.getALL();
        logger.info("=======================" + JSON.toJSONString(list));

    }

    @Test
    public void test4() {
        List<Map<String,Object>> list = userService.getALL1();
        logger.info("=======================" + JSON.toJSONString(list));

    }*/

/*
    @Test
    public void test5() {
        userService.deleteByPrimaryKey(15);
        logger.info("=======================删除成功！" );

    }
*/


/*    @Test
    public void test6() {

        TestUser user = SessionFactoryUtil.getSqlSession().selectOne("com.juhuawang.dao.interfaces.ITestDao.getUserById", 12);

        logger.info("=======================" + JSON.toJSONString(user));

    }*/
    @Test
    public void test7() {

/*  Map<String, Object> paramter = new HashMap<String, Object>();
        paramter.put("enable", 001);
        userService.execProcedure(paramter);
        List list = (List) paramter.get("p_CURSOR");
        int myrows = (Integer) paramter.get("myrows");
        logger.info("=======================" + JSON.toJSONString(list));
        logger.info("=======================" + myrows);*/
    /*  userService.cascadeOperation();*/
/*     userService.getPageUserbyProcedure(1, 10);*/
/* logger.info("=======================" + JSON.toJSONString(orderGoodService.getGoodList(1,10)));*/
/*      logger.info("=======================" + JSON.toJSONString(orderGoodService.getGood()));*/
    }
}