package sns.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sns.board.db.BoardDAO;

public class DeleteBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int b_num = Integer.parseInt(request.getParameter("b_num"));
		
		BoardDAO bdao = new BoardDAO();
		bdao.deleteBoard(b_num);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.ma");
		forward.setRedirect(true);
		
		return forward;
	}

}
