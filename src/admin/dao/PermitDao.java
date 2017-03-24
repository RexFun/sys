package admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import admin.entity.Permit;
import chok.devwork.BaseDao;


@Repository
public class PermitDao extends BaseDao<Permit,Long>
{
	@Override
	public Class getEntityClass()
	{
		return Permit.class;
	}
	
	public List getByRoleId(Long roleId)
	{
		return this.getSqlSession().selectList(getStatementName("getByRoleId"), roleId);
	}
	
	public List getBtnPermitByUserId(Long userId)
	{
		return this.getSqlSession().selectList(getStatementName("getBtnPermitByUserId"), userId);
	}
	
	public int getCountByUserIdAndActionUrl(Map m){
		return (Integer) this.getSqlSession().selectOne(getStatementName("getCountByUserIdAndActionUrl"), m);
	}
}
