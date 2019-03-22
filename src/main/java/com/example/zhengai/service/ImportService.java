package com.example.zhengai.service;

import org.springframework.web.multipart.MultipartFile;

public interface ImportService {  
      
    /** 
     * 导入Excel 文件
     */  
	String readExcelFile(MultipartFile file1);  
  
}
