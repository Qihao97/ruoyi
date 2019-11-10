package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.senselink.SlDevice;
import com.ruoyi.system.domain.senselink.SlGroups;

import java.util.List;

/**
 * 人员组数据层
 * 
 * @author ruoyi
 */
public interface SlGroupsMapper
{

    /**
     * 通过人员组ID查询人员组
     *
     * @param id 人员组D
     * @return 人员组对象信息
     */
    public SlGroups selectGroupsById(Long id);

    /**
     * 通过人员组ID删除人员组
     *
     * @param id 角色ID
     * @return 结果
     */
    public boolean deleteGroupsById(Long id);



    /**
     * 保存或更新人员组信息
     *
     * @param slGroups 人员组信息
     * @return 结果
     */
    public int saveOrUpdateGroups(SlGroups slGroups);

    /**
     * 批量保存或更新人员组信息
     *
     * @param groupsList 人员组信息列表
     * @return 结果
     */
    public int batchSaveOrUpdateGroups(List groupsList);

}
