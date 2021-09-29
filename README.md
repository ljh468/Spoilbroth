# Spoilbroth

- SpringPRJ -> src -> poly 에 들어가시면 서버코드
- SpringPRJ -> WebContent -> WEB-INF -> view 에 들어가면 jps코드 확인 가능합니다. 

## MBTI성향분석을 활용한 스터디매칭 애플리케이션(data mining, WebSocket)
시연 영상 : [![](https://user-images.githubusercontent.com/64997253/131215235-c395ea58-bdc8-437f-966e-163ffb41fedb.jpg)](https://www.youtube.com/watch?v=Gf1kTz76lh8 "demo")

## 적용 기술
        - 프레임워크 : SpringFramework
        - 데이터베이스 : MariaDB, RedisDB
        - 클라우드 환경 : Amazon Web Service
        - 개발 언어 : Java, Python
        - 개발 기술 : Java, Websocket(실시간 채팅), Python Flask(Selenium 웹크롤링)
        - 에디터 : Eclipse
        
## 기능

1. MBTI 성향분석
        - 개인의 성향을 파악할 수 있는 MBTI 성격유형 검사를 제공하여 성향간의 궁합을 분석함
        - 성향간의 궁합은 16가지 성격유형의 상관관계의 가중치를 두어 분석

2. 스터디모임 추천 서비스
        - 생성된 스터디그룹의 팀원의 성향을 사용자의 성향과 비교 분석하여 사용자에 맞는 스터디 그룹을 추천함

3. 정보 공유서비스
        - 각 스터디모임은 멀티게시판으로 구현되어 팀원들간 소통이 가능
        - WebSocket을 활용한 실시간채팅은 각그룹별로 RedisDB에 저장되며 개인적인 정보를 공유할 수 있음
        - Python Selenium라이브러리를 활용하여 웹사이트에서 크롤링한 공모전 데이터는 사용자에 맞춤형 정보를 제공함 

### 프로젝트 기간
        - 2021-05-01 ~ 2021-06-10  
