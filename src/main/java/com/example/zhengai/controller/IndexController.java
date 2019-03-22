package com.example.zhengai.controller;


import com.example.zhengai.model.YzControllerChart;
import com.example.zhengai.model.YzControllerS;
import com.example.zhengai.model.YzTargetSort;
import com.example.zhengai.service.YzControllerChartService;
import com.example.zhengai.service.YzControllerSService;
import com.example.zhengai.service.YzTargetSortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/Index")
public class IndexController {
	@Autowired
	private YzControllerSService yzControllerService;
	
	
	@Autowired
	private YzControllerChartService chartService;
	 
	@Autowired
	private YzTargetSortService yzTargetSortService;
	
	
	/*@Autowired
	private YzTargetChartSevice yzchartSevice;*/
	
	@RequestMapping("/left.do")
	public String left(Model model){
		List<YzControllerS> show_list = yzControllerService.selectAll();
		model.addAttribute("show_list", show_list);
		return "Public/left";
	}
	@RequestMapping("/show.do")
	public String show(Integer id,Model model){
		List<YzControllerChart> controllers=chartService.selectYzTargetChart(id);
		model.addAttribute("controllers", controllers);
		return "show";
	}
	
	@ResponseBody
	@RequestMapping("/listYzTargerSort.do")
	public JSONArray listYzTargerSort(Integer sort){
		List<YzTargetSort> yzTargetSortList = yzTargetSortService.selectAllPY(sort);
		JSONArray ja = JSONArray.fromObject(yzTargetSortList);
		return ja;
	}
}
