package poly.service;

import java.util.List;
import java.util.Map;

import poly.dto.OcrDTO;

public interface IImgService {
	
	// 프로필 이미지 정보 저장하기
	public int InsertImage(OcrDTO pDTO) throws Exception;
	
	// 프로필 이미지 정보 가져오기
	public Map<String, String> getImgList(String id);
	
}
