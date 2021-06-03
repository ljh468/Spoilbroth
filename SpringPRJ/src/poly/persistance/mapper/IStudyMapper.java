package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.StudyListDTO;

@Mapper("StudyMapper")
public interface IStudyMapper {

	public List<StudyListDTO> getAllStudyList();

}
