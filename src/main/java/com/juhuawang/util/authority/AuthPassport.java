package com.juhuawang.util.authority;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author pwj  2015-07-20
 * 权限验证 通行证的注解  需要时加在每个方法上来控制权限
 */
@Documented
@Inherited
//只作用在方法上 不作用在类上
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)

public @interface AuthPassport {
    boolean validate() default true;//默认是权限验证的
}
