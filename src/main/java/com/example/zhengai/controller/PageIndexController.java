package com.example.zhengai.controller;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.example.zhengai.model.*;
import com.example.zhengai.service.YzControllerChartService;
import com.example.zhengai.service.YzControllerSService;
import com.example.zhengai.service.YzControllerService;
import com.example.zhengai.service.YzTargetChartSevice;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/PageIndex")
public class PageIndexController {

	@Autowired
	private YzControllerSService yzControllerService;
	
	@Autowired
	private YzTargetChartSevice yzTargertService;
	
	@Autowired
	private YzControllerService controllerService;
	
	@Autowired
	private YzControllerChartService chartService;
	
	@RequestMapping("/PageContr.do")
	public String PageContr(Model model){
		List<YzControllerS> list = yzControllerService.selectALLControllers();
		
		model.addAttribute("list", list);
		return "PageIndex/PageIndex";
	}
	
	@RequestMapping("/sava.do")
	public String sava(YzControllerS yzConTrollerS){
		SimpleDateFormat sdf = new SimpleDateFormat();
		String addTime = sdf.format(new java.util.Date());
		
		yzConTrollerS.setAddTime(addTime);
		yzConTrollerS.setIsDel(0);
		yzConTrollerS.setDelUid(0);
		
		yzControllerService.insertSelective(yzConTrollerS);
		
		return "redirect:PageContr.do";
	}
	
	@RequestMapping("/update.do")
	public String update(YzControllerS yzConTrollerS){
		SimpleDateFormat sdf = new SimpleDateFormat();
		String editTime = sdf.format(new java.util.Date());
		
		yzConTrollerS.setEditTime(editTime);
		
		yzControllerService.updateByPrimaryKeySelective(yzConTrollerS);
		
		return "redirect:PageContr.do";
	}
	
	@RequestMapping("/delete.do")
	public String delete(Integer id){
		YzControllerS yzControllerS= yzControllerService.selectByPrimaryKey(id);
		
		SimpleDateFormat sdf = new SimpleDateFormat();
		String delTime = sdf.format(new java.util.Date());
		
		yzControllerS.setDelTime(delTime);
		yzControllerS.setIsDel(1);
		
		yzControllerService.updateByPrimaryKeySelective(yzControllerS);
		
		return "redirect:PageContr.do";
	}
	
	@RequestMapping("/pageEdit.do")
	public String pageEdit(Integer id,Model model){
		List<YzController> list= controllerService.selectByAddUidPrimaryKey(id);
		model.addAttribute("pid",id);
		model.addAttribute("list", list);
		
		return "PageIndex/pageSIndex";
	}
	
	@RequestMapping("/deleteController.do")
	public String deleteController(Integer id){
		YzController controller=controllerService.selectPrimaryKey(id);
		SimpleDateFormat sdf = new SimpleDateFormat();
		String delTime = sdf.format(new java.util.Date());
		controller.setDelTime(delTime);
		controller.setIsDel(1);
		controllerService.updateByPrimaryKeySelective(controller);
		Integer sort=controller.getSort();
		return "redirect:pageEdit.do?id="+sort;
	}
	
	/**
	 * 
	* @Title: updatePage 
	* @Description: TODO(pageSIndex.jsp通过添加页面查找a.jsp) 
	* @param 2018年12月14日
	* @param id
	* @param model
	* @return
	* @throws
	 */
	@RequestMapping("/addPage.do")
	public String addPage(Integer id,Model model){
		//YzController list=controllerService.selectPrimaryKey(id);
		List<YzTargetChart> chart = yzTargertService.selectAllChart();
		model.addAttribute("chart", chart);
		model.addAttribute("pid",id);
		//model.addAttribute("list",list);
		return "PageIndex/addPage";
	}
	
	/**
	 * 
	* @Title: addSave 
	* @Description: TODO(将addPage.do 页面ajax提交的数据保存到对应数据库) 
	* @param 2018年12月18日
	* @param pid
	* @param title
	* @param is_show
	* @param controller
	* @param charts
	* @return
	* @throws
	 */
	@ResponseBody
	@RequestMapping("/addSave.do")
	public String addSave(Integer pid,String title,Integer is_show,String controller,String charts){
		YzControllerChart chart=new YzControllerChart();
		YzController yzController=new YzController();
		SimpleDateFormat sdf = new SimpleDateFormat();
		String addTime = sdf.format(new java.util.Date());
		yzController.setAddTime(addTime);
		yzController.setEditTime(addTime);
		yzController.setController(controller);
		yzController.setIsShow(is_show);
		yzController.setTitle(title);
		yzController.setSort(pid);
		yzController.setAddUid(1);
		int ret=controllerService.insertSelective(yzController);
		
		Integer y=yzController.getId();
		Map<String,Object> mapCharts=mapput(charts);
		Map<String,Object> mapController=mapput(controller);
		Map<String,Integer> map=compareMap(y,mapController, mapCharts);
		for (Entry<String, Integer> entry : map.entrySet()) {
			String key=entry.getKey().toString();
			Integer cid=(Integer) entry.getValue();
			chart.setcId(cid);
			chart.setpId(y);
			chart.setAddress(key);
			System.out.println(key +" "+ cid);
			chartService.insertSelective(chart);
		}
		String text="";
		if(ret!=0){
			text="SUCCESS";
		}else{
			text="No";
		}
		
		return text;
		
	}
	/**
	 * 
	* @Title: updatePage 
	* @Description: TODO(pageSIndex.jsp通过id查找修改页面a.jsp) 
	* @param 2018年12月14日
	* @param id
	* @param model
	* @return
	* @throws
	 */
	
	@RequestMapping("updatePage.do")
	public String updatePage(Integer id,Model model){
		Map<String, Object> charts=page(id);
		YzController list=controllerService.selectPrimaryKey(id);
		List<YzTargetChart> chart = yzTargertService.selectAllChart();
		model.addAttribute("charts", charts);
		model.addAttribute("chart", chart);
		model.addAttribute("list",list);
		return "PageIndex/updatePage";
	}
	
	
	/**
	 * 
	* @Title: addUpdate 
	* @Description: TODO(a.jsp数据提交保存) 
	* @param 2018年12月14日
	* @return
	* @throws
	 */
	@ResponseBody
	@RequestMapping("/addUpdate.do")
	public String addUpdate(Integer id,Integer pid,String title,Integer is_show,String controller,String charts){
		String text="";
		YzController yzController=new YzController();
		YzControllerChart chart=new YzControllerChart();
		SimpleDateFormat sdf = new SimpleDateFormat();
		String editTime = sdf.format(new java.util.Date());
		yzController.setId(id);
		yzController.setSort(pid);
		yzController.setEditTime(editTime);
		yzController.setTitle(title);
		yzController.setController(controller);
		yzController.setIsShow(is_show);
		int ret=controllerService.updateByPrimaryKeySelective(yzController);
	
		Map<String,Object> mapCharts=mapput(charts);
		Map<String,Object> mapController=mapput(controller);
		Map<String,Integer> map=compareMap(id,mapController, mapCharts);
		for (Entry<String, Integer> entry : map.entrySet()) {
			String key=entry.getKey().toString();
			Integer cid=(Integer) entry.getValue();
			chart.setcId(cid);
			chart.setpId(id);
			chart.setAddress(key);
			chartService.insertSelective(chart);
		}
		if(ret!=0){
			text="SUCCESS";
		}else{
			text="NO";
		}
		return text;
	
	}
	
	/**
	 * 
	* @Title: selectBoxTitle 
	* @Description: TODO(模糊查找) 
	* @param 2018年12月17日
	* @param key
	* @throws
	 *//*
	@ResponseBody
	@RequestMapping("selectBoxTitle.do")
	public List<Map<String, Object>> selectBoxTitle(String key){
		List<Map<String, Object>> list=new ArrayList<Map<String, Object>>();
		
		String title="%"+key+"%";
		List<YzTargetChart> charts=yzTargertService.selectAll(title);
		for (YzTargetChart yzTargetChart : charts) {
			Map<String, Object> map=new HashMap<String, Object>();
			String ti=yzTargetChart.getTitle();
			map.put("title",ti);
			String editTime=yzTargetChart.getEditTime();
			map.put("editTime", editTime);
			List<YzChart> user=yzTargetChart.getUserList();
			for (YzChart yzChart : user) {
				String img=yzChart.getImg();
				map.put("img", img);
				String ti1=yzChart.getTitle();
				map.put("title1",ti1);
			}
			list.add(map);
		}
		
		return list;
	}*/
	
	public Map<String, Object> page(Integer id){
		List<YzControllerChart> charts=chartService.selectYzTargetChart(id);
		YzController list=controllerService.selectPrimaryKey(id);
		Map<String, Object> map= new HashMap<String, Object>();
		String jaStr=chartStr(id);
		map.put("page",list.getController());
		map.put("id", list.getId());
		map.put("pid", list.getSort());
		map.put("chartStr", jaStr);
		//String chart="{";
		List<Map<String, Object>> a=new ArrayList<Map<String, Object>>();
		for (YzControllerChart chartOne : charts) {
			Map<String, Object> map1= new HashMap<String, Object>();
			map1.put("address",chartOne.getAddress());
			List<YzChart> cha=chartOne.getUserChart();
			for (YzChart ch : cha) {
				map1.put("img", ch.getImg());
			}
			String book=String.valueOf(chartOne.getcId());
			map1.put("c_id",book);
			a.add(map1);
			
		}
		JSONArray ja=JSONArray.fromObject(a);
		map.put("chart", ja);
		return map;
	}
	
	/**
	 * 
	* @Title: controllerUpdate 
	* @Description: TODO(将YzController数据表中controller该字段数据改成map集合.) 
	* @param 2018年12月13日
	* @param id
	* @return
	* @throws
	 */
	public  Map<String, Object>  controllerUpdate(Integer id){
		YzController con=controllerService.selectPrimaryKey(id);
		String controller=con.getController();
		String bo=controller.substring(1, controller.length()-1);
		String[] ao=bo.split("],");
		Map<String,Object> map=new HashMap<String,Object>();
		int x=1;
		for (int i = 0; i < ao.length; i++) {
			String co=ao[i];
			String da=co.substring(1, co.length());
			String[] eo=da.split(",");
			int y=1;
			for (int j = 0; j < eo.length; j++) {
				String fo="";
				if(i==ao.length-1 &&j==eo.length-1){
					fo=eo[j].substring(0, eo[j].length()-1);
				}else{
					fo=eo[j];
				}
				String ab=x+"-"+y;
				map.put(ab, fo);
				y+=1;
			}
			x+=1;
			
		}
		return map;
	}
	
	/**
	 * 
	* @Title: accessCid 
	* @Description: TODO(通过ID查询YzControllerChart数据表中access和c_id字段，生成map集合) 
	* @param 2018年12月13日
	* @param id
	* @return
	* @throws
	 */
	public Map<String,Object> accessCid(Integer id){
		Map<String,Object> map=new HashMap<String,Object>();
		List<YzControllerChart> charts=chartService.selectYzTargetChart(id);
		for (YzControllerChart yzControllerChart : charts) {
			String access=yzControllerChart.getAddress();
			String cId=yzControllerChart.getcId().toString();
			map.put(access, cId);
		}
		return map;
	}
	
	/**
	 * 
	* @Title: accesssCidController 
	* @Description: TODO(将accessCid中key与controllerUpdate中key相同进行替换) 
	* @param 2018年12月13日
	* @param id
	* @return
	* @throws
	 */
	public Map<String,Object> accesssCidController(Integer id){
		Map<String,Object> map=controllerUpdate(id);
		Map<String,Object> mapo=accessCid(id);
		Map<String,Object> map1=new HashMap<String,Object>();
		for (Entry<String, Object> entry : map.entrySet()) {
			   String key = entry.getKey().toString();
			   String value = entry.getValue().toString();
			   for (Entry<String, Object> entry1 : mapo.entrySet()) {
				   String key1=entry1.getKey().toString();
				   if(key1.equals(key)){
					   value=entry1.getValue().toString();
				   }
			   }
			   map1.put(key, value);
		}

		return map1;
	}
	
	/**
	 * 
	* @Title: chartStr 
	* @Description: TODO(将accesssCidController传出的map集合转化为String类型) 
	* @param 2018年12月13日
	* @param id
	* @return String
	* @throws
	 */
	public String chartStr(Integer id){
		Integer x=sumX(id);
		Integer[] y=sumY(id);
		String car="[";
		Map<String,Object> map=accesssCidController(id);
		  Object[] key_arr = map.keySet().toArray();   
		    Arrays.sort(key_arr);   
		    for(Object key : key_arr) {
		    	String[] a=key.toString().split("-");
		    	Integer a1=Integer.valueOf(a[0]);
		    	Integer a2=Integer.valueOf(a[1]);
		    	if(x==1){
		    		if(y[a1-1]==1){
		    			car+="["+map.get(key).toString()+"]";
		    		}else if(a2==1){
		    			car+="["+map.get(key).toString()+",";
		    		}else if(a2>1&&a2<y[a1-1]){
		    			car+=""+map.get(key).toString()+",";
		    		}else if(a2==y[a1-1]){
		    			car+=""+map.get(key).toString()+"]";
		    		}
		    	}else if(a1==1){
		    		if(y[a1-1]==1){
		    			car+="["+map.get(key).toString()+"],";
		    		}else if(a2==1){
		    			car+="["+map.get(key).toString()+",";
		    		}else if(a2>1&&a2<y[a1-1]){
		    			car+=""+map.get(key).toString()+",";
		    		}else if(a2==y[a1-1]){
		    			car+=""+map.get(key).toString()+"],";
		    		}
		    	}else if(a1>1&&a1<x){
		    		if(y[a1-1]==1){
		    			car+="["+map.get(key).toString()+"],";
		    		}else if(a2==1){
		    			car+="["+map.get(key).toString()+",";
		    		}else if(a2>1&&a2<y[a1-1]){
		    			car+=""+map.get(key).toString()+",";
		    		}else if(a2==y[a1-1]){
		    			car+=""+map.get(key).toString()+"],";
		    		}
		    	}else if(a1==x){
		    		if(y[a1-1]==1){
		    			car+="["+map.get(key).toString()+"]";
		    		}else if(a2==1){
		    			car+="["+map.get(key).toString()+",";
		    		}else if(a2>1&&a2<y[a1-1]){
		    			car+=""+map.get(key).toString()+",";
		    		}else if(a2==y[a1-1]){
		    			car+=""+map.get(key).toString()+"]";
		    		}
		    	}
		        
		    	
		    } 
		    car+="]";
		return car;
	}
	
	/**
	 * 
	* @Title: sumX 
	* @Description: TODO(将YzController 的数据表中 controller 字段 "-"前数字最大数值) 
	* @param 2018年12月14日
	* @param id
	* @return
	* @throws
	 */
	public Integer sumX(Integer id){
		YzController con=controllerService.selectPrimaryKey(id);
		String controller=con.getController();
		String bo=controller.substring(1, controller.length()-1);
		String[] ao=bo.split("],");
		Integer so=ao.length;
		return so;
	}
	
	/**
	 * 
	* @Title: sumY 
	* @Description: TODO(将YzController 的数据表中 controller 字段 "-"后数字个数) 
	* @param 2018年12月14日
	* @param id
	* @return
	* @throws
	 */
	public Integer[] sumY(Integer id){
		Integer x=sumX(id);
		YzController con=controllerService.selectPrimaryKey(id);
		String controller=con.getController();
		String bo=controller.substring(1, controller.length()-1);
		String[] ao=bo.split("],");
		Integer[] so=new Integer[x];
		for (int i = 0; i < ao.length; i++) {
			String co=ao[i];
			String da=co.substring(1, co.length());
			String[] eo=da.split(",");
			int y=eo.length;
			so[i]=y;
		}
		return so;
	}
	
	/**
	 * 
	* @Title: mapput 
	* @Description: TODO(将String类型转化为map类型) 
	* @param 2018年12月17日
	* @param chart
	* @return map
	* @throws
	 */
	public  Map<String, Object> mapput(String chart){
		String bo=chart.substring(1, chart.length()-1);
		String[] ao=bo.split("],");
		Map<String,Object> map=new HashMap<String,Object>();
		int x=1;
		for (int i = 0; i < ao.length; i++) {
			String co=ao[i];
			String da=co.substring(1, co.length());
			String[] eo=da.split(",");
			int y=1;
			for (int j = 0; j < eo.length; j++) {
				String fo="";
				if(i==ao.length-1 &&j==eo.length-1){
					fo=eo[j].substring(0, eo[j].length()-1);
				}else{
					fo=eo[j];
				}
				String ab=x+"-"+y;
				map.put(ab, fo);
				y+=1;
			}
			x+=1;
			
		}
		return map;
	}
	
	
	public Map<String, Integer> compareMap(Integer id,Map<String,Object> map,Map<String,Object> mapo){
		Map<String, Integer> map1=new HashMap<String,Integer>();
		for (Entry<String, Object> entry : map.entrySet()) {
			String key = entry.getKey().toString();
			String value = entry.getValue().toString();
			Integer id1=0;
			for (Entry<String, Object> entry1 : mapo.entrySet()) {
				String key1 = entry1.getKey().toString();
				String value1 = entry1.getValue().toString();
				if (key1.equals(key)) {
					if (value1.equals(value)) {
						if(value1.lastIndexOf("\"")==(value1.length()-1)){
							String va=value1.substring(1, value1.length()-1);
								id1= Integer.valueOf(va);
						}else{
					    id1=Integer.valueOf(value1);
					    }
						List<YzControllerChart> cList = chartService
								.selectByCidPrimaryKey(id1);
						for (YzControllerChart chart : cList) {
							String access = chart.getAddress();
							if (access.equals(key1)) {
								map1.put(key1, id1);
							}
						}
					}else{
						if(value1.lastIndexOf("\"")==(value1.length()-1)){
							String va=value1.substring(1, value1.length()-1);
								id1= Integer.valueOf(va);
						}else{
					    id1=Integer.valueOf(value1);
					    }
							map1.put(key1, id1);
					}
				}
			}
		
		}
		chartService.deleteByPrimaryKey(id);
		return map1;
	}
}
