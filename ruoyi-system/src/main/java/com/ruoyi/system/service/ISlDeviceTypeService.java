package com.ruoyi.system.service;

import com.ruoyi.system.domain.senselink.SlDevice;
import com.ruoyi.system.domain.senselink.SlDeviceType;

import java.util.List;

/**
 * 设备类型业务层
 * 
 * @author ruoyi
 */
public interface ISlDeviceTypeService
{


    /**
     * 通过设备类型ID查询设备类型
     * 
     * @param id 设备类型ID
     * @return 设备类型对象信息
     */
    public SlDeviceType selectDeviceTypeById(Long id);

    /**
     * 通过设备类型ID删除设备类型
     * 
     * @param id 设备类型ID
     * @return 结果
     */
    public boolean deleteDeviceTypeById(Long id);



    /**
     * 保存或更新设备类型信息
     * 
     * @param slDeviceType 设备类型信息
     * @return 结果
     */
    public int saveOrUpdateDeviceType(SlDeviceType slDeviceType);

    /**
     * 批量保存或更新设备类型信息
     * 
     * @param deviceTypeList 设备类型信息列表
     * @return 结果
     */
    public int batchSaveOrUpdateDeviceType(List deviceTypeList);


}
