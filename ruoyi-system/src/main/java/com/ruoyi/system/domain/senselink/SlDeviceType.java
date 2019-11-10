package com.ruoyi.system.domain.senselink;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 设备类型
 * 
 * @author zl
 */
public class SlDeviceType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /****device_type	设备类型*****/


    /** 设备类型ID */
    @Excel(name = "设备类型ID")
    private Long id;

    /** 设备类型名称 */
    @Excel(name = "设备类型名称")
    private String name;

    /** 设备类型标识（简称） */
    @Excel(name = "设备类型标识")
    private String identifier;

    /** 设备类型描述 */
    @Excel(name = "设备类型描述")
    private String description;

    /** 创建时间 */
    @Excel(name = "创建时间")
    private String create_at;

    /** 更新时间 */
    @Excel(name = "更新时间")
    private String update_at;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreate_at() {
        return create_at;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }

    public String getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(String update_at) {
        this.update_at = update_at;
    }
}
