package poly.service;

import poly.dto.UserDTO;

public interface IUserService {

	UserDTO getUserInfo(UserDTO uDTO) throws Exception;

	int insertUserInfo(UserDTO uDTO) throws Exception;

	UserDTO idCheck(String userId) throws Exception;
	
}
