package admin.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.entity.App;
import admin.service.AppService;
import chok.devwork.BaseController;
import chok.util.CollectionUtil;
import common.Dict;

@Scope("prototype")
@Controller
@RequestMapping("/admin/app")
public class AppAction extends BaseController<App>
{
	@Autowired
	private AppService service;
	
	@RequestMapping("/add1")
	public String add1() 
	{
		put("queryParams",req.getParameterValueMap(false, true));
		return "/admin/app/add.jsp";
	}
	@RequestMapping("/add2")
	public void add2(App po) 
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
		put("queryParams",req.getParameterValueMap(false, true));
		return "/admin/app/upd.jsp";
	}
	@RequestMapping("/upd2")
	public void upd2(App po) 
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
		put("po",service.getById(req.getLong("id")));
		put("queryParams",req.getParameterValueMap(false, true));
		return "/admin/app/getById.jsp";
	}

	@RequestMapping("/get")
	public String get() 
	{
		put("queryParams",req.getParameterValueMap(false, true));
		return "/admin/app/get.jsp";
	}
	
	@RequestMapping("/getJson")
	public void getJson()
	{
		Map<String, Object> m = req.getParameterValueMap(false, true);
		result.put("total",service.getCount(m));
		result.put("rows",service.get(m));
		printJson(result.getData());
	}
	
	@RequestMapping("/getPermitTreeNodes")
	public void getPermitTreeNodes()
	{
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tc_type", "0");
		List<Object> treeNodes = Dict.getPermitTreeNodes(req.getLong("id"), params);
		printJson(treeNodes);
	}
}