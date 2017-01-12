TẠO DATABASE shoplaptop
CREATE DATABASE `shoplaptop` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertcpu` (IN `cpu_name` VARCHAR(50) CHARSET utf8)  begin 
INSERT INTO cpu(cpu_name) VALUES (cpu_name);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTimage` (IN `image_alt` VARCHAR(100) CHARSET utf8, IN `image_image` VARCHAR(50) CHARSET utf8, IN `product_id` BIGINT(20))  begin 
INSERT INTO image(image_alt,image_image, product_id) VALUES (image_alt,image_image,product_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertos` (IN `os_name` VARCHAR(50) CHARSET utf8)  begin 
INSERT INTO os(os_name) VALUES (os_name);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertproducer` (IN `producer_name` VARCHAR(50) CHARSET utf8, IN `producer_image_brand` VARCHAR(50) CHARSET utf8, IN `producer_link` VARCHAR(100) CHARSET utf8)  begin 
INSERT INTO producer(producer_name, producer_image_brand, producer_link) VALUES (producer_name, producer_image_brand, producer_link);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertproduct` (IN `product_name` VARCHAR(50) CHARSET utf8, IN `product_image` VARCHAR(50) CHARSET utf8, IN `product_color` VARCHAR(50) CHARSET utf8, IN `product_content` LONGTEXT CHARSET utf8, IN `product_cpudetail` VARCHAR(200) CHARSET utf8, IN `product_ramdetail` VARCHAR(200) CHARSET utf8, IN `product_storagedetail` VARCHAR(300) CHARSET utf8, IN `product_screen` VARCHAR(10) CHARSET utf8, IN `product_screendetail` VARCHAR(300) CHARSET utf8, IN `product_vga` VARCHAR(300) CHARSET utf8, IN `product_sound` VARCHAR(300) CHARSET utf8, IN `product_dvd` VARCHAR(100) CHARSET utf8, IN `product_connect` VARCHAR(300) CHARSET utf8, IN `product_lan` VARCHAR(200) CHARSET utf8, IN `product_wifi` VARCHAR(100) CHARSET utf8, IN `product_wireless` VARCHAR(300) CHARSET utf8, IN `product_cardreader` VARCHAR(100) CHARSET utf8, IN `product_webcam` VARCHAR(100) CHARSET utf8, IN `product_pin` VARCHAR(50) CHARSET utf8, IN `product_os` VARCHAR(50) CHARSET utf8, IN `product_size` VARCHAR(300) CHARSET utf8, IN `product_weight` VARCHAR(50) CHARSET utf8, IN `product_material` VARCHAR(50) CHARSET utf8, IN `product_price` DOUBLE, IN `product_sale` INT(11), IN `product_price_real` DOUBLE, IN `product_update` TIMESTAMP, IN `product_inventory` INT(11), IN `product_hide` INT(1), IN `cpu_id` BIGINT(20), IN `ram_id` BIGINT(20), IN `storage_id` BIGINT(20), IN `pricelevel_id` BIGINT(20), IN `screensize_id` BIGINT(20), IN `category_id` BIGINT(20), IN `producer_id` BIGINT(20))  begin 
INSERT INTO product(product_name,product_image,product_color,product_content,product_cpudetail,product_ramdetail,product_storagedetail, product_screen,product_screendetail,product_vga,product_sound,product_dvd,product_connect,product_lan,product_wifi,product_wireless,product_cardreader,product_webcam,product_pin,product_os,product_size,product_weight,product_material,product_price,product_sale,product_price_real,product_update,product_inventory,product_hide,cpu_id,ram_id,storage_id,pricelevel_id,screensize_id,category_id,producer_id) VALUES (product_name,product_image,product_color,product_content,product_cpudetail,product_ramdetail,product_storagedetail, product_screen,product_screendetail,product_vga,product_sound,product_dvd,product_connect,product_lan,product_wifi,product_wireless,product_cardreader,product_webcam,product_pin,product_os,product_size,product_weight,product_material,product_price,product_sale,product_price_real,product_update,product_inventory,product_hide,cpu_id,ram_id,storage_id,pricelevel_id,screensize_id,category_id,producer_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATEimage` (IN `p_image_id` BIGINT(20), IN `p_image_alt` VARCHAR(100), IN `p_image_image` VARCHAR(50), IN `p_product_id` BIGINT(20))  BEGIN 

    UPDATE image
    SET    
           image_alt  = p_image_alt,
           image_image = p_image_image,
           product_id = p_product_id
    WHERE  image_id = p_image_id ; 

END$$

DELIMITER ;
======================TẠO BẢNG NSX===========================
DROP TABLE IF EXISTS `producer`; 
CREATE TABLE `producer` (   
`producer_id` bigint(20) NOT NULL auto_increment,   
`producer_name` varchar(50) NULL,  
 `producer_image_brand` varchar(50)  NULL,    
 `producer_link` varchar(100) NULL,  
 PRIMARY KEY  (`producer_id`)
 ) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 
//Nhập liệu
INSERT INTO `producer` VALUES ('1', 'Asus', 'brand1.png', ' #'); 
INSERT INTO `producer` VALUES ('2', 'Acer', 'brand2.png', '#'); 
INSERT INTO `producer` VALUES ('3', 'Dell', 'brand3.png', '#'); 
INSERT INTO `producer` VALUES ('4', 'MacBook (Apple)', 'brand4.png', '#'); 
INSERT INTO `producer` VALUES ('5', 'Lenovo', 'brand5.png', '#'); 
INSERT INTO `producer` VALUES ('6', 'HP-Compaq', 'brand6.png', '#'); 
INSERT INTO `producer` VALUES ('7', 'MSI', 'brand1.png', '#'); 
INSERT INTO `producer` VALUES ('8', 'Razer', 'brand2.png', '#'); 
INSERT INTO `producer` VALUES ('9', ' Gigabyte', 'brand3.png', '#'); 
INSERT INTO `producer` VALUES ('10', ' Microsoft', 'brand4.png', '#'); 

======================TẠO BẢNG LOẠI SẢN PHẨM===========================
DROP TABLE IF EXISTS `category`; 
CREATE TABLE `category` (   
`category_id` int(11) NOT NULL auto_increment,  
`category_name` varchar(50) collate utf8_unicode_ci default NULL, 
`category_metatitle` varchar(250) NULL,  
`category_metakeywords` varchar(250) NULL,  
`category_metadescription` varchar(250) NULL, 
PRIMARY KEY  (`category_id`)
 )  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 
//Nhập liệu
INSERT INTO `category` VALUES ('1', 'Gaming', 'Gaming', 'Gaming', 'Gaming' ); 
INSERT INTO `category` VALUES ('2', 'NoteBook', 'NoteBook', 'NoteBook', 'NoteBook' ); 
INSERT INTO `category` VALUES ('3', 'UltraBook', 'UltraBook', 'UltraBook', 'UltraBook' ); 
INSERT INTO `category` VALUES ('4', '2 in 1', '2 in 1', '2 in 1', '2 in 1' ); 

====================TẠO BẢNG LOẠI CPU===========================
DROP TABLE IF EXISTS `cpu`; 
CREATE TABLE `cpu` (   
`cpu_id` bigint(20) NOT NULL auto_increment,   
`cpu_name` varchar(50) NULL,  
PRIMARY KEY  (`cpu_id`)
 ) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 
//NHAP LIEU
INSERT INTO `cpu` VALUES ('1', 'Core I3'); 
INSERT INTO `cpu` VALUES ('2', 'Core I5'); 
INSERT INTO `cpu` VALUES ('3', 'Core I7'); 
INSERT INTO `cpu` VALUES ('4', 'Pentium'); 
INSERT INTO `cpu` VALUES ('5', 'Celeron'); 
INSERT INTO `cpu` VALUES ('6', 'Core M'); 

====================TẠO BẢNG RAM===========================
DROP TABLE IF EXISTS `ram`; 
CREATE TABLE `ram` (   
`ram_id` bigint(20) NOT NULL auto_increment,   
`ram_name` varchar(50) NULL,  
PRIMARY KEY  (`ram_id`)
 ) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 
//nhap lieu
INSERT INTO `ram` VALUES ('1', '2 GB'); 
INSERT INTO `ram` VALUES ('2', '4 GB'); 
INSERT INTO `ram` VALUES ('3', '8 GB'); 
INSERT INTO `ram` VALUES ('4', '16 GB'); 
INSERT INTO `ram` VALUES ('5', '32 GB'); 

==================TẠO BẢNG DUNG LƯỢNG Ổ CỨNG=========================
DROP TABLE IF EXISTS `storage`; 
CREATE TABLE `storage` (   
`storage_id` bigint(20) NOT NULL auto_increment,   
`storage_name` varchar(50) NULL,  
PRIMARY KEY  (`storage_id`)
 ) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 
//NHAP LIEU
INSERT INTO `storage` VALUES ('1', '128 GB'); 
INSERT INTO `storage` VALUES ('2', '256 GB'); 
INSERT INTO `storage` VALUES ('3', '500 GB'); 
INSERT INTO `storage` VALUES ('4', '512 GB'); 
INSERT INTO `storage` VALUES ('5', '1 TB'); 
INSERT INTO `storage` VALUES ('6', '2 TB'); 

====================TẠO BẢNG KHOẢNG GIÁ===========================
DROP TABLE IF EXISTS `pricelevel`; 
CREATE TABLE `pricelevel` (   
`pricelevel_id` bigint(20) NOT NULL auto_increment,   
`pricelevel_name` varchar(100) NULL,  
PRIMARY KEY  (`pricelevel_id`)
 ) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 
//Nhap lieu
INSERT INTO `pricelevel` VALUES ('1', 'Dưới 5 triệu'); 
INSERT INTO `pricelevel` VALUES ('2', 'Từ 5 - 10 triệu'); 
INSERT INTO `pricelevel` VALUES ('3', 'Từ 10 - 15 triệu'); 
INSERT INTO `pricelevel` VALUES ('4', 'Từ 15 - 20 triệu'); 
INSERT INTO `pricelevel` VALUES ('5', 'Từ 20 - 25 triệu'); 
INSERT INTO `pricelevel` VALUES ('6', 'Từ 25 - 30 triệu'); 
INSERT INTO `pricelevel` VALUES ('7', 'Trên 30 triệu'); 

================TẠO BẢNG KÍCH THƯỚC MÀN HÌNH=======================
DROP TABLE IF EXISTS `screensize`; 
CREATE TABLE `screensize` (   
`screensize_id` bigint(20) NOT NULL auto_increment,   
`screensize_name` varchar(50) NULL,  
PRIMARY KEY  (`screensize_id`)
 ) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 
//Nhap lieu
INSERT INTO `screensize` VALUES ('1', 'Khoảng 11 inch'); 
INSERT INTO `screensize` VALUES ('2', 'Khoảng 12 inch'); 
INSERT INTO `screensize` VALUES ('3', 'Khoảng 13 inch'); 
INSERT INTO `screensize` VALUES ('4', 'Khoảng 14 inch'); 
INSERT INTO `screensize` VALUES ('5', 'Trên 15 inch'); 

====================TẠO BẢNG HÌNH SẢN PHẨM===========================
DROP TABLE IF EXISTS `image`; 
CREATE TABLE `image` (   
`image_id` bigint(20) NOT NULL auto_increment,   
`image_alt` varchar(100) default NULL,  
 `image_image` varchar(50)  default NULL,    
 `product_id` bigint(20) default NULL, 
 PRIMARY KEY  (`image_id`)
 ) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 
//Nhập liệu
INSERT INTO `image` VALUES ('1', 'Laptop 1', 'lenovo-ideapad-100.png', '1'); 
INSERT INTO `image` VALUES ('2', 'Laptop 2', 'lenovo-ideapad-100.png', '1');
INSERT INTO `image` VALUES ('3', 'Laptop 1', 'lenovo-ideapad-100.png', '2'); 
INSERT INTO `image` VALUES ('4', 'Laptop 2', 'lenovo-ideapad-100.png', '2'); 
INSERT INTO `image` VALUES ('5', 'Laptop 1', 'lenovo-ideapad-100.png', '3'); 
INSERT INTO `image` VALUES ('6', 'Laptop 2', 'lenovo-ideapad-100.png', '3'); 
INSERT INTO `image` VALUES ('7', 'Laptop 1', 'lenovo-ideapad-100.png', '4'); 
INSERT INTO `image` VALUES ('8', 'Laptop 2', 'lenovo-ideapad-100.png', '4'); 
INSERT INTO `image` VALUES ('9', 'Laptop 1', 'lenovo-ideapad-100.png', '5'); 
INSERT INTO `image` VALUES ('10', 'Laptop 2', 'lenovo-ideapad-100.png', '5'); 
INSERT INTO `image` VALUES ('11', 'Laptop 1', 'lenovo-ideapad-100.png', '6'); 
INSERT INTO `image` VALUES ('12', 'Laptop 2', 'lenovo-ideapad-100.png', '6'); 
INSERT INTO `image` VALUES ('13', 'Laptop 1', 'lenovo-ideapad-100.png', '7'); 
INSERT INTO `image` VALUES ('14', 'Laptop 2', 'lenovo-ideapad-100.png', '7'); 
INSERT INTO `image` VALUES ('15', 'Laptop 1', 'lenovo-ideapad-100.png', '8'); 
INSERT INTO `image` VALUES ('16', 'Laptop 2', 'lenovo-ideapad-100.png', '8'); 
INSERT INTO `image` VALUES ('17', 'Laptop 1', 'lenovo-ideapad-100.png', '9'); 
INSERT INTO `image` VALUES ('18', 'Laptop 2', 'lenovo-ideapad-100.png', '9'); 
INSERT INTO `image` VALUES ('19', 'Laptop 1', 'lenovo-ideapad-100.png', '10'); 
INSERT INTO `image` VALUES ('20', 'Laptop 2', 'lenovo-ideapad-100.png', '10'); 

======================TẠO BẢNG SẢN PHẨM ===========================
-- Tạo Table product
DROP TABLE IF EXISTS `product`; 
CREATE TABLE `product` (   
`product_id` bigint(20) NOT NULL auto_increment,   
`product_name` varchar(50) NULL,  
`product_image` varchar(50)  NULL,   
`product_color` varchar(50)  NULL,   
`product_content` longtext NULL, 
`product_metatitle` varchar(250) NULL,  
`product_metakeywords` varchar(250) NULL,  
`product_metadescription` varchar(250) NULL, 
`product_cpudetail` varchar(200)  NULL,   
`product_ramdetail` varchar(200)  NULL,   
`product_storagedetail` varchar(300)  NULL,   
`product_screen` varchar(10)  NULL, 
`product_screendetail` varchar(300)  NULL,   
`product_vga` varchar(300) NULL,   
`product_sound` varchar(300)  NULL,   
`product_dvd` varchar(100) collate utf8_unicode_ci default 'Không',   
`product_connect` varchar(300)  NULL,   
`product_lan` varchar(200)  NULL,   
`product_wifi` varchar(100)  NULL,   
`product_wireless` varchar(300)  NULL,   
`product_cardreader` varchar(100)  NULL,   
`product_webcam` varchar(100)  default 'VGA',   
`product_pin` varchar(50)  NULL,   
`product_os` varchar(50)  NULL,   
`product_size` varchar(300)  NULL,   
`product_weight` varchar(50)  NULL,   
`product_material` varchar(50)  NULL,   
`product_price` double default NULL,  
`product_sale` int default 0,  
`product_price_real` double default NULL,  
`product_update` timestamp NULL default NULL on update CURRENT_TIMESTAMP,  
`product_buys` int default 0,  
`product_inventory` int default NULL,  
`product_hide` int(1) default 0,  
`cpu_id` bigint(20) default NULL,   
`ram_id` bigint(20) default NULL,   
`storage_id` bigint(20) default NULL,   
`pricelevel_id` bigint(20) default NULL,   
`screensize_id` bigint(20) default NULL,   
`category_id` bigint(20) default NULL, 
`producer_id` bigint(20) default NULL,  
 PRIMARY KEY  (`product_id`)
 ) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 
-- Nhập liệu  cho table product 
INSERT INTO `product` VALUES ('1', 'Asus X555UJ', 'lenovo-ideapad-100.png', 'Đen', 'Laptop Asus X555UJ', 'Title', 'Keywords', 'Description', 'Skylake, 6500U, 2.50 GHz', 'DDR4(1Khe), Tốc độ Bus 2133 MHz', 'HDD', '15,6', 'HD (1366 x 768 pixels) Công nghệ MH ASUS Splendid Video, LED Backlight', 'NVIDIA® GeForce® 920MX (2 GB)', 'Kênh 2.0, Combo Microphone & Headphone', 'DVD Super Multi Double Layer', '2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)', '10/100/1000 Mbps Ethernet LAN', '802.11b/g/n', 'Không', 'SD', '0.3 MP', '2 cell Li - Polymer', 'Windows 10', 'Dài 382 mm - Ngang 256 mm - Dày 25.8 mm', '2.3 Kg', 'Vỏ nhựa', '13390000', '10', '12051000', '2016-12-15 13:55:50', '10', '100', '0', '2', '2', '3', '3', '5', '3', '1'); 


INSERT INTO `product` VALUES ('2', 'Asus A541UV', 'lenovo-ideapad-100.png', 'Đen', 'Laptop Asus A541UV', 'Title', 'Keywords', 'Description', 'Skylake, 6200U, 2.30 GHz', 'DDR3L(On board+1Khe), Tốc độ Bus 1600 MHz', 'HDD', '14', 'HD (1366 x 768 pixels) Công nghệ MH ASUS Splendid Video, LED Backlight', 'NVIDIA® GeForce® 920M (2 GB)', 'Kênh 2.0, Combo Microphone & Headphone', 'DVD Super Multi Double Layer', '2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)', '10/100/1000 Mbps Ethernet LAN', '802.11b/g/n', 'Bluetooth v4.0', 'SD', '0.3 MP', '3 cell Li - Polymer', 'Windows 10', 'Dài 382 mm - Ngang 256 mm - Dày 25.8 mm', '2.3 Kg', 'Vỏ nhựa', '16290000', '0', '16290000', '2016-12-15 20:55:50', '50', '300', '0', '3', '2', '3', '4', '5', '3', '1'); 


INSERT INTO `product` VALUES ('3', ' Asus E402SA', 'lenovo-ideapad-100.png', 'Đen', 'Laptop Asus E402SA', 'Title', 'Keywords', 'Description', 'N3050, 1.60 GHz', 'DDR3(On board), Tốc độ Bus 1600 MHz', 'HDD', '14', 'HD (1366 x 768 pixels) Công nghệ MH ASUS Splendid Video, LED Backlight', 'Integrated Graphics (Dùng chung bộ nhớ Ram)', 'Kênh 2.0, Combo Microphone & Headphone', 'DVD Super Multi Double Layer', '2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)', '10/100/1000 Mbps Ethernet LAN', '802.11b/g/n', 'Không', 'Không', '0.3 MP', '2 cell Li - Polymer', 'Windows 10', 'Dài 382 mm - Ngang 256 mm - Dày 25.8 mm', '2.3 Kg', 'Vỏ nhựa', '6290000', '0', '6290000', '2016-12-15 13:55:50', '10', '100', '0', '5', '2', '3', '2', '5', '3', '1'); 


INSERT INTO `product` VALUES ('4', 'Sản phẩm 4', 'lenovo-ideapad-100.png', 'Đen', 'Sản phẩm 4', 'Title', 'Keywords', 'Description', 'Skylake, 6200U, 2.30 GHz', 'DDR3L(On board+1Khe), Tốc độ Bus 1600 MHz', 'HDD', '14', 'HD (1366 x 768 pixels) Công nghệ MH ASUS Splendid Video, LED Backlight', 'NVIDIA® GeForce® 920M (2 GB)', 'Kênh 2.0, Combo Microphone & Headphone', 'DVD Super Multi Double Layer', '2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)', '10/100/1000 Mbps Ethernet LAN', '802.11b/g/n', 'Không', 'SD', '0.3 MP', '2 cell Li - Polymer', 'Windows 10', 'Dài 382 mm - Ngang 256 mm - Dày 25.8 mm', '2.3 Kg', 'Vỏ nhựa', '1339000', '10', '1205100', '2016-12-15 13:55:50', '10', '100', '0', '2', '2', '3', '3', '5', '3', '1'); 


INSERT INTO `product` VALUES ('5', 'Sản phẩm 5', 'lenovo-ideapad-100.png', 'Đen', 'Sản phẩm 4', 'Title', 'Keywords', 'Description', 'Skylake, 6200U, 2.30 GHz', 'DDR3L(On board+1Khe), Tốc độ Bus 1600 MHz', 'HDD', '14', 'HD (1366 x 768 pixels) Công nghệ MH ASUS Splendid Video, LED Backlight', 'NVIDIA® GeForce® 920M (2 GB)', 'Kênh 2.0, Combo Microphone & Headphone', 'DVD Super Multi Double Layer', '2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)', '10/100/1000 Mbps Ethernet LAN', '802.11b/g/n', 'Không', 'SD', '0.3 MP', '2 cell Li - Polymer', 'Windows 10', 'Dài 382 mm - Ngang 256 mm - Dày 25.8 mm', '2.3 Kg', 'Vỏ nhựa', '133900', '10', '120510', '2016-12-15 13:55:50', '10', '100', '0', '2', '2', '3', '3', '5', '3', '1'); 


INSERT INTO `product` VALUES ('6', 'Sản phẩm 6', 'lenovo-ideapad-100.png', 'Đen', 'Sản phẩm 6', 'Title', 'Keywords', 'Description', 'Skylake, 6200U, 2.30 GHz', 'DDR3L(On board+1Khe), Tốc độ Bus 1600 MHz', 'HDD', '14', 'HD (1366 x 768 pixels) Công nghệ MH ASUS Splendid Video, LED Backlight', 'NVIDIA® GeForce® 920M (2 GB)', 'Kênh 2.0, Combo Microphone & Headphone', 'DVD Super Multi Double Layer', '2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)', '10/100/1000 Mbps Ethernet LAN', '802.11b/g/n', 'Không', 'SD', '0.3 MP', '2 cell Li - Polymer', 'Windows 10', 'Dài 382 mm - Ngang 256 mm - Dày 25.8 mm', '2.3 Kg', 'Vỏ nhựa', '1330000', '0', '1330000', '2016-12-15 13:55:50', '10', '100', '0', '2', '2', '3', '3', '5', '3', '1'); 


INSERT INTO `product` VALUES ('7', 'Sản phẩm 7', 'lenovo-ideapad-100.png', 'Đen', 'Sản phẩm 7', 'Title', 'Keywords', 'Description', 'Skylake, 6200U, 2.30 GHz', 'DDR3L(On board+1Khe), Tốc độ Bus 1600 MHz', 'HDD', '14', 'HD (1366 x 768 pixels) Công nghệ MH ASUS Splendid Video, LED Backlight', 'NVIDIA® GeForce® 920M (2 GB)', 'Kênh 2.0, Combo Microphone & Headphone', 'DVD Super Multi Double Layer', '2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)', '10/100/1000 Mbps Ethernet LAN', '802.11b/g/n', 'Không', 'SD', '0.3 MP', '2 cell Li - Polymer', 'Windows 10', 'Dài 382 mm - Ngang 256 mm - Dày 25.8 mm', '2.3 Kg', 'Vỏ nhựa', '133900000', '10', '120510000', '2016-12-15 13:55:50', '10', '100', '0', '2', '2', '3', '3', '5', '3', '1'); 


INSERT INTO `product` VALUES ('8', 'Sản phẩm 8', 'lenovo-ideapad-100.png', 'Đen', 'Sản phẩm 8', 'Title', 'Keywords', 'Description', 'Skylake, 6200U, 2.30 GHz', 'DDR3L(On board+1Khe), Tốc độ Bus 1600 MHz', 'HDD', '14', 'HD (1366 x 768 pixels) Công nghệ MH ASUS Splendid Video, LED Backlight', 'NVIDIA® GeForce® 920M (2 GB)', 'Kênh 2.0, Combo Microphone & Headphone', 'DVD Super Multi Double Layer', '2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)', '10/100/1000 Mbps Ethernet LAN', '802.11b/g/n', 'Không', 'SD', '0.3 MP', '2 cell Li - Polymer', 'Windows 10', 'Dài 382 mm - Ngang 256 mm - Dày 25.8 mm', '2.3 Kg', 'Vỏ nhựa', '13390000', '10', '12051000', '2016-12-15 13:55:50', '10', '100', '0', '2', '2', '3', '3', '5', '3', '1'); 


INSERT INTO `product` VALUES ('9', 'Sản phẩm 9', 'lenovo-ideapad-100.png', 'Đen', 'Sản phẩm 9', 'Title', 'Keywords', 'Description', 'Skylake, 6200U, 2.30 GHz', 'DDR3L(On board+1Khe), Tốc độ Bus 1600 MHz', 'HDD', '14', 'HD (1366 x 768 pixels) Công nghệ MH ASUS Splendid Video, LED Backlight', 'NVIDIA® GeForce® 920M (2 GB)', 'Kênh 2.0, Combo Microphone & Headphone', 'DVD Super Multi Double Layer', '2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)', '10/100/1000 Mbps Ethernet LAN', '802.11b/g/n', 'Không', 'SD', '0.3 MP', '2 cell Li - Polymer', 'Windows 10', 'Dài 382 mm - Ngang 256 mm - Dày 25.8 mm', '2.3 Kg', 'Vỏ nhựa', '13390000', '10', '12051000', '2016-12-15 13:55:50', '10', '100', '0', '2', '2', '3', '3', '5', '3', '1'); 


INSERT INTO `product` VALUES ('10', 'Sản phẩm 10', 'lenovo-ideapad-100.png', 'Đen', 'Sản phẩm 10', 'Title', 'Keywords', 'Description', 'Skylake, 6200U, 2.30 GHz', 'DDR3L(On board+1Khe), Tốc độ Bus 1600 MHz', 'HDD', '14', 'HD (1366 x 768 pixels) Công nghệ MH ASUS Splendid Video, LED Backlight', 'NVIDIA® GeForce® 920M (2 GB)', 'Kênh 2.0, Combo Microphone & Headphone', 'DVD Super Multi Double Layer', '2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)', '10/100/1000 Mbps Ethernet LAN', '802.11b/g/n', 'Không', 'SD', '0.3 MP', '2 cell Li - Polymer', 'Windows 10', 'Dài 382 mm - Ngang 256 mm - Dày 25.8 mm', '2.3 Kg', 'Vỏ nhựa', '133910000', '10', '120511000', '2016-12-15 13:55:50', '10', '100', '0', '2', '2', '3', '3', '5', '3', '1'); 


======================TẠO BẢNG NGƯỜI DÙNG ===========================
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
`user_id` bigint(20) NOT NULL auto_increment,
`user_fullname` varchar(50) collate utf8_unicode_ci NOT NULL,
`user_address` longtext collate utf8_unicode_ci,
`user_phone` bigint(20) default NULL,
`user_email` varchar(50) NOT NULL,
`user_pass` varchar(50) NOT NULL,
PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

//Nhập liệu cho Table Users
INSERT INTO `users` VALUES ('1481990800540','Quốc Toàn','D3, P.24, Q.Bình Thạnh','01234567899', 'demo@gmail.com',
'3e8f51ec1e337d5317a3578de559665a');

======================TẠO BẢNG HÓA ĐƠN===========================
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
`bill_id` bigint(20) NOT NULL,
`bill_name` varchar(50) collate utf8_unicode_ci NOT NULL,
`bill_phone` bigint(20) default NULL,
`bill_address` longtext collate utf8_unicode_ci,
`bill_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
`bill_payment` varchar(255) collate utf8_unicode_ci default NULL,
`bill_paid` int(1) default 0,
`bill_finish` int(1) default 0,
`bill_total` int default 0,
`user_id` bigint(20) default NULL,
PRIMARY KEY (`bill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

//Nhập liệu
INSERT INTO `bill` VALUES ('1463295350519', 'Quốc Toàn', '0987654321', 'D3, P.25, Q.Bình Thạnh, TP.HCM', '2016-12-15 13:55:50', 'Live', '0', '0','100', '1481990800540');

====================TẠO BẢNG CHI TIẾT HÓA ĐƠN=========================
DROP TABLE IF EXISTS `bill_detail`;
CREATE TABLE `bill_detail` (
`bill_detail_id` bigint(20) NOT NULL auto_increment,
`product_id` bigint(20) default NULL,
`quantity` int(11) default NULL,
`price` double default NULL,
`bill_id` bigint(20) default NULL,
PRIMARY KEY (`bill_detail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

//NHập liệu
INSERT INTO `bill_detail` VALUES ('1', '1', '1', '1000000', '1463295350519');
INSERT INTO `bill_detail` VALUES ('2', '3', '2', '3000000', '1463295350519');
INSERT INTO `bill_detail` VALUES ('3', '5', '4', '4000000', '1463295350519');

======================TẠO BẢNG GÓP Ý ===========================
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
`feedback_id` bigint(20) NOT NULL auto_increment,
`feedback_name` varchar(50) collate utf8_unicode_ci NOT NULL,
`feedback_email` varchar(50) NOT NULL,
`feedback_text` longtext collate utf8_unicode_ci,
`feedback_update` timestamp NULL default NULL on update CURRENT_TIMESTAMP,  
`feedback_finish` int(1) default 0,
PRIMARY KEY (`feedback_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

======================TẠO BẢNG ADMIN ===========================
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
`admin_id` bigint(20) NOT NULL auto_increment,
`admin_fullname` varchar(50) collate utf8_unicode_ci NOT NULL,
`admin_avatar` varchar(50)  NULL, 
`admin_email` varchar(50) NOT NULL,
`admin_pass` varchar(50) NOT NULL,
`pq_id` bigint(20) default NULL,
PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
//Nhập liệu pass: demo
INSERT INTO `admin` VALUES ('123', 'Quốc Toàn', 'user2.jpg', 'demo@gmail.com', '3e8f51ec1e337d5317a3578de559665a', '1');

======================TẠO BẢNG PHÂN QUYỀN ===========================
DROP TABLE IF EXISTS `pq`;
CREATE TABLE `pq` (
`pq_id` bigint(20) NOT NULL auto_increment,
`pq_name` varchar(50) collate utf8_unicode_ci NOT NULL,
`pq_content` longtext NULL,
`pq_type` tinyint(1) default 0,
PRIMARY KEY (`pq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

//Nhập
INSERT INTO `pq` VALUES ('1', 'System', 'Admin System', '1');
INSERT INTO `pq` VALUES ('2', 'Content', 'Admin quản lý nội dung', '2');
INSERT INTO `pq` VALUES ('3', 'Bill and Feedback', 'Admin quản lý Bill and Feedback', '3');
INSERT INTO `pq` VALUES ('4', 'View', 'Admin Chỉ xem', '4');