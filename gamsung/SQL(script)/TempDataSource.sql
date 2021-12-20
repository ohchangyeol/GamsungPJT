INSERT INTO USERS(user_id, role, nick_name, password, name, phone, entry_reg_date, camp_name, camp_call) values
('admin', 'ADMIN', '관리자', 'admin', '최정아', '77777777', SYSDATE(), null, null),
('user1@gamsung.com', 'GENERAL', '니코', '1111', '김관우', '01022223333', SYSDATE(), null, null),
('user2@gamsung.com', 'GENERAL', '헤이즐', '2222', '이소희', '01012345679', SYSDATE(), null, null),
('user3@gamsung.com', 'GENERAL', '제나바', '3333', '유희주', '01012345680', SYSDATE(), null, null),
('user4@gamsung.com', 'GENERAL', '키아라', '4444', '조영주', '01012345681', SYSDATE(), null, null),
('user5@gamsung.com', 'GENERAL', '이젤라', '5555', '권도윤', '01012345682', SYSDATE(), null, null),
('businessuser1@gamsung.com', 'BUSINESS', null, '1111', '박철홍', '01012345683', SYSDATE(), '갤럭시', '021234567'),
('businessuser2@gamsung.com', 'BUSINESS', null, '2222', '오창열', '01012345684', SYSDATE(), '오감자', '0315552637'),
('businessuser3@gamsung.com', 'BUSINESS', null, '3333', '최인규', '01012345685', SYSDATE(), '밀키웨이', '0329998476'),
('businessuser4@gamsung.com', 'BUSINESS', null, '4444', '황현지', '01012345686', SYSDATE(), '아리스', '029384736'),
('businessuser5@gamsung.com', 'BUSINESS', null, '5555', '임준희', '01012345687', SYSDATE(), '비너스', '07019283746');

INSERT INTO AUCTION_PRODUCT(registrant_id,product_name,product_detail,start_bid_price,hopeful_bid_price,bid_unit,auction_start_time,auction_end_time,bidable_grade,hashtag1,hashtag2,hashtag3,product_img1) VALUES
('user1@gamsung.com', '상품1', '너무 좋은 상품이에요', 5100, 110000, 100, '2021-12-17  3:00:00', '2021-12-19  3:00:00', 10, '#상품1', '#상품01', '#상품001', '상품1.jpg'),
('user2@gamsung.com', '상품2', '너무 좋은 상품이에요', 5200, 120000, 200, '2021-12-18  3:00:00', '2021-12-21  3:00:00', 20, '#상품2', '#상품02', '#상품002', '상품2.jpg'),
('user3@gamsung.com', '상품3', '너무 좋은 상품이에요', 5300, 130000, 300, '2021-12-19  3:00:00', '2021-12-21  3:00:00', 30, '#상품3', '#상품03', '#상품003', '상품3.jpg'),
('user4@gamsung.com', '상품4', '너무 좋은 상품이에요', 5400, 140000, 400, '2021-12-17  3:00:00', '2021-12-21  3:00:00', 40, '#상품4', '#상품04', '#상품004', '상품4.jpg'),
('user5@gamsung.com', '상품5', '너무 좋은 상품이에요', 5500, 150000, 500, '2021-12-18  3:00:00', '2021-12-21  3:00:00', 50, '#상품5', '#상품05', '#상품005', '상품5.jpg'),
('user1@gamsung.com', '상품6', '너무 좋은 상품이에요', 5600, 160000, 600, '2021-12-19  3:00:00', '2021-12-21  3:00:00', 60, '#상품6', '#상품06', '#상품006', '상품6.jpg'),
('user2@gamsung.com', '상품7', '너무 좋은 상품이에요', 5700, 170000, 700, '2021-12-17  3:00:00', '2021-12-21  3:00:00', 70, '#상품7', '#상품07', '#상품007', '상품7.jpg'),
('user3@gamsung.com', '상품8', '너무 좋은 상품이에요', 5800, 180000, 800, '2021-12-18  3:00:00', '2021-12-21  3:00:00', 80, '#상품8', '#상품08', '#상품008', '상품8.jpg'),
('user4@gamsung.com', '상품9', '너무 좋은 상품이에요', 5900, 190000, 900, '2021-12-19  3:00:00', '2021-12-21  3:00:00', 90, '#상품9', '#상품09', '#상품009', '상품9.jpg'),
('user5@gamsung.com', '상품10', '너무 좋은 상품이에요', 6000, 200000, 1000, '2021-12-17  3:00:00', '2021-12-21  3:00:00', 100, '#상품10', '#상품10', '#상품010', '상품10.jpg');


INSERT INTO CAMP (business_user_id, tempsave_flag, delete_flag, camp_summery, camp_reg_date, camp_theme1, camp_theme2, camp_nature1, camp_nature2, camp_operation1, camp_operation2, camp_view_count_previous_month, camp_view_count_current_month, camp_reservation_count, camp_rating) VALUES
('businessuser1@gamsung.com', 'n', 'n', '좋은캠핑장1', '1990-01-01', '봄', '겨울', '계곡', '호수', '상시', '여름', 2, 3, 1, 1.1),
('businessuser2@gamsung.com', 'n', 'n', '좋은캠핑장2', '1990-01-02', '여름', '봄', '호수', '계곡', '봄', '상시', 2, 4, 3, 3.4),
('businessuser3@gamsung.com', 'n', 'n', '좋은캠핑장3', '1990-01-03', '가을', '여름', '강', '호수', '여름', '봄', 3, 4, 4, 2.4),
('businessuser4@gamsung.com', 'n', 'n', '좋은캠핑장4', '1990-01-04', '겨울', '가을', '바다', '강', '가을', '여름', 4, 5, 5, 3.3),
('businessuser5@gamsung.com', 'n', 'n', '좋은캠핑장5', '1990-01-05', '일출', '겨울', '산', '바다', '겨울', '가을', 5, 6, 1, 2.3);

INSERT INTO MAINSITE (camp_no, mainsite_type, delete_flag, mainsite_name, mainsite_section, mainsite_size, mainsite_min_capacity, mainsite_max_capacity, mainsite_min_price, mainsite_add_price, mainsite_parking_size, mainsite_info, mainsite_reservation_user_name, mainsite_reservation_start, mainsite_reservation_end, mainsite_reg_date) VALUES
(10000, '오토캠핑', 'n', '하늘1', '구역1', '3m x 6m', 2, 4, 6, 2, 1, '주요시설1', '홍길동1', '1990-01-01', '1990-01-02', '2020-01-01'),
(10001, '글램핑', 'n', '하늘2', '구역2', '3m x 7m', 3, 5, 7, 2, 2, '주요시설2', '홍길동2', '1990-01-02', '1990-01-03', '2020-01-02'),
(10002, '카라반', 'n', '하늘3', '구역3', '3m x 8m', 4, 6, 8, 2, 3, '주요시설3', '홍길동3', '1990-01-03', '1990-01-04', '2020-01-03'),
(10003, '방갈로', 'n', '하늘4', '구역4', '3m x 9m', 5, 7, 9, 2, 4, '주요시설4', '홍길동4', '1990-01-04', '1990-01-05', '2020-01-04'),
(10004, ' 팬션', 'n', '하늘5', '구역5', '3m x 10m', 6, 8, 10, 2, 5, '주요시설5', '홍길동5', '1990-01-05', '1990-01-06', '2020-01-05');

INSERT INTO SUBSITE (camp_no, subsite_type, subsite_reg_date, subsite_name, subsite_info) values
(10000, '전기', '1990-01-01', '전기1', '최신시설1'),
(10001, '온수', '1990-01-02', '온수2', '최신시설2'),
(10002, '매점', '1990-01-03', '매점3', '최신시설3'),
(10003, '화장실', '1990-01-04', '화장실4', '최신시설4'),
(10004, '물놀이장', '1990-01-05', '물놀이장5', '최신시설5');

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

INSERT INTO RATING_REVIEW (user_id, product_no, rating_review_content, review_reg_date, status_rating, price_rating, kindness_rating, review_img1) VALUES
('user1@gamsung.com', 'PROD00001', 'very good', '2021-12-17', 3.0, 1.0, 2.0, 'img1'),
('user2@gamsung.com', 'PROD00002', 'very good', '2021-12-17', 4.0, 2.0, 3.0, 'img1'),
('user3@gamsung.com', 'PROD00003', 'very good', '2021-12-17', 5.0, 3.0, 4.0, 'img1'),
('user4@gamsung.com', 'PROD00004', 'very good', '2021-12-17', 4.0, 4.0, 5.0, 'img1'),
('user5@gamsung.com', 'PROD00005', 'very good', '2021-12-17', 3.0, 5.0, 1.0, 'img1');

INSERT INTO RATING_REVIEW (user_id, product_no, rating_review_content, review_reg_date, comment, comment_reg_date, status_rating, price_rating, kindness_rating, review_img1) VALUES
('user1@gamsung.com', 'PROD00001', 'very good', '2021-12-17', 'very good', '2021-12-17', 3.0, 1.0, 2.0, 'img1'),
('user2@gamsung.com', 'PROD00002', 'very good', '2021-12-17', 'very good', '2021-12-17', 4.0, 2.0, 3.0, 'img1'),
('user3@gamsung.com', 'PROD00003', 'very good', '2021-12-17', 'very good', '2021-12-17', 5.0, 3.0, 4.0, 'img1'),
('user4@gamsung.com', 'PROD00004', 'very good', '2021-12-17', 'very good', '2021-12-17', 4.0, 4.0, 5.0, 'img1'),
('user5@gamsung.com', 'PROD00005', 'very good', '2021-12-17', 'very good', '2021-12-17', 3.0, 5.0, 1.0, 'img1');