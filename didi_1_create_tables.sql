-- Datadase of the Didi APP platphorm
/*
 * This APP is multifunction, but in the framework of this work, I described only the most basic ones.
 * In China, all documents are unified, and data such as provinces, cities, vehicle identification numbers, vehicle type, etc.
 * are stored in state partially open databases.
 * As part of the work, I compiled my catalogs, but I downloaded the catalog of coding provinces and cities from open resource
 * and converted it into sql tables.
 * Please connect china_codes file to the Didi batabase before starting work
 */
DELETE DATABASE IF EXISTS didi1;
CREATE DATABASE didi1;

USE didi1;

-- Catalog of a membership
DROP TABLE IF EXISTS member_levels;
CREATE TABLE member_levels(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	level_name VARCHAR(100) NOT NULL UNIQUE 
);

-- Create an account. All platform users have the same registration. 
-- Every users should authorizate account through a phone number and creating a password.
-- The phone number consists of 11 digits without the need to prescribe a country code
-- The password in the application is stored encoded.
DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	phone CHAR(11) UNIQUE NOT NULL,
	password_hash VARCHAR(65) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table of credits and user membership levels
DROP TABLE IF EXISTS user_points;
CREATE TABLE user_points(
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
	member_level_id INT UNSIGNED NOT NULL DEFAULT 1,
	basic_points INT NOT NULL DEFAULT 0,
	consumers_points INT NOT NULL DEFAULT 0,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (member_level_id) REFERENCES member_levels(id) ON UPDATE CASCADE
);

ALTER TABLE user_points ADD FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ;

-- Profile photo catalog
DROP TABLE IF EXISTS profile_photos;
CREATE TABLE profile_photos(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	photo_size BIGINT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE 
);

-- Create a profile. The table is optional. Filled in manually by users.
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles(
	user_id SERIAL PRIMARY KEY,
	nick_name VARCHAR(200),
	profile_photo_id BIGINT UNSIGNED UNIQUE,
	gender ENUM('F', 'M') DEFAULT 'M',
	birthday_decode ENUM('50', '60', '70', '80', '90', '00'), 
	industry VARCHAR(200), 
	company VARCHAR(200), 
	profession VARCHAR(200), 
	self_discription VARCHAR(255),
	
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE,
	FOREIGN KEY (profile_photo_id) REFERENCES profile_photos(id) ON DELETE CASCADE ON UPDATE CASCADE,
	INDEX birthday_decode_idx (birthday_decode)
);

-- Status table. Confirms the backed documents to the account. Updated after documents are attached.
DROP TABLE IF EXISTS document_status;
CREATE TABLE document_status(
	user_id SERIAL PRIMARY KEY,	
	passport_id BOOLEAN DEFAULT FALSE, 
	driving_licence BOOLEAN DEFAULT FALSE, 
	student_authenticate BOOLEAN DEFAULT FALSE,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE,
	
	INDEX inx_passport_exists (passport_id),
	INDEX inx_driving_licence_exists (driving_licence)
);


/*
Catalog of types of trips. The user can specify the type of trip after setting the final and initial path. 
We are talking about a regular taxi (express, special, luxury, taxi), 
hitchhiking (drivers and passengers are informed in advance about the deliberate trip, in case of coincidence of their 
intentions is asked the driver of the passenger), 
sharing car (driver can service two clients at once if their orders are quite similar.),
services of driver (It is used by those who have their own car, but due to certain circumstances cannot drive it on their own)
and taxi third-party applications.
In this work only describes regular taxi.
*/
DROP TABLE IF EXISTS order_types;
CREATE TABLE order_types( 
	order_type_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(200) NOT NULL UNIQUE
); 

-- Catalog of colors for cars. When authorizing a user as a driver, he needs to enter information about the color of his car. Colors variation is fixed by the application.
DROP TABLE IF EXISTS car_colors;
CREATE TABLE car_colors( 
	color_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	color_name VARCHAR(50) NOT NULL UNIQUE -- black, silver, grey, white, red, golden, blue, brown, purple, green, pink, yellow, orange
);

/*
 * Passport data table. Passenger users who use a regular taxi order do not need to enter passport data.
 * Residents of China use an ID-card instead of a passport. The id number consists of 18 digits or 17 digits and one letter X.
 * There is a special logic for compiling the id of the passport number. 2 digits - province number, 2 digits - city number, 2 digits - county or registration region number, 8 digits - yyyymmdd of birth, 2 digits - police station number, 1 digit - sex.
 * Usually names consist of 2-4 hieroglyphs, where the first hieroglyph is the surname. Written in one line.
 * There are 56 nationalities in China, but they are all chinese.
 * The information of all attached documents is filled in by an algorithm that scans a photo of the document. Because of this, many of the tables below will have duplicate data, such as date of birth, gender, and name.
 */
DROP TABLE IF EXISTS passports;
CREATE TABLE passports( 
	user_id SERIAL PRIMARY KEY,
	full_name VARCHAR(5) NOT NULL,
	passport_id VARCHAR(18) NOT NULL, -- it is possible to attach a passport number to several accounts, as well as buy a phone number using one passport
	gender ENUM('F', 'M') NOT NULL,
	nationality VARCHAR(10), -- removed NOT NULL for convenience of filling
	address VARCHAR(255), -- removed NOT NULL for convenience of filling 
	birthday DATE NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE,
	
	INDEX inx_passport_gender (gender),
	INDEX inx_passport_age (birthday)
); 

/*
 * Catalog of vehicle types. This information appears in the vehicle license.
 * In this work, I considered only the passenger small type. The description contains the requirements for this type of machine.
 */
DROP TABLE IF EXISTS vehicle_types;
CREATE TABLE vehicle_types( 
	vehicle_type_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(200) NOT NULL UNIQUE,
	discription VARCHAR(255)
);

-- Catalog of vehicle usage types. Separate combinations of types passenger cars or trucks, for personal or business use.
DROP TABLE IF EXISTS use_characters;
CREATE TABLE use_characters( 
	use_character_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(200) NOT NULL UNIQUE
);

-- License class catalog.
DROP TABLE IF EXISTS license_classes;
CREATE TABLE license_classes( 
	license_class_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	class_name CHAR(2) NOT NULL UNIQUE -- A1, A2, A3, B1, B2, C1, C2, C3, C4, C5
);

/*
 * Vehicle Ownership License. The information from the document is read by the algorithm from the uploaded photo.
 * The first digit of the license plate is a Chinese character representing the provincial administrative region where the vehicle is registered,
 * The second digit of the license plate is an English letter representing the prefecture-level administrative region in which the vehicle registration is located (letter code).
 * To simplify data entry, several of the columns can be omitted, although in reality all data must be entered.
 */
DROP TABLE IF EXISTS vehicle_licenses;
CREATE TABLE vehicle_licenses( 
	vehicle_license_id SERIAL PRIMARY KEY,
	plate_id VARCHAR(8) NOT NULL UNIQUE, -- vehicle number plate. Consists of 7 characters for fuel vehicles and 8 characters for electronic or semi-electronic vehicles.
	vehicle_type_id INT UNSIGNED NOT NULL,
	owner_fullname VARCHAR(200) NOT NULL,
	address VARCHAR(255),
	model VARCHAR(80), -- vehicle model number, 
	use_character_id INT UNSIGNED NOT NULL,
	VIN VARCHAR(17), -- Vehicle identification number, including manufacturer, year, model, body type and code, engine code, assembly location, etc.
	engine_id VARCHAR(8) UNIQUE, -- engine identification number
	police_register_date DATE NOT NULL, -- Date of issue of a license for a car, date of registration with the traffic police after purchase. From this day on, DPD has car affairs
	license_register_date DATE NOT NULL, -- Driver's license issue date: This is the confirmation date and time for recording the date of issue of the driver's license (license plate issue).
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	user_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_types(vehicle_type_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (use_character_id) REFERENCES use_characters(use_character_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE,
	
	INDEX inx_owner_fullname (owner_fullname)
); 

ALTER TABLE vehicle_licenses ADD INDEX (plate_id) ;

-- Table for storing photos of the vehicle attached to the license.
DROP TABLE IF EXISTS license_car_photos;
CREATE TABLE license_car_photos( 
	vehicle_license_id SERIAL PRIMARY KEY,
	file_size BIGINT UNSIGNED,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	user_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (vehicle_license_id) REFERENCES vehicle_licenses(vehicle_license_id) ON DELETE CASCADE ON UPDATE CASCADE, -- удаляется вместе с лицензией
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE;
);

-- Driver's license.
-- To simplify data entry, several of the columns can be omitted, although in reality all data must be entered. 
DROP TABLE IF EXISTS driving_licenses;
CREATE TABLE driving_licenses( 
	driving_license_id SERIAL PRIMARY KEY,
	full_name VARCHAR(200) NOT NULL,
	gender ENUM('F', 'M') NOT NULL,
	nationality VARCHAR(200),
	address VARCHAR(255),
	birthday DATE NOT NULL,
	date_of_first_issue DATE NOT NULL, -- time of getting first driver's license
	license_class_id INT UNSIGNED NOT NULL,
	from_valid_period DATE NOT NULL,
	to_valid_period DATE NOT NULL, -- driving license is valid for 6 years.
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	user_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (license_class_id) REFERENCES license_classes(license_class_id) ON DELETE RESTRICT ON UPDATE CASCADE
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE;
); 


-- Photos of the vehicle rear view. Reinforced at the time of registration in the application. A kind of confirmation of the presence and compliance of the vehicle indicated in the documents
DROP TABLE IF EXISTS car_tail_photos;
CREATE TABLE car_tail_photos( 
	photo_id SERIAL PRIMARY KEY,
	file_size BIGINT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	user_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE
);

/*
 * Driver table.
  * Any user of the application can become a driver if he has documents that meet the conditions.
  * The driver has the right to provide his services only within the boundaries of the province of his license plate.
 */
DROP TABLE IF EXISTS drivers;
CREATE TABLE drivers( 
	user_id SERIAL PRIMARY KEY,
	order_type_id BIGINT UNSIGNED NOT NULL, -- trip type
	is_vehicle_owner BOOLEAN DEFAULT FALSE, -- own car or not
	city_id INT UNSIGNED NOT NULL, -- selection of the city where the driver provides services
	vehicle_license_id BIGINT UNSIGNED, -- several drivers can use one vehicle
	car_tail_photo_id BIGINT UNSIGNED UNIQUE, -- you can not attach the same photo to different drivers
	driving_license_id BIGINT UNSIGNED NOT NULL UNIQUE, -- you cannot attach the same license to different drivers
	car_color_id INT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	is_valid BOOLEAN DEFAULT FALSE, -- driver validation confirmation
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE,
	FOREIGN KEY (order_type_id) REFERENCES order_types(order_type_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (city_id) REFERENCES city_codes(city_code) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (vehicle_license_id) REFERENCES vehicle_licenses(vehicle_license_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (car_tail_photo_id) REFERENCES car_tail_photos(photo_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (driving_license_id) REFERENCES driving_licenses(driving_license_id) ON UPDATE CASCADE,
	FOREIGN KEY (car_color_id) REFERENCES car_colors(color_id) ON UPDATE CASCADE
);


/*
 * Online wallet. Required for driver users only. He receives money from completed orders.
 */
DROP TABLE IF EXISTS wallets;
CREATE TABLE wallets( 
	wallet_id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
	wallet_balance DECIMAL(11,2) DEFAULT 0,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Order status.
DROP TABLE IF EXISTS order_status;
CREATE TABLE order_status(
	id INT  UNSIGNED NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE
);

/*
 * Table of orders.
 * To call a taxi, the user needs to enter the locations of the starting and ending stops. Then choose the type of trip. After the order is confirmed from the driver.
*/
DROP TABLE IF EXISTS orders;
CREATE TABLE orders( 
	order_id SERIAL PRIMARY KEY,
	order_type_id BIGINT UNSIGNED NOT NULL,
	user_id_1 BIGINT UNSIGNED NOT NULL,
	driver_id BIGINT UNSIGNED NOT NULL,
	from_address VARCHAR(150) NOT NULL,
	to_address VARCHAR(150) NOT NULL,
	price DECIMAL(7,2) DEFAULT NULL,
	order_status INT UNSIGNED NOT NULL, -- passenger delivery confirmation
	delivered_at DATETIME DEFAULT NULL, -- time of completion of the trip
	distance INT,
	payment_status BOOLEAN DEFAULT FALSE, -- payment status, if the previous order has not been paid, the user cannot order a taxi 
	basic_points INT UNSIGNED DEFAULT NULL,
	consumer_points INT UNSIGNED DEFAULT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- users have the possibility of changing the destination
	FOREIGN KEY (order_type_id) REFERENCES order_types(order_type_id) ON UPDATE CASCADE,
	FOREIGN KEY (user_id_1) REFERENCES users(id) ON UPDATE CASCADE,
	FOREIGN KEY (driver_id) REFERENCES drivers(user_id) ON UPDATE CASCADE,
	FOREIGN KEY (order_status) REFERENCES order_status(id) ON UPDATE CASCADE 
); 

CREATE INDEX inx_user_driver ON orders(user_id_1, driver_id);
CREATE INDEX inx_order_price ON orders(price);
ALTER TABLE orders ADD CONSTRAINT ck_address_diff CHECK (from_address != to_address);

ALTER TABLE orders ADD INDEX (price);

/*
 * Table of the id of surveillance cameras installed in the vehicle.
 * According to the terms of the application, all drivers are required to install cameras in the cabin for the passenger's safety.
 */
DROP TABLE IF EXISTS cameras;
CREATE TABLE cameras( 
	camera_id SERIAL PRIMARY KEY,
	driver_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (driver_id) REFERENCES drivers(user_id) ON UPDATE CASCADE
);

/*
 * Table of order records files from surveillance cameras
 */
DROP TABLE IF EXISTS camera_records;
CREATE TABLE camera_records( 
	record_id SERIAL PRIMARY KEY,
	camera_id BIGINT UNSIGNED NOT NULL,
	order_id BIGINT UNSIGNED NOT NULL,
	file_size BIGINT UNSIGNED,
	file_duration TIME NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (order_id) REFERENCES orders(order_id) ON UPDATE CASCADE,
	FOREIGN KEY (camera_id) REFERENCES cameras(camera_id) ON UPDATE CASCADE
);