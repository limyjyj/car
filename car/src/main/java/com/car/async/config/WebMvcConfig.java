package com.car.async.config;

import java.util.List;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.AsyncSupportConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

@Configuration
@ComponentScan(basePackages = { "com.car.async" })
public class WebMvcConfig extends WebMvcConfigurationSupport {

	@Override
	public void configureAsyncSupport(AsyncSupportConfigurer configurer) {
		configurer.setDefaultTimeout(30*1000L);
	}

	@Override
	protected void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		converters.add(new MappingJackson2HttpMessageConverter());
	}

	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("groupchat/groupchat");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("resources/");
	}

//	@Bean
//	public ViewResolver viewResolver() {
//		ThymeleafViewResolver resolver = new ThymeleafViewResolver();
//		resolver.setTemplateEngine(templateEngine());
//		return resolver;
//	}
//
//	@Bean
//	public SpringTemplateEngine templateEngine() {
//		SpringTemplateEngine engine = new SpringTemplateEngine();
//		engine.setTemplateResolver(templateResolver());
//		return engine;
//	}
//
//	@Bean
//	public TemplateResolver templateResolver() {
//		ServletContextTemplateResolver resolver = new ServletContextTemplateResolver();
//		resolver.setPrefix("/WEB-INF/templates/");
//		resolver.setSuffix(".html");
//		resolver.setTemplateMode("HTML5");
//		resolver.setCacheable(false);
//		return resolver;
//	}

}
