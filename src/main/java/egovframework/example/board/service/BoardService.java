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
package egovframework.example.board.service;

import java.util.List;

public interface BoardService {

	String insertBoard(BoardVO vo) throws Exception;

	void updateBoard(BoardVO vo) throws Exception;

	void deleteBoard(BoardVO vo) throws Exception;

	BoardVO selectBoard(BoardVO vo) throws Exception;
	
	void updateReadCnt(BoardVO vo) throws Exception;

	List<?> selectBoardList(BoardVO vo) throws Exception;
	
	int selectMaxBno()throws Exception;
	
	int updateGrpord(BoardVO vo) throws Exception;
	
	int insertReply(BoardVO vo) throws Exception;

	int selectBoardListTotCnt(BoardVO vo);
	
	List<?> selectNoticeList(BoardVO vo) throws Exception;
	
	String userIdCheck(String vo);
	
	int insertUser(UserVO vo);
	
	UserVO loginCheck(UserVO vo);
	
	List<?> selectUserList(UserVO vo);
	
	int selectUserListTotCnt(UserVO vo);

	UserVO selectUser(UserVO vo);

	int updateUser(UserVO vo);
	
	int selectMaxCno();
	
	int insertComment(CommentVO vo);
	
	int deleteComment(CommentVO vo);
	
	List<?> selectCommentList(BoardVO vo);
	
	int insertHistory(HistoryVO vo);
	
	int checkHistory(HistoryVO vo);
}
