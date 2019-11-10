package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.senselink.SlDeviceGroupsRel;
import com.ruoyi.system.domain.senselink.SlGroups;

import java.util.List;

/**
 * 设备与人员组关联数据层
 * 
 * @author ruoyi
 */
public interface SlDeviceGroupsRelMapper
{

    /**
     * 通过设备与人员组关联ID查询设备与人员组关联
     *
     * @param id 设备与人员组关联D
     * @return 设备与人员组关联对象信息
     */
    public SlDeviceGroupsRel selectDeviceGroupsRelById(Long id);


    /**
     * 通过设备ID、人员组ID查询
     * @param slDeviceGroupsRel
     * @return 设备与人员组关联列表
     */
    public List<SlDeviceGroupsRel> selectDeviceGroupsRelList(SlDeviceGroupsRel slDeviceGroupsRel);


    /**
     * 通过设备与人员组关联ID删除设备与人员组关联
     *
     * @param id ID
     * @return 结果
     */
    public boolean deleteDeviceGroupsRelById(Long id);



    /**
     * 保存或更新设备与人员组关联信息
     *
     * @param slDeviceGroupsRel 设备与人员组关联信息
     * @return 结果
     */
    public int saveOrUpdateDeviceGroupsRel(SlDeviceGroupsRel slDeviceGroupsRel);



}
