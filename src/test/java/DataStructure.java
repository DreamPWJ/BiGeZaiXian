/**
 * Created by pwj  on 2015/10/25 0025.
 * 数据结构相关知识
 */
public class DataStructure {
    public static void main(String args[]) {

        int[] values = {3, 1, 6, 2, 9, 0, 7, 4, 5};

        sort(values);

        for (int i = 0; i < values.length; i++) {//排序后打印数组中的元素

            System.out.println("Index: " + i + "  value: " + values[i]);

        }

    }

/*  冒泡排序是一种简单的交换类排序。其基本思路是，
    从头开始扫描待排序的元素，在扫描过程中依次对相邻元素进行比较，
    将关键字值大的元素后移。每经过一趟排序后，关键字值最大的元素将移到末尾，
    此时记下该元素的位置，下一趟排序只需要比较到此位置为止，直到所有元素都已有序排列。*/

    public static void sort(int[] values) {

        int temp;

        for (int i = 0; i < values.length; i++) {//趟数

            for (int j = 0; j < values.length - i - 1; j++) {//比较次数

                if (values[j] > values[j + 1]) {

                    temp = values[j];

                    values[j] = values[j + 1];

                    values[j + 1] = temp;

                }

            }
        }
    }

}
