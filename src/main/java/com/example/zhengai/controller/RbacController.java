package com.example.zhengai.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.zhengai.model.YzAccess;
import com.example.zhengai.model.YzNode;
import com.example.zhengai.model.YzRole;
import com.example.zhengai.service.YzAccessService;
import com.example.zhengai.service.YzNodeService;
import com.example.zhengai.service.YzRoleService;
import net.sf.json.JSONArray;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/Rbac")
public class RbacController {
	@Autowired
	private YzRoleService yzRoleService;
	
	@Autowired
	private YzNodeService yzNodeService;
	
	@Autowired
	private YzAccessService accessService;
	
	@RequestMapping("/role.do")
	public String rbacRole(Model model){
		//查出主表数据集合
		List<YzRole> rList=yzRoleService.selectAllRole();
		model.addAttribute("list", rList);
		return "Rbac/role";
	}
	
	@RequestMapping("/role_add.do")
	public String roleAdd(Model model,Integer id){
		YzRole role=yzRoleService.selectRoleById(id);
		
		model.addAttribute("role", role);
		return "Rbac/role_add";
	}
	
	@RequestMapping("/importa.do")
	public String updateRole(@RequestParam(value="name",required = false) String name,
						   @RequestParam(value="id",required = false) Integer id,
						   @RequestParam(value="remark",required = false) String remark){
		String 	r="redirect:role.do";
		if(id!=null){
			yzRoleService.updateByPrimaryKeySelective(newRole(name,id,remark));
		}else {
			if(name.equals("")&&remark.equals("")){
				r="Rbac/role_add";
			}else{
				yzRoleService.insertSelective(newRole(name, id, remark));
			}
		}
		return r;
	}
	
	@RequestMapping("/role_delete.do")
	public String roleDelete(@RequestParam(value="id",required = false) Integer id){
		
		yzRoleService.deleteByPrimaryKey(id);
		accessService.deleteByRoleId(id);
		return "redirect:role.do";
	}
	

	
	
	@RequestMapping("/node.do")
	public String node(Model model){
		List<YzNode> yzNodeList=testQueryYzNodeList();
	   // Map<String,Object> jsonMap = new HashMap<>();
	    //jsonMap.put("YzNode", yzNodeList);
	    model.addAttribute("YzNode",yzNodeList);
		return "Rbac/node";
	}
	
	@RequestMapping("/access.do")
	public String access(Model model,Integer id){
		if(id==null){
			id=0;
		}
		YzRole role=yzRoleService.selectRoleById(id);
		List<YzNode> yzNodeList=accessput(id);
		createView(yzNodeList,model);
		model.addAttribute("role",role);
		return "Rbac/access";
	}
	
	
	@RequestMapping("/node_add.do")
	public String nodeAdd(Model model,Integer id,Integer pid,Integer level){
		YzNode role;
		if(pid==null && level==null){
		 role=yzNodeService.selectByPrimaryBy(id);
		}else{
			role=new YzNode();
			role.setPid(pid);
			role.setLevel(level);
		}
		model.addAttribute("role", role);
		return "Rbac/node_add";
	}
	

	
	@RequestMapping("/importnode.do")
	public String updateNode(@RequestParam(value="name",required = false) String name,
						   @RequestParam(value="id",required = false) Integer id,
						   @RequestParam(value="pid",required=false) Integer pid,
						   @RequestParam(value="remark",required = false) String remark,
						   @RequestParam(value="level",required=false) Integer level){
		String 	r="redirect:node.do";
		if(id!=null){
			
			yzNodeService.updateByPrimaryKeySelective(newNode(name, id, remark, pid, level));
		}else {
			if(name.equals("")&&remark.equals("")){
				r="Rbac/nole_add";
			}else{
				if(level==null){
					level=1;
				}
				yzNodeService.insertSelective(newNode(name, id, remark, pid, level));
			}
		}
		return r;
	}
	
	@RequestMapping("/node_delete.do")
	public String nodeDelete(@RequestParam(value="id",required = false) Integer id){
		
		yzNodeService.deleteByPrimaryKey(id);
		
		return "redirect:node.do";
	}
	
	@RequestMapping("/insert.do")
	public String insertaccess(Integer userId,String rids){
		
		if(userId==null||userId==0){
			userId=0;
		}
		accessService.deleteByRoleId(userId);
		if(StringUtils.isNotBlank(rids)){
			String[] ids = rids.split(",");
			
			//遍历传上来的角色ID
			for(String rid:ids){
				Integer id=Integer.valueOf(rid);
				YzNode node=yzNodeService.selectByPrimaryBy(id);
				YzAccess access=new YzAccess();
				access.setLevel(node.getLevel());
				access.setRoleId(userId);
				access.setNodeId(id);
				accessService.insertSelective(access);
			}
		}
		return "redirect:role.do";
	}
	
	public YzRole newRole(String name,Integer id,String remark){
		YzRole role=new  YzRole();
		role.setId(id);
		role.setName(name);
		role.setRemark(remark);
		return role;
	}
	
	public YzNode newNode(String name,Integer id,String remark,Integer pid,Integer level){
		YzNode node=new YzNode();
		node.setId(id);
		node.setName(name);
		node.setRemark(remark);
		node.setPid(pid);
		node.setLevel(level);
		return node;
	}
	 
	 public List<YzNode> testQueryYzNodeList() {
			// 原始的数据
		    List<YzNode> rootYzNode = yzNodeService.selectByPrimary();

		    
		    // 最后的结果
		    List<YzNode> yzNodeList = new ArrayList<YzNode>();
		    // 先找到所有的一级菜单
		    for (int i = 0; i < rootYzNode.size(); i++) {
		        // 一级菜单没有parentId
		        if (rootYzNode.get(i).getPid()==0) {
		            yzNodeList.add(rootYzNode.get(i));
		        }
		    }
		    // 为一级菜单设置子菜单，getChild是递归调用的
		    for (YzNode YzNode : yzNodeList) {
		        YzNode.setYzNode(getChild(YzNode.getId(), rootYzNode));
		    }
		    	return yzNodeList;
		   
		}

		/**
		 * 递归查找子菜单
		 * 
		 * @param id
		 *            当前菜单id
		 * @param rootYzNode
		 *            要查找的列表
		 * @return
		 */
		private List<YzNode> getChild(Integer id, List<YzNode> rootYzNode) {
		    // 子菜单
		    List<YzNode> childList = new ArrayList<>();
		    for (YzNode YzNode : rootYzNode) {
		        // 遍历所有节点，将父菜单id与传过来的id比较
		        if (StringUtils.isNotBlank(YzNode.getPid().toString())) {
		            if (YzNode.getPid()==id) {
		                childList.add(YzNode);
		            }
		        }
		    }
		    // 把子菜单的子菜单再循环一遍
		    for (YzNode YzNode : childList) {
		            // 递归
		            YzNode.setYzNode(getChild(YzNode.getId(), rootYzNode));
		    } // 递归退出条件
		    if (childList.size() == 0) {
		        return null;
		    }
		    return childList;
		}
		

		public void createView(List<YzNode> yzNodeList,Model model){
			List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
			boolean check=false;
			for (YzNode node:yzNodeList) {
				if(node!=null){
					Map<String,Object> map=new HashMap<String,Object>();
					Integer id=node.getId();
					Integer pid=node.getPid();
					String remark=node.getRemark();
					Integer judge=node.getJudge();
					List<YzNode> no=node.getYzNode();
					if(judge==null ){
						check=false;
					}else if(judge==1){
						check=true;
					}else{
						check=false;
					}
					map.put("id", id);
					map.put("pId", pid);
					map.put("name", remark);
					map.put("checked", check);
					map.put("open", false);
					list.add(map);
					if(no!=null &&no.size()>0){
						for (YzNode node1 : no) {
							Map<String,Object> map1=new HashMap<String,Object>();
							Integer id1=node1.getId();
							Integer pid1=node1.getPid();
							Integer judge1=node.getJudge();
							String remark1=node1.getRemark();
							List<YzNode> no1=node1.getYzNode();
							if(judge1==null ){
								check=false;
							}else if(judge1==1){
								check=true;
							}else{
								check=false;
							}
						
							map1.put("id", id1);
							map1.put("pId", pid1);
							map1.put("name", remark1);
							map1.put("checked", check);
							map1.put("open", false);
							list.add(map1);
							if(no1!=null &&no1.size()>0){
								for (YzNode node2 : no1) {
									Map<String,Object> map2=new HashMap<String,Object>();
									Integer id2=node2.getId();
									Integer pid2=node2.getPid();
									Integer judge2=node.getJudge();
									String remark2=node2.getRemark();
									if(judge2==null){
										check=false;
									}else if(judge2==1){
										check=true;
									}else{
										check=false;
									}
								
									map2.put("id", id2);
									map2.put("pId", pid2);
									map2.put("name", remark2);
									map2.put("checked", check);
									map2.put("open", false);
									list.add(map2);
								}
							}
						}
					}
				
				}
				}
			JSONArray ja=JSONArray.fromObject(list);
			model.addAttribute("ja",ja);
			}
		
		
		public List<YzNode> accessput(Integer id){
			 
			//查询出角色表的所有角色
			List<YzNode> yzNodeList=testQueryYzNodeList();
			// 查看结果
		    for (YzNode yzNode : yzNodeList) {
		        System.out.println(yzNode.toString());
		    }
			if(id!=null){
				
				//获得者用户的所有角色
				List<YzNode> nodes=yzNodeService.selectRoleIdByPrimary(id);
				if (nodes!=null){
					
					for(YzNode node:nodes){
						for(YzNode nodelist:yzNodeList){
							
							if(node.getId().intValue() == nodelist.getId().intValue()){
								//如果用户的某个角色和角色表上的某个角色相等  就把这个角色的状态设置成1
								nodelist.setJudge(1);     
							}else{
								List<YzNode> nodeList1=nodelist.getYzNode();
								if(nodeList1!=null){
									for (YzNode yzNode : nodeList1) {
										if(yzNode.getId().intValue() == node.getId().intValue()){
											//如果用户的某个角色和角色表上的某个角色相等  就把这个角色的状态设置成1
											yzNode.setJudge(1);     
										}else{
											List<YzNode> nodeList2=yzNode.getYzNode();
											if(nodeList2!=null){
											for (YzNode node2 : nodeList2) {
												if(node2.getId().intValue() == node.getId().intValue()){
													node2.setJudge(1);    
												}
											}
										}
									  }
								   }
								}
								
						}
						
					}
						
				}
				
				}
				}
			return yzNodeList;
		}

}	
