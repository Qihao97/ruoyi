package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.senselink.SlDevice;
import com.ruoyi.system.domain.senselink.SlGroups;
import com.ruoyi.system.mapper.SlDeviceMapper;
import com.ruoyi.system.mapper.SlGroupsMapper;
import com.ruoyi.system.service.ISlDeviceService;
import com.ruoyi.system.service.ISlGroupsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 人员组业务层处理
 * 
 * @author ruoyi
 */
@Service
public class SlGroupsServiceImpl implements ISlGroupsService
{
    @Autowired
    private SlGroupsMapper groupsMapper;

    /**
     * 通过人员组ID查询人员组
     *
     * @param id 人员组D
     * @return 人员组对象信息
     */
    public SlGroups selectGroupsById(Long id)
    {
        return groupsMapper.selectGroupsById(id);
    }

    /**
     * 通过人员组ID删除人员组
     *
     * @param id 角色ID
     * @return 结果
     */
    public boolean deleteGroupsById(Long id)
    {
        return groupsMapper.deleteGroupsById(id);
    }



    /**
     * 保存或更新人员组信息
     *
     * @param slGroups 人员组信息
     * @return 结果
     */
    public int saveOrUpdateGroups(SlGroups slGroups)
    {
        return groupsMapper.saveOrUpdateGroups(slGroups);
    }
    /**
     * 批量保存或更新人员组信息
     *
     * @param groupsList 人员组信息列表
     * @return 结果
     */
    public int batchSaveOrUpdateGroups(List groupsList)
    {
        return groupsMapper.batchSaveOrUpdateGroups(groupsList);
    }

}
