package com.dbal.app.problem.web;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.dbal.app.problem.HashtagVO;
import com.dbal.app.problem.PaperheadVO;
import com.dbal.app.problem.ProblemVO;
import com.dbal.app.problem.service.HashService;
import com.dbal.app.problem.service.PaperService;
import com.dbal.app.problem.service.ProService;

@Controller
public class PaperController {
	@Autowired 
	PaperService paperService;
	@Autowired
	ProService proservice;
	@Autowired
	HashService hashservice; 
	
	@RequestMapping("insertPheadForm")
	public String insertPheadForm(PaperheadVO vo, ProblemVO vo1, HashtagVO vo2) {
		return "paperHead/headInsert";
	}
	
	
	@RequestMapping("insertPhead")
	public String insertPhead(PaperheadVO vo, ProblemVO vo1, HashtagVO vo2) {
		paperService.insertPhead(vo, vo1, vo2);
		return "redirect:insertPheadFrom";
	}
	
	@RequestMapping("insertExcel")
	public String insertPhead(ProblemVO problemVO, HttpServletRequest request) throws IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		MultipartFile multipartFile = multipartRequest.getFile("file_path");
		multipartFile.transferTo(new File("c:/upload1", multipartFile.getOriginalFilename()));
		
		try {
			OPCPackage opcPackage = OPCPackage.open("c:/upload/" + multipartFile.getOriginalFilename()); // opcPackage : 대용량 파일?(zip파일) 읽기
			@SuppressWarnings("resource")
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage); // xssfWorkbook : 엑셀 파일 전용

			// 첫번째 시트 불러오기
			XSSFSheet sheet = workbook.getSheetAt(0);

			for (int i = 0; i < sheet.getLastRowNum(); i++) {
				ProblemVO problem1 = new ProblemVO();
				problem1.setProblem_id(multipartFile.getName());
				XSSFRow row = sheet.getRow(i);

				// 행이 존재하지 않으면 패스
				if (null == row) {
					continue;
				}
				
				// 행과 열 불러오기
				XSSFCell cell = row.getCell(0);
				if (null != cell) problem1.setProblem_id(Double.toString(cell.getNumericCellValue()));
				
				cell = row.getCell(1);
				if (null != cell) problem1.setSubject(cell.getStringCellValue());
				
				cell = row.getCell(2);
				if (null != cell) problem1.setHaeseol(cell.getStringCellValue());
				
				cell = row.getCell(3);
				if (null != cell) problem1.setProblem_text(cell.getStringCellValue());
				
				cell = row.getCell(4);
				if (null != cell) problem1.setAns_1(cell.getStringCellValue());
				
				cell = row.getCell(5);
				if (null != cell) problem1.setAns_2(cell.getStringCellValue());
				
				cell = row.getCell(6);
				if (null != cell) problem1.setAns_3(cell.getStringCellValue());
				
				cell = row.getCell(7);
				if (null != cell) problem1.setAns_4(cell.getStringCellValue());
				
				cell = row.getCell(8);
				if (null != cell) problem1.setAns_correct(Double.toString(cell.getNumericCellValue())); 
																							
				cell = row.getCell(9);
				if (null != cell) problem1.setPaperhead_id(Double.toString(cell.getNumericCellValue()));
				
				cell = row.getCell(10);
				if (null != cell) problem1.setProblem_image(Double.toString(cell.getNumericCellValue()));

				System.out.println(problem1);

				proservice.insertPro(problemVO, null);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "paperHead/headInsert";
		
	}
	
}
