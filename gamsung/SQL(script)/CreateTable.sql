CREATE SCHEMA gamsung;
USE gamsung;

CREATE TABLE `USERS` (
    `user_id` VARCHAR(50) NOT NULL,
    `role` VARCHAR(20)  NOT NULL,
    `nick_name` VARCHAR(30),
    `password` VARCHAR(500) NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    `phone` VARCHAR(11) NOT NULL,
    `addr` VARCHAR(100),
    `entry_reg_date` DATE NOT NULL,
    `bank` VARCHAR(15),
    `account_holder` VARCHAR(30),
    `account_num` VARCHAR(14),
    `having_point` INT NOT NULL DEFAULT 0,
    `camp_name` VARCHAR(30),
    `camp_call` VARCHAR(15),
    `entry_approval_flag` CHAR(1)  DEFAULT 'N',
    `receive_cancel_total_count` INT NOT NULL DEFAULT 0,
    `receive_ban_end_date` DATE,
    `dormant_reg_date` DATE,
    `secession_reg_date` DATE,
    `suspension_reg_date` DATE,
    `tourism_business_num` VARCHAR(10),
    `suspension_content` VARCHAR(200),
    `auction_grade` SMALLINT NOT NULL DEFAULT 1,
    PRIMARY KEY ( `user_id`),
    UNIQUE (`user_id`,`nick_name`, `phone`, `tourism_business_num`)
);

CREATE TABLE `LOGIN_HISTORY` (
    `login_history_no` INT NOT NULL,
    `user_id` VARCHAR(50) NOT NULL,
    `login_reg_date` DATE NOT NULL,
    PRIMARY KEY (`login_history_no`)
);

DELIMITER $$
CREATE TRIGGER LOGIN_HISTORY_SEQ
BEFORE INSERT ON LOGIN_HISTORY
FOR EACH ROW
BEGIN
   DECLARE history_no INT;
   SET history_no = (SELECT COUNT(login_history_no) FROM LOGIN_HISTORY);
   SET NEW.login_history_no = LPAD(history_no+1, 5, '0');
END $$
DELIMITER ;

CREATE TABLE `AUCTION_PRODUCT` (
    `product_no` VARCHAR(9) NOT NULL,
    `registrant_id` VARCHAR(50) NOT NULL,
    `successful_bidder_id` VARCHAR(50),
    `product_name` VARCHAR(20),
    `product_detail` VARCHAR(4000),
    `start_bid_price` INT,
    `hopeful_bid_price` INT,
    `bid_unit` INT,
    `auction_start_time` DATETIME,
    `auction_end_time` DATETIME,
    `bidable_grade` TINYINT,
    `hashtag1` VARCHAR(20),
    `hashtag2` VARCHAR(20),
    `hashtag3` VARCHAR(20),
    `product_img1` CHAR(10),
    `product_img2` CHAR(10),
    `product_img3` CHAR(10),
    `product_img4` CHAR(10),
    `product_img5` CHAR(10),
    `product_view_count` INT NOT NULL DEFAULT 0,
    `product_reg_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `registrant_confirm_flag` CHAR(1) NOT NULL DEFAULT 'N',
    `successful_bidder_confirm_flag` CHAR(1) NOT NULL DEFAULT 'N',
    `auction_status` VARCHAR(20) NOT NULL DEFAULT 'START',
    `temp_save_flag` CHAR(1) NOT NULL DEFAULT 'N',
    `delete_flag` CHAR(1) NOT NULL DEFAULT 'N',
    PRIMARY KEY (`product_no`)
);

DELIMITER $$
CREATE TRIGGER AUCTION_PRODUCT_SEQ
BEFORE INSERT ON AUCTION_PRODUCT
FOR EACH ROW
BEGIN
	DECLARE prod_id INT;
	SET prod_id = (SELECT COUNT(product_no) FROM AUCTION_PRODUCT);
	SET NEW.product_no = CONCAT('PROD',LPAD(prod_id+1, 5, '0'));
END $$
DELIMITER ;

CREATE TABLE `AUCTION_HISTORY` (
    `bid_no` CHAR(8) NOT NULL,
    `product_no` CHAR(9) NOT NULL,
    `bidder_id` VARCHAR(50) NOT NULL,
    `bid_price` INT NOT NULL,
    `bid_datetime` DATETIME NOT NULL DEFAULT NOW(),
    `auction_status` VARCHAR(10) NOT NULL DEFAULT 'START',
    PRIMARY KEY (`bid_no`)
);


DELIMITER $$
CREATE TRIGGER AUCTION_HISTORY_SEQ
BEFORE INSERT ON AUCTION_HISTORY
FOR EACH ROW
BEGIN
	DECLARE bid_id INT;
	SET bid_id = (SELECT COUNT(bid_no) FROM AUCTION_HISTORY);
	SET NEW.bid_no = CONCAT('BID',LPAD(bid_id+1, 5, '0'));
END $$
DELIMITER ;

CREATE TABLE `BID_CONCERN` (
    `bid_concern_no` CHAR(9) NOT NULL,
    `auciton_user_id` VARCHAR(50) NOT NULL,
    `product_no` CHAR(9) NOT NULL,
    `concern_reg_date` DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY (`bid_concern_no`)
);

DELIMITER $$
CREATE TRIGGER BID_CONCERN_SEQ
BEFORE INSERT ON BID_CONCERN
FOR EACH ROW
BEGIN
	DECLARE con_id INT;
	SET con_id = (SELECT COUNT(bid_concern_no) FROM BID_CONCERN);
	SET NEW.bid_concern_no = CONCAT('CON',LPAD(prod_id+1, 5, '0'));
END $$
DELIMITER ;

CREATE TABLE `MAIN_AUCTION_HISTORY` (
    `main_product_no` CHAR(9) NOT NULL,
    `product_no` CHAR(9) NOT NULL,
    `main_reg_date` DATETIME NOT NULL DEFAULT NOW(),
    `timeout_flag` CHAR(1) NOT NULL DEFAULT 'N',
    PRIMARY KEY (`main_product_no`)
);


DELIMITER $$
CREATE TRIGGER MAIN_AUCTION_HISTORY_SEQ
BEFORE INSERT ON MAIN_AUCTION_HISTORY
FOR EACH ROW
BEGIN
	DECLARE main_id INT;
	SET main_id = (SELECT COUNT(main_product_no) FROM MAIN_AUCTION_HISTORY);
	SET NEW.main_product_no = CONCAT('MAIN',LPAD(main_id+1, 5, '0'));
END $$
DELIMITER ;


CREATE TABLE `CAMP` (
    `camp_no` INT NOT NULL AUTO_INCREMENT,
    `business_user_id` VARCHAR(50) NOT NULL,
    `tempsave_flag` CHAR(1) NOT NULL DEFAULT 'N',
    `delete_flag` CHAR(1) NOT NULL DEFAULT 'N',
    `camp_summery` VARCHAR(200),
    `camp_detail` VARCHAR(800),
    `camp_map_img` VARCHAR(100),
    `camp_img1` VARCHAR(100),
    `camp_img2` VARCHAR(100),
    `camp_img3` VARCHAR(100),
    `camp_img4` VARCHAR(100),
    `camp_img5` VARCHAR(100),
    `camp_reg_date` DATE NOT NULL,
    `camp_theme1` VARCHAR(50) NOT NULL,
    `camp_theme2` VARCHAR(50) NOT NULL,
    `camp_nature1` VARCHAR(50) NOT NULL,
    `camp_nature2` VARCHAR(50) NOT NULL,
    `camp_operation1` VARCHAR(50) NOT NULL,
    `camp_operation2` VARCHAR(50) NOT NULL,
    `camp_view_count_previous_month` INT,
    `camp_view_count_current_month` INT,
    `camp_reservation_count` INT,
    `camp_rating` FLOAT,
    PRIMARY KEY (`camp_no`)
);

ALTER TABLE CAMP AUTO_INCREMENT=10000;

CREATE TABLE `MAINSITE` (
    `mainsite_no` INT NOT NULL AUTO_INCREMENT,
    `camp_no` INT NOT NULL,
    `mainsite_type` VARCHAR(50) NOT NULL,
    `delete_flag` CHAR(1) NOT NULL DEFAULT 'N',
    `mainsite_name` VARCHAR(50) NOT NULL,
    `mainsite_section` VARCHAR(50),
    `mainsite_size` VARCHAR(50),
    `mainsite_min_capacity` INT NOT NULL,
    `mainsite_max_capacity` INT NOT NULL,
    `mainsite_min_price` INT NOT NULL,
    `mainsite_add_price` INT NOT NULL,
    `mainsite_parking_size` INT,
    `mainsite_info` VARCHAR(800),
    `mainsite_reservation_user_name` VARCHAR(20) NOT NULL,
    `mainsite_reservation_start` DATE NOT NULL,
    `mainsite_reservation_end` DATE NOT NULL,
    `mainsite_reg_date` DATE NOT NULL,
    `mainsite_img1` VARCHAR(100),
    `mainsite_img2` VARCHAR(100),
    `mainsite_img3` VARCHAR(100),
    PRIMARY KEY (`mainsite_no`)
);

ALTER TABLE MAINSITE AUTO_INCREMENT=10000;

CREATE TABLE `SUBSITE` (
    `subsite_no` INT NOT NULL AUTO_INCREMENT,
    `camp_no` INT NOT NULL,
    `subsite_type` VARCHAR(50) NOT NULL,
    `subsite_reg_date` DATE NOT NULL,
    `subsite_name` VARCHAR(50) NOT NULL,
    `subsite_info` VARCHAR(800),
    `subsite_img` VARCHAR(100),
    PRIMARY KEY (`subsite_no`)
);

ALTER TABLE SUBSITE AUTO_INCREMENT=10000;

CREATE TABLE `PAYMENT` (
    `payment_no` VARCHAR(10) NOT NULL,
    `payment_sender` VARCHAR(50) NOT NULL,
    `payment_receiver` VARCHAR(50) NOT NULL,
    `payment_code` VARCHAR(20) NOT NULL,
    `payment_reference_num` VARCHAR(20) NOT NULL,
    `payment_refund_reference_num` VARCHAR(20) NOT NULL,
    `payment_method` INT NOT NULL,
    `payment_reg_time` VARCHAR(20) NOT NULL,
    `payment_price_total` INT NOT NULL,
    `payment_price_pay` INT NOT NULL,
    `payment_price_fee` INT NOT NULL,
    `payment_reference_fee` INT NOT NULL,
    `payment_refund_price_total` INT,
    `payment_refund_price_pay` INT,
    `payment_refund_price_fee` INT,
    `payment_refund_reference_fee` INT,
    PRIMARY KEY (`payment_no`)
);

DELIMITER $$
CREATE TRIGGER PAYMENT_SEQ
BEFORE INSERT ON PAYMENT
FOR EACH ROW
BEGIN
DECLARE pay_no INT;
SET pay_no = (SELECT COUNT(payment_no) FROM PAYMENT);
SET NEW.payment_no = CONCAT('P',LPAD(pay_no+1, 9, '0'));
END $$ 
DELIMITER ;

CREATE TABLE `PAYMENT_CODE` (
    `payment_code` VARCHAR(10) NOT NULL,
    `payment_code_range_start` INT,
    `payment_code_range_end` INT,
    `payment_code_info` VARCHAR(100) NOT NULL,
    `payment_code_fee` INT NOT NULL,
    PRIMARY KEY (`payment_code`)
);

CREATE TABLE `SITE_PROFIT` (
    `profit_reg_date` DATE NOT NULL,
    `profit_point` INT NOT NULL,
    `profit_cash` INT NOT NULL,
    `profit_creditcard` INT NOT NULL,
    `profit_simplepay` INT NOT NULL,
    PRIMARY KEY (`profit_reg_date`)
);

CREATE TABLE `CAMP_RESERVATION` (
    `reservation_no` VARCHAR(10) NOT NULL,
    `user_id` VARCHAR(50) NOT NULL,
    `camp_no` INT NOT NULL,
    `mainsite_no` INT NOT NULL,
    `reservation_status` INT NOT NULL DEFAULT 1,
    `reservation_reg_date` DATE NOT NULL,
    `reservation_user_name` VARCHAR(20) NOT NULL,
    `reservation_start_date` DATE NOT NULL,
    `reservation_end_date` DATE NOT NULL,
    `use_num` INT NOT NULL,
    `reservation_user_phone` VARCHAR(11) NOT NULL,
    `reservation_reg_car_num` VARCHAR(10),
    `reservation_request` VARCHAR(1000),
    `total_payment_price` INT NOT NULL,
    `total_reservation_reg_car` INT,
    `delete_flag` CHAR(1) NOT NULL DEFAULT 'N',
    `payment_type` INT NOT NULL,
    PRIMARY KEY (`reservation_no`)
);

DELIMITER $$
	CREATE TRIGGER CAMP_RESERVATION_SEQ
	BEFORE INSERT ON CAMP_RESERVATION
	FOR EACH ROW
	BEGIN
	   DECLARE rsv_no INT;
	   SET rsv_no = (SELECT COUNT(reservation_no) FROM CAMP_RESERVATION);
	   SET NEW.reservation_no = CONCAT('R',LPAD(rsv_no+1, 5, '0'));
	END $$ 
DELIMITER ;

CREATE TABLE `RATING_REVIEW` (
    `rating_review_no` INT NOT NULL,
    `user_id` VARCHAR(50) NOT NULL,
    `camp_no` INT,
    `product_no` CHAR(9),
    `rating_review_status` INT NOT NULL DEFAULT 0,
    `rating_review_title` VARCHAR(40),
    `rating_review_content` VARCHAR(1000) NOT NULL,
    `review_reg_date` DATE NOT NULL,
    `comment` VARCHAR(1000),
    `comment_reg_date` DATE,
    `status_rating` FLOAT NOT NULL DEFAULT 0,
    `price_rating` FLOAT NOT NULL DEFAULT 0,
    `kindness_rating` FLOAT NOT NULL DEFAULT 0,
    `review_img1` VARCHAR(100),
    `review_img2` VARCHAR(100),
    `review_img3` VARCHAR(100),
    `review_delete_flag` CHAR(1) NOT NULL DEFAULT 'N',
    `comment_delete_flag` CHAR(1) NOT NULL DEFAULT 'N',
    PRIMARY KEY (`rating_review_no`)
);

DELIMITER $$
	CREATE TRIGGER RATING_REVIEW_SEQ
	BEFORE INSERT ON RATING_REVIEW
	FOR EACH ROW
	BEGIN
	   DECLARE review_no INT;
	   SET review_no = (SELECT COUNT(rating_review_no) FROM RATING_REVIEW);
	   SET NEW.rating_review_no = LPAD(review_no+1, 5, '0');
	END $$ 
DELIMITER ;


CREATE TABLE `POST` (
    `post_no` INT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(50) NOT NULL,
    `post_type` INT NOT NULL,
    `post_title` VARCHAR(40),
    `post_content` VARCHAR(1000),
    `post_reg_date` DATETIME default CURRENT_TIMESTAMP,
    `post_Img1` VARCHAR(100),
    `post_Img2` VARCHAR(100),
    `post_Img3` VARCHAR(100),
    `post_hashtag1` VARCHAR(20),
    `post_hashtag2` VARCHAR(20),
    `post_hashtag3` VARCHAR(20),
    `video` VARCHAR(100),
    `delete_flag` CHAR(1) NOT NULL DEFAULT 'N',
    PRIMARY KEY (`post_no`)
);


CREATE TABLE `COMMENT` (
    `comment_no` INT NOT NULL AUTO_INCREMENT,
    `post_no` INT NOT NULL,
    `user_id` VARCHAR(50) NOT NULL,
    `comment_content` VARCHAR(400),
    `comment_reg_date` DATETIME default CURRENT_TIMESTAMP,
    PRIMARY KEY (`comment_no`)
);


CREATE TABLE `POST_CONCERN` (
    `count_no` INT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(50) NOT NULL,
    `post_no` INT NOT NULL,
    PRIMARY KEY (`count_no`)
);


CREATE TABLE `TRANSFER` (
    `transfer_no` INT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(50) NOT NULL,
    `reservation_no` VARCHAR(10),
    `transfer_camp_area` VARCHAR(30),
    `transfer_camp_name` VARCHAR(30),
    `transfer_camp_call` VARCHAR(15),
    `transfer_start_date` DATE,
    `transfer_end_date` DATE,
    `transfer_use_num` INT,
    `transfer_price` INT,
    `transfer_title` VARCHAR(40),
    `transfer_content` VARCHAR(1000),
    `transfer_add_content` VARCHAR(800),
    `transfer_reg_date` DATETIME default CURRENT_TIMESTAMP,
    `transfer_status` INT DEFAULT 0,
    `transfer_payment_img` VARCHAR(100),
    `delete_flag` CHAR(1) NOT NULL DEFAULT 'N',
    `transfer_hashtag1` VARCHAR(20),
    `transfer_hashtag2` VARCHAR(20),
    `transfer_hashtag3` VARCHAR(20),
    PRIMARY KEY (`transfer_no`)
);

CREATE TABLE `RECEIVE` (
    `receive_no` INT NOT NULL AUTO_INCREMENT,
    `transfer_no` INT NOT NULL,
    `user_id` VARCHAR(50) NOT NULL,
    `transfer_ee_phone` VARCHAR(11),
    `receive_title` VARCHAR(40),
    `receive_content` VARCHAR(1000),
    `receive_reg_date` DATETIME default CURRENT_TIMESTAMP,
    `receive_cancel_date` DATE,
    `receive_status` INT DEFAULT 0,
    `delete_flag` CHAR(1) NOT NULL DEFAULT 'N',
    PRIMARY KEY (`receive_no`)
);

CREATE TABLE `QNA` (
    `qna_no` INT NOT NULL AUTO_INCREMENT,
    `sender_id` VARCHAR(50) NOT NULL,
    `receiver_id` VARCHAR(50) NOT NULL,
    `delete_flag` CHAR(1) NOT NULL DEFAULT 'N',
    `question_title` VARCHAR(40),
    `question_content` VARCHAR(800),
    `question_reg_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `view_count` INT,
    `answer_content` VARCHAR(1000),
    `answer_reg_date` DATETIME ,
    `camp_no` INT,
    `camp_name` VARCHAR(30),
    PRIMARY KEY (`qna_no`)
);

CREATE TABLE `NOTICE` (
    `notice_no` INT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(50) NOT NULL,
    `delete_flag` CHAR(1) NOT NULL DEFAULT 'N',
    `notice_title` VARCHAR(40) NOT NULL,
    `notice_content` VARCHAR(2000) NOT NULL,
    `view_count` INT,
    `reg_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `camp_no` INT,
    `camp_name` VARCHAR(30),
    `notice_file1` VARCHAR(50),
    `notice_file2` VARCHAR(50),
    `notice_file3` VARCHAR(50),
    PRIMARY KEY (`notice_no`)
);

CREATE TABLE `REPORT` (
    `report_no` INT NOT NULL AUTO_INCREMENT,
    `sender_id` VARCHAR(50) NOT NULL,
    `receiver_id` VARCHAR(50) NOT NULL,
    `report_status` INT,
    `report_type` CHAR(1),
    `delete_flag` CHAR(1) NOT NULL DEFAULT 'N',
    `camp_name` VARCHAR(30),
    `report_content` VARCHAR(1000),
    `report_reg_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `report_Img1` VARCHAR(50),
    `report_Img2` VARCHAR(50),
    `report_img3` VARCHAR(50),
    PRIMARY KEY (`report_no`)
);

ALTER TABLE `QNA` ADD FOREIGN KEY (`sender_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `NOTICE` ADD FOREIGN KEY (`user_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `REPORT` ADD FOREIGN KEY (`sender_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `REPORT` ADD FOREIGN KEY (`receiver_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `POST` ADD FOREIGN KEY (`user_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `COMMENT` ADD FOREIGN KEY (`post_no`) REFERENCES `POST`(`post_no`);
ALTER TABLE `COMMENT` ADD FOREIGN KEY (`user_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `POST_CONCERN` ADD FOREIGN KEY (`post_no`) REFERENCES `POST`(`post_no`);
ALTER TABLE `POST_CONCERN` ADD FOREIGN KEY (`user_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `TRANSFER` ADD FOREIGN KEY (`user_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `RECEIVE` ADD FOREIGN KEY (`transfer_no`) REFERENCES `TRANSFER`(`transfer_no`);
ALTER TABLE `TRANSFER` ADD FOREIGN KEY (`reservation_no`) REFERENCES `CAMP_RESERVATION`(`reservation_no`);
ALTER TABLE `AUCTION_PRODUCT` ADD FOREIGN KEY (`registrant_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `AUCTION_PRODUCT` ADD FOREIGN KEY (`successful_bidder_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `AUCTION_HISTORY` ADD FOREIGN KEY (`product_no`) REFERENCES `AUCTION_PRODUCT`(`product_no`);
ALTER TABLE `BID_CONCERN` ADD FOREIGN KEY (`product_no`) REFERENCES `AUCTION_PRODUCT`(`product_no`);
ALTER TABLE `BID_CONCERN` ADD FOREIGN KEY (`auciton_user_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `LOGIN_HISTORY` ADD FOREIGN KEY (`user_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `MAIN_AUCTION_HISTORY` ADD FOREIGN KEY (`product_no`) REFERENCES `AUCTION_PRODUCT`(`product_no`);
ALTER TABLE `CAMP` ADD FOREIGN KEY (`business_user_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `RATING_REVIEW` ADD FOREIGN KEY (`camp_no`) REFERENCES `CAMP`(`camp_no`);
ALTER TABLE `RATING_REVIEW` ADD FOREIGN KEY (`user_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `RATING_REVIEW` ADD FOREIGN KEY (`product_no`) REFERENCES `AUCTION_PRODUCT`(`product_no`);
ALTER TABLE `MAINSITE` ADD FOREIGN KEY (`camp_no`) REFERENCES `CAMP`(`camp_no`);
ALTER TABLE `SUBSITE` ADD FOREIGN KEY (`camp_no`) REFERENCES `CAMP`(`camp_no`);
ALTER TABLE `CAMP_RESERVATION` ADD FOREIGN KEY (`user_id`) REFERENCES `USERS`(`user_id`);
ALTER TABLE `CAMP_RESERVATION` ADD FOREIGN KEY (`mainsite_no`) REFERENCES `MAINSITE`(`mainsite_no`);
ALTER TABLE `CAMP_RESERVATION` ADD FOREIGN KEY (`camp_no`) REFERENCES `CAMP`(`camp_no`);
ALTER TABLE `PAYMENT` ADD FOREIGN KEY (`payment_code`) REFERENCES `PAYMENT_CODE`(`payment_code`);
ALTER TABLE `NOTICE` ADD FOREIGN KEY (`camp_no`) REFERENCES `CAMP`(`camp_no`);
ALTER TABLE `QNA` ADD FOREIGN KEY (`camp_no`) REFERENCES `CAMP`(`camp_no`);