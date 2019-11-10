package com.ruoyi.system.domain.senselink;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备
 * 
 * @author zl
 */
public class Device extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long id;
    /****device_type	设备类型*****/
    private SlDeviceType device_type;

    /****device		设备信息*****/
    private SlDevice device;

    public SlDeviceType getDevice_type() {
        return device_type;
    }

    public void setDevice_type(SlDeviceType device_type) {
        this.device_type = device_type;
    }

    public SlDevice getDevice() {
        return device;
    }

    public void setDevice(SlDevice device) {
        this.device = device;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
