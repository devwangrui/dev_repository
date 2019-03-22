package com.example.zhengai.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.example.zhengai.model.YzTargetSort;
import com.example.zhengai.service.YzTargetSortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;




@Controller
@RequestMapping("/YzTargetSort")
public class YzTargetSortController {
	
	/*private Integer id;*/
	//http://zhengai.ityazhi.com/login/login_check/username/admin
	//http://localhost:8080/zhengai-11.10/YzTargetSort/listYzTargetSort.do
	@Autowired
	private YzTargetSortService yzTargetSortService;
	
	
	
	//做修改数据的方法 
	@RequestMapping("/update.do")
	public ModelAndView update(YzTargetSort yzTargetSort, Integer sort){
		SimpleDateFormat sdf = new SimpleDateFormat();
		String date = sdf.format(new Date());
		
		yzTargetSort.setEditTime(date);
		//传入对象 ，修改数据
		yzTargetSortService.updateTarget(yzTargetSort);
		
		//这里要带着值做重定向 所以要用到redirectView， 把sort的值带到要指向的方法上去
		RedirectView redirectView = new RedirectView("/YzTargetSort/listYzTargetSort.do", true, true);
        ModelAndView mav = new ModelAndView(redirectView);
        mav.addObject("sort", sort);
		
		//改完之后指定主页面跳转刷新
		return mav;
	}
	
	
	//根据ID做数据删除   并不是真的删除 而是把他的delUid再改成1  表示删除标志  默认是空   1表示此数据已删除
	@RequestMapping("/delete.do")
	public ModelAndView delete(Integer id){
		//先查出这个数据
		YzTargetSort yzTargetSort = yzTargetSortService.selectById(id);
		
		Integer sort = yzTargetSort.getSort();
		
		//设置delUidzhi改成1
		yzTargetSort.setIsDel(1);
		
		SimpleDateFormat sdf = new SimpleDateFormat();
		String date = sdf.format(new Date());
		yzTargetSort.setDelTime(date);
		yzTargetSort.setIsDel(1);
		
		//修改数据库对应的这个数据
		yzTargetSortService.updateTarget(yzTargetSort);
		

		RedirectView redirectView = new RedirectView("/YzTargetSort/listYzTargetSort.do",true,true);
		ModelAndView mav = new ModelAndView(redirectView);
		mav.addObject("sort", sort);
		
		
		return mav;
				
	}
	
	
	
	
	@RequestMapping("/listYzTargetSort.do")
	public String listYzTargetSort(Model model, Integer sort ){
		List<YzTargetSort> alist = yzTargetSortService.selectAllPY(sort);
		
		 model.addAttribute("alist", alist);
		 model.addAttribute("sort", sort);
		return "YzTarget/s_index";
	}
	
	
	
	
	@RequestMapping("/getUpdateId.do")
	public String getUpdateId(Integer id,Model model){
		YzTargetSort yzTargetSort = yzTargetSortService.selectById(id);
		
		model.addAttribute("yzTargetSort", yzTargetSort);
		
		return "update1";
	}
	
	
	
	
	/*
	//            添加二级
   */	
	@RequestMapping("/savaYzTargetSort.do")
		public ModelAndView savaYzTargetSort(YzTargetSort yzTargetSort,Integer sort){
			SimpleDateFormat sdf = new SimpleDateFormat();
			String date = sdf.format(new Date());
			
			yzTargetSort.setAddTime(date);
			yzTargetSort.setIsDel(0);
			yzTargetSort.setEditUid(0);
			yzTargetSort.setSort(sort);
			
			yzTargetSortService.savaYzTargetSort(yzTargetSort);
			
			RedirectView redirectView = new RedirectView("/YzTargetSort/listYzTargetSort.do",true,true);
			ModelAndView mav = new ModelAndView(redirectView);
			mav.addObject("sort", sort);
			
			return mav;
		}
		
		
		
		/*
		 *  添加一级数据
		 */
		@RequestMapping("/sava.do")
		public ModelAndView sava(YzTargetSort yzTargetSort, Integer sort){
			
			SimpleDateFormat sdf = new SimpleDateFormat();
			String date = sdf.format(new Date());
			
			yzTargetSort.setAddTime(date);
			yzTargetSort.setIsDel(0);
			yzTargetSort.setSort(sort);
			yzTargetSort.setPid(0);
			
			yzTargetSortService.savaYzTargetSort(yzTargetSort);
			
			RedirectView redirectView = new RedirectView("/YzTargetSort/listYzTargetSort.do",true,true);
			ModelAndView mav = new ModelAndView(redirectView);
			mav.addObject("sort", sort);
			
			
			return mav;
			
		}
		
	
}
