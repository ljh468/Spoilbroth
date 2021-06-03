package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.StudyListDTO;

@Mapper("StudyMapper")
public interface IStudyMapper {

	List<StudyListDTO> getAllStudyList();

	StudyListDTO getStudyExists(StudyListDTO sDTO);

	int insertStudyInfo(StudyListDTO sDTO);

	StudyListDTO getStudyInfo(String study_name);

}
