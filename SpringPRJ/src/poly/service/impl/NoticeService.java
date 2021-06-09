package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BoardDTO;
import poly.persistance.mapper.INoticeMapper;
import poly.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService{
	
	@Resource(name="NoticeMapper")
	private INoticeMapper noticeMapper;

	@Override
	public List<BoardDTO> getNoticeList() throws Exception {
		return noticeMapper.getNoticeList();
	}

	@Override
	public void InsertNoticeInfo(BoardDTO pDTO) throws Exception {
		noticeMapper.InsertNoticeInfo(pDTO);
	}

	@Override
	public BoardDTO getNoticeInfo(BoardDTO pDTO) throws Exception {
		return noticeMapper.getNoticeInfo(pDTO);
	}

	@Override
	public void upateNoticeReadCnt(BoardDTO pDTO) throws Exception {
		noticeMapper.upateNoticeReadCnt(pDTO);
	}

	@Override
	public void updateNoticeInfo(BoardDTO pDTO) throws Exception {
		noticeMapper.updateNoticeInfo(pDTO);
	}

	@Override
	public void deleteNoticeInfo(BoardDTO pDTO) throws Exception {
		noticeMapper.deleteNoticeInfo(pDTO);
	}

}
