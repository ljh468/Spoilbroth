package poly.service;

import java.util.List;

import poly.dto.StudyListDTO;

public interface IStudyService {

	List<StudyListDTO> getAllStudyList();

	int insertStudyInfo(StudyListDTO sDTO);

	StudyListDTO getStudyInfo(String study_name);
	
}
