package poly.persistance.mapper;

import java.util.List;
import java.util.Map;

import config.Mapper;
import poly.dto.StudyListDTO;

@Mapper("StudyMapper")
public interface IStudyMapper {

	List<StudyListDTO> getAllStudyList();

	StudyListDTO getStudyExists(StudyListDTO sDTO);

	int insertStudyInfo(StudyListDTO sDTO);

	StudyListDTO getStudyInfo(String study_name);

	List<StudyListDTO> getJoinStudyList(List<String> aList);

	int updateJoinUser(Map<String, String> sMap);

}
