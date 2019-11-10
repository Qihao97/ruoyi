package com.ruoyi.senselink.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.SgDorm;
import com.ruoyi.system.domain.SysRole;
import com.ruoyi.system.domain.senselink.Device;
import com.ruoyi.system.domain.senselink.SlDeviceGroupsRel;
import com.ruoyi.system.domain.senselink.SlGroups;
import com.ruoyi.system.service.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.List;

import static com.alibaba.druid.util.Utils.md5;

/**
 * 设备管理操作处理
 * 
 * @author zl
 * @date 2019-8-28
 */
@Controller
@RequestMapping("/senselink/device")
public class Deviceroller extends BaseController
{
    private String prefix = "device";

    // SenseLink平台API地址
	String slprefix = "http://122.114.11.209/api/v1";
	// 时间戳
	String timestamp =  String.valueOf(new Date().getTime());
	// 应用密钥（AppKey和AppSecret）
	String appSecret = "794e09b6b48d3d9ee2574ae24e8a1bac"; // AppSecret
	String appkey="89fdc8d2f11500fb";	// app_key

	List<Device> deviceList = null;
	
	@Autowired
	private ISlDeviceService slDeviceService;
	@Autowired
	private ISlDeviceTypeService slDeviceTypeService;
	@Autowired
	private ISlGroupsService groupsService;
	@Autowired
	private ISlDeviceGroupsRelService devicegroupsrelService;
	
	@RequiresPermissions("senselink:device:view")
	@GetMapping()
	public String device()
	{

		return prefix + "/list";
	}

	@RequiresPermissions("senselink:device:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Device device)
	{

		//startPage();
		PageDomain pageDomain = TableSupport.buildPageRequest();
		Integer pageNum = pageDomain.getPageNum();
		Integer pageSize = pageDomain.getPageSize();


		// md5转换
		String hash = md5(timestamp + "#" + appSecret);
		// 发起http请求并获取设备列表，json格式
		JsonObject jsonObject = getXpath(slprefix + "/device?page=" + pageNum + "&size=" + pageSize + "&app_key=" + appkey + "&sign=" + hash + "&timestamp=" + timestamp);

		// 开始解析json格式数据，转化为对象list
		if(jsonObject != null)
		{
			// 返回执行代码
			int code =  jsonObject.get("code").getAsInt();
			// 返回执行消息
			String message = jsonObject.get("message").getAsString();
			// 数据返回成功
			if(code == 200 && "OK".equals(message))
			{
				// 返回查询数据
				JsonObject jsonData0 = jsonObject.get("data").getAsJsonObject();
				int total = jsonData0.get("total").getAsInt();
				int pageNum1 = jsonData0.get("pageNum").getAsInt();
				int size = jsonData0.get("size").getAsInt();
				int totalPage = jsonData0.get("totalPage").getAsInt();

				String jsonDataStr = jsonData0.get("data").toString();

				// 使用GSON方法解析JSON数据，转换为javabean
				Gson gson = new Gson();
				// 转换为Device
				deviceList = gson.fromJson(jsonDataStr,new TypeToken<List<Device>>(){}.getType());

				if(deviceList != null)
				{
					for (Device device1: deviceList)
					{
						// 把设备ID赋值给设备外层结构，便于在页面上处理
						device1.setId(device1.getDevice().getId());
						// 保存设备信息
						slDeviceService.saveOrUpdateDevice(device1.getDevice());
						// 保存设备类型信息
						slDeviceTypeService.saveOrUpdateDeviceType(device1.getDevice_type());
						// 人员组
						List<SlGroups> groupsList = device1.getDevice().getGroups();
						if(groupsList != null)
						{
							for(SlGroups group : groupsList)
							{
								// 人员组
								groupsService.saveOrUpdateGroups(group);
								// 设备与人员组关联
								SlDeviceGroupsRel devicegroupsrel = new SlDeviceGroupsRel();
								devicegroupsrel.setGroupid(group.getId());
								devicegroupsrel.setDeviceid(device1.getDevice().getId());
								devicegroupsrelService.saveOrUpdateDeviceGroupsRel(devicegroupsrel);

							}
						}
					}
				}

			}

		}
		return getDataTable(deviceList);
	}

	/**
	 * 发起http请求并获取结果
	 * @param requestUrl 请求地址
	 */
	public  JsonObject getXpath(String requestUrl){
		String res="";
		JsonObject object = null;
		StringBuffer buffer = new StringBuffer();
		try{
			URL url = new URL(requestUrl);
			HttpURLConnection urlCon= (HttpURLConnection)url.openConnection();
			if(200==urlCon.getResponseCode()){
				InputStream is = urlCon.getInputStream();
				InputStreamReader isr = new InputStreamReader(is,"utf-8");
				BufferedReader br = new BufferedReader(isr);

				String str = null;
				while((str = br.readLine())!=null){
					buffer.append(str);
				}
				br.close();
				isr.close();
				is.close();
				res = buffer.toString();
				// 将获得的String对象转为JSON格式
				JsonParser parse = new JsonParser();
				object = (JsonObject) parse.parse(res);
			}
		}catch(IOException e){
			e.printStackTrace();
		}
		return object;
	}

	public  JsonObject postDownloadJson(String path,String post){
		URL url = null;
		try {
			url = new URL(path);
			HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
			httpURLConnection.setRequestMethod("POST");// 提交模式
			// conn.setConnectTimeout(10000);//连接超时 单位毫秒
			// conn.setReadTimeout(2000);//读取超时 单位毫秒
			// 发送POST请求必须设置如下两行
			httpURLConnection.setDoOutput(true);
			httpURLConnection.setDoInput(true);
			// 获取URLConnection对象对应的输出流
			PrintWriter printWriter = new PrintWriter(httpURLConnection.getOutputStream());
			// 发送请求参数
			printWriter.write(post);//post的参数 xx=xx&yy=yy
			// flush输出流的缓冲
			printWriter.flush();
			//开始获取数据
			BufferedInputStream bis = new BufferedInputStream(httpURLConnection.getInputStream());
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			int len;
			byte[] arr = new byte[1024];
			while((len=bis.read(arr))!= -1){
				bos.write(arr,0,len);
				bos.flush();
			}
			bos.close();
			JsonParser parse = new JsonParser();
			return (JsonObject)parse.parse(bos.toString("utf-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	/**
	 * 修改设备
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, ModelMap mmap)
	{
		// 如果从senseLink平台获取的设备列表不为空，则遍历获取要修改的设备信息
		if(deviceList != null)
		{
			for (Device device:	deviceList )
			{
				if(device.getId() == id)
				{
					// 存入ModelMap，在前台页面显示
					mmap.put("device", device);
				}
			}

		}
		return prefix + "/edit";
	}

	/**
	 * 修改保存设备信息
	 */
	@GetMapping("/setDevice/{id}")
	public String setDevice(@PathVariable("id") Long id, ModelMap mmap)
	{
//		mmap.put("role", roleService.selectRoleById(roleId));
		return prefix + "/edit";
	}

	/**
	 * 修改设备
	 */
	@GetMapping("/setPass/{id}")
	public String setPass(@PathVariable("id") Long id, ModelMap mmap)
	{
//		mmap.put("role", roleService.selectRoleById(roleId));
		return prefix + "/edit";
	}

	/**
	 * 修改设备
	 */
	@GetMapping("/setAttendance/{id}")
	public String setAttendance(@PathVariable("id") Long id, ModelMap mmap)
	{
//		mmap.put("role", roleService.selectRoleById(roleId));
		return prefix + "/edit";
	}

	
	
	/**
	 * 导出宿舍列表
	 */
	@RequiresPermissions("sg:dorm:export")
    @PostMapping("/export")
    @ResponseBody
//    public AjaxResult export(SgDorm sgDorm)
//    {
//    	List<SgDorm> list = sgDormService.selectSgDormList(sgDorm);
//        ExcelUtil<SgDorm> util = new ExcelUtil<SgDorm>(SgDorm.class);
//        return util.exportExcel(list, "sgDorm");
//    }
	
	/**
	 * 新增宿舍
	 */
	@GetMapping("/add/{parentId}")
	public String add(@PathVariable("parentId") Long parentId, ModelMap mmap)
	{
		//mmap.put("dorm", sgDormService.selectSgDormById(parentId));
		return prefix + "/add";
	}
	
	/**
	 * 新增保存宿舍
	 */
//	@RequiresPermissions("sg:dorm:add")
//	@Log(title = "宿舍", businessType = BusinessType.INSERT)
//	@PostMapping("/add")
//	@ResponseBody
//	public AjaxResult addSave(SgDorm sgDorm)
//	{
//		sgDorm.setCreateBy(ShiroUtils.getLoginName());
//		return toAjax(sgDormService.insertSgDorm(sgDorm));
//	}

	/**
	 * 修改宿舍
	 */
//	@GetMapping("/edit/{dormId}")
//	public String edit(@PathVariable("dormId") Long dormId, ModelMap mmap)
//	{
//		SgDorm sgDorm = sgDormService.selectSgDormById(dormId);
//		if (StringUtils.isNotNull(sgDorm) && 100L == dormId)
//		{
//			sgDorm.setParentName("无");
//		}
//		mmap.put("dorm", sgDorm);
//	    return prefix + "/edit";
//	}
	
	/**
	 * 修改保存宿舍
	 */
//	@RequiresPermissions("sg:dorm:edit")
//	@Log(title = "宿舍", businessType = BusinessType.UPDATE)
//	@PostMapping("/edit")
//	@ResponseBody
//	public AjaxResult editSave(SgDorm sgDorm)
//	{
//		sgDorm.setUpdateBy(ShiroUtils.getLoginName());
//		return toAjax(sgDormService.updateSgDorm(sgDorm));
//	}
	
	/**
	 * 删除宿舍
	 */
//	@RequiresPermissions("sg:dorm:remove")
//	@Log(title = "宿舍", businessType = BusinessType.DELETE)
//	@PostMapping( "/remove/{deptId}")
//	@ResponseBody
//	public AjaxResult remove(@PathVariable("deptId") Integer dormId)
//	{
//		if (sgDormService.selectDormCount(dormId) > 0)
//		{
//			return error(1, "存在下级宿舍,不允许删除");
//		}
//		if (sgDormService.checkDormExistUser(dormId))
//		{
//			return error(1, "宿舍存在用户,不允许删除");
//		}
//		return toAjax(sgDormService.deleteSgDormById(dormId));
//	}

	/**
	 * 校验宿舍名称
	 */
//	@PostMapping("/checkDormNameUnique")
//	@ResponseBody
//	public String checkDeptNameUnique(SgDorm dorm)
//	{
//		return sgDormService.checkDeptNameUnique(dorm);
//	}

	/**
	 * 选择宿舍树
	 */
//	@GetMapping("/selectDormTree/{dormId}")
//	public String selectDeptTree(@PathVariable("dormId") Long dormId, ModelMap mmap)
//	{
//		mmap.put("dorm", sgDormService.selectSgDormById(dormId));
//		return prefix + "/tree";
//	}

	/**
	 * 加载部门列表树
	 */
//	@GetMapping("/treeData")
//	@ResponseBody
//	public List<Ztree> treeData()
//	{
//		List<Ztree> ztrees = sgDormService.selectDeptTree(new SgDorm());
//		return ztrees;
//	}

}
