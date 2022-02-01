USE didi1;

INSERT INTO member_levels(level_name) 
VALUES ('white silver'), ('gold'), ('white gold'), ('diamond'), ('black gold'), ('black gold PLUS');

INSERT INTO car_colors(color_name)
VALUES 	('black'), ('silver'), ('grey'), ('white'), ('red'), ('golden'), ('blue'), ('brown'), ('purple'), ('green'), ('pink'), ('yellow'), ('orange');

INSERT INTO order_types(name)
VALUES 	('express'), ('special'), ('luxury'), ('taxi'), ('hitchhiker'), ('sharing car'), ('third party car'), ('driver rent');

INSERT INTO license_classes(class_name)
VALUES 	('A1'), ('A2'), ('A3'), ('B1'), ('B2'), ('C1'), ('C2'), ('C3'), ('C4'), ('C5');

INSERT INTO use_characters(name)
VALUES 	('non-business passenger cars'), ('business passenger cars'), ('non-business trucks'), ('business trucks');

INSERT INTO vehicle_types
VALUES 
	(1, 'Large passenger car', 'длина автомобиля не менее 6 м или количество пассажиров не менее 20 человек. Если количество пассажиров переменное, определяется верхний предел.'),
	(2, 'Medium passenger car', 'длина автомобиля меньше 6 м, а количество пассажиров больше 9 и меньше 20.'),
	(3, 'Small passenger car', 'длина транспортного средства составляет менее 6 м, а количество пассажиров не превышает 9 человек.'),
	(4, 'Mini passenger car', 'длина автомобиля меньше или равна 3,5 м, а общий объем цилиндра двигателя меньше или равен 1 литру.'),
	(5, 'Heavy Cargo', 'длина транспортного средства больше или равна 6 м, а общая масса больше или равна 12000 кг.'),
	(6, 'Medium Cargo', 'длина транспортного средства больше или равна 6 м, а общая масса больше или равна 4500 кг и меньше 12000 кг.'),
	(7, 'Lightweight Cargo', 'длина автомобиля составляет менее 6 м, а общая масса - менее 4500 кг.'),
	(8, 'Mini Cargo','длина транспортного средства не превышает 3,5 м, а общая масса не превышает 1800 кг.'),
	(9, 'Other', '');


-- Creating a trigger for auto-completion of tables with profile, document status and points after registering a new user
DROP TRIGGER IF EXISTS tables_of_new_user_insert;

delimiter //
CREATE TRIGGER tables_of_new_user_insert AFTER INSERT ON users
FOR EACH ROW 
BEGIN 
	INSERT INTO user_points(user_id) VALUES (NEW.id);
	INSERT INTO document_status(user_id) VALUES (NEW.id);
	INSERT INTO profiles(user_id) VALUES (NEW.id);
END //
delimiter ;

-- insert a company profile
INSERT INTO users(id, phone, password_hash) VALUES (1, '4000000999', '$2y$10$RT23.uUlpLfWwErqPClOtOHAJUJ32rJwWVeC8j312.cXgsg0iBac2');
-- insert new users, the first 10 ids are left for accounts used within the company
INSERT INTO users(id, phone, password_hash) VALUES (11, '12345678988', '$2y$10$uMMeUS56STleGZs380TTV./YlFGnv8/ANfHirh8y6GzFUN249A7xO');
INSERT INTO users(id, phone, password_hash) VALUES (12, '12235673998', '$2y$10$kKMMZEbr.LLCRoCNk6Vl..bZhB3FqhEEzTqo778LsZKh7NxWFCi8u');
INSERT INTO users(id, phone, password_hash) VALUES	(13, '19483330228', '$2y$10$A3veo9kiNGykYjXt.bTNPO/OM97KyxhHEccf.Kd187MZpdv3CIVei');
INSERT INTO users(id, phone, password_hash) VALUES	(14, '19205339882', '$2y$10$RTGK.uUlpLfWwErqPClOtOHAJUJq7rJwWVeC8j3HP.cXgsg0iBac2');
INSERT INTO users(id, phone, password_hash) VALUES	(15, '19364882004', '$2y$10$wifbbkYUNDoxhZmkGYwy5.ezubAUexYozdxeEkULZaZ.IxqHo04MK');
INSERT INTO users(id, phone, password_hash) VALUES	(16, '13572044876', '$2y$10$ZsAkplLpOl5TZcLwvLH9Puons0Xovl9fDSj9uQ8ZDUNaqYfGAQRQ6');
INSERT INTO users(id, phone, password_hash) VALUES	(17, '13755038299', '$2y$10$.NIEANqWL2rzWk2wDSsALOQXlaihVKiGN3pewIhupRwNVhV3WpzYm');
INSERT INTO users(id, phone, password_hash) VALUES	(18, '13056293004', '$2y$10$MgIvG85pqaOHPuNGvpyFg.PMrrTQa0OdqvqH9Q8JGgl5h1Aa7PUea');
INSERT INTO users(id, phone, password_hash) VALUES	(19, '13450321333', '$2y$10$.6.SWZGzghCV7DvaJ0auc.Ff9llCecz/Fg53hwjK8EeMearz56fhi');
INSERT INTO users(id, phone, password_hash) VALUES	(20, '19302454392', '$2y$10$DFFbWebUpHUXy/5VJUZXjOu5hrOJbcFYygdv/OwVzt9tCci4KOuzm');
INSERT INTO users(id, phone, password_hash) VALUES	(21, '19346583241', '$2y$10$BKnhozb9humtPXzyTuHQ0.ee7Tspctb3W.LpdeYTki5jfTRKJPYQy');
INSERT INTO users(id, phone, password_hash) VALUES	(22, '19263826352', '$2y$10$Tlrpd7ENgczodbXLG3RJluBQmUX.XQ70FC97xx5VKkIG7Fw0TFrm6');
INSERT INTO users(id, phone, password_hash) VALUES	(23, '13940398843', '$2y$10$Tlrpd7ENgczod2XLG3RJluBQmUX.XQ70FC97xx5VKkIG7Fw0TFrm6');
INSERT INTO users(id, phone, password_hash) VALUES	(24, '13928403321', '$2y$10$.NIEANqWL2rz1k2w3SsALOQXlaihVKiGN3pewIhupRwNVhV3WpzYm');
INSERT INTO users(id, phone, password_hash) VALUES	(25, '16932836490', '$2y$10$XXaXVMaVo3QNhaccu5sou.OE8w8tSCpazalSPvzZrORLLwXGTggzW');
INSERT INTO users(id, phone, password_hash) VALUES	(26, '19373928311', '$2y$10$Jxnva0nQ845ERk0ORCIQreRISzEtCtEVTP9cxirWLFcHiAEhg2p0a');
INSERT INTO users(id, phone, password_hash) VALUES	(27, '10323248232', '$2y$10$TSQUUo0JIb5q3CqjUltqWubOfyhKkkoxYMwhJQUNnv24jaE2Z/lc2');

-- updating the profile table, after adding a photo to the profile photo table
DROP TRIGGER IF EXISTS profile_photo_insert;
delimiter //
CREATE TRIGGER profile_photo_insert AFTER INSERT ON profile_photos
FOR EACH ROW 
BEGIN 
	UPDATE profiles 
	SET profiles.profile_photo_id = NEW.id
	WHERE profiles.user_id = NEW.user_id;
END //
delimiter ;

INSERT INTO profile_photos(user_id, photo_size)
VALUES (12, 234), (18, 183), (21, 39), (15, 61);

UPDATE profiles 
SET nick_name = 'Lize', gender = 'F'
WHERE user_id = 17;

-- company profile
UPDATE profiles 
SET nick_name = 'Didi company'
WHERE user_id = 1;

-- Updating the status of documents and points, after inserting the passport data. For attaching a passport, the user is added + 40 points. It is impossible to delete a passport info
DROP TRIGGER IF EXISTS tables_update_after_passport_insert;
delimiter //
CREATE TRIGGER tables_update_after_passport_insert AFTER INSERT ON passports
FOR EACH ROW 
BEGIN 
	UPDATE document_status 
	SET document_status.passport_id = TRUE 
	WHERE document_status.user_id = NEW.user_id;

	UPDATE user_points
	SET user_points.basic_points = user_points.basic_points + 40
	WHERE user_points.user_id = NEW.user_id;
END //
delimiter ;


INSERT INTO passports(user_id, full_name, passport_id, gender, nationality, address, birthday) 
VALUES 
	(11, '张三','110101199003072674', 'M', '汉', '北京市市辖区东城区', '1990-03-07'),
	(27, '李四','130609199802179429', 'F', '汉', '河北省保定市徐水区', '1998-02-17'),
	(23, '伦雪','36010219930603255X', 'M', '汉', '江西省南晶市东湖区', '1993-06-03'),
	(12, '宁颀秀','410302200701122441', 'F', '汉', '河南省洛阳市老城区', '2007-01-12'),
	(14, '祝嘉赐','230102200510054170', 'M', '汉', '黑龙江省哈尔滨市道里区', '2005-10-05'),
	(17, '及梓婷','410302198501022956', 'F', '汉', '河南省洛阳市老城区', '1985-01-02'),
	(25, '孟兴怀','330102200009153259', 'M', '汉', '浙江省杭州市上城区', '2000-09-15'),
	(18, '歧丹丹','230102197905203447', 'F', '汉', '黑龙江省哈尔滨市道里区', '1979-05-20'), --  driver
	(19, '似玉石','330102198209166433', 'M', '汉', '浙江省杭州市上城区', '1982-09-16'),  --  driver
	(20, '字天晴','13060919881107662X', 'F', '汉', '河北省保定市徐水区', '1988-11-07'), --  driver
	(21, '六明远','330102197803278898', 'M', '汉', '浙江省杭州市上城区', '1978-03-27'), --  driver
	(13, '舒元','230102198603249110', 'F', '汉', '黑龙江省哈尔滨市道里区', '1986-03-24');

-- basic verification of driver's license data for all types of drivers before insert
DROP TRIGGER IF EXISTS basic_validation_driving_license_insert;
delimiter //

CREATE TRIGGER basic_validation_driving_license_insert BEFORE INSERT ON driving_licenses
FOR EACH ROW 
BEGIN 
	IF TIMESTAMPDIFF(MONTH, NOW(), NEW.to_valid_period) < 7 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO VALID DRIVING PERIOD';
	ELSEIF (TIMESTAMPDIFF(YEAR, NEW.birthday, NOW()) < 18 OR TIMESTAMPDIFF(YEAR, NEW.birthday, NOW()) > 70) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO VALID AGE';
	ELSEIF TIMESTAMPDIFF(YEAR, NEW.date_of_first_issue, NOW()) < 1 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO VALID PEDIOD OF DRIVING TIME';
	ELSEIF NEW.license_class_id > (SELECT license_class_id FROM license_classes WHERE class_name = 'C2') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO VALID LICENSE CLASS';
	ELSEIF (SELECT full_name FROM passports WHERE user_id = NEW.user_id) IS NULL THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO PASSPORT INFO'; -- нужно сначала прикрепить паспорт
	ELSEIF NEW.full_name != (SELECT full_name FROM passports WHERE user_id = NEW.user_id) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'MISMATCH FULLNAME WITH PASSPORT FULLNAME'; -- можно подкрепить водительское удостоверение только на свое имя
	END IF;
END //

-- updating the status of documents after inserting the driver's license data
DROP TRIGGER IF EXISTS tables_update_after_driving_license_insert;
CREATE TRIGGER tables_update_after_driving_license_insert AFTER INSERT ON driving_licenses
FOR EACH ROW 
BEGIN 
	UPDATE document_status 
	SET document_status.driving_licence = TRUE 
	WHERE document_status.user_id = NEW.user_id;
END //

delimiter ;


INSERT INTO driving_licenses(user_id, full_name, gender, nationality, address, birthday, date_of_first_issue, license_class_id, from_valid_period, to_valid_period)
VALUES 
	(18, '歧丹丹', 'F', '汉', '浙江省杭州市上城区', '1979-05-20', '2019-11-28', 7, '2019-11-28', '2025-11-28'),
	(19, '似玉石', 'M', '汉', '浙江省杭州市上城区', '1982-09-16', '2011-11-09', 7, '2017-07-30', '2023-07-30'),
	(20, '字天晴', 'F', '汉', '浙江省杭州市上城区', '1988-11-07', '2012-04-09', 7, '2018-02-12', '2024-02-12');

INSERT  INTO vehicle_licenses(user_id, plate_id, vehicle_type_id, owner_fullname, address, model, use_character_id, VIN, engine_id, police_register_date, license_register_date)
VALUES 
	(18, '浙AD89122', 3, '歧丹丹', '浙江省杭州市上城区', 'BMW7200HL', 1, 'LBV8V3120482H4245', '20459211', '2016-03-21', '2019-11-28'),
	(19, '浙AK391M2', 3, '似玉石', '浙江省杭州市上城区', 'SC7081C', 1, 'DHNV32OS020031321', '32048273', '2002-12-13', '2003-11-09'),
	(20, '浙AS273K1', 3, '字天晴', '浙江省杭州市上城区', 'EQ3100FE', 1, 'SK392H402N123B54D', '3945298', '2008-08-22', '2018-02-01');

INSERT INTO license_car_photos(vehicle_license_id, user_id, file_size)
VALUES 	(4, 18, 124), (5, 19, 100), (6, 20, 12);

INSERT INTO car_tail_photos(user_id, file_size) 
VALUES (18, 12), (19, 37), (20, 115);

-- validation of all information about the driver according to the selected order type
DROP TRIGGER IF EXISTS basic_validation_driver_insert;
delimiter //

CREATE TRIGGER basic_validation_driver_insert BEFORE INSERT ON drivers
FOR EACH ROW 
BEGIN 
	IF NEW.user_id != (SELECT user_id FROM driving_licenses WHERE driving_license_id = NEW.driving_license_id) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'YOU CAN NOT USE THIS DRIVING LICENSE'; -- you can attach only your driver's license
	END IF;
	IF NEW.is_vehicle_owner = 0 THEN
		SET NEW.is_valid =
		(SELECT 
			CASE 
				WHEN date_of_first_issue <= (current_timestamp-INTERVAL 3 YEAR) -- driving experience 3 years
					AND TIMESTAMPDIFF(YEAR, birthday, NOW()) >= 21 
					AND TIMESTAMPDIFF(YEAR, birthday, NOW()) <= 65
				THEN TRUE
				ELSE FALSE 
			END AS is_valid
		FROM  driving_licenses WHERE user_id = NEW.user_id);
		
		IF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'driver rent')
			THEN 
				SET NEW.is_valid =
				(SELECT 
					CASE 
						WHEN date_of_first_issue <= (current_timestamp-INTERVAL 5 YEAR)
							AND license_class_id <= (SELECT id FROM license_classes WHERE name = 'C1')
							AND TIMESTAMPDIFF(YEAR, birthday, NOW()) >= 25 
							AND TIMESTAMPDIFF(YEAR, birthday, NOW()) <= 50
						THEN TRUE
						ELSE FALSE
					END AS is_valid
				FROM driving_licenses WHERE user_id = NEW.user_id);
		END IF;
	ELSE 
		IF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'express') 
			OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'special')
			OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'luxury')
			OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'sharing car')
			THEN 
				SET NEW.is_valid = 
				(SELECT 
					CASE
						WHEN pc.plate_code = (SELECT LEFT(plate_id, 2) FROM vehicle_licenses WHERE user_id = NEW.user_id )
						THEN TRUE 
						ELSE FALSE 
					END AS is_valid
				FROM city_codes cc JOIN plate_codes pc ON cc.city_name = pc.city_name 
				WHERE cc.city_code = NEW.city_id);
		END IF;
	END IF;
END //

INSERT INTO drivers(user_id, order_type_id, is_vehicle_owner, city_id, vehicle_license_id, driving_license_id, car_color_id, car_tail_photo_id)
VALUES 
	(18, 1, TRUE, 3301, 4, 4, 4, 1),
	(19, 2, TRUE, 3301, 5, 5, 3, 2),
	(20, 3, TRUE, 3301, 6, 6, 5, 3);

INSERT INTO wallets(wallet_id, user_id, wallet_balance)
VALUES (1, 1, DEFAULT), (10, 20, DEFAULT), (11, 19, 2500), (12, 18, 1200);


INSERT INTO order_status
VALUES (1, 'in the process'), (2, 'complete'), (3, 'closed');

-- order validation
DROP TRIGGER IF EXISTS before_order_insert;

delimiter //
CREATE TRIGGER before_order_insert BEFORE INSERT ON orders
FOR EACH ROW 
BEGIN
	IF NEW.user_id_1 = NEW.driver_id THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NOT VALID DATA';
	ELSEIF (SELECT is_valid FROM drivers d WHERE user_id = NEW.driver_id) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NOT VALID DRIVER';
	ELSEIF (SELECT order_status FROM orders WHERE user_id_1 = NEW.user_id_1 ORDER BY updated_at DESC LIMIT 1) = 1 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'PREVIOS ORDER DID NOT PAIDED'; -- если у пользователя предыдущий заказ не оплачен, то он не может закать новый
	ELSEIF NEW.driver_id NOT IN (SELECT user_id FROM drivers) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'WRONG DRIVER_ID';
	ELSEIF NEW.order_type_id != (SELECT order_type_id FROM drivers WHERE user_id = NEW.driver_id) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'THIS DRIVER CAN NOT SERVE THIS TYPE OF ORDER';
	ELSEIF NEW.order_status = 3 AND NEW.payment_status = 1 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CENCELED ORDER CAN NOT BE PAIDED';	
	ELSE 
		SET NEW.order_status = COALESCE(NEW.order_status, 1); -- созданному заказу автоматически причисляется статус в процессе
		IF NEW.payment_status = 1 THEN 
			IF NEW.distance IS NULL OR NEW.price IS NULL OR NEW.price = 0 OR NEW.delivered_at IS NULL THEN 
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NOT ENOUGH INFO FOR COMPLETE ORDER';
			ELSE 
				SET NEW.order_status = 2;
			
				IF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'express') OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'sharing car') THEN 
					SET NEW.consumer_points = NEW.distance;
				ELSEIF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'special') THEN 
					SET NEW.consumer_points = NEW.distance * 2;
				ELSEIF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'luxury') THEN 
					SET NEW.consumer_points = NEW.distance * 5;
				ELSEIF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'taxi') OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'third party car') THEN
					SET NEW.consumer_points = NEW.distance * 1.5;
				END IF;			
				
				SET NEW.basic_points = 5;
				
				UPDATE user_points
				SET basic_points = basic_points + 5
				WHERE user_id = NEW.user_id_1;
				
				UPDATE user_points 
				SET consumers_points = consumers_points + NEW.consumer_points
				WHERE user_id = NEW.user_id_1;
			END IF;
		END IF;
	END IF;
END //
	
CREATE TRIGGER before_order_update BEFORE UPDATE ON orders
FOR EACH ROW 
BEGIN
	IF NEW.payment_status = 1 AND OLD.payment_status = 0 THEN
		IF NEW.distance IS NULL OR NEW.price IS NULL OR NEW.price = 0 OR NEW.delivered_at IS NULL THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NOT ENOUGH INFO FOR COMPLETE ORDER';
		ELSE 
			SET NEW.order_status = 2;
			
			IF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'express') OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'sharing car') THEN 
				SET NEW.consumer_points = NEW.distance;
			ELSEIF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'special') THEN 
				SET NEW.consumer_points = NEW.distance * 2;
			ELSEIF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'luxury') THEN 
				SET NEW.consumer_points = NEW.distance * 5;
			ELSEIF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'taxi') OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'third party car') THEN
				SET NEW.consumer_points = NEW.distance * 1.5;
			END IF;
				
			SET NEW.basic_points = 5;
			
			UPDATE user_points
			SET basic_points = basic_points + 5
			WHERE user_id = NEW.user_id_1;
				
			UPDATE user_points 
			SET consumers_points = consumers_points + NEW.consumer_points
			WHERE user_id = NEW.user_id_1;
		END IF;
	END IF;
END //

INSERT INTO orders
VALUES 
	(0, 1, 12, 18, '杭州市银泰百货-北1门', '杭州东站', 18.75, 2, '2021-03-22 12:46:48', 2, TRUE, 5, 2, '2021-03-22 12:09:10', '2021-03-22 12:46:48'),
	(0, 2, 17, 19, '杭州市Carbon法国餐厅（北山十号）西侧', '富源商务酒店', 53.68, 2, '2021-04-13 22:51:48', 4, TRUE, 5, 8, '2021-04-13 22:10:14', '2021-04-13 22:51:48'),
	(0, 2, 14, 19, '杭州环城西路/省府路路口', '宜尚PLUS酒店', DEFAULT, 3, DEFAULT, NULL, FALSE, NULL, NULL, '2021-05-22 18:09:14', '2021-05-22 18:09:59'),
	(0, 3, 16, 20, '杭州国际博览中心-5号门西', '优能科技园', 82.83, 2, '2021-02-17 09:55:27', 7, TRUE, 5, 35, '2021-02-17 09:23:14', '2021-02-17 09:55:27');


-- checking the work of triggers
INSERT INTO orders(order_type_id, user_id_1, driver_id, from_address, to_address)
VALUES (3, 13, 20, '杭州世纪访-西北门', '天云花园');

UPDATE orders 
SET 
	delivered_at = now(),
	distance = 5,
	price = 60.19
WHERE order_id = 5;
	
UPDATE orders
SET payment_status = 1
WHERE order_id = 5;

-- money transfer through the procedure
CALL sp_transfer_money (20, 60.19, @tran_result);
SELECT @tran_result;

INSERT INTO orders
VALUES 
	(0, 1, 14, 18, '杭州市某地方', '杭州东其他地方', 32.75, 2, '2021-04-22 12:46:48', 4, TRUE, 0, 0, '2021-04-22 12:09:10', '2021-04-22 12:46:48');

-- money transfer through the procedure 
CALL sp_transfer_money (18, 32.75, @tran_result);
SELECT @tran_result;

INSERT INTO cameras
VALUES (NULL, 18), (NULL, 18), (NULL, 19), (NULL, 20), (NULL, 20), (NULL, 20);

-- updating records in the file table from all cameras owned by the driver when inserting full order data
delimiter //
CREATE TRIGGER after_order_insert_camera AFTER INSERT ON orders
FOR EACH ROW 
BEGIN
	DECLARE c_id, d_id INT;
	DECLARE is_end INT DEFAULT 0;

	DECLARE curcat CURSOR FOR SELECT * FROM cameras WHERE driver_id = NEW.driver_id;
  	DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;
  
  	-- заказ должен быть доставлен и дистанция должна быть просчитана
	IF NEW.delivered_at IS NOT NULL AND NEW.distance IS NOT NULL THEN 
  		OPEN curcat;

  		cycle : LOOP
			FETCH curcat INTO c_id, d_id;
			IF is_end THEN LEAVE cycle;
			END IF;
			INSERT INTO camera_records(record_id, camera_id, order_id, file_duration, created_at)
				VALUES (NULL, c_id, NEW.order_id, timediff(NEW.delivered_at, NEW.created_at), now());
  		END LOOP cycle;

  		CLOSE curcat;
  	END IF;
END//

-- updating records in the file table from all cameras belonging to the driver when updating order records
delimiter //
CREATE TRIGGER after_order_update_camera AFTER UPDATE ON orders
FOR EACH ROW 
BEGIN
	DECLARE c_id, d_id INT;
	DECLARE is_end INT DEFAULT 0;

	DECLARE curcat CURSOR FOR SELECT * FROM cameras WHERE driver_id = NEW.driver_id;
  	DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;
  	
  	-- the order must be delivered and the distance must be calculated
	IF NEW.delivered_at IS NOT NULL 
		AND NEW.distance IS NOT NULL 
		AND (OLD.delivered_at IS NULL OR OLD.distance IS NULL)
	THEN 
  		OPEN curcat;

  		cycle : LOOP
			FETCH curcat INTO c_id, d_id;
			IF is_end THEN LEAVE cycle;
			END IF;
			INSERT INTO camera_records(record_id, camera_id, order_id, file_duration, created_at)
				VALUES (NULL, c_id, NEW.order_id, timediff(NEW.delivered_at, NEW.created_at), now());
  		END LOOP cycle;

  		CLOSE curcat;
  	END IF;
END//

INSERT INTO camera_records
VALUES 
	(NULL, 1, 1, 12302, '0:37:38', '2021-03-22 12:46:50'),
	(NULL, 2, 1, 12302, '0:37:38', '2021-03-22 12:46:50'),
	(NULL, 3, 2, 20130, '0:40:26', '2021-04-13 22:51:49'),
	(NULL, 4, 4, 10973, '0:32:13', '2021-02-17 09:55:28'),
	(NULL, 5, 4, 10932, '0:32:13', '2021-02-17 09:55:28'),
	(NULL, 6, 4, 10829, '0:32:13', '2021-02-17 09:55:28'),
	(NULL, 4, 5, 973, '0:14:30', '2021-10-02 13:27:21'),
	(NULL, 5, 5, 821, '0:14:30', '2021-10-02 13:27:21'),
	(NULL, 6, 5, 924, '0:14:30', '2021-10-02 13:27:21');


-- updating the membership level
delimiter //
CREATE TRIGGER update_user_points BEFORE UPDATE ON user_points
FOR EACH ROW 
BEGIN
	IF NEW.basic_points != OLD.basic_points THEN 
		IF NEW.basic_points > 149 AND NEW.basic_points < 300 THEN 
			SET NEW.member_level_id = 2;
		ELSEIF NEW.basic_points >= 300 AND NEW.basic_points < 800 THEN 
			SET NEW.member_level_id = 3;
		ELSEIF NEW.basic_points >= 800 AND NEW.basic_points < 1800 THEN 
			SET NEW.member_level_id = 4;
		ELSEIF NEW.basic_points >= 1800 AND NEW.basic_points < 3800 THEN 
			SET NEW.member_level_id = 5;
		ELSEIF NEW.basic_points >= 3800 THEN 
			SET NEW.member_level_id = 6;
		END IF;
	END IF;
END//


UPDATE user_points
SET basic_points = 156
WHERE user_id = 15;

