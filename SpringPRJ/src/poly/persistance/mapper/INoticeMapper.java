package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BoardDTO;
import poly.dto.DummyDTO;

@Mapper("NoticeMapper")
public interface INoticeMapper {

	// 게시판 리스트
	List<BoardDTO> getNoticeList() throws Exception;
	
	// 게시판 글 등록
	void InsertNoticeInfo(BoardDTO pDTO) throws Exception;
	
	// 게시판 상세보기
	BoardDTO getNoticeInfo(BoardDTO pDTO) throws Exception;
	
	// 게시판 조회수 업데이트
	void upateNoticeReadCnt(BoardDTO pDTO) throws Exception;
	
	// 게시판 글 수정
	void updateNoticeInfo(BoardDTO pDTO) throws Exception;
	
	// 게시판 글 삭제
	void deleteNoticeInfo(BoardDTO pDTO) throws Exception;
}
