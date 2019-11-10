package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.system.domain.SgDorm;
import java.util.List;

/**
 * 宿舍 服务层
 * 
 * @author ruoyi
 * @date 2019-03-28
 */
public interface ISgDormService 
{
	/**
     * 查询宿舍信息
     * 
     * @param dormId 宿舍ID
     * @return 宿舍信息
     */
	public SgDorm selectSgDormById(Long dormId);
	
	/**
     * 查询宿舍列表
     * 
     * @param sgDorm 宿舍信息
     * @return 宿舍集合
     */
	public List<SgDorm> selectSgDormList(SgDorm sgDorm);
	
	/**
     * 新增宿舍
     * 
     * @param sgDorm 宿舍信息
     * @return 结果
     */
	public int insertSgDorm(SgDorm sgDorm);
	
	/**
     * 修改宿舍
     * 
     * @param sgDorm 宿舍信息
     * @return 结果
     */
	public int updateSgDorm(SgDorm sgDorm);

	/**
	 * 查询宿舍人数
	 *
	 * @param parentId 父宿舍ID
	 * @return 结果
	 */
	public int selectDormCount(Integer parentId);

	/**
	 * 查询宿舍是否存在用户
	 *
	 * @param dormId 宿舍ID
	 * @return 结果 true 存在 false 不存在
	 */
	public boolean checkDormExistUser(Integer dormId);
	/**
     * 删除宿舍信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteSgDormByIds(String ids);

	/**
	 * 删除宿舍信息
	 *
	 * @param dromId 需要删除的数据ID
	 * @return 结果
	 */
	public int deleteSgDormById(Integer dromId);
	/**
	 * 校验宿舍名称是否唯一
	 *
	 * @param dorm 宿舍信息
	 * @return 结果
	 */
	public String checkDeptNameUnique(SgDorm dorm);

	/**
	 * 查询部门管理树
	 *
	 * @param dorm 宿舍信息
	 * @return 所有部门信息
	 */
	public List<Ztree> selectDeptTree(SgDorm dorm);
	
}
