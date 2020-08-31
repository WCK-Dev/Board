package egovframework.example.board.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO;
import egovframework.example.board.service.UserVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

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
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> boardList = boardService.selectBoardList(boardVO);
		model.addAttribute("boardList", boardList);
		model.addAttribute("board", boardVO);
		
		List<?> noticeList = boardService.selectNoticeList(boardVO);
		model.addAttribute("noticeList", noticeList);

		int totCnt = boardService.selectBoardListTotCnt(boardVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "board/boardList";
	}
	
	@RequestMapping(value="writeBoard.do" , method = RequestMethod.GET)
	public String writeBoard() throws Exception {
		
		return "board/writeBoard";
	}

	@ResponseBody
	@RequestMapping(value="writeBoard.do" , method = RequestMethod.POST)
	public void writeBoard(@ModelAttribute("board")BoardVO boardVO, ModelMap model) throws Exception {
		
		
		int b_no = boardService.selectMaxBno() + 1;
		boardVO.setB_no(b_no);
		
		boardService.insertBoard(boardVO);
	}

	@RequestMapping(value="readBoard.do")
	public String readBoard(@ModelAttribute("board")BoardVO boardVO, ModelMap model) throws Exception {
		
		boardService.updateReadCnt(boardVO);

		model.addAttribute("boardVO", boardService.selectBoard(boardVO));
		
		return "board/readBoard";
	}
	
	@RequestMapping(value="updateBoard.do", method = RequestMethod.GET)
	public String updateBoard(int b_no, ModelMap model, HttpServletRequest request) throws Exception {
		
		model.addAttribute("session_user_id", request.getSession().getAttribute("user_id"));
		
		BoardVO boardVO = new BoardVO();
		boardVO.setB_no(b_no);
		
		model.addAttribute("boardVO", boardService.selectBoard(boardVO));
		
		return "board/updateBoard";
	}
	
	@RequestMapping(value="updateBoard.do", method = RequestMethod.POST)
	public String updateBoard(@ModelAttribute("board")BoardVO boardVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		boardVO.setB_writer((String)request.getSession().getAttribute("user_id"));

		boardService.updateBoard(boardVO);
		return "redirect:/readBoard.do?b_no=" + boardVO.getB_no();
	}

	@ResponseBody
	@RequestMapping(value="deleteBoard.do", method = RequestMethod.POST)
	public void deleteBoard(BoardVO boardVO, HttpServletRequest request) throws Exception{

		boardVO.setB_writer((String)request.getSession().getAttribute("user_id"));
		
		boardService.deleteBoard(boardVO);
		
	}
	
	@RequestMapping(value="writeReply.do", method =RequestMethod.GET)
	public String writeReply(@ModelAttribute("board")BoardVO boardVO, ModelMap model) throws Exception {
		
		model.addAttribute("boardVO", boardService.selectBoard(boardVO));
		
		return "board/writeReply";
	}
	
	@ResponseBody
	@RequestMapping(value="insertReply.do", method = RequestMethod.POST)
	public void insertReply(@ModelAttribute("board")BoardVO boardVO, ModelMap model) throws Exception {
		
		int b_no = boardService.selectMaxBno() + 1;
		boardVO.setB_no(b_no);
		
		boardService.insertReply(boardVO);
	}
	
	@RequestMapping(value="signUp.do", method = RequestMethod.GET)
	public String signUp() throws Exception{
		
		return "board/signUp";
	}
	
	@RequestMapping(value="signUp.do", method = RequestMethod.POST)
	public String signUp(UserVO userVO, RedirectAttributes ra) throws Exception{
		
		if(boardService.insertUser(userVO) == 1) {
			ra.addFlashAttribute("joinSuccessMsg", "회원가입이 완료되었습니다.");
		} else {
			ra.addFlashAttribute("joinErrorMsg", "회원가입에 오류가 발생했습니다.");
		};
		
		return "redirect:/boardList.do";
	}
	
	@RequestMapping(value="idCheck.do")
	@ResponseBody
	public String idCheck(@RequestParam String user_id) {
		return boardService.userIdCheck(user_id);
	}
	
	@RequestMapping(value="login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest request) throws Exception {
		
		return "board/login";
	}
	
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	public String login(UserVO user, String isPopUp, RedirectAttributes ra, HttpServletRequest request) throws Exception {
		UserVO userVO = boardService.loginCheck(user);
		
		if( userVO != null ) {
			request.getSession().setAttribute("user_id", userVO.getUser_id());
			request.getSession().setAttribute("user_name", userVO.getUser_name());
			ra.addFlashAttribute("loginSuccess", "Y");
		} else {
			request.getSession().setAttribute("user_id", "");
			request.getSession().setAttribute("user_name", "");
			ra.addFlashAttribute("loginErrorMsg", "사용자 정보를 확인해주십시오.");
		}
		
		if(isPopUp != null && isPopUp.equals("true")) {
			return "redirect:/login.do";
		}
			return "redirect:/boardList.do";
	}
	
	@RequestMapping(value="logout.do")
	public String logout(HttpServletRequest request) throws Exception {
		
		request.getSession().removeAttribute("user_id");
		request.getSession().removeAttribute("user_name");
		
		return "redirect:/boardList.do";
	}
}
