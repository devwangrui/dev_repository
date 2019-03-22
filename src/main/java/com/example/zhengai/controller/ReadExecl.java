package com.example.zhengai.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;


public class ReadExecl {
	//总行数
	private int totalRows=0;
	//总条数
	private int totalCells=0;
	//错误信息接收
	private String errorMsg;
	//默认构造方法
	public void ReadExcel() {
		
	}
	public int getTotalRows() {
		return totalRows;
	}

	public int getTotalCells() {
		return totalCells;
	}
	
	public String getErrorMsg() {
		return errorMsg;
	}
	
	 // @描述：是否是2003的excel，返回true是2003
    public static boolean isExcel2003(String filePath) {
        return filePath.matches("^.+\\.(?i)(xls)$");
    }

    // @描述：是否是2007的excel，返回true是2007
    public static boolean isExcel2007(String filePath) {
        return filePath.matches("^.+\\.(?i)(xlsx)$");
    }
	
	/**
     * 验证EXCEL文件
     * 
     * @param filePath
     * @return
     */
    public boolean validateExcel(String filePath) {
        if (filePath == null || !(isExcel2003(filePath) || isExcel2007(filePath))) {
            errorMsg = "文件名不是excel格式";
            return false;
        }
        return true;
    }
	
/**
 * 读EXCEL文件，获取信息集合
 * 
 * @param fielName
 * @return
 */
public List<Map<String, Object>> getExcelInfo(MultipartFile file) {
    String fileName = file.getOriginalFilename();// 获取文件名
//    List<Map<String, Object>> userList = new LinkedList<Map<String, Object>>();
    try {
        if (!validateExcel(fileName)) {// 验证文件名是否合格
            return null;
        }
        boolean isExcel2003 = true;// 根据文件名判断文件是2003版本还是2007版本
        if (isExcel2007(fileName)) {
            isExcel2003 = false;
        }
        return createExcel(file.getInputStream(), isExcel2003);
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

/**
 * 根据excel里面的内容读取客户信息
 * 
 * @param is      输入流
 * @param isExcel2003   excel是2003还是2007版本
 * @return
 * @throws IOException
 */
public List<Map<String, Object>> createExcel(InputStream is, boolean isExcel2003) {
    try {
        Workbook wb = null;
        if (isExcel2003) {// 当excel是2003时,创建excel2003
            wb = new HSSFWorkbook(is);
        } else {// 当excel是2007时,创建excel2007
            wb = new XSSFWorkbook(is);
        }
        return readExcelValue(wb);// 读取Excel里面客户的信息
    } catch (IOException e) {
        e.printStackTrace();
    }
    return null;
}

/**
 * 读取Excel里面客户的信息
 * 
 * @param wb
 * @return
 */
private List<Map<String, Object>> readExcelValue(Workbook wb) {
	 List<Map<String, Object>> userList = new ArrayList<Map<String, Object>>();
	// 循环工作表Sheet
	for (int numSheet = 0; numSheet < wb.getNumberOfSheets(); numSheet++) {
	
	         Sheet hssfSheet = wb.getSheetAt(numSheet);
	         if (hssfSheet == null) {
	                continue;
	         }
	         
	         // 得到Excel的行数
	         this.totalRows = hssfSheet.getPhysicalNumberOfRows();
	         // 得到Excel的列数(前提是有行数)
	         if (totalRows > 1 && hssfSheet.getRow(0) != null) {
	        this.totalCells = hssfSheet.getRow(0).getPhysicalNumberOfCells();
	         }
	        
	         // 循环Excel行数
	         for (int r = 1; r < totalRows; r++) {
	        	 Row row = hssfSheet.getRow(r);
	        	 if (row == null) {
	        		 continue;
	        	 }
	        	 // 循环Excel的列
	        	 Map<String, Object> map = new HashMap<String, Object>();
	        	 for (int c = 0; c < this.totalCells; c++) {
	        		 	Cell cell = row.getCell(c);
           /**
            * 定义一个String类型的数组，里面储存
            *  一级指示，二级指示，指示名称，标准值，标准值类型，比较类型，数据源，更新周期，排序，备注，添加人，添加时间
            */
	        		 	String[] columnName= {"title","twoTitle","sortTitle","stand","standSort","standSortS",
	        		 			"dataTitle","updateSort","sort","remark","name","addTime"};
	        		 	map.put(columnName[c], getCellValue(cell));
	        		 // 添加到list
	        	        
	        	 }
	        	 userList.add(map);
      }
	}
	return userList;
}

public static String getCellValue(Cell cell) {
    String cellValue = "";
    if (cell == null) {
        return cellValue;
    }
    // 判断数据的类型
    switch (cell.getCellType()) {
    case Cell.CELL_TYPE_NUMERIC: // 数字
        //short s = cell.getCellStyle().getDataFormat();
        if (HSSFDateUtil.isCellDateFormatted(cell)) {// 处理日期格式、时间格式
            SimpleDateFormat sdf = null;
            // 验证short值
            if (cell.getCellStyle().getDataFormat() == 14) {
                sdf = new SimpleDateFormat("yyyy/MM/dd");
            } else if (cell.getCellStyle().getDataFormat() == 21) {
                sdf = new SimpleDateFormat("HH:mm:ss");
            } else if (cell.getCellStyle().getDataFormat() == 22) {
                sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            } else {
                throw new RuntimeException("日期格式错误!!!");
            }
            Date date = cell.getDateCellValue();
            cellValue = sdf.format(date);
        } else if (cell.getCellStyle().getDataFormat() == 0) {//处理数值格式
            cell.setCellType(Cell.CELL_TYPE_STRING);
            cellValue = String.valueOf(cell.getRichStringCellValue().getString());
        }
        break;
    case Cell.CELL_TYPE_STRING: // 字符串
        cellValue = String.valueOf(cell.getStringCellValue());
        break;
    case Cell.CELL_TYPE_BOOLEAN: // Boolean
        cellValue = String.valueOf(cell.getBooleanCellValue());
        break;
    case Cell.CELL_TYPE_FORMULA: // 公式
        cellValue = String.valueOf(cell.getCellFormula());
        break;
    case Cell.CELL_TYPE_BLANK: // 空值
        cellValue = "";
        break;
    case Cell.CELL_TYPE_ERROR: // 故障
        cellValue = "非法字符";
        break;
    default:
        cellValue = "未知类型";
        break;
    }
    return cellValue;
}
}

