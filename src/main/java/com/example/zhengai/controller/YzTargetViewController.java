package com.example.zhengai.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.example.zhengai.model.*;
import com.example.zhengai.query.TargerSortQuery;
import com.example.zhengai.service.*;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/YzTargetView")
public class YzTargetViewController {
	
	@Autowired
	private YzTargetViewService yzTargetViewService;
	
	@Autowired
	private YzTargetSortService yzTargetSortService;
	
	@Autowired
	private YzLayerService yzLayerService;
	
	@Autowired
	private YzTargetService yzTargetService;
	
	@Autowired
	private YzTargetViewGlKeyService yzTargetViewGlKeyService;
	
	@RequestMapping("/listYzTargetView.do")
	public String listYzTargetView(Model model){
		

		List<YzLayer> layerList = yzLayerService.selectAllLayer();
		
		List<YzTargetView> list = yzTargetViewService.selectAllViewCondition(1);
		
		model.addAttribute("list", list);
		model.addAttribute("layerList", layerList);
		return "YzTargetView/Targetview";
	}
	
	
	@RequestMapping("/listYzTargetViewConditon.do")
	public String listYzTargetViewConditon(Model model,Integer sort){
		

		List<YzLayer> layerList = yzLayerService.selectAllLayer();
		
		List<YzTargetView> list = yzTargetViewService.selectAllViewCondition(sort);
		
		model.addAttribute("list", list);
		model.addAttribute("sort", sort);
		model.addAttribute("layerList", layerList);
		return "YzTargetView/Targetview";
	}
	
    
    //传递树形菜单的数据
    @RequestMapping("/listView.do")
    public String listView(Model model,Integer id,Integer sort){
    	List<YzTargetSort> selectAllPY = yzTargetSortService.selectAllPY2(sort);
    	YzTargetView yzTargetView = yzTargetViewService.selectById(id);
    	List<Map<String,Object>> list=createView(selectAllPY);
    	Map<String, Object> map = new HashMap<String, Object>(); 
    		map.put("sort", sort);
    		map.put("id", id);
    	List<YzTargetSort> selectTargetViewJoinN = yzTargetSortService.selectTargetViewJoinN(map);
    	
    	List<Map<String,Object>> listView1 = createView(selectTargetViewJoinN);
		
		//把树形菜单的数据转换成JSON数组
		JSONArray ja = JSONArray.fromObject(list); 
		JSONArray ja2 = JSONArray.fromObject(listView1); 
		
		//把JSON数据和其它数据传回前台 这里的JSON数据在前台页面可以直接用EL表达式做接受 接收到的数据类型也是JSON对象 不需要转换
		model.addAttribute("ja", ja);
		model.addAttribute("ja2", ja2);
		model.addAttribute("sort", sort);
		model.addAttribute("id", id);
		model.addAttribute("yzTargetView", yzTargetView);
    	return "YzTargetView/view";
    }
    
    
    
	
    @RequestMapping("/updateTargetView.do")
    public String updateTargetView(YzTargetView yzTargetView){
    	
    	SimpleDateFormat sdf = new SimpleDateFormat();
    	String editTime = sdf.format(new Date());
    	
    	yzTargetView.setEditTime(editTime);
    	
    	yzTargetViewService.updateTargetView(yzTargetView);
    
    	
    	return "redirect:listYzTargetView.do";
    }

    
    @RequestMapping("/deleteTargetView.do")
    public String deleteTargetView(Integer id){
    	YzTargetView yzTargetView = yzTargetViewService.selectById(id);
    	
    	SimpleDateFormat sdf = new SimpleDateFormat();
    	String delTime = sdf.format(new Date());
    	
    	yzTargetView.setDelTime(delTime);
    	yzTargetView.setIsDel(1);
    	
    	yzTargetViewService.updateTargetView(yzTargetView);
    	
    	/*RedirectView redirectView = new RedirectView("/YzTargetView/listYzTargetViewConditon.do",true,true);
    	ModelAndView mad = new ModelAndView(redirectView);
    	mad.addObject("sort", sort);*/
    	return "redirect:listYzTargetView.do";
    }
    
    
    @RequestMapping("/addTargetViewLayer.do")
    public  String addTargetViewLayer(YzTargetView yzTargetView){
    	SimpleDateFormat sdf = new SimpleDateFormat();
    	String addTime = sdf.format(new Date());
    	
    	yzTargetView.setAddTime(addTime);
    	yzTargetView.setIsDel(0);
    	
    	
    	yzTargetViewService.savaTargetView(yzTargetView);
    	
    	return "redirect:listYzTargetView.do"; 
    }
   
    
    
    
    
    @RequestMapping("/configTarget.do")
    public String configTarget(Integer id,String ids,Integer sort){
    	//先清理这个数据的中间表数据
    	yzTargetViewGlKeyService.deleteByVid(id);
    	
    	if(ids!=null && ids.length()>0 ){
    		
    		String[] idStrs = ids.split(",");
    		
    		for (int i=1;i<idStrs.length;i++){
    			String aId=idStrs[i];
    			String[] idStr=aId.split("-");
    			int a=idStr.length-1;
    			String avd=idStr[a];
    			String avid=avd.substring(0, avd.length()-1);
    			Integer intId = new Integer(avid);
    			YzTargetViewGlKey ytvg = new YzTargetViewGlKey();
    			ytvg.setvId(id);
    			ytvg.settId(intId);
    			
    			yzTargetViewGlKeyService.sava(ytvg);
    		} 
    	}
    	
    	
    	return "redirect:listView.do?id="+id+"&sort="+sort;
    
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
    
  //做一个方法 用来包装树形菜单的数据
    /* public void creatViewMap(YzTargetSort yts,List<Map<String,Object>> list ){
     	
     	if(yts != null){
     		Map<String,Object> map = new HashMap<String,Object>();
     		
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
     		
     		if(list2!=null && list2.size()>0){
     			for(TargerSortQuery tsq:list2){
     				Map<String,Object> map1 = new HashMap<String,Object>();
     				Integer id2 = tsq.getId();
     				Integer pid2 = tsq.getPid();
     				String name2 = tsq.getTitle();
     				List<YzTarget> list3 = tsq.getList();
     			
     				map1.put("id", id2);
     	    		map1.put("pId", pid2);
     	    		map1.put("name", name2);
     	    		map1.put("rlevel", 2);
     	    		map1.put("open", false);
     	    		list.add(map1);
     	    		if(list3!=null && list3.size()>0){
     	    			for(YzTarget yt:list3){
     	    				Map<String,Object> map2 = new HashMap<String,Object>();
     	    				Integer id3 = yt.getId();
     	    				String name3 = yt.getTitle();
     	    				
     	    				map2.put("id", id3);
     	    	    		map2.put("pId", id2);
     	    	    		map2.put("name", name3);
     	    	    		map2.put("rlevel", 3);
     	    	    		map2.put("open", false);
     	    	    		list.add(map2);
     	    			}
     	    		}
     			}
     		}
     		
     	}
     	
     }*/
}
