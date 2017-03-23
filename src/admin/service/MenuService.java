package admin.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.MenuDao;
import admin.entity.Menu;
import chok.devwork.BaseDao;
import chok.devwork.BaseService;

@Service
public class MenuService extends BaseService<Menu,Long>
{
	@Autowired
	private MenuDao menuDao;

	@Override
	public BaseDao<Menu,Long> getEntityDao() {
		return menuDao;
	}
	
	public List getAll()
	{
		List<Menu> menuData = menuDao.get(null);
		List<Object> treeNodes = new ArrayList<Object>();
		for(int i=0; i<menuData.size(); i++)
		{
			Menu o = menuData.get(i);
			treeNodes.add(o.getM());
		}
		return treeNodes;
	}
	
	public List getByUserId(Map m)
	{
		List<Long> menuIds = new ArrayList<Long>();
		List<Menu> menus = new ArrayList<Menu>();
		Long userid = Long.valueOf(m.get("tc_user_id").toString());
		// 1. 查找目的菜单
		List<Menu> targetMenus = menuDao.getByUserId(m);
		for(Menu o : targetMenus)
		{
			menuIds.add(o.getLong("id"));
		}
		// 2. 根据目的菜单递归检索所有父菜单和子菜单
		if (m.containsKey("tc_name") && m.get("tc_name").toString().length()>0)
		{
			// 2.1 递归检索父菜单
			List<Long> pids = new ArrayList<Long>(); // 缓存所有父节点id
			for(Menu o : targetMenus)
			{
				menuIds.addAll(getParentMenus(userid, o.getLong("pid"), pids));
			}
			// 2.2 递归检索子菜单
			List<Long> cids = new ArrayList<Long>(); // 缓存所有子节点id
			for(Menu o : targetMenus)
			{
				menuIds.addAll(getChildMenus(userid, o.getLong("id"), cids));
			}
		}
		// 3. 合并菜单集合
		// 3.1 去重复
		HashSet set  =   new  HashSet(menuIds); 
		menuIds.clear(); 
		menuIds.addAll(set); 
		for(Long id : menuIds)
		{
			m.clear();
			m.put("id", id);
			m.put("tc_user_id", userid);
			menus.add((Menu) menuDao.getByUserId(m).get(0));
		}
		// 3.2 格式化为json
		List<Map> treeNodes = new ArrayList<Map>();
		for(int i=0; i<menus.size(); i++)
		{
			Menu o = menus.get(i);
			treeNodes.add(o.getM());
		}
		// 3.3 按tc_order排序
		Collections.sort(treeNodes,new Comparator<Map>(){
            public int compare(Map arg0, Map arg1) {
                return (arg0.get("tc_order").toString()).compareTo(arg1.get("tc_order").toString());
            }
        });
		return treeNodes;
	}
	
	// 递归检索父菜单id集合
	public List<Long> getParentMenus(Long userid, Long pid, List<Long> pids)
	{
		Map m = new HashMap();
		m.put("tc_user_id", userid);
		m.put("id",pid);
		List<Menu> parentMenus = menuDao.getByUserId(m);
		
		if(parentMenus.size()==1)
		{
			pids.add(parentMenus.get(0).getLong("id"));
			getParentMenus(userid, parentMenus.get(0).getLong("pid"), pids);
		}
		return pids;
	}
	
	// 递归检索子菜单id集合
	public List<Long> getChildMenus(Long userid, Long id, List<Long> cids)
	{
		Map m = new HashMap();
		m.put("tc_user_id", userid);
		m.put("pid",id);
		List<Menu> childMenus = menuDao.getByUserId(m);
		
		if(childMenus.size()>0)
		{
			for (int i=0; i<childMenus.size(); i++)
			{
				cids.add(childMenus.get(i).getLong("id"));
				getChildMenus(userid, childMenus.get(i).getLong("id"), cids);
			}
		}
		return cids;
	}
}
