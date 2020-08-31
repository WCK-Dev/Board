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

import java.sql.Timestamp;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class BoardVO extends BoardDefaultVO {

	private static final long serialVersionUID = 1L;

	/** 게시글 번호 */
	private int b_no;

	/** 제목 */
	private String b_title;

	/** 내용 */
	private String b_content;

	/** 게시자 */
	private String b_writer;
	
	/** 사용여부 */
	private Timestamp b_regdate;
	
	/** 조회수 */
	private int b_readcnt;

	/** 원글 번호 */
	private int b_refno;
	
	/** 답글의 계층 */
	private int b_depth;
	
	/** 글유형 (공지, 일반) */
	private int b_category;
	
	private int b_order;
	
	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public Timestamp getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Timestamp b_regdate) {
		this.b_regdate = b_regdate;
	}

	public int getB_readcnt() {
		return b_readcnt;
	}

	public void setB_readcnt(int b_readcnt) {
		this.b_readcnt = b_readcnt;
	}

	public int getB_refno() {
		return b_refno;
	}

	public void setB_refno(int b_refno) {
		this.b_refno = b_refno;
	}

	public int getB_depth() {
		return b_depth;
	}

	public void setB_depth(int b_depth) {
		this.b_depth = b_depth;
	}

	public int getB_category() {
		return b_category;
	}

	public void setB_category(int b_category) {
		this.b_category = b_category;
	}
	
	public int getB_order() {
		return b_order;
	}

	public void setB_order(int b_order) {
		this.b_order = b_order;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
