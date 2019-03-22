package com.example.zhengai.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.zhengai.model.*;
import com.example.zhengai.query.YzTargetSortTitleAndId;
import com.example.zhengai.service.*;
import net.sf.json.JSONArray;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;



@Controller
@RequestMapping("/YzTargetSort1")
public class YzTargetSortController1 {
	
	
	@Autowired
	private YzTargetSortService yzTargetSortService;
	@Autowired
	private YzTargetService yzTargetService;
	@Autowired
	private YzDatasService yzDatasService;
	@Autowired
	private YzNoticeService yzNoticeService;
	@Autowired
	private YzDatasFormulaService yzDatasFormulaService;
	@Autowired
	private YzTargetChartSevice chartSevice;
	@Autowired
	private YzChartSService service;
	@Autowired
	private YzChartSearchService searchService;
	@Autowired
	private YzDicService yzDicService;
	@Autowired
	private YzTargetChartSearchService chartSearchService;
	@Autowired
	private YzControllerService controllerService;
	@Autowired
	private YzControllerChartService chartService1;
	@Autowired
	private YzChartService yzChartService;
	
	
	//********************************************************************************************************************************************
	@RequestMapping("/listYzTargetSort.do")
	public String listYzTargetSort1(Model model, Integer sort ){
		
		///查出所有一级数据
		List<YzTargetSort> list = yzTargetSortService.selectAllPY(sort);
		
		List<YzTargetSort> alist = new ArrayList<YzTargetSort>();
		//遍历查上来的数据
				for(int i = 0; i<list.size(); i++){
					
					//或得到每一个父节点
					YzTargetSort yzTargetSort = list.get(i); 
					
					//获得到父节点的ID
					Integer id = yzTargetSort.getId();
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("id", id);
					map.put("sort", sort);
					YzTargetSort selectAllJoin = yzTargetSortService.selectAllJoin(map);
						
						alist.add(selectAllJoin);
			 }
				
		//把title查出来 放到前台去方便回显
		/*List<String> pTitel = yzTargetSortService.selectPTitel();*/
		List<String> cTitel = yzTargetSortService.selectCTitel();
		List<YzTargetSortTitleAndId> pTitel = yzTargetSortService.selectTitleAndIdP(sort);
		List<YzDatas> datas=yzDatasService.selectByTitle();
		List<String> li=new ArrayList<String>();
		for (YzDatas yzDatas : datas) {
			String title=yzDatas.getTitle();
			li.add(title);
		}
		JSONArray ja=JSONArray.fromObject(li);
		// 把数据都放到前台
		model.addAttribute("datas", ja);
		 model.addAttribute("alist", alist);
		 model.addAttribute("pTitel", pTitel);
		 model.addAttribute("cTitel", cTitel);
		 model.addAttribute("sort", sort);
		return "YzElement/index";
	}
	
	@RequestMapping("/delectYzTarget.do")
	public String delectYzTarget(Integer id,Integer tid,Integer sort){
		YzTargetChart chart=new YzTargetChart();
		chart.setId(id);
		chart.setIsDel(1);
		chartSevice.updateByPrimaryKeySelective(chart);
		return "redirect:configChart.do?id="+tid+"&sort="+sort;
	}
	
	
	//删除  这里不是真的删除 只是修改isDel属性  以及update日期等信息 数据并没有真的删除 只是不再显示在前端 数据库仍然有数据
		@RequestMapping("/delete.do")
		public ModelAndView delete(Integer id,Integer sort){
			
			//根据前台传过来的id查询出这个对应的数据
			YzTarget yzTarget = yzTargetService.selectById(id);
			//获得当前时间为删除时间   
			SimpleDateFormat std = new SimpleDateFormat();
			String delDate = std.format(new Date());
			//把当前时间设置给数据
			yzTarget.setDelTime(delDate);
			//设置删除标志  这里认为isDel值是1的时候 表示这个数据被删除 ，默认是0
			yzTarget.setIsDel(1);
			yzTarget.setDelUid(1);
			
			//这里要带着值做重定向 所以要用到redirectView， 把sort的值带到要指向的方法上去
			RedirectView redirectView = new RedirectView("/YzTargetSort1/listYzTargetSort.do", true, true);
	        ModelAndView mav = new ModelAndView(redirectView);
	        mav.addObject("sort", sort);
			
			//修改要删除的数据  修改后 此数据就不在前端显示了
	        yzTargetService.updateTarget(yzTarget);
			//改完之后指定主页面跳转刷新
			
					return mav;
		}
	
	@ResponseBody
	@RequestMapping("/getLevelTwo.do")
	public List<YzTargetSortTitleAndId> getLevelTwo(Integer id){
		List<YzTargetSortTitleAndId> list = yzTargetSortService.selectTitleAndIdLevelTwo(id);
		
		return list;
	}
	
	
	//修改...................................................
	@RequestMapping("/update.do")
	public ModelAndView update(Integer levelOneId,Integer levelTwoId,String ptitle,String ctitle,YzTarget yzTarget,String dataTitle,Integer dataId,Integer sort){
		//根据前台传过来的一级指标的ID 查询出这个数据
		YzTargetSort levelOneYzTargetSort = yzTargetSortService.selectById(levelOneId);
		//把要修改的数据设置上去
		levelOneYzTargetSort.setTitle(ptitle);
		
		SimpleDateFormat sdf = new SimpleDateFormat(); 
		String updataTime = sdf.format(new Date());    //获得当前时间的字符串格式内容
		
		levelOneYzTargetSort.setEditTime(updataTime);
		//保存修改好的数据到数据库
		yzTargetSortService.updateTarget(levelOneYzTargetSort);
		
		
		//根据前台传过来的二级指标的ID 查询出这个数据
		YzTargetSort levelTwoYzTargetSort = yzTargetSortService.selectById(levelTwoId);
		levelTwoYzTargetSort.setTitle(ptitle);
		levelTwoYzTargetSort.setEditTime(updataTime);
		//保存修改好的数据到数据库
		yzTargetSortService.updateTarget(levelTwoYzTargetSort);
		
		 
		//设置yzTarget数据的修改时间
		yzTarget.setEditTime(updataTime);
		//修改数据
		yzTargetService.updateTarget(yzTarget);
		
		//查出yzdatas对应的数据    并修改title
		YzDatas yzDatas = yzDatasService.selectByPrimaryKey(dataId);
		  if(yzDatas!= null){
			  yzDatas.setTitle(dataTitle);
			  
			//保存修改的数据
				yzDatasService.update(yzDatas);
		  }
		
		
		
		//这里要带着值做重定向 所以要用到redirectView， 把sort的值带到要指向的方法上去
				RedirectView redirectView = new RedirectView("/YzTargetSort1/listYzTargetSort.do", true, true);
		        ModelAndView mav = new ModelAndView(redirectView);
		        mav.addObject("sort", sort);
				
				//改完之后指定主页面跳转刷新
				return mav;
		
	}
	
	
	/*
	 * 
	 * 这里是保存指标的方法内容 由于涉及到数据的多级保存(目前使用的Mybatis框架不支持级联保存) 所以需要一级一级作保存：
	 *     先保存一级指标数据，再根据返回的一级指标的ID保存自关联下的  二级指标 并把一级指标的主键设置给二级指标的Pid
	 *     然后返回刚刚保存的二级指标的id  然后把一级指标和二级指标的ID分别设置给yzTarget对象   并设置YzTarget基本属性后   
	 *     再new一个datas对象 把后台传过来的datasTltle设置给datas 插入这个datas数据到数据库 并把返回的datas主键 和传上来的datasTitle设置给TzTarget对象
	 *     最后再保存YzTarget   
	 *      保存一级——>保存二级——>设置3级——>保存4级——>保存3级
	 * 
	 */
	
	@RequestMapping("/sava.do")
	public ModelAndView sava(String levelOneQueryTitle,String levelTwoQueryTitle,YzTarget yzTarget,String datasTitle,	Integer sort){
		//设置添加的一级指标的基本属性
		YzTargetSort yzTargetSort = new YzTargetSort();
		yzTargetSort.setTitle(levelOneQueryTitle);
		yzTargetSort.setPid(0);
		yzTargetSort.setUpdateSort(1);
		yzTargetSort.setSort(1);
		
		SimpleDateFormat sdf = new SimpleDateFormat(); 
		String updataTime = sdf.format(new Date());    //获得当前时间的字符串格式内容
		
		yzTargetSort.setAddTime(updataTime);
		yzTargetSort.setAddUid(1);
		yzTargetSort.setIsDel(0);
		yzTargetSort.setEditUid(0);
		
		//把一级指标插入到数据库
		yzTargetSortService.savaYzTargetSort(yzTargetSort);
		Integer yzTargetSortId = yzTargetSort.getId();
		
		//给二级指标设置相应的基本属性
		YzTargetSort yzTargetSort2 = new YzTargetSort();
		yzTargetSort2.setTitle(levelTwoQueryTitle);
		yzTargetSort2.setPid(yzTargetSortId);     //把一级指标的主键设置给二级指标的Pid
		yzTargetSort2.setUpdateSort(1);
		yzTargetSort2.setSort(1);
		
		SimpleDateFormat sdf1 = new SimpleDateFormat();    
		String updataTime2 = sdf1.format(new Date());     //获得当前时间的字符串格式内容
		
		yzTargetSort2.setAddTime(updataTime2);
		yzTargetSort2.setAddUid(1);
		yzTargetSort2.setIsDel(0);
		//插入二级指标
		yzTargetSortService.savaYzTargetSort(yzTargetSort2);
		
		//获得刚插入的二级指标的ID
		Integer levelTwoId = yzTargetSort2.getId();
		
		//设置yzTarget数据的基本属性
		yzTarget.setsOne(yzTargetSortId);
		yzTarget.setsTwo(levelTwoId);
		yzTarget.setSort(1);
		yzTarget.setAddUid(1);
		
		SimpleDateFormat sdf2 = new SimpleDateFormat();    
		String updataTime3= sdf2.format(new Date());  //获得当前时间的字符串格式内容 
		yzTarget.setAddTime(updataTime3);
		yzTarget.setIsDel(0);
		
		//设置Tzdatas对象的剧本属性
		YzDatas yzDatas = new YzDatas();
		yzDatas.setTitle(datasTitle);    //这个title数据就是前台传过来的数据
		
		//插入这条yzDatas数据到数据库
		yzDatasService.sava(yzDatas);
		//获得刚刚插入的这条数据的主键
		Integer yzDatasId = yzDatas.getId();
		
		yzTarget.setDataId(yzDatasId);
		yzTarget.setDataTitle(datasTitle);
		
		
		//把yzTarget对象数据插入数据库
		yzTargetService.savaTarget(yzTarget);
		
		RedirectView redirectView = new RedirectView("/YzTargetSort1/listYzTargetSort.do",true,true);
		ModelAndView mav = new ModelAndView(redirectView);
		mav.addObject("sort", sort);
		return mav;
		
	}
	
	@RequestMapping("/configNotice.do")
	public String configNotice(Integer id,Integer sort,Model model){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("sort", sort);
		List<YzNotice> list = yzNoticeService.selectJoinTarget(map);
		
		model.addAttribute("list", list);
		model.addAttribute("sort", sort);
		model.addAttribute("id", id);
		
		return "YzTarget/index";
	}
	
	@RequestMapping("/updataNotice.do")
	public ModelAndView updataNotice(YzNotice yzNotice, Integer sort, Integer rid){
		SimpleDateFormat sdf = new SimpleDateFormat();
		 String editTime = sdf.format(new Date());
		 yzNotice.setEditTime(editTime);
		
		
		yzNoticeService.updataNotice(yzNotice);
		
		RedirectView redirectView = new RedirectView("/YzTargetSort1/configNotice.do",true,true);
		ModelAndView mav = new ModelAndView(redirectView);
		mav.addObject("id", rid);
		mav.addObject("sort", sort);
		
		return mav;
	}
	
	@RequestMapping("/deleteNotice.do")
	public ModelAndView deleteNotice(Integer sort,Integer rid,Integer id){
		SimpleDateFormat sdf = new SimpleDateFormat();
		 String delTime = sdf.format(new Date());
		
		YzNotice yzNotice = yzNoticeService.selectById(id);
		yzNotice.setIsDel(1);
		yzNotice.setDelTime(delTime);
		
		yzNoticeService.updataNotice(yzNotice);
		
		RedirectView redirectView = new RedirectView("/YzTargetSort1/configNotice.do",true,true);
		ModelAndView mav = new ModelAndView(redirectView);
		mav.addObject("id", rid);
		mav.addObject("sort", sort);
		return mav;
	}
	
	@RequestMapping("/addNotice.do")
	public ModelAndView addNotice(YzNotice yzNotice,Integer sort,Integer rid){
		SimpleDateFormat sdf = new SimpleDateFormat();
		 String addTime = sdf.format(new Date());
		 yzNotice.setAddTime(addTime);
		 yzNotice.setSort(sort);
		 yzNotice.setPid(rid);
		  
		 yzNoticeService.savaNotice(yzNotice);
		 
		 RedirectView redirectView = new RedirectView("/YzTargetSort1/configNotice.do",true,true);
			ModelAndView mav = new ModelAndView(redirectView);
			mav.addObject("id", rid);
			mav.addObject("sort", sort);
			
			return mav;
		}
	
	
	//图表设置跳转的方法 
	@RequestMapping("/configChart.do")
	public String configChart(Integer id,Integer sort,Model model){
		List<YzTargetChart> chart=chartSevice.selectAllByTid(id);
		model.addAttribute("chart", chart);
		model.addAttribute("id", id);
		model.addAttribute("sort", sort);
		return "/Adminchart/index";
	}
	
	//页面配置要跳转的方法
	
	@RequestMapping("/pageConfig.do")
	public String pageConfig(Integer id,Integer sort){
		String ad="";
		YzController controller=controllerService.selectAllChartTid(id);
		if(controller==null){
			ad="redirect:addPage.do?id="+id+"&sort="+sort;
		}else{
			ad="redirect:updatePage.do?id="+id+"&sort="+sort;
		}
		return ad;
	}
	
	
	@RequestMapping("/addPage.do")
	public String addPage(Integer id,Integer sort,Model model){
		List<YzTargetChart> chart=chartSevice.selectAllByTid(id);
		YzTarget target=yzTargetService.selectById(id);
		model.addAttribute("sort", sort);
		model.addAttribute("title",target.getTitle());
		model.addAttribute("pid",id);
		model.addAttribute("chart", chart);
		return "Adminchart/page";
	}
	
	@ResponseBody
	@RequestMapping("/savePage.do")
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
		yzController.settId(pid);
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
			chartService1.insertSelective(chart);
		}
		String text="";
		if(ret!=0){
			text="SUCCESS";
		}else{
			text="No";
		}
		
		return text;
		
	}
	
	@RequestMapping("/updatePage.do")
	public String updatePage(Integer id,Integer sort,Model model){
		List<YzTargetChart> chart=chartSevice.selectAllByTid(id);
		YzController controller=controllerService.selectAllChartTid(id);
		Map<String,Object> map=page(controller.getId());
		model.addAttribute("pid", id);
		model.addAttribute("sort", sort);
		model.addAttribute("charts", map);
		model.addAttribute("chart", chart);
		return "Adminchart/updatePage";
	}
	
	@ResponseBody
	@RequestMapping("/addUpdate.do")
	public String addUpdate(Integer id,Integer pid,String title,Integer is_show,String controller,String charts){
		String text="";
		YzController yzController=new YzController();
		YzControllerChart chart=new YzControllerChart();
		SimpleDateFormat sdf = new SimpleDateFormat();
		String editTime = sdf.format(new java.util.Date());
		yzController.setId(id);
		yzController.settId(pid);
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
			chartService1.insertSelective(chart);
		}
		if(ret!=0){
			text="SUCCESS";
		}else{
			text="NO";
		}
		return text;
	
	}
	//添加图表跳转的方法
	
	@RequestMapping("/addChart.do")
	public String addChart(Integer id,Integer tid,Integer sort,Model model){
		if(id==null){
			id=0;
		}else{
			YzTargetChart chart=chartSevice.selectByPrimaryKey(id);
			Integer ca=chart.getChart();
			YzChart chart2=yzChartService.selectByPrimaryKey(ca);
			YzChartS chartS=service.selectByChartId(chart.getChart());
			YzTargetChartSearch sean=chartSearchService.selectByTcId(id);
			model.addAttribute("sean", sean);
			model.addAttribute("chartS", chartS);
			model.addAttribute("chart", chart);
			model.addAttribute("img", chart2);
		}
		List<YzDic> dic=yzDicService.selectAllDatas();
		List<Map<String,Object>> list=chartSearch();
		List<YzChartS> ch=service.selectByPidAndSort();
		List<YzChartSearch> search=searchService.selectAllSearch();
		JSONArray sea=JSONArray.fromObject(list);
		model.addAttribute("id", id);
		model.addAttribute("tid",tid);
		model.addAttribute("sort",sort);
		model.addAttribute("dic",dic);
		model.addAttribute("sea",sea);
		model.addAttribute("ch", ch);
		model.addAttribute("search", search);
		return "Adminchart/add";
	}
	
	
	@RequestMapping("/save.do")
	public String save(Integer idone,Integer t_id,String title,String box_title,String box_con,Integer select,Integer data,Integer chart,Integer sort,String value){
		if(idone==0){
			addSave(t_id, title, box_title, box_con, select, data, chart, sort, value);
		}else{
			addUpdate(idone, t_id, title, box_title, box_con, select, data, chart, sort, value);
		}
		return "redirect:configChart.do?id="+t_id+"&sort="+sort;
	}
	
	
	//做公式设置的方法  
	@RequestMapping("/setEdit.do")
	public String setEdit(Integer id,Model model,HttpServletRequest req, HttpServletResponse resp){
		//设置编码格式
		resp.setCharacterEncoding("UTF-8");
		try {
			req.setCharacterEncoding("UTF-8");
		
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		resp.setContentType("text/html;charset=utf-8");
		
		YzDatas yzDatas = yzDatasService.selectByPrimaryKey(id);
		YzDatasFormula yzDatasFormula = yzDatasFormulaService.selectById(id);
		
		List<String> list =new ArrayList<String>();
		if(yzDatasFormula!=null){
			String formulas = yzDatasFormula.getFormula();
			String[] formula = formulas.split(",");
			for(String dt:formula){
				if(dt =="➕" || dt.equals("➕")){
					dt="+";
				}
				list.add(dt);
			}
			//list = Arrays.asList(formula);
		}
		
		JSONArray ja = JSONArray.fromObject(list);
		model.addAttribute("id", id);
		model.addAttribute("ja", ja);
		model.addAttribute("yzDatas", yzDatas);
		/*return "YzElement/setEdit";*/
		return "YzElement/jisuanqi";
	}
	@RequestMapping("/setEdit1.do")
	public String setEdit1(Integer id,Model model,HttpServletRequest req, HttpServletResponse resp){
		//设置编码格式
		resp.setCharacterEncoding("UTF-8");
		try {
			req.setCharacterEncoding("UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		resp.setContentType("text/html;charset=utf-8");
		
		YzDatas yzDatas = yzDatasService.selectByPrimaryKey(id);
		YzDatasFormula yzDatasFormula = yzDatasFormulaService.selectById(id);
		
		List<String> list =new ArrayList<String>();
		if(yzDatasFormula!=null){
			String formulas = yzDatasFormula.getFormula();
			String[] formula = formulas.split(",");
			for(String dt:formula){
				if(dt =="➕" || dt.equals("➕")){
					dt="+";
				}
				list.add(dt);
			}
			//list = Arrays.asList(formula);
		}
		
		JSONArray ja = JSONArray.fromObject(list);
		model.addAttribute("id", id);
		model.addAttribute("ja", ja);
		model.addAttribute("yzDatas", yzDatas);
		/*return "YzElement/setEdit";*/
		return "YzElement/setEdit";
	}
	
	
    //ajax做公式查询的方法
	@ResponseBody
	@RequestMapping("/selectDatas.do")
	public Map<String,Object> selectDatas(String keyword){
		
		List<YzDatas> datas = yzDatasService.selectDatas(keyword);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("code",0);
		map.put("msg","成功");
		map.put("data", datas);
		
		
		return map;
	}

	
	@RequestMapping("/savaFormula.do")
	public ModelAndView savaFormula(String gs,String zb,HttpServletRequest req, HttpServletResponse resp){
		if(StringUtils.isNotEmpty(gs)){
    		try {
    			gs=URLDecoder.decode(gs,"utf-8");
    			} catch (UnsupportedEncodingException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}

		}
		yzDatasFormulaService.deleteById(new Integer(zb));
		YzDatasFormula ydf = new YzDatasFormula();
		
		SimpleDateFormat sdf =new SimpleDateFormat();
		String addTime = sdf.format(new Date());
		
		ydf.setDatasId(new Integer(zb));
		ydf.setAddTime(addTime);
		ydf.setFormula(gs);
		
		yzDatasFormulaService.savaYzDatasFormula(ydf);
		
		RedirectView redirectView = new RedirectView("/YzTargetSort1/setEdit.do",true,true);
		ModelAndView mav = new ModelAndView(redirectView);
		mav.addObject("id", new Integer(zb));
		
		return mav;
	}
	
	public List<Map<String,Object>> chartSearch(){
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
	
		List<YzChartSearch> search=searchService.selectAllChart();
		for (YzChartSearch yzChartSearch : search) {
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("id", yzChartSearch.getId());
			map.put("title", yzChartSearch.getTitle());
			map.put("remark",yzChartSearch.getRemark());
			List<String> map1=new ArrayList<String>();
			List<YzChartSearchS> chartS=yzChartSearch.getChild();
			
			for (YzChartSearchS yzChartSearchS : chartS) {
				map1.add(yzChartSearchS.getTitle());
			}
			map.put("child", map1);
			list.add(map);
		}
		return list;
	}

	public void addSave(Integer t_id,String title,String box_title,String box_con,Integer select,Integer data,Integer chart,Integer sort,String value){
		YzTargetChart targetChart=new YzTargetChart();
		targetChart.settId(t_id);
		targetChart.setTitle(title);
		targetChart.setBoxTitle(box_title);
		targetChart.setBoxCon(box_con);
		targetChart.setSelect(select);
		targetChart.setData(data);
		targetChart.setChart(chart);
		SimpleDateFormat sdf = new SimpleDateFormat();
		String addTime = sdf.format(new java.util.Date());
		targetChart.setAddTime(addTime);
		targetChart.setEditTime(addTime);
		chartSevice.insertSelective(targetChart);
		Integer id=targetChart.getId();
		YzTargetChartSearch sea=new YzTargetChartSearch();
		sea.setTcId(id);
		sea.setTi(value);
		chartSearchService.insertSelective(sea);
	}
	
	public void addUpdate(Integer idone,Integer t_id,String title,String box_title,String box_con,Integer select,Integer data,Integer chart,Integer sort,String value){
		YzTargetChart targetChart=new YzTargetChart();
		targetChart.setId(idone);
		targetChart.settId(t_id);
		targetChart.setTitle(title);
		targetChart.setBoxTitle(box_title);
		targetChart.setBoxCon(box_con);
		targetChart.setSelect(select);
		targetChart.setData(data);
		targetChart.setChart(chart);
		SimpleDateFormat sdf = new SimpleDateFormat();
		String addTime = sdf.format(new java.util.Date());
		targetChart.setEditTime(addTime);
		chartSevice.updateByPrimaryKeySelective(targetChart);
		if(value==null){
			value="";
		}
		YzTargetChartSearch sea=new YzTargetChartSearch();
		sea.setTcId(idone);
		sea.setTi(value);
		chartSearchService.updateByPrimaryKey(sea);
	}
	

	public Map<String, Object> page(Integer id){
		List<YzControllerChart> charts=chartService1.selectYzTargetChart(id);
		YzController list=controllerService.selectPrimaryKey(id);
		Map<String, Object> map= new HashMap<String, Object>();
		String jaStr=chartStr(id);
		map.put("page",list.getController());
		map.put("id", list.getId());
		map.put("pid", list.gettId());
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
						List<YzControllerChart> cList = chartService1
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
		chartService1.deleteByPrimaryKey(id);
		return map1;
	}
	
	public Integer sumX(Integer id){
		YzController con=controllerService.selectPrimaryKey(id);
		String controller=con.getController();
		String bo=controller.substring(1, controller.length()-1);
		String[] ao=bo.split("],");
		Integer so=ao.length;
		return so;
	}
	
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
	public Map<String,Object> accessCid(Integer id){
		Map<String,Object> map=new HashMap<String,Object>();
		List<YzControllerChart> charts=chartService1.selectYzTargetChart(id);
		for (YzControllerChart yzControllerChart : charts) {
			String access=yzControllerChart.getAddress();
			String cId=yzControllerChart.getcId().toString();
			map.put(access, cId);
		}
		return map;
	}
}

