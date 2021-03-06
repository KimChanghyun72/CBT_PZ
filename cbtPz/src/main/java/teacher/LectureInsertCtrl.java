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
import model.LectureDAO;
import model.LectureVO;
import model.TeacherVO;

public class LectureInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 추출
		String lecture_name = request.getParameter("lecture_name");
		String lecture_info = request.getParameter("lecture_info");
		String lecture_link = request.getParameter("lecture_link");
		String lecture_subject = request.getParameter("lecture_subject");
		String path = "c:/upload"; // 썸네일 이미지 추가

		
		
		
		
		
		TeacherVO teacher = (TeacherVO) request.getSession().getAttribute("login");
		String teacher_id = teacher.getTeacher_id(); // teacher_member table teacher_id column에서 가져옴

		System.out.println(path);
		LectureVO lecture = new LectureVO();

		lecture.setLecture_subject(lecture_subject);
		lecture.setLecture_name(lecture_name);
		lecture.setLecture_info(lecture_info);
		lecture.setLecture_link(lecture_link);
		lecture.setTeacher_id(teacher_id); // teacher_member table teacher_id column에서 가져옴

		//teacher_num -> teacher_id 변경



		Part part = request.getPart("lecture_image");
		String lecture_image = getFileName(part);

		// 유효성 체크
		if (lecture_name.isEmpty() || lecture_info.isEmpty() || lecture_link.isEmpty()) {
			request.setAttribute("error", "모든 항목을 빠짐없이 입력해주시기 바랍니다.");
			HttpUtil.forward(request, response, "/mypage/insertLecture.jsp");
			return;
		}

		System.out.println(lecture_image);

		if (lecture_image==null || lecture_image.isEmpty()) {
			lecture.setLecture_image("");
		} else {
			File renameFile = FileRenamePolicy.rename(new File(path, lecture_image));
			part.write(path + "/" + renameFile.getName());
			lecture.setLecture_image(path + "/" + renameFile.getName());

		}
		LectureDAO dao = LectureDAO.getInstance();
		dao.insert(lecture);

		request.getRequestDispatcher("/mypage/insertLecture.jsp").forward(request, response);
		// request.getRequestDispatcher("/mypage/LectureOutput.jsp").forward(request, response);

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
