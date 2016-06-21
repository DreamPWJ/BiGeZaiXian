package com.juhuawang.util;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;


/**
 * @author pwj 2015/7/21 0021.
 *         SessionFactoryUtil公共类
 *         提供获取mybatis生成session工厂和session方法 用于SQL语句查询等
 */
@Component
public class SessionFactoryUtil {
    //mybatis中SqlSessionFactory类
    public static SqlSessionFactory sqlsessionFactory;
    //spring-mybatis.xml已配置  通过SqlSessionTemplate获取到session
    public static SqlSessionTemplate sqlSession;

    /**
     * 获取SqlSessionFactory的方法
     *
     * @return
     */

    public static SqlSessionFactory getSqlSessionFactory() {
        if (sqlsessionFactory == null) {//sqlsessionFactory为null才创建
            //通过SqlSession反向获取SqlSessionFactory
            sqlsessionFactory = sqlSession.getSqlSessionFactory();
        }
        return sqlsessionFactory;
    }

    /**
     * 获取SqlSession的方法
     *
     * @return
     */
    public static SqlSession getSqlSession() {
        //通过SqlSessionTemplate获取到sqlSession
        return sqlSession;
    }

    /**
     * Spring注解 @Resource等不能放在静态变量static属性上
     * 解决办法 通过非静态set方法加上 @Resource  注入SPRING容器管理
     */
    @Resource
    public void setSqlsessionFactory(SqlSessionFactory sqlsessionFactory) {
        SessionFactoryUtil.sqlsessionFactory = sqlsessionFactory;
    }

    @Resource
    public void setSqlSession(SqlSessionTemplate sqlSession) {
        SessionFactoryUtil.sqlSession = sqlSession;
    }
}
