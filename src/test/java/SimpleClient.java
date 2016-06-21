import com.juhuawang.util.RedisClient;
import org.junit.Test;

/**
 * Created by pwj  on 2016/1/14 0014.
 * 测试独立redis 客户端
 */
public class SimpleClient {

    @Test
    public void userCache(){

        //向缓存中保存对象
        UserDO panweiji = new UserDO();
        panweiji.setUserId(113445);
        panweiji.setSex(1);
        panweiji.setUname("潘维吉");
        panweiji.setUnick("panweiji");
        panweiji.setEmail("潘维吉@qq.com");
        //调用方法处理
        boolean reusltCache = RedisClient.set("panweiji", panweiji);
        if (reusltCache) {
            System.out.println("向Redis缓存中保存对象成功。");
        }else{
            System.out.println("向Redis缓存中保存对象失败。");
        }
    }


    @Test
    public void getUserInfo(){

        UserDO panweiji = RedisClient.get("panweiji",UserDO.class);
        if(panweiji != null){
            System.out.println("从Redis缓存中获取的对象，" + panweiji.getUname() + "@" + panweiji.getEmail());
        }

    }

}
