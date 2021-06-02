package poly.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.OcrDTO;
import poly.persistance.mapper.IImgMapper;
import poly.service.IImgService;

@Service("ImgService")
public class ImgService implements IImgService{
	
	@Resource(name="ImgMapper")
	private IImgMapper imgMapper;

	@Override
	public int InsertImage(OcrDTO pDTO) throws Exception {
		
		return imgMapper.InsertImage(pDTO);
	}

	@Override
	public Map<String, String> getImgList(String id) {
		
		return imgMapper.getImgList(id);
	}

}
