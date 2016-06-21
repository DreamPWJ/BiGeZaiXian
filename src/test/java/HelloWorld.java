import java.math.BigDecimal;

/**
 * Created by pwj  on 2015/10/12 0012.
 */
public class HelloWorld {
    public static void main(String args[]) {
       // System.out.println(String.format("date:%s-%s","10/24","10/25"));
        try{
            System.out.println(2.0-1.1);
            BigDecimal a=new BigDecimal(Double.toString(2.0));
            System.exit(0);
        }finally {
            System.out.println("finally");
        }



    }

}
