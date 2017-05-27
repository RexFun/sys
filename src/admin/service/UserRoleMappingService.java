package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.UserRoleMappingDao;
import admin.entity.UserRoleMapping;
import chok.devwork.BaseDao;
import chok.devwork.BaseService;

@Service
public class UserRoleMappingService extends BaseService<UserRoleMapping,Long>
{
	@Autowired
	private UserRoleMappingDao userRoleMappingDao;

	@Override
	public BaseDao<UserRoleMapping,Long> getEntityDao() 
	{
		return userRoleMappingDao;
	}
	
	@Override
	public void add(UserRoleMapping po)
	{
		userRoleMappingDao.add(po);
	}
}
