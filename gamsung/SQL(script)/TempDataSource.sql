INSERT INTO USERS(user_id, addr, role, nick_name, password, name, phone, entry_reg_date, camp_name, camp_call, having_point, salt, auction_grade) values
('admin', '서울 강남구', 'ADMIN', '관리자', 'admin', '최정아', '77777777', SYSDATE(), null, null, 0, null, null),
('gamsungsite@gmail.com', '서울 강남구', 'GENERAL', '감성캠핑', '9c2d11fbca3ffb5f0746fa84b24e0feaca2113450720e271edfabf9a3a6f8881', '감성캠핑', '01012345678', SYSDATE(), null, null, 0, '9fb488826f89350c', 100),
('user1@gamsung.com', '서울 강남구', 'GENERAL', '니코', '1111', '김관우', '01022223333', SYSDATE(), null, null, 100, null, null),
('user2@gamsung.com', '서울 강남구', 'GENERAL', '헤이즐', '2222', '이소희', '01012345679', SYSDATE(), null, null, 100, null, null),
('user3@gamsung.com', '서울 강남구', 'GENERAL', '제나바', '3333', '유희주', '01012345680', SYSDATE(), null, null, 100, null, null),
('user4@gamsung.com', '서울 강남구', 'GENERAL', '키아라', '4444', '조영주', '01012345681', SYSDATE(), null, null, 100, null, null),
('user5@gamsung.com', '서울 강남구', 'GENERAL', '이젤라', '5555', '권도윤', '01012345682', SYSDATE(), null, null, 100, null, null),
('businessuser1@gamsung.com', '서울 노원구 하계1동 현대아파트', 'BUSINESS', null, '1111', '박철홍', '01012345683', SYSDATE(), '갤럭시', '021234567', 100, null, null),
('businessuser2@gamsung.com', '서울 강남구', 'BUSINESS', null, '2222', '오창열', '01012345684', SYSDATE(), '오감자', '0315552637', 100, null, null),
('businessuser3@gamsung.com', '서울 은평구', 'BUSINESS', null, '3333', '최인규', '01012345685', SYSDATE(), '밀키웨이', '0329998476', 100, null, null),
('businessuser4@gamsung.com', '서울 강서구', 'BUSINESS', null, '4444', '황현지', '01012345686', SYSDATE(), '아리스', '029384736', 100, null, null),
('businessuser5@gamsung.com', '경기 가평군', 'BUSINESS', null, '5555', '임준희', '01012345687', SYSDATE(), '비너스', '07019283746', 100, null, null),
('businessuser6@gamsung.com', '경기 하남시', 'BUSINESS', null, '1111', '박철홍1', '01012345683', SYSDATE(), '갤럭시1', '021234567', 100, null, null),
('businessuser7@gamsung.com', '충북 청주시', 'BUSINESS', null, '2222', '오창열1', '01012345684', SYSDATE(), '오감자1', '0315552637', 100, null, null),
('businessuser8@gamsung.com', '경기 파주시', 'BUSINESS', null, '3333', '최인규1', '01012345685', SYSDATE(), '밀키웨이1', '0329998476', 100, null, null),
('businessuser9@gamsung.com', '경기 부천시', 'BUSINESS', null, '4444', '황현지1', '01012345686', SYSDATE(), '아리스1', '029384736', 100, null, null),
('businessuser10@gamsung.com', '전남 강진군', 'BUSINESS', null, '5555', '임준희1', '01012345687', SYSDATE(), '비너스1', '07019283746', 100, null, null),
('businessuser11@gamsung.com', '부산 서면', 'BUSINESS', null, '1111', '박철홍2', '01012345683', SYSDATE(), '갤럭시2', '021234567', 100, null, null),
('businessuser12@gamsung.com', '부산 서면', 'BUSINESS', null, '2222', '오창열2', '01012345684', SYSDATE(), '오감자2', '0315552637', 100, null, null),
('businessuser13@gamsung.com', '전남 여주시', 'BUSINESS', null, '3333', '최인규2', '01012345685', SYSDATE(), '밀키웨이2', '0329998476', 100, null, null),
('businessuser14@gamsung.com', '경기 용인시', 'BUSINESS', null, '4444', '황현지2', '01012345686', SYSDATE(), '아리스2', '029384736', 100, null, null),
('businessuser15@gamsung.com', '서울 중랑구', 'BUSINESS', null, '5555', '임준희2', '01012345687', SYSDATE(), '비너스2', '07019283746', 100, null, null);

INSERT INTO CAMP 
(user_id, camp_map_img, camp_img1, camp_img2, camp_img3, camp_img4, camp_img5, tempsave_flag, delete_flag, camp_summery, camp_detail, camp_reg_date, camp_theme1, camp_theme2, camp_nature1, camp_nature2, camp_operation1, camp_operation2, camp_view_count_current_month, camp_reservation_count, camp_rating) VALUES
('businessuser1@gamsung.com', 'map.jpg', 'thumb1.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', '3', 'N', '좋은캠핑장입니다. 가족이나 연인과 함께 즐거운 캠핑을 해보세요.', '좋은캠핑장입니다. 가족이나 연인과 함께 즐거운 캠핑을 해보세요.', '1990-01-01', '봄', '겨울', '계곡', '호수', '상시', '여름', 3, 1, 1.1),
('businessuser2@gamsung.com', 'map.jpg', 'thumb2.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', '3', 'N', '좋은캠핑장2', '좋은캠핑장입니다. 가족이나 연인과 함께 즐거운 캠핑을 해보세요.', '1990-01-02', '여름', '봄', '호수', '계곡', '봄', '상시', 4, 3, 3.4),
('businessuser3@gamsung.com', 'map.jpg', 'thumb1.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', '3', 'N', '좋은캠핑장3', '좋은캠핑장입니다. 가족이나 연인과 함께 즐거운 캠핑을 해보세요.', '1990-01-03', '가을', '여름', '강', '호수', '여름', '봄', 4, 4, 2.4),
('businessuser4@gamsung.com', 'map.jpg', 'thumb4.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', '3', 'N', '좋은캠핑장4', '좋은캠핑장입니다. 가족이나 연인과 함께 즐거운 캠핑을 해보세요.', '1990-01-04', '겨울', '가을', '바다', '강', '가을', '여름', 5, 5, 3.3),
('businessuser5@gamsung.com', 'map.jpg', 'thumb5.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', '3', 'N', '좋은캠핑장5', '좋은캠핑장입니다. 가족이나 연인과 함께 즐거운 캠핑을 해보세요.', '1990-01-05', '일출', '겨울', '산', '바다', '겨울', '가을', 6, 1, 2.3),
('businessuser6@gamsung.com', 'map.jpg', 'thumb1.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', '2', 'N', '좋은캠핑장6', '좋은캠핑장입니다. 가족이나 연인과 함께 즐거운 캠핑을 해보세요.', '1990-01-01', '봄', '겨울', '계곡', '호수', '상시', '여름', 3, 1, 1.1),
('businessuser7@gamsung.com', 'map.jpg', 'thumb1.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', '2', 'N', '좋은캠핑장7', '좋은캠핑장입니다. 가족이나 연인과 함께 즐거운 캠핑을 해보세요.', '1990-01-02', '여름', '봄', '호수', '계곡', '봄', '상시', 4, 3, 3.4),
('businessuser8@gamsung.com', 'map.jpg', 'thumb1.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', '2', 'N', '좋은캠핑장8', '좋은캠핑장입니다. 가족이나 연인과 함께 즐거운 캠핑을 해보세요.', '1990-01-03', '가을', '여름', '강', '호수', '여름', '봄', 4, 4, 2.4),
('businessuser9@gamsung.com', 'map.jpg', 'thumb1.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', '1', 'N', '좋은캠핑장9', '좋은캠핑장입니다. 가족이나 연인과 함께 즐거운 캠핑을 해보세요.', '1990-01-04', '겨울', '가을', '바다', '강', '가을', '여름', 5, 5, 3.3),
('businessuser10@gamsung.com', 'map.jpg', 'thumb1.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', '1', 'N', '좋은캠핑장10', '좋은캠핑장입니다. 가족이나 연인과 함께 즐거운 캠핑을 해보세요.', '1990-01-05', '일출', '겨울', '산', '바다', '겨울', '가을', 6, 1, 2.3),
('businessuser11@gamsung.com', 'map.jpg', 'thumb1.jpg', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', '1', 'N', '좋은캠핑장11', '좋은캠핑장입니다. 가족이나 연인과 함께 즐거운 캠핑을 해보세요.', '1990-01-01', '봄', '겨울', '계곡', '호수', '상시', '여름', 3, 1, 1.1);


INSERT INTO MAINSITE (camp_no, mainsite_img1, mainsite_type, delete_flag, mainsite_name, mainsite_section, mainsite_size, mainsite_min_capacity, mainsite_max_capacity, mainsite_min_price, mainsite_add_price, mainsite_parking_size, mainsite_info, mainsite_reservation_user_name, mainsite_reservation_start, mainsite_reservation_end, mainsite_reg_date) VALUES
(10000, 'img1.jpg', '오토캠핑', 'N', '하늘1', '구역1', '3m x 6m', 2, 4, 6, 2, 1, '아주 깔끔하고 아늑한 자리 입니다. 강추 드려요!!', '홍길동1', '1990-01-01', '1990-01-02', '2020-01-01'),
(10001, 'img1.jpg', '글램핑', 'N', '하늘2', '구역2', '3m x 7m', 3, 5, 7, 2, 2, '주요시설2', '홍길동2', '1990-01-02', '1990-01-03', '2020-01-02'),
(10002, 'img1.jpg', '카라반', 'N', '하늘3', '구역3', '3m x 8m', 4, 6, 8, 2, 3, '주요시설3', '홍길동3', '1990-01-03', '1990-01-04', '2020-01-03'),
(10003, 'img1.jpg', '방갈로', 'N', '하늘4', '구역4', '3m x 9m', 5, 7, 9, 2, 4, '주요시설4', '홍길동4', '1990-01-04', '1990-01-05', '2020-01-04'),
(10004, 'img1.jpg', '팬션', 'N', '하늘5', '구역5', '3m x 10m', 6, 8, 10, 2, 5, '주요시설5', '홍길동5', '1990-01-05', '1990-01-06', '2020-01-05'),
(10000, 'img2.jpg', '오토캠핑', 'N', '하늘1', '구역1', '3m x 6m', 2, 4, 6, 2, 1, '아주 깔끔하고 아늑한 자리 입니다. 강추 드려요!!', '홍길동1', '1990-01-01', '1990-01-02', '2020-01-01'),
(10000, 'img3.jpg', '글램핑', 'N', '하늘2', '구역2', '3m x 7m', 3, 5, 7, 2, 2, '아주 깔끔하고 아늑한 자리 입니다. 강추 드려요!!', '홍길동2', '1990-01-02', '1990-01-03', '2020-01-02'),
(10000, 'img4.jpg', '카라반', 'N', '하늘3', '구역3', '3m x 8m', 4, 6, 8, 2, 3, '아주 깔끔하고 아늑한 자리 입니다. 강추 드려요!!', '홍길동3', '1990-01-03', '1990-01-04', '2020-01-03'),
(10000, 'img5.jpg', '방갈로', 'N', '하늘4', '구역4', '3m x 9m', 5, 7, 9, 2, 4, '아주 깔끔하고 아늑한 자리 입니다. 강추 드려요!!', '홍길동4', '1990-01-04', '1990-01-05', '2020-01-04'),
(10000, 'img6.jpg', '팬션', 'N', '하늘5', '구역5', '3m x 10m', 6, 8, 10, 2, 5, '아주 깔끔하고 아늑한 자리 입니다. 강추 드려요!!', '홍길동5', '1990-01-05', '1990-01-06', '2020-01-05'),
(10000, 'img7.jpg', '오토캠핑', 'N', '하늘1', '구역1', '3m x 6m', 2, 4, 6, 2, 1, '아주 깔끔하고 아늑한 자리 입니다. 강추 드려요!!', '홍길동1', '1990-01-01', '1990-01-02', '2020-01-01'),
(10000, 'img8.jpg', '글램핑', 'N', '하늘2', '구역2', '3m x 7m', 3, 5, 7, 2, 2, '아주 깔끔하고 아늑한 자리 입니다. 강추 드려요!!', '홍길동2', '1990-01-02', '1990-01-03', '2020-01-02'),
(10000, 'img9.jpg', '카라반', 'N', '하늘3', '구역3', '3m x 8m', 4, 6, 8, 2, 3, '아주 깔끔하고 아늑한 자리 입니다. 강추 드려요!!', '홍길동3', '1990-01-03', '1990-01-04', '2020-01-03'),
(10000, 'img1.jpg', '방갈로', 'N', '하늘4', '구역4', '3m x 9m', 5, 7, 9, 2, 4, '주요시설19', '홍길동4', '1990-01-04', '1990-01-05', '2020-01-04'),
(10000, 'img1.jpg', '팬션', 'N', '하늘5', '구역5', '3m x 10m', 6, 8, 10, 2, 5, '주요시설20', '홍길동5', '1990-01-05', '1990-01-06', '2020-01-05');


INSERT INTO SUBSITE (camp_no, subsite_type, subsite_reg_date, subsite_name, subsite_info) values
(10000, '전기', '1990-01-01', '전기1', '최신시설1'),
(10001, '온수', '1990-01-02', '온수2', '최신시설2'),
(10002, '매점', '1990-01-03', '매점3', '최신시설3'),
(10003, '화장실', '1990-01-04', '화장실4', '최신시설4'),
(10004, '물놀이장', '1990-01-05', '물놀이장5', '최신시설5'),
(10000, '전기1', '1990-01-01', '전기1', '최신시설1'),
(10000, '온수1', '1990-01-02', '온수2', '최신시설2'),
(10000, '매점1', '1990-01-03', '매점3', '최신시설3'),
(10000, '화장실1', '1990-01-04', '화장실4', '최신시설4'),
(10000, '물놀이장1', '1990-01-05', '물놀이장5', '최신시설5'),
(10000, '전기2', '1990-01-01', '전기1', '최신시설1'),
(10000, '온수2', '1990-01-02', '온수2', '최신시설2'),
(10000, '매점2', '1990-01-03', '매점3', '최신시설3'),
(10000, '화장실2', '1990-01-04', '화장실4', '최신시설4'),
(10000, '물놀이장2', '1990-01-05', '물놀이장5', '최신시설5');

INSERT INTO CAMP_RESERVATION (user_id, camp_no, mainsite_no, reservation_status, reservation_reg_date, reservation_user_name, reservation_start_date, reservation_end_date, use_num, reservation_user_phone, total_payment_price, delete_flag, payment_type) VALUES 
('user1@gamsung.com', 10000, 10000, 1, '2021-12-17', '오창열', '2021-12-24', '2021-12-25', 2, '01012341234', 1000000, 'N', 1),
('user2@gamsung.com', 10001, 10001, 2, '2021-12-17', '최인규', '2021-12-24', '2021-12-25', 1, '01012341235', 1000000, 'N', 2),
('user3@gamsung.com', 10002, 10002, 3, '2021-12-17', '임준희', '2021-12-24', '2021-12-25', 2, '01012341236', 1000000, 'N', 3),
('user4@gamsung.com', 10003, 10003, 4, '2021-12-17', '최정아', '2021-12-24', '2021-12-25', 1, '01012341237', 1000000, 'N', 1),
('user5@gamsung.com', 10004, 10004, 5, '2021-12-17', '황현지', '2021-12-24', '2021-12-25', 2, '01012341238', 1000000, 'N', 2),
('user1@gamsung.com', 10000, 10001, 6, '2021-12-17', '권도윤', '2021-12-24', '2021-12-25', 1, '01012341239', 1000000, 'N', 3),
('user2@gamsung.com', 10001, 10002, 1, '2021-12-17', '유희주', '2021-12-24', '2021-12-25', 2, '01012341240', 1000000, 'N', 1),
('user3@gamsung.com', 10002, 10003, 2, '2021-12-17', '김관우', '2021-12-24', '2021-12-25', 1, '01012341241', 1000000, 'N', 2),
('user4@gamsung.com', 10003, 10004, 3, '2021-12-17', '조영주', '2021-12-24', '2021-12-25', 2, '01012341242', 1000000, 'N', 3),
('user5@gamsung.com', 10004, 10001, 4, '2021-12-17', '이소희', '2021-12-24', '2021-12-25', 1, '01012341243', 1000000, 'N', 1),
('user1@gamsung.com', 10000, 10002, 5, '2021-12-17', '홍진호', '2021-12-24', '2021-12-25', 2, '01012341244', 1000000, 'N', 2);

INSERT INTO RATING_REVIEW (user_id, camp_no, rating_review_status, rating_review_content, review_reg_date, status_rating, review_img1) VALUES 
('user1@gamsung.com', 10000, 1, 'very good', '2021-12-17', 3.0, 'img1'),
('user2@gamsung.com', 10001, 1, 'very good', '2021-12-17', 4.0, 'img1'),
('user3@gamsung.com', 10002, 1, 'very good', '2021-12-17', 5.0, 'img1'),
('user4@gamsung.com', 10003, 1, 'very good', '2021-12-17', 4.0, 'img1'),
('user5@gamsung.com', 10004, 1, 'very good', '2021-12-17', 3.0, 'img1');

INSERT INTO RATING_REVIEW (user_id, camp_no, rating_review_status, rating_review_content, review_reg_date, comment, comment_reg_date, status_rating, review_img1) VALUES
('user1@gamsung.com', 10000, 1, 'good', '2021-12-17', 'very good', '2021-12-17', 3.0, 'img1'),
('user2@gamsung.com', 10001, 1, 'good', '2021-12-17', 'very good', '2021-12-17', 4.0, 'img1'),
('user3@gamsung.com', 10002, 1, 'good', '2021-12-17', 'very good', '2021-12-17', 5.0, 'img1'),
('user4@gamsung.com', 10003, 1, 'good', '2021-12-17', 'very good', '2021-12-17', 4.0, 'img1'),
('user5@gamsung.com', 10004, 1, 'good', '2021-12-17', 'very good', '2021-12-17', 3.0, 'img1');

INSERT INTO RATING_REVIEW (user_id, camp_no, rating_review_status, rating_review_title, rating_review_content, review_reg_date, status_rating, review_img1) VALUES 
('user1@gamsung.com', 10000, 2, 'wow', 'good', '2021-12-17', 3.0, 'img1'),
('user2@gamsung.com', 10001, 2, 'wow', 'good', '2021-12-17', 4.0, 'img1'),
('user3@gamsung.com', 10002, 2, 'wow', 'good', '2021-12-17', 5.0, 'img1'),
('user4@gamsung.com', 10003, 2, 'wow', 'good', '2021-12-17', 4.0, 'img1'),
('user5@gamsung.com', 10004, 2, 'wow', 'good', '2021-12-17', 3.0, 'img1');

INSERT INTO RATING_REVIEW (user_id, camp_no, rating_review_status, rating_review_title, rating_review_content, review_reg_date, comment, comment_reg_date, status_rating, review_img1) VALUES
('user1@gamsung.com', 10000, 2, 'wow', 'good', '2021-12-17', 'very good', '2021-12-17', 3.0, 'img1'),
('user2@gamsung.com', 10001, 2, 'wow', 'good', '2021-12-17', 'very good', '2021-12-17', 4.0, 'img1'),
('user3@gamsung.com', 10002, 2, 'wow', 'good', '2021-12-17', 'very good', '2021-12-17', 5.0, 'img1'),
('user4@gamsung.com', 10003, 2, 'wow', 'good', '2021-12-17', 'very good', '2021-12-17', 4.0, 'img1'),
('user5@gamsung.com', 10004, 2, 'wow', 'good', '2021-12-17', 'very good', '2021-12-17', 3.0, 'img1');

INSERT INTO PAYMENT_CODE (payment_code, payment_code_range_start, payment_code_range_end, payment_code_info, payment_code_fee) VALUES
 ('P0', 0, 0, '포인트 관리자', 0),
 ('P1', 0, 0, '포인트 구매', 0),
 ('P2', 0, 0, '포인트 출금', 20),
 ('R0', 0, 0, '캠핑 관리자', 0),
 ('R1', 0, 0, '캠핑 예약', 8),
 ('R2', 2, 2, '캠핑 예약환불 2일전', 50),
 ('R3', 3, 3, '캠핑 예약환불 3일전', 60),
 ('R4', 4, 4, '캠핑 예약환불 4일전', 70),
 ('R5', 5, 5, '캠핑 예약환불 5일전', 80),
 ('R6', 6, 6, '캠핑 예약환불 6일전', 90),
 ('R7', 7, 7, '캠핑 예약환불 7일전', 100),
 ('A0', 0, 0, '경매 관리자', 0),
 ('A1', 100, 0, '경매 낙찰취소/중도철회 A등급', 1),
 ('A2', 60, 99, '경매 낙찰취소/중도철회 B등급', 2),
 ('A3', 30, 59, '경매 낙찰취소/중도철회 C등급', 3),
 ('A4', 10, 29, '경매 낙찰취소/중도철회 D등급', 4),
 ('A5', 1, 9, '경매 낙찰취소/중도철회 E등급', 5),
 ('T0', 0, 0, '양도양수 관리자', 0),
 ('T1', 0, 0, '양도양수', 0); 

INSERT INTO notice (user_id, notice_title, notice_content, notice_file1, notice_file2,notice_file3, camp_no, camp_name )
VALUES 
('admin', '공지사항 제목입니다', '공지사항 제목입니다.', "file.hwp","file.xlsx",null, null, null),
('admin', '예시 테이블 생성', '테스트 공지사항 내용입니다.', "file.hwp","file.xlsx",null, null, null),
('admin', '예시 테이블', '테스트 내용입니다.', "file.hwp","file.xlsx",null, null, null),
('admin', '예시 생성', '예시입니다', "file.hwp","file.xlsx",null, null, null),
('admin', '예시 테이블notice 생성', '가나다라마바사아자차카타파하', "file.hwp","file.xlsx",null, null, null),
('admin', 'html 내용이 들어간 예시', '<span>가나다</span>', "file.hwp","file.xlsx",null, null, null),
('admin', '한번 해보자 이거야', '그래 이거 한번 해봐', "file.hwp","file.xlsx",null, null, null),
('admin', 'full text', 'full text', "file.hwp","file.xlsx",null, null, null),
('admin', 'title', 'content', "file.hwp","file.xlsx",null, null, null),
('admin', '가나다라', '마바사아자차카타파하', "file.hwp","file.xlsx",null, null, null),
('admin', '공지사항 제목', '공지사항내용', "file.hwp","file.xlsx",null, null, null),
('admin', '공지', '내용', "file.hwp","file.xlsx",null, null, null),
('businessuser1@gamsung.com', '캠핑장공지사항1', '1번 캠핑장 공지사항 입니다.', "file.hwp","file.xlsx",null, 10000,'갤럭시'),
('businessuser2@gamsung.com', '캠핑장공지사항2', '22번 캠핑장 공지사항 입니다.', "file.hwp","file.xlsx",null, 10001,'오감자'),
('businessuser3@gamsung.com', '캠핑장공지사항33', '33번 캠핑장 공지사항 입니다.', "file.hwp","file.xlsx",null, 10002,'밀키웨이'),
('businessuser4@gamsung.com', '캠핑장공지사항44', '44번 캠핑장 공지사항 입니다.', "file.hwp","file.xlsx",null, 10003,'아리스'),
('businessuser5@gamsung.com', '캠핑장공지사항55', '55번 캠핑장 공지사항 입니다.', "file.hwp","file.xlsx",null, 10004,'비너스'),
('businessuser5@gamsung.com', '캠핑장공지사항55', '55번 캠핑장 공지사항 입니다.', "file.hwp","file.xlsx",null, null,null);

INSERT INTO QNA (sender_id, question_title, question_content, camp_no, camp_name)
values
('user1@gamsung.com', '크래프트 블랙은 원래 쓴가요?','아니 한번 먹어봤는데 존나 쓴거에요 그래서 물어봅니다.',null,null),
('user2@gamsung.com', '아아아아아아악나다ㅏ라라나','너무 졸립고 맘아파...',null,null),
('user3@gamsung.com', '테스트1 제목입니다.','테스트1 내용 입니다.',null,null),
('user1@gamsung.com', '테스트2 제목입니다.','테스트2 내용 입니다.',null,null),
('user2@gamsung.com', '테스트3 제목입니다.','테스트3 내용 입니다.',null,null),
('user3@gamsung.com', '테스트4 제목입니다.','테스트4 내용 입니다.',null,null),
('user5@gamsung.com', '테스트5 제목입니다.','테스트5 내용 입니다.',null,null),
('user3@gamsung.com', '테스트6 제목입니다.','테스트6 내용 입니다.',null,null),
('user4@gamsung.com', '테스트7 제목입니다.','테스트7 내용 입니다.',null,null),
('user4@gamsung.com', '테스트8 제목입니다.','테스트8 내용 입니다.',null,null),
('user2@gamsung.com', '테스트9 제목입니다.','테스트9 내용 입니다.',null,null),
('user1@gamsung.com', '테스트10 제목입니다.','테스트10 내용 입니다.',null,null),
('user3@gamsung.com', '테스트11 제목입니다.','테스트11 내용 입니다.',null,null),
('user5@gamsung.com', '테스트12 제목입니다.','테스트12 내용 입니다.',null,null),
('user4@gamsung.com', '캠핑장1 Q&A 제목입니다.','캠핑장1 Q&A 내용 입니다.',10001,'오감자'),
('user4@gamsung.com', '캠핑장2 Q&A 제목입니다.','캠핑장2 Q&A 내용 입니다.',10003,'아리스'),
('user2@gamsung.com', '캠핑장3 Q&A 제목입니다.','캠핑장3 Q&A 내용 입니다.',10000,'갤럭시');

INSERT INTO report_table (report_name)
values
('캠핑장 신고'),
('경매 신고'),
('커뮤니티 신고'),
('예약 양도 신고'),
('이용 고객 신고');

INSERT INTO REPORT (sender_id, receiver_id,report_type , report_content,report_Img1,report_Img2,report_img3,receiver_camp_name)
values
('user1@gamsung.com', 'user2@gamsung.com', 2,'불법 경매 신고' , null, null ,null, null ),
('user2@gamsung.com', 'businessuser1@gamsung.com', 1,'캠핑장 금액 올림' , null, null ,null,'갤럭시'),
('businessuser1@gamsung.com', 'user3@gamsung.com', 5,'불량회원 신고' , null, null ,null, null);