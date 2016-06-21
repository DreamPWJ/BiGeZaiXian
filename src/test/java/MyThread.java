import org.apache.commons.codec.digest.DigestUtils;

/**
 * Created by pwj  on 2016/3/16 0016.
 */
public class MyThread implements Runnable {
    private String name;

    public MyThread(String name) {
        super();
        this.name = name;
    }

    @Override
    public void run() {
        for (int i = 0; i < 10; i++) {
            System.out.println("线程开始：" + this.name + " ,i=" + i);
        }
        DigestUtils.md5("2222");
    }

    public static void main(String[] args) {
   /*     MyThread mt1=new MyThread("线程a");
        MyThread mt2=new MyThread("线程b");
        new Thread(mt1).start();
        new Thread(mt2).start();

*/
        Integer a = 1000, b = 1000;
        Integer c = 100, d = 100;//小的数字使用的频率比较高  所以为了性能优化  把这之间的数据缓存下来
        System.out.println(a==b);//对象地址比较 两个对象 false
        System.out.println(c==d);//Integer对象的值在128-127之间的时候引用的是同一个对象
        String s1 = "abc";
        String s2="abc";
        String s3=new String("abc");//基本类型的变量和对象的引用变量都是在函数的栈内存中分配，而堆内存中则存放new 出来的对象和数组。然而除此之外还有一块区域叫做常量池。
       // System.out.println(s1==s2);//当我们创建String s1 = "abc"这样一个对象之后，"abc"就存储到了常量池（也可叫做字符串池）中，当我们创建引用String s2  = "abc" 的时候，Java底层会优先在常量池中查找是否存在"abc"，如果存在则让s2指向这个值，不会重新创建，如果常量池中没有则创建并添加的池中
        //System.out.println(s1==s3);
 /*       Integer a=new Integer(1000);
        int b=1000;*/
       /* Integer c=new Integer(10);
        Integer d=new Integer(10);
        System.out.println(a==b);// int与Integer进行==比较时候  Java会把Integer进行自动拆箱 也就是Integer转换成int类型 ==值得比较true
        System.out.println(c==d);*///new 出来的是两个对象 ==对象引用地址 false


    }
}
