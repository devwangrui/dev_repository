package com.example.zhengai.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.example.zhengai.model.YzTarget;
import com.example.zhengai.model.YzTargetSort;
import com.example.zhengai.service.YzTargetService;
import com.example.zhengai.service.YzTargetSortService;
import com.example.zhengai.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/YzTarget")
public class YzTargetController {
	
	private Integer id;
	@Autowired
	private YzTargetService yzTargetService;
	
	@Autowired
	private YzTargetSortService yzTargetSortService;
	
	//用于主页面现实所有数据
	@RequestMapping("/listTarget.do")
	public String listTarget(Model model, YzTarget yzTarget, YzTargetSort yzTargetSort){
		//查出主表数据集合
		List<YzTarget> tList = yzTargetService.selectAllTarget();
		//做一个空集合 以存放指定了表与表关系的数据集合
		List<YzTarget> alist = new ArrayList<YzTarget>();
		for(int i=0;i<tList.size();i++){
			//获得每一个主表数据
			YzTarget yzTarget1 = tList.get(i);
			//获得主表的每个主键
			Integer id2 = yzTarget1.getId();
			//根据主键查出子表对应的数据
			List<YzTargetSort> list1 = yzTargetSortService.selectByPid(id2);
			//设置给主表
			yzTarget1.setList(list1);
			alist.add(yzTarget1);
		}
		//把数据集合写入前台
		model.addAttribute("alist", alist);
		model.addAttribute("yzTarget", yzTarget);
		//指定跳转的页面
		return "YzTarget/s_index";
	}
//数据的分页查询	
	@RequestMapping("/listTargetLimit.do")
	public String listTargetLimit(Model model,Integer pageNo){
		//  初始化开始行号
		if(pageNo==null || pageNo==0){
			pageNo = 1;
		}
		//创建page对象
		Page page = yzTargetService.getPage(pageNo);
		
		//取出查询上来的分页记录数据
		List<YzTarget> tList = (List<YzTarget>) page.getList();
		
		//做一个空集合
		List<YzTarget> alist = new ArrayList<YzTarget>();
		
		//对页面封装的数据进行遍历
		for(int i=0;i<tList.size();i++){
			
			//获得每一个主表数据
			YzTarget yzTarget1 = tList.get(i);
			
			//获得主表的每个主键
			Integer id2 = yzTarget1.getId();
			
			//根据主键查出子表对应的数据
			List<YzTargetSort> list1 = yzTargetSortService.selectByPid(id2);
			
			//设置给主表
			yzTarget1.setList(list1);
			//把获得到的对象加入集合 以方便传递到前台
			alist.add(yzTarget1);
		}
		model.addAttribute("page", page);
		model.addAttribute("alist", alist);
		
		return "YzTarget/s_index";
	}
	
	
	// 保存数据
	@RequestMapping("/sava.do")
	public String sava(YzTarget yzTarget, Model model) {
		System.out.println("接到前端传过来的对象的值         ：" + yzTarget);

		SimpleDateFormat sdf = new SimpleDateFormat();
		String format = sdf.format(new Date());
		// 设置添加时间
		yzTarget.setAddTime(format);
		//设置添加标志为1 
		yzTarget.setAddUid(1);
		yzTarget.setIsDel(0);
		yzTargetService.savaTarget(yzTarget);

		return "redirect:listTargetLimit.do";
	}

	// 通过AJAX获得要操作的ID传到后台 并赋值给controller层
	@RequestMapping("/getId.do")
	public void getId(Integer id) {
		this.id = id;
		System.out.println("AJAX传过来的id是：" + this.id);
	}
	
	//通过AJAX获得要操作的ID传到后台 并赋值给controller层 
	@RequestMapping("/getYzId.do")
	public void getYzId(Integer id,Model model){
		this.id = id;
		System.out.println("AJAX传过来的Yzid是：             -------------------------- -----------"+id);
	}
	
	// 把AJAX传过来的ID 赋值给子表作外键 并保存子表数据 
	@RequestMapping("/savaYzTargetSort.do")
	public String savaYzTargetSort(YzTargetSort yzTargetSort){
		yzTargetSort.setPid(this.id);
		yzTargetSortService.savaYzTargetSort(yzTargetSort);
		return "redirect:listTargetLimit.do";
	}
	
	//根据AJAX传回来的ID 修改数据
	@RequestMapping("/updateYzTarget.do")
	public String updateYzTarget(YzTarget yzTarget){
		
		System.out.println("要修改的对象是            ----------------------------"+yzTarget);
		//设置修改时间  每次修改都会更新修改时间
		SimpleDateFormat sdf = new SimpleDateFormat();
		String format = sdf.format(new Date());
		yzTarget.setEditTime(format);
		
	/*	//设置修改次数 每次加1 
		Integer editUid = yzTarget.getEditUid();
		
		//通过这里的设置 可以在数据库查看对应数据的修改次数 修改次数等于Edit_id减去1                                注意：此功能   前台未处理
		yzTarget.setEditUid(editUid+1);;
		*/
		
	    yzTargetService.savaTarget(yzTarget);
		yzTarget.setId(this.id);
		yzTargetService.updateTarget(yzTarget);
		
		return "redirect:listTargetLimit.do";
		/*return new ModelAndView("redirect:listTarget.do?yzTarget="+yzTarget);*/
	}
	
	//删除数据
	@RequestMapping("/delete.do")
	public String delete(Integer id){
		//此方法封装在service层  由于主表和子表有关联 在service层会先调用两次DAO的操作 先删子表 再删主表注意 这里只是模拟删除 只需要设置是否删除的标志 表中字段依然存在
		yzTargetService.updateToIsDel(id);
		
		return "redirect:listTargetLimit.do";
	}
	
	@RequestMapping("/getTitle.do")
	public String getTitle(String title,Model model){
		
		System.out.println("title是====" +title);
		List<YzTarget> tList = yzTargetService.selectByTitle(title);
		
		//做一个空集合 以存放指定了表与表关系的数据集合
				List<YzTarget> alist = new ArrayList<YzTarget>();
				for(int i=0;i<tList.size();i++){
					//获得每一个主表数据
					YzTarget yzTarget1 = tList.get(i);
					//获得主表的每个主键
					Integer id2 = yzTarget1.getId();
					//根据主键查出子表对应的数据
					List<YzTargetSort> list1 = yzTargetSortService.selectByPid(id2);
					//设置给主表
					yzTarget1.setList(list1);
					alist.add(yzTarget1);
				}
				

				return "YzTarget/s_index";
	}

	
	

}
