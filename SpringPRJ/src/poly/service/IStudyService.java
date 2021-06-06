package poly.service;

import java.util.List;
import java.util.Map;

import poly.dto.StudyListDTO;

public interface IStudyService {

	List<StudyListDTO> getAllStudyList();

	int insertStudyInfo(StudyListDTO sDTO);

	StudyListDTO getStudyInfo(String study_name);

	List<StudyListDTO> getJoinStudyList(List<String> aList);

	int updateJoinUser(Map<String, String> sMap);
	
}
