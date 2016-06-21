package com.juhuawang.util;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * @author pwj on 2015/7/18 0018.
 * AUTOtaskscheduling 自动定时任务调度
 */

/**CRON表达式    含义
 "0 0 12 * * ?"    每天中午十二点触发
 "0 15 10 ? * *"    每天早上10：15触发
 "0 15 10 * * ?"    每天早上10：15触发
 "0 15 10 * * ? *"    每天早上10：15触发
 "0 15 10 * * ? 2005"    2005年的每天早上10：15触发
 "0 * 14 * * ?"    每天从下午2点开始到2点59分每分钟一次触发
 "0 0/5 14 * * ?"    每天从下午2点开始到2：55分结束每5分钟一次触发
 "0 0/5 14,18 * * ?"    每天的下午2点至2：55和6点至6点55分两个时间段内每5分钟一次触发
 "0 0-5 14 * * ?"    每天14:00至14:05每分钟一次触发
 "0 10,44 14 ? 3 WED"    三月的每周三的14：10和14：44触发
 "0 15 10 ? * MON-FRI"    每个周一、周二、周三、周四、周五的10：15触发
 */
//注入spring容器管理
@Component
public class AutoTaskScheduling {


    /**
     * 自动定时备份oracle数据库方法
     * 定时器的任务方法不能有返回值
     * 每天晚上12点整自动备份数据库
     */
    @Scheduled(cron = "0 0 0 * * ?")
    public static void backupDatabaseExecute() {
        try {
            OracleDatabaseBackup.exportDatabaseTool(SysConstants.ORACLE_DATABASE_USERNAME,
                    SysConstants.ORACLE_DATABASE_PASSWORD, SysConstants.ORACLE_DATABASE_NAME,
                    SysConstants.ORACLE_DATABASE_SAVEPATH, SysConstants.ORACLE_DATABASE_FILENAME);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }




/*
    @Scheduled(fixedRate= 5000)
    //定时器的任务方法不能有返回值
    public static  void execute() {
        System.out.println("自动任务调度任务，执行时间：" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));

    }

    public static void main(String[] args) {
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
    }
*/

}
