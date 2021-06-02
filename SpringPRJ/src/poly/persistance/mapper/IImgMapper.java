package poly.persistance.mapper;

import java.util.Map;

import config.Mapper;
import poly.dto.OcrDTO;

@Mapper("ImgMapper")
public interface IImgMapper {
	
	// 유저 프로필 이미지 저장하기
	int InsertImage(OcrDTO pDTO) throws Exception;
	
	// 프로필 이미지 가져오기
	Map<String, String> getImgList(String id);

	
	
}
