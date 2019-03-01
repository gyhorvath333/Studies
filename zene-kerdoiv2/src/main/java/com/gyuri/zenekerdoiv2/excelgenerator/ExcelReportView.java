package com.gyuri.zenekerdoiv2.excelgenerator;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.gyuri.zenekerdoiv2.entity.Respondent;
public class ExcelReportView extends AbstractXlsView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment;filename=\"results.xls\"");
		List<Respondent> exportResults = (List<Respondent>) model.get("exportResults");
		

		Sheet sheet = workbook.createSheet("Respondent Data");
		Row header = sheet.createRow(0);
		header.createCell(0).setCellValue("id");
		header.createCell(1).setCellValue("gender");
		header.createCell(2).setCellValue("age");
		header.createCell(3).setCellValue("year");
		header.createCell(4).setCellValue("studies");
		header.createCell(5).setCellValue("note");
		header.createCell(6).setCellValue("county");
		header.createCell(7).setCellValue("type");
		for (int i=8; i<=180; i++) {
			header.createCell(i).setCellValue("answer_"+(i-6));
			header.createCell(i+1).setCellValue("right_"+(i-6));
		}

		
		  
		int rowNum = 1;
		for(Respondent item : exportResults){
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(item.getId());
			row.createCell(1).setCellValue(item.getGender());
			row.createCell(2).setCellValue(item.getAge());
			row.createCell(3).setCellValue(item.getYear());
			row.createCell(4).setCellValue(item.getStudies());
			row.createCell(5).setCellValue(item.getNote());
			row.createCell(6).setCellValue(item.getCounty());
			row.createCell(7).setCellValue(item.getType());
			for(int i=2; i<=86; i++) {
				try {
					String a = item.getAnswers().get(i-2).getAnswer();
					
					if (a!=null) {
						row.createCell(2*i+4).setCellValue(a);
						row.createCell(2*i+5).setCellValue(0);
					}
				}
				catch(Exception e) {
					row.createCell(2*i+4).setCellValue("");
					row.createCell(2*i+5).setCellValue("");
				} 
			}
		}
	}
}
