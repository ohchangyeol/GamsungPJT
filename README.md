# 🏕️Gamsung Campping Project🏕️
캠핑 관련 중고거래, 양도, 예약, 커뮤니티 서비스를 갖춘 웹 플랫폼

## Application introduction
방역 체계를 전환하는 ‘위드 코로나’가 시행되었지만
여전히 사람이 대거 몰리는 관광지나 숙소는 꺼려하는 이들이 많다.

이로 인하여 인구가 밀집된 도심보다는 한적한 자연 속에서의 감성, 추억을 위한 소수인원 위주의 캠핑인구와
업무로 인한 스트레스를 해소하기 위해 여가 및 취미활동에 적극적 소비를 하는 신규 직장인들의 최신 성향이 맞물려 캠핑에 대한 수요가 몰리고 있다.

캠핑 열풍 초기 모든 장비가 구비된 글램핑 대여나 최소한의 장비로 즐기는 미니멀 캠핑 등이 유행했으나 최근에는 목적에 맞는 텐트, 불멍을 위한 화로, 스테이크를 위한 그리들 등 다양한 부가 장비를 구매해 본격적인 캠핑을 시작하는 사람들이 점차 늘고 있어 여러 기업들에서는 캠핑족을 사로잡기 위한 다양한 상품들을 출시하고 있다.

또한 신품 캠핑 장비의 경우 수요에 비해 공급이 부족한 경우가 많아 캠핑용품 품귀 현상이 자주 발생하며
이에 따라 중고 제품을 구매하는 소비자가 많은데 중고거래 시 발생하는 불만족 및 사기 피해 또한 증가하고 있다. 이에 따라 해당 문제점들을 보완하고 기존 예약 사이트와 차별 점을 두기 위해 예약, 위치검색 이외 추가적으로 캠핑과 관련된 기능을 한 곳에 해결할 수 있는 편의를 제공하는 웹(앱) 사이트를 구축하려고 한다.


### Model2MVCShop  



### Update  history
- [REFACTORING 01](https://github.com/ohchangyeol/mini-project/tree/main/01.Model2MVCShop(stu))  
    Spring framework를 사용하지않고 dispatcherservlet, resolver, mapping, connection을 직접 구현하여 동작 방식의 이해하여 제작

- [REFACTORING 02](https://github.com/ohchangyeol/mini-project/tree/main/02.Model2MVCShop(Refactor%20%26%20Page%20Navigation))  
    Page **POJO**를 통해 Page Navigation 기능 추가

- [REFACTORING 03](https://github.com/ohchangyeol/mini-project/tree/main/03.Model2MVCShop(EL%2CJSTL))  
    Java server Page에 자바형식의 코드를 간편하게 사용할 수 있는 **EL**과,  
    태그처럼 연산이나 조건문이나 반복문인 if문, for문을 편하게 처리할 수 있는 **JSTL**로 업데이트

- [REFACTORING 04](https://github.com/ohchangyeol/mini-project/tree/main/04.Model2MVCShop(Business%20Logic%2CMyBatis%20Spring))  
    **Business Logic**에 복잡한 JDBC코드를 걷어내며 깔끔한 소스코드로 관리하고  
    직접 Beans가 RDBMS에 접근하는 형태보다는 dbcp와 Mybatis를 활용하여 RDBMS에 접근하고 SQL을 관리

- [REFACTORING 05](https://github.com/ohchangyeol/mini-project/tree/main/05.Model2MVCShop(AOP%2CTransaction))  
    **Business Logic**에 AOP를 이용한 Transaction을 사용하여 데이터 처리하는 과정에 오류가 발생할 경우 Rollback
- [REFACTORING 06](https://github.com/ohchangyeol/mini-project/tree/main/06.Model2MVCShop(Presentation%2BBusinessLogic))  
   refactoring 04, 05번을 통해 구현한 Business logic 부분을  controller를 만들어 annotation Mapping을 사용해 Presentation logic이랑 연결

- [REFACTORING 07](https://github.com/ohchangyeol/mini-project/tree/main/07.Model2MVCShop(URI%2Cpattern))  
    url pattern을 적용    

- [REFACTORING 08-Client](https://github.com/ohchangyeol/mini-project/tree/main/08.Model2MVCShop(RestFul%20Client))  
    Web을 platform하여 httpcomponents를 사용해 url 테스트  
    하고 data json simple과 jackson을 사용해 json 형식으로 변환 테스트. 

- [REFACTORING 08-Server](https://github.com/ohchangyeol/mini-project/tree/main/08.Model2MVCShop(RestFul%20Server))  
    Model과 View를 전송하는 방식이 아닌 RestController를 사용하여 Model(json) 전송  

- [REFACTORING 09](https://github.com/ohchangyeol/mini-project/tree/main/09.Model2MVCShop(jQuery))  
    정적인 JSP을 javascript(jQuery)를 활용해 동적으로 수정

- [REFACTORING 10](https://github.com/ohchangyeol/mini-project/tree/main/10.Model2MVCShop(Ajax))  
    자바스크립트(Ajax)를 통해서 서버에 데이터를 비동기 방식으로 요청하여 페이지 리로드 할 필요 없이 필요한 data를 추출

- [REFACTORING 11](https://github.com/ohchangyeol/mini-project/tree/main/11.Model2MVCShop)  
    css framework를 사용하여 Presentation 디자인 업데이트
