package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.senselink.SlDeviceGroupsRel;
import com.ruoyi.system.mapper.SlDeviceGroupsRelMapper;
import com.ruoyi.system.service.ISlDeviceGroupsRelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 设备与人员组关联业务层处理
 * 
 * @author ruoyi
 */
@Service
public class SlDeviceGroupsRelServiceImpl implements ISlDeviceGroupsRelService
{
    @Autowired
    private SlDeviceGroupsRelMapper devicegroupsrelMapper;


    @Override
    public SlDeviceGroupsRel selectDeviceGroupsRelById(Long id) {
        return devicegroupsrelMapper.selectDeviceGroupsRelById(id);
    }

    @Override
    public List<SlDeviceGroupsRel> selectDeviceGroupsRelList(SlDeviceGroupsRel slDeviceGroupsRel) {
        return devicegroupsrelMapper.selectDeviceGroupsRelList(slDeviceGroupsRel);
    }

    @Override
    public boolean deleteDeviceGroupsRelById(Long id) {
        return devicegroupsrelMapper.deleteDeviceGroupsRelById(id);
    }

    @Override
    public int saveOrUpdateDeviceGroupsRel(SlDeviceGroupsRel slDeviceGroupsRel) {
        return devicegroupsrelMapper.saveOrUpdateDeviceGroupsRel(slDeviceGroupsRel);
    }
}
