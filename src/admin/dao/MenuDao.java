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
	public Class getEntityClass()
	{
		return Menu.class;
	}
	
	public List getByUserId(Map m)
	{
		return this.getSqlSession().selectList(getStatementName("getByUserId"), m);
	}
}
