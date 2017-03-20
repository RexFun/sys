package admin.dao;

import org.springframework.stereotype.Repository;

import admin.entity.RolePermitMapping;
import chok.devwork.BaseDao;


@Repository
public class RolePermitMappingDao extends BaseDao<RolePermitMapping,Long>
{
	@Override
	public Class getEntityClass()
	{
		return RolePermitMapping.class;
	}
	
	public void delByRoleId(Long roleId)
	{
		this.getSqlSession().delete(getStatementName("delByRoleId"), roleId);
	}
	
	public void delByPermitId(Long permitId)
	{
		this.getSqlSession().delete(getStatementName("delByPermitId"), permitId);
	}
	
	public String getPermitIdsByRoleId(Long roleId)
	{
		return this.getSqlSession().selectOne(getStatementName("getPermitIdsByRoleId"), roleId);
	}
}
