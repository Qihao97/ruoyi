package com.ruoyi.system.domain.senselink;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 设备信息
 * 
 * @author zl
 */
public class SlDevice extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /****device		设备信息*****/
    /** 设备id */
    @Excel(name = "设备id")
    private Long id;

    /** 设备sn号 */
    @Excel(name = "设备sn号")
    private String sn;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String name;

    /** 设备方向 */
    @Excel(name = "设备方向")
    private int direction;

    /** 设备位置 */
    @Excel(name = "设备位置")
    private String location;

    /** 设备ip */
    @Excel(name = "设备ip")
    private String ip;

    /** 设备在线状态 */
    @Excel(name = "设备在线状态")
    private int status;


    /** 设备绑定了的人员组 */
    @Excel(name = "设备绑定了的人员组")
    private List<SlGroups> groups;



    /** 假删除标志，1代表未删除，0代表已删除 */
    @Excel(name = "假删除标志", readConverterExp = "0=已删除,1=未删除")
    private int active;


    /** 设备类型id */
    @Excel(name = "设备类型id")
    private Long type_id;


    /** 设备描述 */
    @Excel(name = "设备描述")
    private String description;


    /** 软件版本号 */
    @Excel(name = "软件版本号")
    private String software_version;


    /** 设备信息 */
    @Excel(name = "设备信息")
    private String info;

    /** 公司id */
    @Excel(name = "公司id")
    private Long company_id;


    /** 设备绑定的人员组数量 */
    @Excel(name = "设备绑定的人员组数量")
    private int group_count;


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

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDirection() {
        return direction;
    }

    public void setDirection(int direction) {
        this.direction = direction;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<SlGroups> getGroups() {
        return groups;
    }

    public void setGroups(List<SlGroups> groups) {
        this.groups = groups;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public Long getType_id() {
        return type_id;
    }

    public void setType_id(Long type_id) {
        this.type_id = type_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSoftware_version() {
        return software_version;
    }

    public void setSoftware_version(String software_version) {
        this.software_version = software_version;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Long getCompany_id() {
        return company_id;
    }

    public void setCompany_id(Long company_id) {
        this.company_id = company_id;
    }

    public int getGroup_count() {
        return group_count;
    }

    public void setGroup_count(int group_count) {
        this.group_count = group_count;
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
