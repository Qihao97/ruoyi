package com.ruoyi.system.service.impl;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysRole;
import com.ruoyi.system.domain.SysRoleDept;
import com.ruoyi.system.domain.SysRoleMenu;
import com.ruoyi.system.domain.senselink.SlDevice;
import com.ruoyi.system.mapper.*;
import com.ruoyi.system.service.ISlDeviceService;
import com.ruoyi.system.service.ISysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * 设备 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class SlDeviceServiceImpl implements ISlDeviceService
{
    @Autowired
    private SlDeviceMapper deviceMapper;

    /**
     * 通过设备ID查询设备
     *
     * @param id 设备D
     * @return 设备对象信息
     */
    public SlDevice selectDeviceById(Long id)
    {
        return deviceMapper.selectDeviceById(id);
    }

    /**
     * 通过设备ID删除设备
     *
     * @param id 角色ID
     * @return 结果
     */
    public boolean deleteDeviceById(Long id)
    {
        return deviceMapper.deleteDeviceById(id);
    }



    /**
     * 保存或更新设备信息
     *
     * @param slDevice 设备信息
     * @return 结果
     */
    public int saveOrUpdateDevice(SlDevice slDevice)
    {
        return deviceMapper.saveOrUpdateDevice(slDevice);
    }
    /**
     * 批量保存或更新设备信息
     *
     * @param deviceList 设备信息列表
     * @return 结果
     */
    public int batchSaveOrUpdateDevice(List deviceList)
    {
        return deviceMapper.batchSaveOrUpdateDevice(deviceList);
    }

}
