package poly.persistance.redis.impl;

import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Component;

import poly.persistance.redis.IMyRedisMapper;

@Component("MyRedisMapper")
public class MyRedisMapper implements IMyRedisMapper{
	
	@Autowired
	public RedisTemplate<String, Object> redisDB;
	
	private Logger log = Logger.getLogger(this.getClass());

	@Override
	public void doSaveData() throws Exception {
		
		// 로그찍기 (추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".getCacheData service start!!");
		
		String redisKey = "Test01";
		String saveData = "난 저장되는 데이터이다.";
		
		/*
		 * redis 저장 및 읽기에 대한 데이터 타입지정(String 타입으로 지정함)
		 */	
		redisDB.setKeySerializer(new StringRedisSerializer()); // String 타입
		redisDB.setValueSerializer(new StringRedisSerializer()); // String 타입
		
		/*
		 * 데이터가 존재하면 바로 반환
		 */
		if(redisDB.hasKey(redisKey)) {
			String res = (String) redisDB.opsForValue().get(redisKey); // key가 존재하면 데이터읽기
			
			log.info("res : " + res);
		} else {
			redisDB.opsForValue().set(redisKey, saveData); // Key가 없으면 데이터저장
			
			redisDB.expire(redisKey, 2, TimeUnit.DAYS);
			log.info("No Data!!");
		}
		
	}

	@Override
	public void doSaveDataforList() throws Exception {
		
		// 로그찍기
		log.info(this.getClass().getName() + ".doSaveDataforList start!!");
		
		String redisKey = "Test02-List";
		
		/*
		 * redis 저장 및 읽기에 대한 데이터 타입 지정(String 타입으로 지정함)
		 */
		redisDB.setKeySerializer(new StringRedisSerializer()); 
		redisDB.setValueSerializer(new StringRedisSerializer());
		
		if(redisDB.hasKey(redisKey)) {
		
			// Redis에 저장된 데이터 전체 가져오기
			// 데이터 인덱스는 0부터 시작하며, 세번째 인자값은 -1로 설정하면 모두 가져옴
			List<String> pList = (List) redisDB.opsForList().range(redisKey, 0, -1);
			
			Iterator<String> it = pList.iterator();
			
			while(it.hasNext()) {
				String data = (String) it.next();
				
				log.info("data : " + data);
				
			}
		}else {
			
			// List를 배열과 같이 여러개의 데이터가 생성되기 때문에 반복문을 통해 데이터 저장
			for(int i = 0; i< 10; i++) {
				
				redisDB.opsForList().rightPush(redisKey,  "[" + i + "] 번째 데이터 입니다.");
				
			}
			
			// 저장되는 데이터의 유효기간(TTL)은 5시간으로 정의
			redisDB.expire(redisKey, 5, TimeUnit.HOURS);
			log.info("Sava Data!!");
		}
	}
	
	
}