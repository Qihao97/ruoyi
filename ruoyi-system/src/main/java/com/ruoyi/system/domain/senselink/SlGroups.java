package com.ruoyi.system.domain.senselink;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
/**
 * 人员组信息
 *
 * @author zl
 */
public class SlGroups extends BaseEntity {

    /****group		人员组信息*****/
    /** 人员组id */
    @Excel(name = "人员组id")
    private Long id;

    /** 人员组类型 */
    @Excel(name = "人员组类型")
    private String type;

    /** 人员组名称 */
    @Excel(name = "人员组名称")
    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
