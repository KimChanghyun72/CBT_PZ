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

public class BoardUpdateCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String board_id =request.getParameter("board_id");
		String board_title = request.getParameter("board_title");
		String board_contents = request.getParameter("board_contents");
		String member_id = request.getParameter("member_id");
		String original_board_file = request.getParameter("board_file");
		String path = "C:/upload";
	
		BoardVO board = new BoardVO();

		board.setBoard_title(board_title);
		board.setBoard_contents(board_contents);
		board.setMember_id(member_id);
		board.setBoard_file(original_board_file);
		board.setBoard_id(board_id);
		Part part = request.getPart("file");
		String board_file = getFileName(part);
		
		//###유효성 검사###
		if (board_file != null && !board_file.isEmpty()) {
				 
			File renameFile = FileRenamePolicy.rename(new File(board_file));
			part.write(renameFile.getName());
			board.setBoard_file(path+"/"+renameFile.getName());
		}
		BoardDAO dao = new BoardDAO();
		dao.update(board);

		request.getRequestDispatcher("/board/boardSelect.do?=board_id"+board_id).forward(request, response);

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
