package admin.action;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.entity.Menu;
import admin.service.AppService;
import admin.service.MenuService;
import chok.devwork.BaseController;
import chok.util.CollectionUtil;

@Scope("prototype")
@Controller
@RequestMapping("/admin/menu")
public class MenuAction extends BaseController<Menu>
{
	@Autowired
	private MenuService service;
	@Autowired
	private AppService appService;
	
	@RequestMapping("/add1")
	public String add1() 
	{
		put("queryParams", req.getParameterValueMap(false, true));
		return "/admin/menu/add.jsp";
	}
	@RequestMapping("/add2")
	public void add2(Menu po) 
	{
		try
		{
			service.add(po);
			print("1");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			print("0:" + e.getMessage());
		}
	}
	
	@RequestMapping("/del")
	public void del() 
	{
		try
		{
			service.del(CollectionUtil.toLongArray(req.getLongArray("id[]", 0l)));
			result.setSuccess(true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			result.setSuccess(false);
			result.setMsg(e.getMessage());
		}
		printJson(result);
	}
	
	@RequestMapping("/upd1")
	public String upd1() 
	{
		put("po", service.getById(req.getLong("id")));
		put("queryParams", req.getParameterValueMap(false, true));
		return "/admin/menu/upd.jsp";
	}
	@RequestMapping("/upd2")
	public void upd2(Menu po) 
	{
		try
		{
			service.upd(po);
			print("1");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			print("0:" + e.getMessage());
		}
	}

	@RequestMapping("/getById")
	public String getById() 
	{
		put("po", service.getById(req.getLong("id")));
		put("queryParams", req.getParameterValueMap(false, true));
		return "/admin/menu/getById.jsp";
	}

	@RequestMapping("/get")
	public String get() 
	{
		put("queryParams",req.getParameterValueMap(false, true));
		put("appList", appService.get(null));
		return "/admin/menu/get.jsp";
	}
	
	@RequestMapping("/getJson")
	public void getJson()
	{
		Map<String, Object> m = req.getParameterValueMap(false, true);
		result.put("total", service.getCount(m));
		result.put("rows", service.get(m));
		printJson(result.getData());
	}
}