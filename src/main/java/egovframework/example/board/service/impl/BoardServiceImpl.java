/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO;
import egovframework.example.board.service.UserVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {

	private static final Logger LOGGER = LoggerFactory.getLogger(BoardServiceImpl.class);

	// mybatis 사용
	  @Resource(name="boardMapper")
	  private BoardMapper boardDAO;

	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public String insertBoard(BoardVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		boardDAO.insertBoard(vo);
		
		return vo.getB_no() + "";
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		System.err.println("service까지 동작확인");

		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) throws Exception {
		boardDAO.deleteBoard(vo);
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) throws Exception {
		BoardVO resultVO = boardDAO.selectBoard(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}
	
	@Override
	public void updateReadCnt(BoardVO vo) throws Exception {
		boardDAO.updateReadCnt(vo);
	}

	@Override
	public List<?> selectBoardList(BoardVO vo) throws Exception {
		return boardDAO.selectBoardList(vo);
	}
	
	@Override
	public int selectMaxBno() throws Exception {
		return boardDAO.selectMaxBno();
	}
	
	@Override
	public int updateGrpord(BoardVO vo) throws Exception {
		return boardDAO.updateGrpord(vo);
	}
	
	@Override
	public int insertReply(BoardVO vo) throws Exception {
		return boardDAO.insertReply(vo);
	}
	
	@Override
	public int selectBoardListTotCnt(BoardVO vo) {
		return boardDAO.selectBoardListTotCnt(vo);
	}
	
	@Override
	public List<?> selectNoticeList(BoardVO vo) throws Exception {
		return boardDAO.selectNoticeList(vo);
	}
	
	@Override
	public String userIdCheck(String user_id) {
		return boardDAO.userIdCheck(user_id);
	}
	
	@Override
	public void insertUser(UserVO vo) {
		boardDAO.insertUser(vo);
	}
	
	@Override
	public UserVO loginCheck(UserVO vo) {
		return boardDAO.loginCheck(vo);
	}


}
