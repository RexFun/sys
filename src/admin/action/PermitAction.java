package admin.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.entity.Permit;
import admin.service.PermitService;
import chok.devwork.BaseController;
import chok.util.CollectionUtil;


@Scope("prototype")
@Controller
@RequestMapping("/admin/permit")
public class PermitAction extends BaseController<Permit>
{
	@Autowired
	private PermitService service;
	
	@RequestMapping("/add1")
	public String add1() 
	{
		put("queryParams", req.getParameterValueMap(false, true));
		return "/admin/permit/add.jsp";
	}
	@RequestMapping("/add2")
	public void add2(Permit po) 
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
		return "/admin/permit/upd.jsp";
	}
	@RequestMapping("/upd2")
	public void upd2(Permit po) 
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
		return "/admin/permit/getById.jsp";
	}

	@RequestMapping("/get")
	public String get() 
	{
		put("queryParams",req.getParameterValueMap(false, true));
		return "/admin/permit/get.jsp";
	}
	
	@RequestMapping("/getJson")
	public void getJson()
	{
		Map m = req.getParameterValueMap(false, true);
		result.put("total",service.getCount(m));
		result.put("rows",service.get(m));
		printJson(result.getData());
	}
	
	@RequestMapping("/getPermitTreeNodes")
	public void getPermitTreeNodes()
	{
		List<Object> treeNodes = new ArrayList<Object>();
		if(req.getLong("id")!=0)
		{// 所有权限，且标记已选权限
			Permit selectedPermitObj = service.getById(req.getLong("id"));
			List<Permit> permitData = service.get(null);
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
			List<Permit> permitData = service.get(null);
			for(int i=0; i<permitData.size(); i++)
			{
				Permit o = permitData.get(i);
				treeNodes.add(o.getM());
			}
		}
		printJson(treeNodes);
	}
}