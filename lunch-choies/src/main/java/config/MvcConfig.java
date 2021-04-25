package config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import rest.interceptor.AuthCheckInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"rest"})
public class MvcConfig implements WebMvcConfigurer {

	@Override
	public void configureDefaultServletHandling(
			DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/view/", ".jsp");
	}
	
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource ms = 
				new ResourceBundleMessageSource();
		ms.setBasename("message.validator"); // properties경로
		ms.setDefaultEncoding("UTF-8");
		return ms;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/map/**", "/game/**");
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
	@Bean
	public AuthCheckInterceptor authCheckInterceptor() {
		return new AuthCheckInterceptor();
	}
	
	

}
