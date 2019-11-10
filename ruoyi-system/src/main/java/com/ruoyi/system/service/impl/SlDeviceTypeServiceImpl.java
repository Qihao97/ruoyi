package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.senselink.SlDevice;
import com.ruoyi.system.domain.senselink.SlDeviceType;
import com.ruoyi.system.mapper.SlDeviceMapper;
import com.ruoyi.system.mapper.SlDeviceTypeMapper;
import com.ruoyi.system.service.ISlDeviceService;
import com.ruoyi.system.service.ISlDeviceTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 设备类型业务层处理
 * 
 * @author zl
 */
@Service
public class SlDeviceTypeServiceImpl implements ISlDeviceTypeService
{
    @Autowired
    private SlDeviceTypeMapper deviceTypeMapper;

    /**
     * 通过设备ID查询设备
     *
     * @param id 设备D
     * @return 设备对象信息
     */
    public SlDeviceType selectDeviceTypeById(Long id)
    {
        return deviceTypeMapper.selectDeviceTypeById(id);
    }

    /**
     * 通过设备ID删除设备
     *
     * @param id 角色ID
     * @return 结果
     */
    public boolean deleteDeviceTypeById(Long id)
    {
        return deviceTypeMapper.deleteDeviceTypeById(id);
    }



    /**
     * 保存或更新设备信息
     *
     * @param slDeviceType 设备信息
     * @return 结果
     */
    public int saveOrUpdateDeviceType(SlDeviceType slDeviceType)
    {
        return deviceTypeMapper.saveOrUpdateDeviceType(slDeviceType);
    }
    /**
     * 批量保存或更新设备信息
     *
     * @param deviceTypeList 设备信息列表
     * @return 结果
     */
    public int batchSaveOrUpdateDeviceType(List deviceTypeList)
    {
        return deviceTypeMapper.batchSaveOrUpdateDeviceType(deviceTypeList);
    }

}
