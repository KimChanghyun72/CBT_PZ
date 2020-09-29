package board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import controller.Controller;

public class FilenameDownloadCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getParameter("board_file");

		File file = new File(realPath);
		String downName = new String(realPath.getBytes("utf-8"), "iso-8859-1");
		
		
		if(! file.exists() ) {
			return;
		}
		
		response.reset();
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + downName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		
		FileUtils.copyFile(file, response.getOutputStream());
		
		response.getOutputStream().close();

	}

}
