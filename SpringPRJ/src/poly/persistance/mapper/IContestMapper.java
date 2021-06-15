package poly.persistance.mapper;

import config.Mapper;
import poly.dto.ContestDTO;

@Mapper("ContestMapper")
public interface IContestMapper {

	int saveJsonCrawl(ContestDTO pDTO) throws Exception;

}
