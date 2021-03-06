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
package egovframework.example.gallery.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.gallery.service.FilesVO;
import egovframework.example.gallery.service.GalleryService;
import egovframework.example.gallery.service.GalleryVO;
import egovframework.example.gallery.service.TagVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("galleryService")
public class GalleryServiceImpl extends EgovAbstractServiceImpl implements GalleryService {

	private static final Logger LOGGER = LoggerFactory.getLogger(GalleryServiceImpl.class);

	// mybatis 사용
	@Resource(name="galleryMapper")
	private GalleryMapper galleryDAO;

	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public int selectMaxGseq() {
		return galleryDAO.selectMaxGseq();
	}
	
	@Override
	public int insertGallery(GalleryVO vo) {
		return galleryDAO.insertGallery(vo);
	}

	@Override
	public int insertFile(FilesVO vo) {
		return galleryDAO.insertFile(vo);
	}

	@Override
	public int insertTag(TagVO vo) {
		return galleryDAO.insertTag(vo);
	}

	@Override
	public List<GalleryVO> selectGalleryList(GalleryVO vo) {
		return galleryDAO.selectGalleryList(vo);
	}
	
	@Override
	public int selectGalleryListTotCnt(GalleryVO vo) {
		return galleryDAO.selectGalleryListTotCnt(vo);
	}
	
	@Override
	public List<TagVO> selectTagRank() {
		return galleryDAO.selectTagRank();
	}

	@Override
	public GalleryVO selectGallery(GalleryVO vo) {
		galleryDAO.updateGalleryReadCnt(vo);
		galleryDAO.updateTagReadCnt(vo);
		return galleryDAO.selectGallery(vo);
	}
	
	@Override
	public FilesVO selectFile(FilesVO vo) {
		return galleryDAO.selectFile(vo);
	}
	
	@Override
	public void updateFileDownCnt(FilesVO vo) {
		galleryDAO.updateFileDownCnt(vo);
	}

	@Override
	public List<FilesVO> selectFileList(GalleryVO vo) {
		return galleryDAO.selectFileList(vo);
	}

	@Override
	public int deleteGallery(GalleryVO vo) {
		return galleryDAO.deleteGallery(vo);
	}

	@Override
	public int updateGallery(GalleryVO vo) {
		return galleryDAO.updateGallery(vo);
	}

	@Override
	public int deleteTag(TagVO vo) {
		return galleryDAO.deleteTag(vo);
	}

	@Override
	public int deleteFile(FilesVO vo) {
		return galleryDAO.deleteFile(vo);
	}

	@Override
	public int selectTagDownCnt(TagVO vo) {
		return galleryDAO.selectTagDownCnt(vo);
	}

}
