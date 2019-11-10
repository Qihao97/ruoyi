package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.SgDorm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 宿舍 数据层
 * 
 * @author ruoyi
 * @date 2019-03-28
 */
public interface SgDormMapper 
{
	/**
	 * 查询宿舍人数
	 *
	 * @param dorm 宿舍信息
	 * @return 结果
	 */
	public int selectDormCount(SgDorm dorm);

	/**
	 * 查询宿舍是否存在用户
	 *
	 * @param dormId 宿舍ID
	 * @return 结果
	 */
	public int checkDormExistUser(Integer dormId);
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
     * 删除宿舍
     * 
     * @param dormId 宿舍ID
     * @return 结果
     */
	public int deleteSgDormById(Integer dormId);
	
	/**
     * 批量删除宿舍
     * 
     * @param dormIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteSgDormByIds(String[] dormIds);

	/**
	 * 校验宿舍名称是否唯一
	 *
	 * @param dormName 宿舍名称
	 * @param parentId 父部门ID
	 * @return 结果
	 */
	public SgDorm checkDormNameUnique(@Param("dormName") String dormName, @Param("parentId") Integer parentId);

}