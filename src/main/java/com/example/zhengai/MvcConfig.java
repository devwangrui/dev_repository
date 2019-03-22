package com.example.zhengai;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import com.example.zhengai.config.MyIntercept;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@Configuration
public class MvcConfig implements WebMvcConfigurer {


    /*配置页面的直接跳转*/
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("HomePage/index").setViewName("homePage");


    }

    /*添加拦截器*/
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        //MyIntercept为自定义的一个拦截器，专门用来做登录权限拦截的
        registry.addInterceptor(new MyIntercept()).addPathPatterns("/**").excludePathPatterns("/PageHome/login","/css/**","/js/**","/fonts/**","/images/**","/PageHome/toLogin");//除了hello这个页面，全部拦截

    }

    /*扩充消息转化器*/
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        FastJsonHttpMessageConverter fc = new FastJsonHttpMessageConverter(); //新建一个FastJson对象
        FastJsonConfig fastJsonConfig = new FastJsonConfig();            //新建一个FastJsonConfig对象
        fastJsonConfig.setSerializerFeatures(SerializerFeature.PrettyFormat);
        fc.setFastJsonConfig(fastJsonConfig);
        converters.add(fc);// 加入到消息转发器中 相当于多加了一个HttpMessageConverter消息转换器

    }
}
