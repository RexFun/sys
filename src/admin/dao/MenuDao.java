package admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import admin.entity.Menu;
import chok.devwork.BaseDao;


@Repository
public class MenuDao extends BaseDao<Menu,Long>
{
	@Override
	public Class<Menu> getEntityClass()
	{
		return Menu.class;
	}
	
	public List<Menu> getByUserId(Map<String, Object> m)
	{
		return this.getSqlSession().selectList(getStatementName("getByUserId"), m);
	}
}
