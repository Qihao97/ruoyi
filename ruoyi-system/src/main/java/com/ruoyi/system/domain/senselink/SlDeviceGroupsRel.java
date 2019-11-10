package com.ruoyi.system.domain.senselink;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备与人员组关联信息
 *
 * @author zl
 */
public class SlDeviceGroupsRel extends BaseEntity {

    /** 设备与人员组关联id */
    @Excel(name = "设备与人员组关联id")
    private Long id;

    /** 人员组id */
    @Excel(name = "人员组id")
    private Long groupid;

    /** 设备id */
    @Excel(name = "设备id")
    private Long deviceid;

    /**设备与人员组关联重复数量**/
    private int count;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getGroupid() {
        return groupid;
    }

    public void setGroupid(Long groupid) {
        this.groupid = groupid;
    }

    public Long getDeviceid() {
        return deviceid;
    }

    public void setDeviceid(Long deviceid) {
        this.deviceid = deviceid;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
