package teacher;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import common.FileRenamePolicy;
import controller.Controller;
import model.TeacherDAO;
import model.TeacherVO;


public class ProfInsertCtrl implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("교사회원등록");
		
		String path = "c:/upload/profupload";
		File Folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	         }else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}
		
		
		TeacherVO teacher = new TeacherVO();
		
		try {
			BeanUtils.copyProperties(teacher, request.getParameterMap());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String tname = teacher.getTeacher_name();
		
		Part part = request.getPart("teacher_picture");
		String teacher_picture = getFileName(part);

		System.out.println(teacher_picture);

		if (teacher_picture != null && !teacher_picture.isEmpty()) {
			File renameFile = FileRenamePolicy.rename(new File(path,teacher_picture));
			part.write(path + "/" + tname + "_" + renameFile.getName());
			teacher.setTeacher_picture(tname + "_" +renameFile.getName());
		}
		
		int r = TeacherDAO.getInstance().insert(teacher);
		
		
		String page = "";
		if (r == 1) { //1건 수정됨
			request.setAttribute("errormsg", "가입을 축하합니다");
			request.setAttribute("errorcode", "1");
			page = "/member/login.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		} else {
			request.setAttribute("errormsg", "가입에 실패했습니다.");
			request.setAttribute("errorcode", "2");
			page = "/member/profInsert.jsp";
			request.getRequestDispatcher(page).forward(request, response);
			
		};
		

		//request.getRequestDispatcher("/member/login.jsp").forward(request, response);
		
	}
	
	
	private String getFileName(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
	
	

}
