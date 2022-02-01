USE didi1;
-- 1. All users who have attached a passport between the ages of 18 and 23 have confirmed their student status
UPDATE document_status 
SET student_authenticate = 1 
WHERE user_id IN (SELECT user_id FROM passports WHERE TIMESTAMPDIFF(YEAR, birthday, NOW())<= 23 AND TIMESTAMPDIFF(YEAR, birthday, NOW()) > 18);

-- 2. update the gender of the nickname, gender, date of birth in the profile of drivers
UPDATE profiles p , drivers_basic_info dbi 
SET p.nick_name = dbi.nick_name,
	p.gender = dbi.gender,
	p.birthday_decode = dbi.birthday_decode
WHERE p.user_id = dbi.driver_id;


-- 3. adding a new driver. A user with id 11 becomes a driver.
-- 3.1 insert driving_license
INSERT INTO driving_licenses(user_id, full_name, gender, nationality, address, birthday, date_of_first_issue, license_class_id, from_valid_period, to_valid_period)
VALUES 
	(21, '六明远', 'M', '汉', '浙江省杭州市上城区', '1978-03-27', '1999-09-13', 7, '2021-01-12', '2027-01-12');

-- 3.2 insert vehicle_license
INSERT INTO vehicle_licenses(user_id, plate_id, vehicle_type_id, owner_fullname, address, model, use_character_id, VIN, engine_id, police_register_date, license_register_date)
VALUES (21, '浙AD89121', 3, '六明远', '浙江省杭州市上城区', 'BH7164AX', 1, '1937F93JS720S0K37', '62039484', '2009-08-12', '2009-09-01');


-- 3.3 insert license_car_photos, car_tail_photos
INSERT INTO license_car_photos
SELECT 
	vl.vehicle_license_id,
	230,
	now(),
	now(),
	p.user_id 
FROM vehicle_licenses vl 
	JOIN passports p ON vl.owner_fullname = p.full_name 
	WHERE p.user_id  = 21;


INSERT INTO car_tail_photos
VALUES (NULL, '26', DEFAULT, DEFAULT, 21);

-- 3.4 insert drivers table + validation from the trigger
INSERT INTO drivers (user_id, order_type_id, is_vehicle_owner, city_id, vehicle_license_id, car_tail_photo_id, driving_license_id, car_color_id)
SELECT 
	p.user_id,
	2,
	1,
	(SELECT city_code FROM city_codes WHERE city_name = '杭州市'),
	vl.vehicle_license_id,
	c.photo_id,
	dl.driving_license_id,
	7
FROM passports p 
	JOIN vehicle_licenses vl ON p.user_id = vl.user_id 
	JOIN driving_licenses dl ON p.user_id = dl.user_id 
	JOIN car_tail_photos c ON p.user_id = c.user_id 
WHERE p.user_id = 21;

-- 3.5 New driver registers 2 cameras
INSERT INTO cameras 
VALUES (0, 21), (0, 21);

-- 3.6 order for a new driver
INSERT INTO orders(order_type_id, user_id_1, driver_id, from_address, to_address )
VALUES 
	(2, 13, 21, '杭州市某地方', '杭州东其他地方');

SELECT * FROM orders;

-- 4. what % of users are drivers
SELECT round((SELECT COUNT(*) FROM drivers)/(SELECT count(*) FROM users WHERE id > 10)*100) AS procent_of_drivers;

-- 4.1 what % of users have inserted their passport info
SELECT ROUND((SELECT COUNT(*) FROM passports) /(SELECT COUNT(*) FROM users u WHERE id > 10)*100);

-- 4.2 what % of passenger users have inserted their passport info
SELECT ROUND(((SELECT COUNT(*) FROM passports) - (SELECT COUNT(*) FROM drivers))/(SELECT count(*) FROM users WHERE id > 10)*100);


-- 5. how many women and men are among the users
SELECT 
	CASE gender 
		WHEN 'M' THEN 'Man'
		ELSE 'Woman'
	END AS gender,
	COUNT(*) AS total_num
FROM passports 
GROUP BY gender; 

-- 6. which driver has the most orders
SELECT 
	driver_id,
	count(*) AS total_orders
FROM orders
GROUP BY driver_id 
ORDER BY total_orders DESC LIMIT 1;

-- 7. how many orders have been canceled in the last month
SELECT count(*) FROM orders WHERE order_status = 3 AND MONTH(created_at) = MONTH(now());

-- 8. list of trips of a user with id = 13
SELECT order_id, from_address, to_address, order_status FROM orders WHERE user_id_1 = 13;

-- 9. list of trips of the user id = 13 of the luxury type
SELECT 
	o.order_id ,
	o.from_address ,
	o.to_address 
FROM orders o 
	JOIN drivers d ON o.driver_id = d.user_id 
	JOIN order_types ot ON ot.order_type_id = d.order_type_id 
WHERE ot.name = 'luxury' AND o.user_id_1 = 13;

-- 10. the average price of trips among users of the age categories under 25, 26-35, 36-40, over 41 years
SELECT 
	CASE 
		WHEN TIMESTAMPDIFF(YEAR, p.birthday, now()) <=25 THEN ' < 25'
		WHEN TIMESTAMPDIFF(YEAR, p.birthday, now()) BETWEEN 26 AND 35 THEN '26-35'
		WHEN TIMESTAMPDIFF(YEAR, p.birthday, now()) BETWEEN 36 AND 40 THEN '36-40'
		ELSE '> 41'
	END AS age_period,
	avg(o.price) avr_price
FROM orders o 
	JOIN passports p ON o.user_id_1 = p.user_id 
GROUP BY age_period
ORDER BY RIGHT(age_period, 2);

-- 11. how many trips were made in each month of this year
SELECT 
	YEAR(delivered_at) `year`,
	monthname(delivered_at) `month`,
	count(*) total_orders
FROM orders
GROUP BY `month`
HAVING `year` = YEAR(now())
ORDER BY MONTH(delivered_at); 
