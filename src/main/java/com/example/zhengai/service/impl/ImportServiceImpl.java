package com.example.zhengai.service.impl;


import com.example.zhengai.controller.ReadExecl;
import com.example.zhengai.dao.YzDatasDao;
import com.example.zhengai.dao.YzTargetDao;
import com.example.zhengai.dao.YzTargetSortDao;
import com.example.zhengai.dao.YzUserDao;
import com.example.zhengai.model.YzDatas;
import com.example.zhengai.model.YzTarget;
import com.example.zhengai.model.YzTargetSort;
import com.example.zhengai.model.YzUser;
import com.example.zhengai.service.ImportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Service
public class ImportServiceImpl implements ImportService {
    @Autowired
    private YzTargetSortDao yzTargetSortDao;
	@Autowired
	private YzTargetDao yzTargetDao;
	@Autowired
	private YzDatasDao yzDatasService;

	
	@Autowired
	private YzUserDao userdao;


    @Override
    public String readExcelFile(MultipartFile file) {
        String result = "";  
        //创建处理EXCEL的类  
        ReadExecl readExcel = new ReadExecl();
        //解析excel，获取上传的事件单  
        List<Map<String, Object>> userList = readExcel.getExcelInfo(file);
        if(userList != null && !userList.isEmpty()){  
            result = "上传成功";  
        }else{  
            result = "上传失败,请检查文件是否有数据,并按照要求的格式填入数据"; 
            return result;
        }  
        //至此已经将excel中的数据转换到list里面了,接下来就可以操作list,可以进行保存到数据库,或者其他操作,  
        for(Map<String, Object> user:userList){
        	//第一次导入数据库表yz_target_sort中的title，sort，add_time对应一级指示(title)，排序(sort)，添加时间(addTime),添加人(name);

        	YzTargetSort yzTargetSort=new YzTargetSort();
        	
        	String OneTitle = (String)user.get("title");
        	String twoTitle = (String)user.get("twoTitle");
        	String sortTitle = (String)user.get("sortTitle");
        	String stand = (String)user.get("stand");
        	String standSort = (String)user.get("standSort");
        	String standSortS = (String)user.get("standSortS");
        	String dataTitle = (String)user.get("dataTitle");
        	String updateSort = (String)user.get("updateSort");
        	String sort = (String)user.get("sort");
        	String remark = (String)user.get("remark");
        	String name = (String)user.get("name");
        	String addTime = (String)user.get("addTime");
        	
        	
        	
        	yzTargetSort.setTitle(OneTitle);
        	yzTargetSort.setSort(new Integer(sort));
        	yzTargetSort.setAddTime(addTime);
        	yzTargetSort.setIsDel(0);
        	yzTargetSort.setPid(0);

        	yzTargetSortDao.savaYzTargetSort1(yzTargetSort);        //插入一级数据
            //获得刚插入的一级指标的ID
            Integer levelOneId=yzTargetSort.getId();              
            
            //第二次导入数据库表yz_target_sort 中的title，sort，pid，add_time对应二级指示(twoTitle),排序(sort),pid,添加时间(addTime);
            YzTargetSort sort1=new YzTargetSort();

            sort1.setPid(levelOneId);
        	sort1.setTitle(twoTitle);
        	sort1.setSort(new Integer(sort));
        	sort1.setAddTime(addTime);
        	sort1.setIsDel(0);
        	
        	if(name!=null){
        		YzUser yz=userdao.selectAllName(name);
        		if(yz!=null){
        			sort1.setAddUid(yz.getId());
        		}
        	}
        	yzTargetSortDao.savaYzTargetSort1(sort1);       //插入二级数据
          
            //获得刚插入的二级指标的ID
    		Integer levelTwoId= sort1.getId();
            
    		//第三次导入数据库表yz_target 中的title，s_one,s_two,stand,stand_sort,stand_sort_s,date_title,sort,update_sort,add_time
    		//对应一级指示id(pid)，二级指示id(twoPid)，指示名称(sortTitle)，标准值(stand)，标准值类型(standSortS)，比较类型(standSort)，数据源(dataTitle),
    		//更新周期(updateSort)，排序(sort)，备注(remark)，添加人(name)添加时间(addTime)
    		YzTarget yzTarget=new YzTarget();
    		if(name!=null){
        		YzUser yz=userdao.selectAllName(name);
        		if(yz!=null){
        			yzTarget.setAddUid(yz.getId());
        		}
        	
        	}
    		
    		int num=0;
    		if(standSortS.equals("数值")||standSortS.equals("1")) {
    			num=1;
    		}else if(standSortS.equals("百分比")||standSortS.equals("2")){
    			num=2;
    		}
    		
    		int num1=0;
    		if(standSort.equals("大于")||standSort.equals("1")) {
    			num1=1;
    		}else if(standSort.equals("小于")||standSort.equals("2")){
    			num1=2;
    		}
    		yzTarget.setsOne(levelOneId);
    		yzTarget.setsTwo(levelTwoId);
    		yzTarget.setSort(new Integer(sort));
    		yzTarget.setTitle(sortTitle);
    		yzTarget.setStand(stand);
    		yzTarget.setStandSort(num1);
    		yzTarget.setStandSortS(num);
    		yzTarget.setUpdateSort(new Integer(updateSort));
    		yzTarget.setRemark(remark);
    		yzTarget.setAddTime(addTime);
    		
    		if(dataTitle!=null && dataTitle!=""){
    			YzDatas yzDatas = new YzDatas();
        		yzDatas.setTitle(dataTitle);    
        		
        		//插入这条yzDatas数据到数据库
        		yzDatasService.sava(yzDatas);               //插入数据源数据
        		//-----------------------------------------------------
        		//获得刚刚插入的这条数据的主键
        		Integer yzDatasId = yzDatas.getId();
        		yzTarget.setDataId(yzDatasId);
        		yzTarget.setDataTitle(dataTitle);
    		}
    		yzTarget.setIsDel(0);
    		yzTargetDao.savaTarget1(yzTarget);            //插入指标数据      
    		//getResult(ret2);
        }
        
        return result;  
    }
    
    
  
}