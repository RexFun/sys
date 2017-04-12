package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.UserDao;
import admin.dao.UserRoleMappingDao;
import admin.entity.User;
import admin.entity.UserRoleMapping;
import chok.devwork.BaseDao;
import chok.devwork.BaseService;
import chok.util.CollectionUtil;
import chok.util.EncryptionUtil;

@Service
public class UserService extends BaseService<User,Long>
{
	@Autowired
	private UserDao userDao;
	@Autowired
	private UserRoleMappingDao userRoleMappingDao;

	@Override
	public BaseDao<User,Long> getEntityDao() {
		return userDao;
	}
	
	@Override
	public void add(User po)
	{
		// 插入系统用户表
		po.set("tc_password", EncryptionUtil.getMD5(po.getString("tc_password")));
		userDao.add(po);
		// 插入系统角色权限表
		if (po.get("tc_role_ids").toString().length()<1) return;
		Long tcUserId = po.getId();
		Long[] tcRoleIds = CollectionUtil.strToLongArray(po.get("tc_role_ids").toString(), ",");
		for(Long tcRoleId : tcRoleIds)
		{
			UserRoleMapping o = new UserRoleMapping();
			o.set("tc_user_id", tcUserId);
			o.set("tc_role_id", tcRoleId);
			userRoleMappingDao.add(o);
		}
	}
	
	@Override
	public void del(Long[] ids) 
	{
		for(Long id:ids)
		{
			userRoleMappingDao.delByUserId(id);
			userDao.del(id);
		}
	}
	
	@Override
	public void upd(User po)
	{
		userDao.upd(po);
		if(po.get("tc_role_ids")!=null)
		{
			// 清空旧记录
			userRoleMappingDao.delByUserId(po.getLong("id"));
			// 插入系统用户角色表
			if (po.get("tc_role_ids").toString().length()<1) return;
			Long tcUserId = po.getLong("id");
			Long[] tcRoleIds = CollectionUtil.strToLongArray(po.get("tc_role_ids").toString(), ",");
			for(Long tcRoleId : tcRoleIds)
			{
				UserRoleMapping o = new UserRoleMapping();
				o.set("tc_user_id", tcUserId);
				o.set("tc_role_id", tcRoleId);
				userRoleMappingDao.add(o);
			}
		}
	}
	
	public void updPwd(User po)
	{
		userDao.updPwd(po);
	}
	
	@Override
	public User getById(Long id) 
	{
		User po = userDao.getById(id);
		po.set("tc_role_ids", userRoleMappingDao.getRoleIdsByUserId(id));
		return po;
	}
}
