package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SgDormMapper;
import com.ruoyi.system.domain.SgDorm;
import com.ruoyi.system.service.ISgDormService;
import com.ruoyi.common.core.text.Convert;

/**
 * 宿舍 服务层实现
 * 
 * @author ruoyi
 * @date 2019-03-28
 */
@Service
public class SgDormServiceImpl implements ISgDormService 
{
	@Autowired
	private SgDormMapper sgDormMapper;

	/**
     * 查询宿舍信息
     * 
     * @param dormId 宿舍ID
     * @return 宿舍信息
     */
    @Override
	public SgDorm selectSgDormById(Long dormId)
	{
	    return sgDormMapper.selectSgDormById(dormId);
	}
	
	/**
     * 查询宿舍列表
     * 
     * @param sgDorm 宿舍信息
     * @return 宿舍集合
     */
	@Override
	public List<SgDorm> selectSgDormList(SgDorm sgDorm)
	{
	    return sgDormMapper.selectSgDormList(sgDorm);
	}
	
    /**
     * 新增宿舍
     * 
     * @param sgDorm 宿舍信息
     * @return 结果
     */
	@Override
	public int insertSgDorm(SgDorm sgDorm)
	{
		SgDorm info = sgDormMapper.selectSgDormById(Long.parseLong(String.valueOf(sgDorm.getParentId())));
		// 如果父节点不为"正常"状态,则不允许新增子节点
		if (!UserConstants.DEPT_NORMAL.equals(info.getStatus()))
		{
			throw new BusinessException("部门停用，不允许新增");
		}
		info.setAncestors(info.getAncestors() + "," + info.getParentId());
	    return sgDormMapper.insertSgDorm(sgDorm);
	}
	
	/**
     * 修改宿舍
     * 
     * @param sgDorm 宿舍信息
     * @return 结果
     */
	@Override
	public int updateSgDorm(SgDorm sgDorm)
	{
	    return sgDormMapper.updateSgDorm(sgDorm);
	}

	/**
	 * 查询宿舍人数
	 *
	 * @param parentId 宿舍ID
	 * @return 结果
	 */
	@Override
	public int selectDormCount(Integer parentId)
	{
		SgDorm dorm = new SgDorm();
		dorm.setParentId(parentId);
		return sgDormMapper.selectDormCount(dorm);
	}

	/**
	 * 查询部门是否存在用户
	 *
	 * @param dormId 部门ID
	 * @return 结果 true 存在 false 不存在
	 */
	@Override
	public boolean checkDormExistUser(Integer dormId)
	{
		int result = sgDormMapper.checkDormExistUser(dormId);
		return result > 0 ? true : false;
	}
	/**
     * 删除宿舍对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteSgDormByIds(String ids)
	{
		return sgDormMapper.deleteSgDormByIds(Convert.toStrArray(ids));
	}

	/**
	 * 删除宿舍对象
	 *
	 * @param dormId 需要删除的数据ID
	 * @return 结果
	 */
	@Override
	public int deleteSgDormById(Integer dormId)
	{
		return sgDormMapper.deleteSgDormById(dormId);
	}

	/**
	 * 校验部门名称是否唯一
	 *
	 * @param dorm 宿舍信息
	 * @return 结果
	 */
	@Override
	public String checkDeptNameUnique(SgDorm dorm)
	{
		Long dormId = StringUtils.isNull(dorm.getDormId()) ? -1L : dorm.getDormId();
		SgDorm info = sgDormMapper.checkDormNameUnique(dorm.getDormName(), dorm.getParentId());
		if (StringUtils.isNotNull(info) && info.getDormId().longValue() != dormId.longValue())
		{
			return UserConstants.DEPT_NAME_NOT_UNIQUE;
		}
		return UserConstants.DEPT_NAME_UNIQUE;
	}

	/**
	 * 查询宿舍管理树
	 *
	 * @param dorm 宿舍信息
	 * @return 所有宿舍信息
	 */
	@Override
	@DataScope(tableAlias = "d")
	public List<Ztree> selectDeptTree(SgDorm dorm)
	{
		List<SgDorm> dormList = sgDormMapper.selectSgDormList(dorm);
		List<Ztree> ztrees = initZtree(dormList);
		return ztrees;
	}

	/**
	 * 对象转宿舍树
	 *
	 * @param dormList 宿舍列表
	 * @return 树结构列表
	 */
	public List<Ztree> initZtree(List<SgDorm> dormList)
	{
		return initZtree(dormList, null);
	}

	/**
	 * 对象转部门树
	 *
	 * @param dormList 部门列表
	 * @param roleDeptList 角色已存在菜单列表
	 * @return 树结构列表
	 */
	public List<Ztree> initZtree(List<SgDorm> dormList, List<String> roleDeptList)
	{

		List<Ztree> ztrees = new ArrayList<Ztree>();
		boolean isCheck = StringUtils.isNotNull(roleDeptList);
		for (SgDorm dorm : dormList)
		{
			if (UserConstants.DEPT_NORMAL.equals(dorm.getStatus()))
			{
				Ztree ztree = new Ztree();
				ztree.setId(Long.parseLong(String.valueOf(dorm.getDormId())));
				ztree.setpId(Long.parseLong(String.valueOf(dorm.getParentId())));
				ztree.setName(dorm.getDormName());
				ztree.setTitle(dorm.getDormName());
				if (isCheck)
				{
					ztree.setChecked(roleDeptList.contains(dorm.getDormId() + dorm.getDormName()));
				}
				ztrees.add(ztree);
			}
		}
		return ztrees;
	}


}
