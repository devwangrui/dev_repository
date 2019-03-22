package com.example.zhengai.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.example.zhengai.model.*;
import com.example.zhengai.query.YzElementQuery;
import com.example.zhengai.query.YzTargetSortTitleAndId;
import com.example.zhengai.service.*;
import com.example.zhengai.utils.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;



@Controller
@RequestMapping("/Teacher")
public  class TeacherController {
	
	@Autowired
	private YzUserService yzUserService;
	
	@Autowired
	private YzRoleService yzRoleService;
	
	@Autowired
	private YzRoleUserService yzRoleUserService;
	
	@Autowired
	private YzElementService yzElementService;
	
	@Autowired
	private YzUserElementService yzUserElementService;
	
	@RequestMapping("/listTeacher.do")
	public String listTeacher(Model model,Integer pageNo){
		if(pageNo==null || pageNo ==0){
			pageNo = 1;
		}
		
		Page page= yzUserService.creatTeacherPage(pageNo);
		
		model.addAttribute("page", page);
		return "User/TeacherIndex";
	}

	@RequestMapping("/listRole.do")
	public String listRole(Integer id,Model model){
		//根据传回来的ID查询出这个用户对象
		YzUser yzUser = yzUserService.selectUserByRoleId(id);
		//获得者用户的所有角色
		List<YzRole> UserRoles = yzUser.getRoleList();
		//查询出角色表的所有角色
		List<YzRole> allRole = yzRoleService.selectAllRole();
		
		if (UserRoles!=null){
			//循环角色表以及用户的所有角色  把用户的所有角色与角色表的所有角色一一作对比 
			for(YzRole role:allRole){
				for(YzRole userRole:UserRoles){
					if(userRole.getId().intValue() == role.getId().intValue()){
						role.setOption(1);     //如果用户的某个角色和角色表上的某个角色相等  就把这个角色的状态设置成1
					}
				}
			}
		}
		
		
		model.addAttribute("allRole", allRole);
		model.addAttribute("yzUser", yzUser);
		return "User/role_user";
	}

	
	//分配角色的方法
	@RequestMapping("/updateUserRole.do")
	public String updateUserRole(Integer userId,String roleIds,Model model){
		
		
		yzRoleUserService.deleteUId(userId);
		
		if(StringUtils.isNotBlank(roleIds)){
			String[] ids = roleIds.split(",");
			
			//遍历传上来的角色ID
			for(String rid:ids){
				YzRoleUser ru = new YzRoleUser();
				ru.setUserId(userId);
				ru.setRoleId(new Integer(rid));
				
				yzRoleUserService.savaRoleUser(ru);
			}
		}
		
		//查询出要分配角色的用户
		YzUser yzUser = yzUserService.selectUserByRoleId(userId);
		
	   //获得者用户的所有角色
		List<YzRole> UserRoles = yzUser.getRoleList();
		//查询出角色表的所有角色
		List<YzRole> allRole = yzRoleService.selectAllRole();
				
			//循环角色表以及用户的所有角色  把用户的所有角色与角色表的所有角色一一作对比 
			for(YzRole role:allRole){
					for(YzRole userRole:UserRoles){
						if(userRole.getId().intValue() == role.getId().intValue()){
							role.setOption(1);     //如果用户的某个角色和角色表上的某个角色相等  就把这个角色的状态设置成1
						}
					}
				}
		
		
				
		model.addAttribute("allRole", allRole);
		model.addAttribute("yzUser", yzUser);
		return "User/role_user";
	}
	
	
	@RequestMapping("/listElement.do")
	public String listElement(Integer id,Model model,String Success){
		String opt = "yes";
		//根据传上来的id查询出对用的用户对象
		YzUser yzUser = yzUserService.selectElementByUserIdLeftJoin(id);
		
		List<YzElement> allJoinList = yzElementService.selectAllJoin();
		
		List<YzElement> list = yzUser.getList();
		if(list.size()<=0){
			opt="no";
		}
		
		model.addAttribute("yzUser", yzUser);
		model.addAttribute("opt", opt);
		
		model.addAttribute("allJoinList", allJoinList);
		model.addAttribute("Success", Success);
		return "User/UserElement";
	}
	
	
	@ResponseBody
	@RequestMapping("/getLevelData.do")
	public List<YzTargetSortTitleAndId> getLevelData(Integer id){
		List<YzTargetSortTitleAndId> ysList = new ArrayList<YzTargetSortTitleAndId>();
		
		YzElement yzElement = yzElementService.selectOneJoin(id);
		
          if(yzElement!=null){
        	  List<YzElementQuery> list = yzElement.getList();
      		   if(list!=null){
      			 for(YzElementQuery levelTwo:list){
      				Integer id2 = levelTwo.getId();
      				String title = levelTwo.getTitle();
      				YzTargetSortTitleAndId ytsq = new YzTargetSortTitleAndId();
      				ytsq.setId(id2);
      				ytsq.setTitle(title);
      				ysList.add(ytsq);
      			}
      		}
		}
		return ysList;
	}
	
	
	
	@ResponseBody
	@RequestMapping("/getLevelData1.do")
	public List<YzTargetSortTitleAndId> getLevelData1(Integer id){
		
		List<YzTargetSortTitleAndId> ysList = new ArrayList<YzTargetSortTitleAndId>();
		YzElement yzElement = yzElementService.selectLevelTwoJoin(id);
		if(yzElement!=null){
			List<YzElementQuery> list = yzElement.getList();
			
			if(list!=null){
				for(YzElementQuery levelTwo:list){
					Integer id2 = levelTwo.getId();
					String title = levelTwo.getTitle();
					YzTargetSortTitleAndId ytsq = new YzTargetSortTitleAndId();
					ytsq.setId(id2);
					ytsq.setTitle(title);
					ysList.add(ytsq);
				}
				
			}
		}
		 
		return ysList;
	}
	
	//为user分配部门的方法
	@RequestMapping("/updateUserElement.do")
	public ModelAndView updateUserElement(String[] levelOne,String[] levelTwo,String[] levelThree,String userId){
		
		Integer uId = new Integer(userId);
		// 一上来就把该用户下原来的部门清空  删除中间表里改用户的数据
		yzUserElementService.deleteById(uId);
		
		if(levelOne!=null){
			List<String> list = Arrays.asList(levelOne); //把第一级数据转换成集合方便操作
			
			for(int i = 0 ;i<list.size();i++){     //对第一级数据做循环
				YzUserElement ye = new YzUserElement();   //new一个中间表的对象
				ye.setuId(new Integer(userId));           //设置要分配部门的用户id给中间表  这里就是给前台传过来的userId对应的user做分配
				
				String idStr = list.get(i);          //获得到每一个以及部门数据   这里的数据都是String类型的 元转换成Integer类型
				if(new Integer(idStr)!=-1){             // -1是前台表单中的下拉菜单中“请选择”对应的值  如果传回来的数据是-1 就说明这一项未被选择  所以只有在值不等于-1的情况下进行下一步操作
					
					ye.seteIdOne(new Integer(idStr));      //如果值不是-1 就把这个值设置给中间表对象
					
					if(new Integer(levelTwo[i])==-1){       //如果一级数据的第i次循环中 二级数据的第i个值是-1 就说明当前一级数据下没有二级数据 程序走到这里  就可以做数据保存了
						yzUserElementService.sava(ye);      //保存数据   
						
					}else {            //否则 就是该次循环下还有二级数据 继续取二级数据       并赋值给中间表对象
						
						List<String> list2 = Arrays.asList(levelTwo);         //以下是取第三极数据  同上
						for(int j = 0 ; j<list2.size();j++){
							if(j==i){
								String idStr2 = list2.get(j);
								ye.seteIdTwo(new Integer(idStr2));
								if(new Integer(levelThree[i])==-1){
									yzUserElementService.sava(ye);
								}else{
									List<String> list3 = Arrays.asList(levelThree);
									for(int k = 0 ; k<list3.size();k++){
										if(k==j){
											String idStr3 = list3.get(k);
											ye.seteIdT(new Integer(idStr3));
											
											yzUserElementService.sava(ye);
										}
									}
									
								}
							}
						}
					}
				}
		     }
		}
		
			
				String Success="Success";      //给一个添加成功的标志 传到后台 如果接到这个值 提示添加成功
				
				//这里要带着值做重定向 所以要用到redirectView， 把uId的值带到要指向的方法上去
				RedirectView redirectView = new RedirectView("/Teacher/listElement.do", true, true);
		        ModelAndView mav = new ModelAndView(redirectView);
		        mav.addObject("id", uId);
		        mav.addObject("Success", Success);
				
				
						return mav;
		
	}
	
	
	
	
	
	@RequestMapping("/listStudent.do")
	public String listStudent(Model model,Integer pageNo){
		
		if(pageNo==null || pageNo ==0){
			pageNo = 1;
		}
		
		Page page= yzUserService.creatStudentPage(pageNo);
		
		model.addAttribute("page", page);
		return "User/TeacherIndex";
	}
	
	@RequestMapping("/selectCondition.do")//daishixian
	public String selectCondition(String key,Integer pageNo){
		
		if(pageNo==null || pageNo ==0){
			pageNo = 1;
		}
		return "";
	}
	

}
