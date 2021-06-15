package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.ContestDTO;
import poly.persistance.mapper.IContestMapper;
import poly.service.IContestService;

@Service("ContestService")
public class ContestService implements IContestService {

	@Resource(name = "ContestMapper")
	private IContestMapper contestMapper;

	@Override
	public int saveJsonCrawl(ContestDTO pDTO) throws Exception { // 웹크롤링 저장 로고
		int save = 0;
			
		save = contestMapper.saveJsonCrawl(pDTO);
		return save;
	}

	

}
