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

import model.BoardVO;
import model.NoticeDAO;

public class NoticeUpdateCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String board_id =request.getParameter("board_id");
		String board_title = request.getParameter("board_title");
		String board_contents = request.getParameter("board_contents");
		String original_board_file = request.getParameter("board_file");
		String path = "C:/upload";
		// String views = request.getParameter("views");
		
		BoardVO board = new BoardVO();

		board.setBoard_title(board_title);
		board.setBoard_contents(board_contents);
		board.setBoard_file(original_board_file);
		board.setBoard_id(board_id);
		Part part = request.getPart("file");
		String board_file = getFileName(part);
		
		if (board_file != null && !board_file.isEmpty()) {
				 
			File renameFile = FileRenamePolicy.rename(new File(board_file));
			part.write(renameFile.getName());
			board.setBoard_file(path+"/"+renameFile.getName());
		}
		NoticeDAO dao = new NoticeDAO();
		dao.update(board);
		if (board_id.startsWith("A")) {
			board_id = board_id.substring(1);
		}
		
		request.getRequestDispatcher("/board/noticeSelect.do?board_id="+board_id).forward(request, response);
		
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


