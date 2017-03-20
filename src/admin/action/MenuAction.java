package admin.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.entity.Menu;
import admin.entity.Permit;
import admin.service.MenuService;
import admin.service.PermitService;
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
	private PermitService permitService;
	
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
	
	@RequestMapping("/getMenuTreeNodes")
	public void getMenuTreeNodes()
	{
		List<Object> treeNodes = new ArrayList<Object>();
		if(req.getLong("id")!=0)
		{// 所有菜单，且标记已选菜单
			Menu selectedMenuObj = service.getById(req.getLong("id"));
			List<Menu> menuData = service.get(null);
			for(int i=0; i<menuData.size(); i++)
			{
				Menu o = menuData.get(i);
				if(o.getLong("id") == selectedMenuObj.getLong("id"))
				{
					o.set("checked", true);
				}
				treeNodes.add(o.getM());
			}
		}
		else
		{// 所有菜单
			List<Menu> resultData = service.get(null);
			for(Menu o : resultData)
			{
				treeNodes.add(o.getM());
			}
		}
		printJson(treeNodes);
	}
	
	@RequestMapping("/getPermitTreeNodes")
	public void getPermitTreeNodes()
	{
		List<Object> treeNodes = new ArrayList<Object>();
		if(req.getLong("id")!=0)
		{// 所有权限，且标记已选权限
			Permit selectedPermitObj = permitService.getById(req.getLong("id"));
			List<Permit> permitData = permitService.get(null);
			for(int i=0; i<permitData.size(); i++)
			{
				Permit o = permitData.get(i);
				if(o.getLong("id") == selectedPermitObj.getLong("id"))
				{
					o.set("checked", true);
				}
				treeNodes.add(o.getM());
			}
		}
		else
		{// 所有权限
			List<Permit> resultData = permitService.get(null);
			for(Permit o : resultData)
			{
				treeNodes.add(o.getM());
			}
		}
		printJson(treeNodes);
	}
	
	@RequestMapping("/getPermitTreeNodesByMenu")
	public void getPermitTreeNodesByMenu()
	{
		Menu po = service.getById(req.getLong("id"));
		
		List<Permit> permitData = permitService.get(null);
		List<Object> treeNodes = new ArrayList<Object>();
		
		for(int i=0; i<permitData.size(); i++)
		{
			Permit o = permitData.get(i);
			if(po.getM().containsKey("tc_permit_id") && o.getLong("id") == po.getLong("tc_permit_id"))
			{
				o.set("checked", true);
			}
			treeNodes.add(o.getM());
		}
		printJson(treeNodes);
	}
}