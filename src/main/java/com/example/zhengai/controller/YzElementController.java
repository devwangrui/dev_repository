package com.example.zhengai.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;

import com.example.zhengai.model.*;
import com.example.zhengai.query.TargerSortQuery;
import com.example.zhengai.query.YzElementQuery;
import com.example.zhengai.service.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.zhengai.utils.Page;
import net.sf.json.JSONArray;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/YzElement")
public class YzElementController {

	@Autowired
	private YzElementService YzElementService;

	@Autowired
	private YzTargetSortService yzTargetSortService;

	@Autowired
	private YzElementTargetsortService yzElementTargetsortService;
	
	@Autowired
	private YzTargetViewService yzTargetViewService;
	
	@Autowired
	private YzElementViewService viewService;

	@RequestMapping("/listYzElement.do")
	public String listPort(Model model, Integer sort,Integer pageNo) {
		
		if(pageNo==null||pageNo==0){
			pageNo=1;
		}
		
		Page page = YzElementService.creatPage(pageNo, sort);

		model.addAttribute("page", page);
		model.addAttribute("sort", sort);
		return "YzElement/Eindex";
	}

	
	@RequestMapping("/listElement.do")
	public String listElement(Model model) {
		List<YzElement> alist = YzElementService.selectAllJoin();

		model.addAttribute("alist", alist);

		return "YzElement/index";
	}

	// 添加二级和三级指标的方法
	@RequestMapping("/savaLevelTwo.do")
	public String sava(YzElement yzElement, Integer elementId) {

		YzElement yzElementP = YzElementService.selectById(elementId);
		Integer sort = yzElementP.getSort();
		yzElement.setPid(elementId);

		SimpleDateFormat sdf = new SimpleDateFormat();
		String addTime = sdf.format(new Date());

		yzElement.setAddTime(addTime);
		yzElement.setIsDel(0);
		yzElement.setPidSort(sort);

		YzElementService.sava(yzElement);

		return "redirect:listElementIndex.do";
	}

	// 添加一级指标的方法
	@RequestMapping("/savaLevelOne.do")
	public String savaLevelOne(YzElement yzElement) {

		SimpleDateFormat sdf = new SimpleDateFormat();
		String addTime = sdf.format(new Date());

		yzElement.setAddTime(addTime);
		yzElement.setIsDel(0);
		yzElement.setPid(0);

		YzElementService.sava(yzElement);

		return "redirect:listElementIndex.do";
	}

	@RequestMapping("/delete.do")
	public String delete(Integer id) {

		YzElement yzElement = YzElementService.selectById(id);

		yzElement.setIsDel(1);
		Integer pid = yzElement.getPid();

		if (pid == 0) {
			YzElementService.updateYzElement(yzElement);
			YzElement yzElement2 = YzElementService.selectOneJoin(id);
			List<YzElementQuery> list = yzElement2.getList();
			
			if (list != null) {
				for (YzElementQuery yzElementQuery : list) {
					yzElementQuery.setIsDel(1);
					YzElement y2 = (YzElement) yzElementQuery;
					YzElementService.updateYzElement(y2);

					List<YzElementQuery> list2 = y2.getList();

					if (list2 != null) {
						for (YzElementQuery yzElementQuery2 : list2) {
							yzElementQuery2.setIsDel(1);
							YzElement y3 = (YzElement) yzElementQuery2;

							YzElementService.updateYzElement(y3);
						}
					}
				}
			}

		}else {
			YzElementService.updateYzElement(yzElement);
		}

		return "redirect:listElementIndex.do";
	}
	
	@RequestMapping("/update.do")
	public String update(Integer id,String name) {
		if(StringUtils.isNotEmpty(name)){
    		try {
    			name=URLDecoder.decode(name,"utf-8");
    			} catch (UnsupportedEncodingException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}

		}
	
		YzElement element=new YzElement();
		
		element.setTitle(name);
		element.setId(id);
		YzElementService.updateYzElement(element);
		
		return "redirect:listElementIndex.do";
	}

	/*
	    * 
	    */
	@RequestMapping("/listElementIndex.do")
	public String listElementIndex(Model model) {

		List<YzElement> alist = YzElementService.selectAllJoin();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		for (YzElement yzElement : alist) {
			creatViewMap(yzElement, list);

		}

		JSONArray ja = JSONArray.fromObject(list);
		model.addAttribute("ja", ja);
		return "YzElement/ElementIndex";
	}

	// 做一个方法 用来包装YzElement树形菜单的数据
	public void creatViewMap(YzElement yts, List<Map<String, Object>> list) {

		if (yts != null) {
			Map<String, Object> map = new HashMap<String, Object>();

			Integer id = yts.getId();
			Integer pid = yts.getPid();
			String name = yts.getTitle();
			List<YzElementQuery> list2 = yts.getList();
			map.put("id", id);
			map.put("pId", pid);
			map.put("name", name);
			map.put("open", false);

			list.add(map);
			if (list2 != null && list2.size() > 0) {
				for (YzElementQuery tsq : list2) {
					Map<String, Object> map1 = new HashMap<String, Object>();
					Integer id2 = tsq.getId();
					Integer pid2 = tsq.getPid();
					String name2 = tsq.getTitle();
					List<YzElementQuery> list3 = tsq.getList();

					map1.put("id", id2);
					map1.put("pId", pid2);
					map1.put("name", name2);
					map1.put("open", false);
					list.add(map1);
					if (list3 != null && list3.size() > 0) {
						for (YzElementQuery yt : list3) {
							Map<String, Object> map2 = new HashMap<String, Object>();
							Integer id3 = yt.getId();
							String name3 = yt.getTitle();

							map2.put("id", id3);
							map2.put("pId", id2);
							map2.put("name", name3);
							map2.put("open", false);
							list.add(map2);
						}
					}
				}
			}
		}
	}

	@RequestMapping("/configTemplete.do")
	public String configTemplete(Integer id,Integer sort,Model model) {
		List<YzTargetView> list = yzTargetViewService.selectAllA(sort);
		YzElement vi=YzElementService.selectAllView(id);
		if(vi==null){
			for (YzTargetView yz : list) {
				yz.setJuge(0);
			}
		}else {
			List<YzTargetView> alist=vi.getUserTarget();
			for (YzTargetView yz : list) {
				int id1=yz.getId().intValue();
				for (YzTargetView view : alist) {
					int id2=view.getId().intValue();
					if(id2==id1 ){
						yz.setJuge(1);
					}
				}
			}
		}
		
		model.addAttribute("list",list);
		model.addAttribute("id",id);
		model.addAttribute("sort",sort);
		return "YzElement/ElementAdd";
	}

	@RequestMapping("/addConfig.do")
	public String addConfig(Integer id,String juge,Integer sort){
		
		if(id!=null){
			viewService.deleteByPrimaryKeyEid(id);
		}
		String vids=juge.substring(0, juge.length()-1);
		 String[] strs=vids.split(",");
		 for (String str : strs) {
			YzElementViewKey key=new YzElementViewKey();
			Integer vid=Integer.valueOf(str);
			key.setvId(vid);
			key.seteId(id);
			viewService.insertSelective(key);
		}
		return "redirect:configTemplete.do?id="+id+"&sort="+sort;
	}
	@RequestMapping("/configElementTarget.do")
	public String configElementTarget(Integer id, String ids, Integer sort) {

		yzElementTargetsortService.deleteByElementId(id);
		if(ids!=null && ids.length()>0 ){
    		
    		String[] idStrs = ids.split(",");
    		
    		for (int i=1;i<idStrs.length;i++){
    			String aId=idStrs[i];
    			String[] idStr=aId.split("-");
    			int a=idStr.length-1;
    			String avd=idStr[a];
    			String avid=avd.substring(0, avd.length()-1);
    			Integer intId = new Integer(avid);
    			YzElementTargetsort yet = new YzElementTargetsort(); // 新建一个中间表数据对象
				// 把新数据赋值给它
				// 并作保存

    			yet.setElementId(id);
    			yet.setTargetsortId(intId);

    			yzElementTargetsortService.savaElementTarget(yet);
    		} 
    	}
    	
		return "redirect:configTarget.do?sort="+sort+"&id="+id;

	}

	@RequestMapping("/configTarget.do")
	public String configTarget(Model model, Integer sort, Integer id) {
		List<YzTargetSort> levels = yzTargetSortService.selectLevels(sort);
    	List<Map<String,Object>> list=createView(levels);
    	Map<String, Object> map = new HashMap<String, Object>(); // 把前台传回来的2个数据封装到map集合中
    	// 方便传多个值使用
    	map.put("sort", sort);
    	map.put("id", id);
    	List<YzTargetSort> elist = yzTargetSortService.selectJoinElement(map);
    	List<Map<String,Object>> listView1 = createView(elist);
		
		//把树形菜单的数据转换成JSON数组
		JSONArray ja = JSONArray.fromObject(list); 
		JSONArray ja2 = JSONArray.fromObject(listView1); 
		
		//把JSON数据和其它数据传回前台 这里的JSON数据在前台页面可以直接用EL表达式做接受 接收到的数据类型也是JSON对象 不需要转换
		model.addAttribute("ja", ja);
		model.addAttribute("ja2", ja2);
		model.addAttribute("sort", sort);
		model.addAttribute("id", id);
		return "YzElement/target";
	}
	
	

	/*// 做一个方法 用来包装YzTargetSort树形菜单的数据
	public void creatTargetMap(YzTargetSort yts, List<Map<String, Object>> list) {

		if (yts != null) {
			Map<String, Object> map = new HashMap<String, Object>();

			Integer id = yts.getId();
			Integer pid = yts.getPid();
			String name = yts.getTitle();
			List<TargerSortQuery> list2 = yts.getList();
			map.put("id", id);
			map.put("pId", pid);
			map.put("name", name);
			map.put("rlevel", 1);

			map.put("open", false);

			list.add(map);
			if (list2 != null && list2.size() > 0) {
				for (TargerSortQuery tsq : list2) {
					Map<String, Object> map1 = new HashMap<String, Object>();
					Integer id2 = tsq.getId();
					Integer pid2 = tsq.getPid();
					String name2 = tsq.getTitle();
					List<YzTarget> list3 = tsq.getList();

					map1.put("id", id2);
					map1.put("pId", pid2);
					map1.put("name", name2);
					map1.put("open", false);
					map1.put("rlevel", 2);
					list.add(map1);
					if (list3 != null && list3.size() > 0) {
						for (YzTarget yt : list3) {
							Map<String, Object> map2 = new HashMap<String, Object>();
							Integer id3 = yt.getId();
							String name3 = yt.getTitle();

							map2.put("id", id3);
							map2.put("pId", id2);
							map2.put("name", name3);
							map2.put("open", false);
							map2.put("rlevel", 3);
							list.add(map2);
						}
					}
				}
			}

		}

	}*/

	@RequestMapping("/selectCondition.do")
	public String selectCondition(String title, Integer sort, Model model,Integer pageNo) {
		
		
		if(pageNo==null||pageNo==0){
			pageNo=1;
		}
		Page page = YzElementService.creatPageCondition(pageNo, sort, title);

		model.addAttribute("page", page);
		model.addAttribute("sort", sort);
		return "YzElement/Eindex";
	}
	 public List<Map<String,Object>> createView(List<YzTargetSort> selectAllPY){
	    	List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
	    	for (YzTargetSort node:selectAllPY) {
				if(node!=null){
					Map<String,Object> map=new HashMap<String,Object>();
					Integer i=node.getId();
					String ai=node.getId()+"-"+i;
					Integer pid=node.getPid();
					String remark=node.getTitle();
					List<TargerSortQuery> no=node.getList();
					map.put("id", ai);
					map.put("pId", pid);
					map.put("name", remark);
					map.put("rlevel", 1);
					
					list.add(map);
					if(no!=null &&no.size()>0){
						for (TargerSortQuery node1 : no) {
							Map<String,Object> map1=new HashMap<String,Object>();
							Integer b=node1.getId();
							String id1=i+"-"+b+"-"+node1.getId();
							String pid1=i+"-"+node1.getPid();
							String remark1=node1.getTitle();
							List<YzTarget> no1=node1.getList();
							map1.put("rlevel", 2);
						
							map1.put("id", id1);
							map1.put("pId", pid1);
							map1.put("name", remark1);
							
							list.add(map1);
							if(no1!=null &&no1.size()>0){
								for (YzTarget node2 : no1) {
									Map<String,Object> map2=new HashMap<String,Object>();
									String id2=i+"-"+b+"-"+node2.getId()+"-"+node2.getId();
									String pid2=i+"-"+b+"-"+node2.getsTwo();
									String remark2=node2.getTitle();
									map2.put("id", id2);
									map2.put("pId", pid2);
									map2.put("name", remark2);

									map2.put("rlevel", 3);
									list.add(map2);
								}
							}
						}
					}
				
				}
				}
			return list;
			}
}
