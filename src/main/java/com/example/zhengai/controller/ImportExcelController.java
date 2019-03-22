package com.example.zhengai.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.zhengai.service.ImportService;
import com.example.zhengai.service.YzTargetSortService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.AbstractController;

import java.io.IOException;


@Controller
@RequestMapping("/excel")
public class ImportExcelController{
	 private static Log log = LogFactory.getLog(AbstractController.class);
    @Autowired
    private ImportService importService;
    

    
    //导入excel
    @RequestMapping("/import.do")
    public String importExcel(@RequestParam(value="excelfile",required = false) MultipartFile excelfile,Model model, 
    		HttpServletRequest request,HttpServletResponse response ) throws IOException {
    	 log.info("AddController ..batchimport() start");
    	 
    	 
    	String result="";
    	/*Map<String, Object> map = new HashMap<String, Object>();*/
    	if(excelfile==null){
    		result="上传文件失败！";
    	}else{
    		result= importService.readExcelFile(excelfile);  
    	}
     model.addAttribute("result", result);
    	
    	return "ImportExcel/IndexImport";
    }  
    
    
    @RequestMapping("/importExcel.do")
    public String toPage() {

    	return "ImportExcel/IndexImport";
    }


}
