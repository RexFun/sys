package common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.entity.Permit;

public class Dict 
{
	/**
	 * 根据类型获取权限树节点集合
	 * @param permitId 已关联权限id
	 * @param type (类型：应用-0/菜单-1/按钮-2/请求-3)
	 * @return List<Object>
	 */
	public static List<Object> getPermitTreeNodesByType(Long permitId, String type)
	{
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tc_type", type);
		return getPermitTreeNodes(permitId, params);
	}
	/**
	 * 获取权限树节点集合
	 * @param permitId 已关联权限id
	 * @param params
	 * @return List<Object>
	 */
	public static List<Object> getPermitTreeNodes(Long permitId, Map<String, Object> params)
	{
		List<Object> treeNodes = new ArrayList<Object>();
		if(permitId!=0)
		{// 所有权限，且标记已选权限
			Permit selectedPermitObj = Factory.getPermitService().getById(permitId);
			List<Permit> permitData = Factory.getPermitService().get(params);
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
			List<Permit> resultData = Factory.getPermitService().get(params);
			for(Permit o : resultData)
			{
				treeNodes.add(o.getM());
			}
		}
		return treeNodes;
	}
}
