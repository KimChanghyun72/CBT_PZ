package teacher;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common.FileRenamePolicy;
import common.HttpUtil;
import controller.Controller;
import model.TeacherDAO;
import model.TeacherVO;

public class ProfUpdateCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		
		
		System.out.println("강사 정보 수정");
		TeacherVO teacherVO = (TeacherVO) request.getSession().getAttribute("login");
		String teacher_id = teacherVO.getTeacher_id();
		
		String tname = request.getParameter("teacher_name");
		String pw = request.getParameter("teacher_password");
		String confirm_pw = request.getParameter("confirm_password");
		String email = request.getParameter("teacher_email");
		String rec = request.getParameter("teacher_record");
		String certif = request.getParameter("teacher_certificate");
		
		TeacherVO teacher = new TeacherVO();
		
		Part part = request.getPart("teacher_picture");
		String teacher_picture = getFileName(part);

		//System.out.println(teacher_picture);
		if(confirm_pw == null || confirm_pw.equals("")) {
			teacher.setTeacher_password(pw);
		} else {
			teacher.setTeacher_password(confirm_pw);
		}
		teacher.setTeacher_id(teacher_id);
		teacher.setTeacher_email(email);
		teacher.setTeacher_record(rec);
		teacher.setTeacher_certificate(certif);
		teacher.setTeacher_picture(null);
		
		//그림처리
		//String pic = request.getParameter("teacher_picture");
		//System.out.println("pic: " + pic);
		if(teacher_picture != null && !teacher_picture.isEmpty()) {
			File renameFile = FileRenamePolicy.rename(new File(path,teacher_picture));
			part.write(path + "/" + tname + "_" + renameFile.getName());
			teacher.setTeacher_picture(path + "/" + tname + "_" +renameFile.getName());
		}
		
		//System.out.println("pic: " + pic);
		
		int r = TeacherDAO.getInstance().update(teacher);
		
		
		String page = "";
		if (r == 1) { //1건 업뎃됨
			request.setAttribute("errormsg", "수정되었습니다");
			request.setAttribute("errorcode", "1");
			page = "/mypage/myInfo.do";
			request.getRequestDispatcher(page).forward(request, response);
			//response.sendRedirect("/mypage/myInfo.do");
		} else {
			request.setAttribute("errormsg", "수정에 실패하였습니다");
			request.setAttribute("errorcode", "2");
			//response.sendRedirect("/mypage/myInfo.do");
			page = "/mypage/myInfo.do";
			request.getRequestDispatcher(page).forward(request, response);
			
		};
		
		
		//HttpUtil.forward(request, response, "/mypage/myInfo.jsp"); // 이동
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
