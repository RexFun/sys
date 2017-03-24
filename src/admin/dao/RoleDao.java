package admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import admin.entity.Role;
import chok.devwork.BaseDao;


@Repository
public class RoleDao extends BaseDao<Role,Long>
{
	@Override
	public Class getEntityClass()
	{
		return Role.class;
	}
	
	public List getByUserId(Long userId)
	{
		return this.getSqlSession().selectList(getStatementName("getByUserId"), userId);
	}
}
