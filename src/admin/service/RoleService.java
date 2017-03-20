package admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.RoleDao;
import admin.dao.RolePermitMappingDao;
import admin.dao.UserRoleMappingDao;
import admin.entity.Role;
import admin.entity.RolePermitMapping;
import chok.devwork.BaseDao;
import chok.devwork.BaseService;
import chok.util.CollectionUtil;

@Service
public class RoleService extends BaseService<Role,Long>
{
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private RolePermitMappingDao rolePermitMappingDao;
	@Autowired
	private UserRoleMappingDao userRoleMappingDao;

	@Override
	public BaseDao<Role,Long> getEntityDao() {
		return roleDao;
	}
	
	@Override
	public void add(Role po)
	{
		// 插入系统角色表
		roleDao.add(po);
		// 插入系统角色权限表
		if (po.get("tc_permit_ids").toString().length()<1) return;
		Long tcRoleId = po.getId();
		Long[] tcPermitIds = CollectionUtil.strToLongArray(po.get("tc_permit_ids").toString(), ",");
		for(Long tcPermitId : tcPermitIds)
		{
			RolePermitMapping o = new RolePermitMapping();
			o.set("tc_role_id", tcRoleId);
			o.set("tc_permit_id", tcPermitId);
			rolePermitMappingDao.add(o);
		}
	}
	
	@Override
	public void del(Long[] ids) 
	{
		for(Long id:ids)
		{
			rolePermitMappingDao.delByRoleId(id);
			userRoleMappingDao.delByRoleId(id);
			roleDao.del(id);
		}
	}
	
	@Override
	public void upd(Role po)
	{
		roleDao.upd(po);
		// 清空旧记录
		rolePermitMappingDao.delByRoleId(po.getLong("id"));
		// 插入系统角色权限表
		if (po.get("tc_permit_ids").toString().length()<1) return;
		Long tcRoleId = po.getLong("id");
		Long[] tcPermitIds = CollectionUtil.strToLongArray(po.get("tc_permit_ids").toString(), ",");
		for(Long tcPermitId : tcPermitIds)
		{
			RolePermitMapping o = new RolePermitMapping();
			o.set("tc_role_id", tcRoleId);
			o.set("tc_permit_id", tcPermitId);
			rolePermitMappingDao.add(o);
		}
	}
	
	@Override
	public Role getById(Long id) 
	{
		Role po = roleDao.getById(id);
		po.set("tc_permit_ids", rolePermitMappingDao.getPermitIdsByRoleId(id));
		return po;
	}
	
	public List getByUserId(Map<String, Object> m)
	{
		return roleDao.getByUserId(m);
	}
}
