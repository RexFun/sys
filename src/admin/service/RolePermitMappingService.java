package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.RolePermitMappingDao;
import admin.entity.RolePermitMapping;
import chok.devwork.BaseDao;
import chok.devwork.BaseService;

@Service
public class RolePermitMappingService extends BaseService<RolePermitMapping,Long>
{
	@Autowired
	private RolePermitMappingDao rolePermitMappingDao;

	@Override
	public BaseDao<RolePermitMapping,Long> getEntityDao() {
		return rolePermitMappingDao;
	}
	
	public void delByRoleId(Long roleId)
	{
		rolePermitMappingDao.delByRoleId(roleId);
	}
}
