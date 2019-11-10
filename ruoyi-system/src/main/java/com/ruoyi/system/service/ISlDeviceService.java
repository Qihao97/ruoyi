package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysRole;
import com.ruoyi.system.domain.senselink.SlDevice;

import java.util.List;
import java.util.Set;

/**
 * 设备业务层
 * 
 * @author ruoyi
 */
public interface ISlDeviceService
{


    /**
     * 通过设备ID查询设备
     * 
     * @param id 设备D
     * @return 设备对象信息
     */
    public SlDevice selectDeviceById(Long id);

    /**
     * 通过设备ID删除设备
     * 
     * @param id 角色ID
     * @return 结果
     */
    public boolean deleteDeviceById(Long id);



    /**
     * 保存或更新设备信息
     * 
     * @param slDevice 设备信息
     * @return 结果
     */
    public int saveOrUpdateDevice(SlDevice slDevice);

    /**
     * 批量保存或更新设备信息
     * 
     * @param deviceList 设备信息列表
     * @return 结果
     */
    public int batchSaveOrUpdateDevice(List deviceList);


}
