package com.juhuawang.util;

import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;

/**
 * @author pwj 2015/7/19 0019.
 * Oracle数据库自动定时备份类 expdb数据泵方式 速度时间更快 文件更小
 */
//注入spring容器管理
@Component
public class OracleDatabaseBackup {
    /**
     * Java代码实现Oracle数据库完全导出
     * @param userName 进入数据库所需要的用户名
     * @param password 进入数据库所需要的密码
     * @param SID 用户所在的SID 数据库名
     * @param savePath 数据库导出文件保存路径
     * @param fileName 数据库导出文件文件名
     * @return 返回true表示导出成功，否则返回false。
     */

    public static boolean exportDatabaseTool(String userName, String password, String SID, String savePath, String fileName) throws InterruptedException {/*
        File saveFile = new File(savePath);
        if (!saveFile.exists()) {// 如果目录不存在
            saveFile.mkdirs();// 创建文件夹
        }
        try {
            //执行dos命令（如：expdb system/manager@TEST file=d:\daochu.dmp full=y） 备份全部oracle数据库
            Process process = Runtime.getRuntime().exec("expdp " + userName + "/" + password + "@192.168.0.37:1521:" + SID + " file=" + savePath + "/" + fileName + ".dmp schemas=rjds");
            if(process.waitFor() == 0){//0 表示线程正常终止。
                return true;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }*/
        return false;
    }

/*   public static void main(String[] args) throws InterruptedException {
        if (exportDatabaseTool("rjds", "Rjdsjhw001", "juhuawang", "F:/BackupDatabase", "juhuawangBackup")) {
            System.out.println("数据库成功备份！！！");
        } else {
            System.out.println("数据库备份失败！！！");
        }
    }*/

}
