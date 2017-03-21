package common;

import admin.service.MenuService;
import admin.service.PermitService;
import chok.devwork.BeanFactory;


public class Factory {
	public static MenuService getMenuService(){return (MenuService) BeanFactory.getBean("menuService");}
	public static PermitService getPermitService(){return (PermitService) BeanFactory.getBean("permitService");}
}
