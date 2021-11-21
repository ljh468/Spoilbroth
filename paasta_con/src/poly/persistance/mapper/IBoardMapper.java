package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BoardDTO;
import poly.dto.OcrDTO;

@Mapper("BoardMapper")
public interface IBoardMapper {

	// 게시판 리스트
	List<BoardDTO> getBoardList(String study_seq) throws Exception;
	
	// 게시판 글 등록
	int InsertBoardInfo(BoardDTO pDTO) throws Exception;
	
	// 게시판 상세보기
	BoardDTO getBoardInfo(BoardDTO pDTO) throws Exception;
	
	// 게시판 조회수 업데이트
	void updateBoardReadCnt(BoardDTO pDTO) throws Exception;
	
	// 게시판 글 수정
	void updateBoardInfo(BoardDTO pDTO) throws Exception;
	
	// 게시판 글 삭제
	void deleteBoardInfo(BoardDTO pDTO) throws Exception;
	
	//파일 등록시 게시판 pk랑 같이 등록
	BoardDTO getNotiSeq(BoardDTO pDTO) throws Exception;
	
	//게시판 상세보기시 파일 보여주기
	List<OcrDTO> getFileList(String notice_seq) throws Exception;

}
