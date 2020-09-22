package board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import common.FileRenamePolicy;
import controller.Controller;
import model.BoardDAO;
import model.BoardVO;

public class BoardInsertCtrl implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String board_title = request.getParameter("board_title");
		String board_contents = request.getParameter("board_contents");
		String member_id = request.getParameter("member_id");
		String path = "E:/upload";
		// String views = request.getParameter("views");	
		System.out.println(path);
		BoardVO board = new BoardVO();

		board.setBoard_title(board_title);
		board.setBoard_contents(board_contents);
		board.setMember_id(member_id);

		Part part = request.getPart("board_file");
		String board_file = getFileName(part);

		System.out.println(board_file);

		if (board_file.isEmpty()) {
			board.setBoard_id(null);
		} else {
			File renameFile = FileRenamePolicy.rename(new File(path,board_file));
			part.write(renameFile.getName());
			board.setBoard_file(path+"/"+renameFile.getName());
			
		}
		BoardDAO dao = new BoardDAO();
		dao.insert(board);

		request.getRequestDispatcher("/board/boardInsertOutput.jsp").forward(request, response);

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
