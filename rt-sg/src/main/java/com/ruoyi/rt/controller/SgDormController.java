package com.ruoyi.rt.controller;

import java.util.List;

import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.util.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SgDorm;
import com.ruoyi.system.service.ISgDormService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 宿舍 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-03-28
 */
@Controller
@RequestMapping("/sg/dorm")
public class SgDormController extends BaseController
{
    private String prefix = "dorm";
	
	@Autowired
	private ISgDormService sgDormService;
	
	@RequiresPermissions("sg:dorm:view")
	@GetMapping()
	public String dorm()
	{
		return prefix + "/dorm";
	}
	
	/**
	 * 查询宿舍列表
	 */
	@RequiresPermissions("sg:dorm:list")
	@GetMapping("/list")
	@ResponseBody
	public  List<SgDorm> list(SgDorm sgDorm)
	{
        List<SgDorm> dromList = sgDormService.selectSgDormList(sgDorm);
		return dromList;
	}
	
	
	/**
	 * 导出宿舍列表
	 */
	@RequiresPermissions("sg:dorm:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SgDorm sgDorm)
    {
    	List<SgDorm> list = sgDormService.selectSgDormList(sgDorm);
        ExcelUtil<SgDorm> util = new ExcelUtil<SgDorm>(SgDorm.class);
        return util.exportExcel(list, "sgDorm");
    }
	
	/**
	 * 新增宿舍
	 */
	@GetMapping("/add/{parentId}")
	public String add(@PathVariable("parentId") Long parentId, ModelMap mmap)
	{
		mmap.put("dorm", sgDormService.selectSgDormById(parentId));
		return prefix + "/add";
	}
	
	/**
	 * 新增保存宿舍
	 */
	@RequiresPermissions("sg:dorm:add")
	@Log(title = "宿舍", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(SgDorm sgDorm)
	{		
		sgDorm.setCreateBy(ShiroUtils.getLoginName());
		return toAjax(sgDormService.insertSgDorm(sgDorm));
	}

	/**
	 * 修改宿舍
	 */
	@GetMapping("/edit/{dormId}")
	public String edit(@PathVariable("dormId") Long dormId, ModelMap mmap)
	{
		SgDorm sgDorm = sgDormService.selectSgDormById(dormId);
		if (StringUtils.isNotNull(sgDorm) && 100L == dormId)
		{
			sgDorm.setParentName("无");
		}
		mmap.put("dorm", sgDorm);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存宿舍
	 */
	@RequiresPermissions("sg:dorm:edit")
	@Log(title = "宿舍", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(SgDorm sgDorm)
	{
		sgDorm.setUpdateBy(ShiroUtils.getLoginName());
		return toAjax(sgDormService.updateSgDorm(sgDorm));
	}
	
	/**
	 * 删除宿舍
	 */
	@RequiresPermissions("sg:dorm:remove")
	@Log(title = "宿舍", businessType = BusinessType.DELETE)
	@PostMapping( "/remove/{deptId}")
	@ResponseBody
	public AjaxResult remove(@PathVariable("deptId") Integer dormId)
	{
		if (sgDormService.selectDormCount(dormId) > 0)
		{
			return error(1, "存在下级宿舍,不允许删除");
		}
		if (sgDormService.checkDormExistUser(dormId))
		{
			return error(1, "宿舍存在用户,不允许删除");
		}
		return toAjax(sgDormService.deleteSgDormById(dormId));
	}

	/**
	 * 校验宿舍名称
	 */
	@PostMapping("/checkDormNameUnique")
	@ResponseBody
	public String checkDeptNameUnique(SgDorm dorm)
	{
		return sgDormService.checkDeptNameUnique(dorm);
	}

	/**
	 * 选择宿舍树
	 */
	@GetMapping("/selectDormTree/{dormId}")
	public String selectDeptTree(@PathVariable("dormId") Long dormId, ModelMap mmap)
	{
		mmap.put("dorm", sgDormService.selectSgDormById(dormId));
		return prefix + "/tree";
	}

	/**
	 * 加载部门列表树
	 */
	@GetMapping("/treeData")
	@ResponseBody
	public List<Ztree> treeData()
	{
		List<Ztree> ztrees = sgDormService.selectDeptTree(new SgDorm());
		return ztrees;
	}

}
