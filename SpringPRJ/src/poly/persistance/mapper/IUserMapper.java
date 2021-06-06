package poly.persistance.mapper;

import java.util.Map;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface IUserMapper {

	// 회원가입 하기 ( 회원정보 등록하기 )
	int insertUserInfo(UserDTO uDTO) throws Exception;
	
	// 회원가입 전 중복체크하기 ( DB 조회히기)
	UserDTO getUserExists(UserDTO uDTO) throws Exception;
	
	// 회원정보 불러오기
	UserDTO getUserInfo(UserDTO uDTO) throws Exception;

	UserDTO idCheck(String userId) throws Exception;

	int updateJoinStudy(Map<String, String> sMap) throws Exception;
	
}
