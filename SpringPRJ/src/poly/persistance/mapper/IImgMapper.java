package poly.persistance.mapper;

import config.Mapper;
import poly.dto.OcrDTO;

@Mapper("ImgMapper")
public interface IImgMapper {
	
	// 유저 프로필 이미지 저장하기
	int InsertImage(OcrDTO pDTO) throws Exception;

	
	
}
