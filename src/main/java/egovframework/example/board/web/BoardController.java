package egovframework.example.board.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO;
import egovframework.example.board.service.UserVO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class BoardController {
	
	/** EgovSampleService */
	@Resource(name = "boardService")
	private BoardService boardService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@RequestMapping(value="boardList.do")
	public String boardList(@ModelAttribute("board")BoardVO boardVO, ModelMap model) throws Exception {
		
		/** EgovPropertyService.sample */
		//boardVO.setPageUnit(propertiesService.getInt("pageUnit"));
		//boardVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		//PaginationInfo paginationInfo = new PaginationInfo();
		//paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		//paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		//paginationInfo.setPageSize(boardVO.getPageSize());

		//boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		//boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		//boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> boardList = boardService.selectBoardList(boardVO);
		model.addAttribute("resultList", boardList);
		model.addAttribute("board", boardVO);

		int totCnt = boardService.selectBoardListTotCnt(boardVO);
		//paginationInfo.setTotalRecordCount(totCnt);
		//model.addAttribute("paginationInfo", paginationInfo);

		return "board/boardList";
	}
	
	@RequestMapping(value="writeBoard.do" , method =RequestMethod.GET)
	public String writeBoard() throws Exception {
		
		return "board/writeBoard";
	}

	@RequestMapping(value="writeBoard.do" , method =RequestMethod.POST)
	public String writeBoard(@ModelAttribute("board")BoardVO boardVO, ModelMap model) throws Exception {
		
		int grpno = boardService.selectMaxBno() + 1;
		boardVO.setB_grpno(grpno);
		
		boardService.insertBoard(boardVO);
		return "redirect:/boardList.do";
	}

	@RequestMapping(value="readBoard.do")
	public String readBoard(@ModelAttribute("board")BoardVO boardVO, ModelMap model) throws Exception {
		
		model.addAttribute("boardVO", boardService.selectBoard(boardVO));
		
		return "board/readBoard";
	}
	
	@RequestMapping(value="replyWrite.do", method =RequestMethod.GET)
	public String replyWrite(@ModelAttribute("board")BoardVO boardVO, ModelMap model) throws Exception {
		
		model.addAttribute("boardVO", boardService.selectBoard(boardVO));
		
		return "board/writeReply";
	}
	
	@RequestMapping(value="insertReply.do", method =RequestMethod.POST)
	public String insertReply(@ModelAttribute("board")BoardVO boardVO, ModelMap model) throws Exception {
		
		boardService.updateGrpord(boardVO);
		boardService.insertReply(boardVO);
		
		return "redirect:/boardList.do";
	}
	
	@RequestMapping(value="login.do")
	public String login(UserVO user, ModelMap model, HttpServletRequest request) throws Exception {
		
		System.out.println("user_id : " + user.getUser_id());
		System.out.println("user_pwd : " + user.getUser_pwd());
		
		UserVO userVO = boardService.loginCheck(user);
		
		if( userVO != null ) {
			request.getSession().setAttribute("user_id", userVO.getUser_id());
			request.getSession().setAttribute("user_name", userVO.getUser_name());
		} else {
			request.getSession().setAttribute("user_id", "");
			request.getSession().setAttribute("user_name", "");
			model.addAttribute("loginErrorMsg", "사용자 정보를 확인해주십시오.");
		}
		
		return "forward:/boardList.do";
	}
	
	@RequestMapping(value="logout.do")
	public String logout(HttpServletRequest request) throws Exception {
		
		request.getSession().invalidate();
		
		return "redirect:/boardList.do";
	}
}
