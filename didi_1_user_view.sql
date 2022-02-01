USE didi1;
-- the procedure for transferring money from the passenger to the driver and the company
DROP PROCEDURE IF EXISTS sp_transfer_money;
delimiter //

CREATE PROCEDURE sp_transfer_money (new_driver_id BIGINT UNSIGNED, new_price DECIMAL(7,2), OUT tran_result VARCHAR(120))
BEGIN 
	DECLARE tran_rollback bool DEFAULT 0;
	DECLARE code varchar(20);
	DECLARE error_string VARCHAR(100);

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
		SET tran_rollback = 1;
		GET stacked DIAGNOSTICS CONDITION 1 code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
		SET tran_result = CONCAT(code, ': ', error_string);
	END;
			
	START TRANSACTION;
			
	UPDATE wallets 
	SET wallet_balance = wallet_balance + 0.8 * new_price
	WHERE user_id = new_driver_id;
	
	UPDATE wallets 
	SET wallet_balance = wallet_balance + 0.2 * new_price
	WHERE user_id = 1;
				
	IF tran_rollback THEN 
		ROLLBACK;
	ELSE
		SET tran_result = 'money transfer is success';
		COMMIT;
	END IF;
END//

-- view for easy profile update
CREATE OR REPLACE VIEW drivers_basic_info AS 
SELECT 
	drivers.user_id AS driver_id, 
	CASE passports.gender 
		WHEN 'M' THEN CONCAT(LEFT(passports.full_name, 1), '先生') -- the first hieroglyph is a surname. Depending on the gender, an analogue of Mr. or Mrs. is added
		ELSE CONCAT(LEFT(passports.full_name, 1), '女士') 
	END AS nick_name,
	ot.name AS order_type,
	passports.gender,
	CASE substring(passports.birthday, 3, 1) 
		WHEN 5 THEN '50'
		WHEN 6 THEN '60'
		WHEN 7 THEN '70'
		WHEN 8 THEN '80'
		WHEN 9 THEN '90'
		ELSE '00'
	END AS birthday_decode,
	pp.id photo_id
FROM drivers 
	JOIN passports ON drivers.user_id = passports.user_id
	JOIN order_types ot ON drivers.order_type_id = ot.order_type_id
	JOIN profile_photos pp ON pp.user_id = passports.user_id ;

-- number of paid trips by month
CREATE OR REPLACE VIEW orders_count_by_month AS 
SELECT 
	YEAR(delivered_at) `year`,
	monthname(delivered_at) `month`,
	count(*) total_orders,
	sum(price) total_price
FROM orders
WHERE order_status = 2
GROUP BY `month`
ORDER BY YEAR(delivered_at), MONTH(delivered_at); 


-- time format for view of the order list
CREATE FUNCTION time_format_from_now(var_time DATETIME)
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
	CASE
	WHEN TIMESTAMPDIFF(DAY, var_time, NOW()) = 0 THEN RETURN CONCAT('today', ' ', DATE_FORMAT(var_time, '%k:%i'));
	WHEN TIMESTAMPDIFF(DAY, var_time, NOW()) = 1 THEN RETURN CONCAT('yesterday', ' ', DATE_FORMAT(var_time, '%k:%i'));
	WHEN TIMESTAMPDIFF(DAY, var_time, NOW()) > 2 AND TIMESTAMPDIFF(DAY, var_time, NOW()) < 7 THEN RETURN CONCAT(DAYNAME(var_time), ' ', DATE_FORMAT(var_time, '%k:%i'));
	ELSE RETURN CONCAT(DAY(var_time), ' ', monthname(var_time), ' ', DATE_FORMAT(var_time, '%k:%i'));
	END CASE ;
END//

-- view of the complated orders list 
CREATE OR REPLACE VIEW basic_order_info_for_users AS 
SELECT 
	o.user_id_1 user_id,
	(SELECT name FROM order_types ot WHERE ot.order_type_id = o.order_type_id) order_type,
	time_format_from_now(o.created_at) AS order_time,
	o.to_address,
	o.from_address,
	(SELECT name FROM order_status os WHERE os.id = o.order_status) order_status
FROM orders o
ORDER BY user_id, created_at DESC ;


-- detailed view of a specific order in the order list 
CREATE OR REPLACE VIEW detail_order_info_for_users AS
SELECT 
	o.user_id_1 user_id,
	o.order_id,
	concat(LEFT(p.full_name, 1), '师傅') nick_name, -- the word "driver" is added to the surname
	(SELECT id FROM profile_photos pp WHERE pp.user_id = o.user_id_1) photo_id,
	vl.plate_id,
	vl.model car_model,
	d.car_color_id,
	CASE 
	WHEN o.payment_status THEN 'payment successful'
	ELSE 'unpaid'
	END,
	o.price,
	o.basic_points,
	o.consumer_points 
FROM orders o 
	JOIN drivers d ON o.driver_id = d.user_id 
	JOIN passports p ON p.user_id = d.user_id 
	JOIN vehicle_licenses vl ON d.user_id = vl.user_id;

SELECT host, `user` FROM mysql.`user`;


-- creating an application user and granting him rights
CREATE USER users IDENTIFIED WITH sha256_password BY 'password';

SHOW grants for users;

GRANT SELECT ON didi1.basic_order_info_for_users TO 'users'@'%';
GRANT SELECT ON didi1.detail_order_info_for_users TO 'users'@'%';
GRANT SELECT, UPDATE ON didi1.profiles TO 'users'@'%';
GRANT SELECT ON didi1.user_points TO 'users'@'%';
GRANT SELECT ON didi1.document_status TO 'users'@'%';




