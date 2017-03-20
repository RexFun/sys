package admin.dao;

import org.springframework.stereotype.Repository;

import admin.entity.UserRoleMapping;
import chok.devwork.BaseDao;


@Repository
public class UserRoleMappingDao extends BaseDao<UserRoleMapping,Long>
{
	@Override
	public Class getEntityClass()
	{
		return UserRoleMapping.class;
	}
	
	public void delByUserId(Long userId)
	{
		this.getSqlSession().delete(getStatementName("delByUserId"), userId);
	}
	
	public void delByRoleId(Long roleId)
	{
		this.getSqlSession().delete(getStatementName("delByRoleId"), roleId);
	}
	
	public String getRoleIdsByUserId(Long userId)
	{
		return this.getSqlSession().selectOne(getStatementName("getRoleIdsByUserId"), userId);
	}
}
