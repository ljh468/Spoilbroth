package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.StudyListDTO;
import poly.persistance.mapper.IStudyMapper;
import poly.service.IStudyService;

@Service("StudyService")
public class StudyService implements IStudyService{
	
	@Resource(name="StudyMapper")
	private IStudyMapper studyMapper;

	@Override
	public List<StudyListDTO> getAllStudyList() {
		
		return studyMapper.getAllStudyList();
	}

}
