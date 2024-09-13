/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : localhost:3306
 Source Schema         : inventario_activospabs

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 13/05/2024 13:08:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria`  (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `categoria_ubicacion` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`categoria_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_spanish2_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES (1, 'Computadoras', 'guadalajara');
INSERT INTO `categoria` VALUES (2, 'Impresoras', 'guadalajara');
INSERT INTO `categoria` VALUES (3, 'Celular', 'guadalajara');

-- ----------------------------
-- Table structure for marcas
-- ----------------------------
DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of marcas
-- ----------------------------
INSERT INTO `marcas` VALUES (1, 'Apple', 'computadora');
INSERT INTO `marcas` VALUES (2, 'Dell', 'computadora');
INSERT INTO `marcas` VALUES (3, 'Lenovo', 'computadora');
INSERT INTO `marcas` VALUES (4, 'HP', 'computadora');
INSERT INTO `marcas` VALUES (5, 'Acer', 'computadora');
INSERT INTO `marcas` VALUES (6, 'Samsung', 'computadora');
INSERT INTO `marcas` VALUES (7, 'Microsoft', 'computadora');
INSERT INTO `marcas` VALUES (8, 'Asus', 'computadora');
INSERT INTO `marcas` VALUES (9, 'MSI', 'computadora');
INSERT INTO `marcas` VALUES (10, 'Sony', 'computadora');
INSERT INTO `marcas` VALUES (11, 'Toshiba', 'computadora');
INSERT INTO `marcas` VALUES (12, 'LG', 'computadora');
INSERT INTO `marcas` VALUES (13, 'Xiaomi', 'computadora');
INSERT INTO `marcas` VALUES (14, 'Huawei', 'computadora');
INSERT INTO `marcas` VALUES (15, 'IBM', 'computadora');
INSERT INTO `marcas` VALUES (16, 'Gateway', 'computadora');
INSERT INTO `marcas` VALUES (17, 'Lexmark', 'impresora');
INSERT INTO `marcas` VALUES (18, 'Ricoh', 'impresora');
INSERT INTO `marcas` VALUES (19, 'Konica Minolta', 'impresora');
INSERT INTO `marcas` VALUES (20, 'Sharp', 'impresora');
INSERT INTO `marcas` VALUES (21, 'Panasonic', 'impresora');
INSERT INTO `marcas` VALUES (22, 'Oki', 'impresora');
INSERT INTO `marcas` VALUES (23, 'Kyocera', 'impresora');
INSERT INTO `marcas` VALUES (24, 'Fujitsu', 'impresora');
INSERT INTO `marcas` VALUES (25, 'HP', 'impresora');
INSERT INTO `marcas` VALUES (26, 'Zebra', 'impresora');
INSERT INTO `marcas` VALUES (27, 'Samsung', 'impresora');
INSERT INTO `marcas` VALUES (28, 'BROTHER', 'impresora');
INSERT INTO `marcas` VALUES (29, 'DCP', 'impresora');
INSERT INTO `marcas` VALUES (30, 'Ele-Gate', 'impresora termica');
INSERT INTO `marcas` VALUES (31, 'Bisofice', 'impresora termica');
INSERT INTO `marcas` VALUES (32, 'GHIA', 'computadora');
INSERT INTO `marcas` VALUES (33, 'Goojprt', 'impresora termica');
INSERT INTO `marcas` VALUES (34, 'Otra', '');

-- ----------------------------
-- Table structure for plazas
-- ----------------------------
DROP TABLE IF EXISTS `plazas`;
CREATE TABLE `plazas`  (
  `id_plaza` int NOT NULL AUTO_INCREMENT,
  `nombre_plaza` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT NULL,
  `telefono` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT NULL,
  `ciudad` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT NULL,
  `estado` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`id_plaza`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 58 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plazas
-- ----------------------------
INSERT INTO `plazas` VALUES (1, 'Puerto Vallarta', NULL, NULL, NULL, NULL, 'Jalisco', 1);
INSERT INTO `plazas` VALUES (2, 'Las Varas', NULL, NULL, NULL, NULL, 'Nayarit', 1);
INSERT INTO `plazas` VALUES (3, 'Pino Suarez', NULL, NULL, NULL, NULL, 'Estado MX', 1);
INSERT INTO `plazas` VALUES (4, 'Bucerias', NULL, NULL, NULL, NULL, 'Nayarit', 1);
INSERT INTO `plazas` VALUES (5, 'Chihuahua', NULL, NULL, NULL, 'Chihuahua', 'Chihuahua', 1);
INSERT INTO `plazas` VALUES (6, 'Cd. Juarez', NULL, NULL, NULL, 'Cd. Juarez', 'Chihuahua', 1);
INSERT INTO `plazas` VALUES (7, 'Colima', 'pabs@tecoman.com', '55465420', 'Tecatito 145', 'colima', 'Colima', 1);
INSERT INTO `plazas` VALUES (8, 'Tecoman', 'pabs_mexico58@pabs.com', '554552524', 'telon 1451', 'Tecoman', 'Colima', 1);
INSERT INTO `plazas` VALUES (9, 'Aguascalientes', 'contacto@pabsmexico.com', '449 9155085', 'Av. Adolfo López Mateos Pte. No. 402 y matamoros', 'Aguascalientes', 'Aguascalientes', 1);
INSERT INTO `plazas` VALUES (10, 'CDMX', NULL, NULL, NULL, NULL, 'CDMX', 0);
INSERT INTO `plazas` VALUES (11, 'Reynosa', NULL, NULL, NULL, NULL, 'Tamaulipas', 1);
INSERT INTO `plazas` VALUES (12, 'Xalapa', NULL, NULL, NULL, NULL, 'Veracruz', 1);
INSERT INTO `plazas` VALUES (13, 'Culiacan', NULL, NULL, NULL, NULL, 'Sinaloa', 1);
INSERT INTO `plazas` VALUES (14, 'Matamoros', NULL, NULL, NULL, NULL, 'Tamaulipas', 1);
INSERT INTO `plazas` VALUES (15, 'Cd. Obregon', NULL, NULL, NULL, NULL, 'Sonora', 1);
INSERT INTO `plazas` VALUES (16, 'Corporativo GDL', NULL, NULL, NULL, NULL, 'Jalisco', 0);
INSERT INTO `plazas` VALUES (17, 'Tijuana, B.C.', NULL, NULL, NULL, NULL, 'Baja California', 0);
INSERT INTO `plazas` VALUES (18, 'Rosarito, B.C.', NULL, NULL, NULL, NULL, 'Baja California', 0);
INSERT INTO `plazas` VALUES (24, 'Torreón', NULL, NULL, NULL, NULL, 'Coahuila', 0);
INSERT INTO `plazas` VALUES (19, 'Tecate, B.C.', NULL, NULL, NULL, NULL, 'Baja California', 0);
INSERT INTO `plazas` VALUES (20, 'Mexicali, B.C.', NULL, NULL, NULL, NULL, 'Baja California', 0);
INSERT INTO `plazas` VALUES (21, 'Ensenada, B.C', NULL, NULL, NULL, NULL, 'Baja California', 0);
INSERT INTO `plazas` VALUES (22, 'Hermosillo, Son', NULL, NULL, NULL, NULL, 'Sonora', 0);
INSERT INTO `plazas` VALUES (23, 'San Luis Río Colorado', NULL, NULL, NULL, NULL, 'Sonora', 0);
INSERT INTO `plazas` VALUES (25, 'Saltillo', NULL, NULL, NULL, NULL, 'Coahuila', 0);
INSERT INTO `plazas` VALUES (26, 'Monclova', NULL, NULL, NULL, NULL, 'Coahuila', 0);
INSERT INTO `plazas` VALUES (27, 'Monterrey', NULL, NULL, NULL, NULL, 'Nuevo Leon', 0);
INSERT INTO `plazas` VALUES (28, 'Nuevo Laredo', NULL, NULL, NULL, NULL, 'Tamaulipas', 0);
INSERT INTO `plazas` VALUES (29, 'Mazatlán', NULL, NULL, NULL, NULL, 'Sinaloa', 0);
INSERT INTO `plazas` VALUES (30, 'Escuinapa', NULL, NULL, NULL, NULL, 'Sinaloa', 0);
INSERT INTO `plazas` VALUES (31, 'La Cruz Elota', NULL, NULL, NULL, NULL, 'Sinaloa', 0);
INSERT INTO `plazas` VALUES (32, 'Durango', NULL, NULL, NULL, NULL, 'Durango', 0);
INSERT INTO `plazas` VALUES (33, 'San Luis Potosí', NULL, NULL, NULL, NULL, 'San Luis Potosí', 0);
INSERT INTO `plazas` VALUES (34, 'Tepic', NULL, NULL, NULL, NULL, 'Nayarit', 0);
INSERT INTO `plazas` VALUES (35, 'Compostela', NULL, NULL, NULL, NULL, 'Nayarit', 0);
INSERT INTO `plazas` VALUES (36, 'Villa Hidalgo', NULL, NULL, NULL, NULL, 'Nayarit', 0);
INSERT INTO `plazas` VALUES (37, 'Guadalajara', NULL, NULL, NULL, NULL, 'Jalisco', 0);
INSERT INTO `plazas` VALUES (38, 'Las Palmas', NULL, NULL, NULL, NULL, 'Jalisco', 0);
INSERT INTO `plazas` VALUES (39, 'Ciudad Guzman', NULL, NULL, NULL, NULL, 'Jalisco', 0);
INSERT INTO `plazas` VALUES (40, 'Manzanillo', NULL, NULL, NULL, NULL, 'Colima', 0);
INSERT INTO `plazas` VALUES (41, 'Querétaro', NULL, NULL, NULL, NULL, 'Querétaro', 0);
INSERT INTO `plazas` VALUES (42, 'Morelia', NULL, NULL, NULL, NULL, 'Michoacán', 0);
INSERT INTO `plazas` VALUES (43, 'Celaya', NULL, NULL, NULL, NULL, 'Guanajuato', 0);
INSERT INTO `plazas` VALUES (44, 'Salamanca', NULL, NULL, NULL, NULL, 'Guanajuato', 0);
INSERT INTO `plazas` VALUES (45, 'Irapuato', NULL, NULL, NULL, NULL, 'Guanajuato', 0);
INSERT INTO `plazas` VALUES (46, 'Leon', NULL, NULL, NULL, NULL, 'Guanajuato', 0);
INSERT INTO `plazas` VALUES (47, 'Puebla', NULL, NULL, NULL, NULL, 'Puebla', 0);
INSERT INTO `plazas` VALUES (48, 'Toluca', NULL, NULL, NULL, NULL, 'Edo. de México', 0);
INSERT INTO `plazas` VALUES (49, 'Cuernavaca', NULL, NULL, NULL, NULL, 'Morelos', 0);
INSERT INTO `plazas` VALUES (50, 'Mérida', NULL, NULL, NULL, NULL, 'Yucatán', 0);
INSERT INTO `plazas` VALUES (51, 'Boca del Río, Ver', NULL, NULL, NULL, NULL, 'Veracrúz', 0);
INSERT INTO `plazas` VALUES (52, 'Villahermosa', NULL, NULL, NULL, NULL, 'Tabasco', 0);
INSERT INTO `plazas` VALUES (53, 'Acapulco', NULL, NULL, NULL, NULL, 'Guerrero', 0);
INSERT INTO `plazas` VALUES (54, 'Tuxtla Gutiérrez', NULL, NULL, NULL, NULL, 'Chiapas', 0);
INSERT INTO `plazas` VALUES (55, 'Cancún', NULL, NULL, NULL, NULL, 'Quintana Roo', 0);
INSERT INTO `plazas` VALUES (56, 'JARDINES DE ORIENTE', NULL, NULL, NULL, NULL, 'Aguascalientes', 0);
INSERT INTO `plazas` VALUES (57, 'Orizaba', NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto`  (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `producto_codigo` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_nombre` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_foto` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `categoria_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `responsable` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT NULL,
  `fecha_inicio` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT NULL,
  `fecha_fin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT '1',
  `marca` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT NULL,
  `plaza_responsable` int NULL DEFAULT NULL,
  `tipo_equipo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT 'NO',
  `memoria` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT 'NO',
  `ram` int NULL DEFAULT 0,
  `procesador` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT 'NO',
  `tipo_memoria` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT 'NO',
  `archivo_detalle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT 'NO',
  `plaza` int NULL DEFAULT NULL,
  `area_asignada` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NULL DEFAULT NULL,
  PRIMARY KEY (`producto_id`) USING BTREE,
  INDEX `categoria_id`(`categoria_id` ASC) USING BTREE,
  INDEX `usuario_id`(`usuario_id` ASC) USING BTREE,
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_spanish2_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES (21, '8CC20338MV', 'DESKTOP-96ENKDN', '', 1, 3, 'Christian Hernandez', '2024-04-03', NULL, '1', 'HP', 'Etiqueta de activo: 8CC20338MV \r\nNúmero de serie del chasis: 8CC20338MV \r\nTipo de gabinete: Todo en uno', 6, 'escritorio', '1tb', 6, 'AMD Athlon Silver 3050U', 'SSD', './documentos/DESKTOP-96ENKDN_8CC20338MV.pdf', 1, 'Funeraria');
INSERT INTO `producto` VALUES (22, '390260', 'DESKTOP-U9P0EGM', '', 1, 3, 'Christian Hernandez', '2024-04-04', NULL, '1', 'GHIA', 'GHIA DESKTOP DESKTOP', 6, 'escritorio', '256gb', 8, 'Intel Core i3-9100F de 3,60 gigahercios', 'SSD', './documentos/DESKTOP-U9P0EGM_390260.pdf', 1, 'Funeraria');
INSERT INTO `producto` VALUES (23, '5CD8291NY9', 'PORTÁTIL-OAO774JE', '', 1, 3, 'Christian Hernandez', '2024-04-04', NULL, '1', 'HP', 'HP HP Pavilion Laptop 15-cw0xxx \r\nTipo de carcasa: Notebook', 6, 'laptop', '1tb', 6, 'AMD Ryzen 3 2200U de 2,50 gigahercios con Radeon Vega Mobile Gfx', 'HDD', './documentos/PORTÁTIL-OAO774JE_5CD8291NY9.pdf', 1, 'Funeraria');
INSERT INTO `producto` VALUES (24, 'JZ1', 'JZ1-PABS-COBRANZA', '', 1, 3, 'Christian Hernandez', '2024-04-04', NULL, '1', '', 'AmSavS Creations', 6, 'escritorio', '128gb', 4, 'Intel(R) Core(TM)2 Quad CPU Q8400 @ 2.66GHz 2.67 GHz', 'HDD', './documentos/JZ1-PABS-COBRANZA_JZ1.pdf', 1, 'Cobranza');
INSERT INTO `producto` VALUES (25, '04042024', 'PcCobranza', '', 1, 3, 'Christian Hernandez', '2024-04-04', NULL, '1', 'Dell', 'Windows 7 PolnT v1', 6, 'escritorio', '128gb', 4, 'Intel(R) Celeron(R) CPU 430 @1.80GHz 1.79 GHz', 'HDD', './documentos/PcCobranza_04042024.pdf', 1, 'Cobranza');
INSERT INTO `producto` VALUES (26, '32AFF72D-3A72-4B70-ABC5-ACAF9E9AD41A', 'DESKTOP-EA8QHSN', '', 1, 3, 'Christian Hernandez', '2024-04-04', NULL, '1', 'Dell', 'procesador x64', 6, 'escritorio', '128gb', 4, 'Intel(R) Core(TM)2 Duo CPU E8400 @ 3.00GHz 2.99 GHz', 'HDD', './documentos/DESKTOP-EA8QHSN_32AFF72D-3A72-4B70-ABC5-ACAF9E9AD41A.pdf', 1, 'Ventas');
INSERT INTO `producto` VALUES (27, '2UA0240DGF', 'VENTAS01', '', 1, 3, 'Christian Hernandez', '2024-04-04', NULL, '1', '', 'Tipo de gabinete: Escritorio de perfil bajo', 6, 'escritorio', '256gb', 4, 'Intel Core 2 Quad Q9500 de 2,85 gigahercios', 'HDD', './documentos/VENTAS01_2UA0240DGF.pdf', 1, 'Ventas');
INSERT INTO `producto` VALUES (28, ' 8CG9228CD4', 'ESCRITORIO-PMB7R2G ', '', 1, 3, 'Christian Hernandez', '2024-04-04', NULL, '1', 'HP', 'GRUPO DE TRABAJO', 6, 'escritorio', '1tb', 4, 'Intel core3.00 gigahertz Intel Core i5-8500', 'HDD', './documentos/ESCRITORIO-PMB7R2G _ 8CG9228CD4.pdf', 1, 'Cobranza');
INSERT INTO `producto` VALUES (29, '2UA9420W6P', 'DESKTOP-GF02H2Q', '', 1, 3, 'Christian Hernandez', '2024-04-04', NULL, '1', 'HP', 'Mini-Tower', 6, 'escritorio', '256gb', 6, '3.07 gigahertz Intel Core 2 Duo E7600 ', 'HDD', './documentos/DESKTOP-GF02H2Q_2UA9420W6P.pdf', 1, 'Cobranza');
INSERT INTO `producto` VALUES (30, '3NH3DX1', 'DESKTOP-RGO3GF1', '', 1, 3, 'Christian Hernandez', '2024-04-05', NULL, '1', 'Dell', 'Manufactured: 24/04/2013 (first used on 09/07/2013)', 6, 'escritorio', '500gb', 4, 'Intel Core i5-3470', 'HDD', './documentos/DESKTOP-RGO3GF1_3NH3DX1.pdf', 1, 'Ventas');
INSERT INTO `producto` VALUES (31, 'CNDKM176V8', 'LASER JET PRO MFP M521DN', 'LASER_JET_PRO_MFP_M521DN_3.jpg', 2, 3, 'Julio Cesar Nevarez Torres', '2024-04-05', '', '1', 'HP', 'Impresora ', 6, 'Impresora ', 'NO', 0, 'NO', 'NO', 'NO', 1, 'TRAMITES');
INSERT INTO `producto` VALUES (32, 'U64968C9N373806', 'HL-L2395DW', 'HL_L2395DW_96.jpg', 2, 3, 'Julio Cesar Nevarez Torres', '2024-04-05', '', '1', 'BROTHER', 'Impresora', 6, 'Impresora ', 'NO', 0, 'NO', 'NO', 'NO', 1, 'AUX DE SERVICIOS');
INSERT INTO `producto` VALUES (34, 'CNB1Q3Y6M0', 'LASER MFP137FNW', 'LASER_MFP137FNW_37.jpg', 2, 3, 'Julio Cesar Nevarez Torres', '2024-04-05', '', '1', 'Hewlett Packard Enterpris', 'Impresora', 6, 'Impresora ', 'NO', 0, 'NO', 'NO', 'NO', 1, 'GERENCIA');
INSERT INTO `producto` VALUES (35, 'CNB3M8X9NF', 'LASER MFP137FNW', 'LASER_MFP137FNW_81.jpg', 2, 3, 'Julio Cesar Nevarez Torres', '2024-04-05', '', '1', 'Hewlett Packard Enterpris', 'Impresora', 6, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 1, 'CAPTURA');
INSERT INTO `producto` VALUES (36, 'U63976E7N778701', 'DCP-1602', 'DCP_1602_37.jpg', 2, 3, 'Julio Cesar Nevarez Torres', '2024-04-05', '', '1', 'BROTHER', 'Impresora', 6, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 1, 'CAJA');
INSERT INTO `producto` VALUES (37, 'CNB7K361HZ', 'LASER JET PRO MFP M521DN', 'LASER_JET_PRO_MFP_M521DN_26.jpg', 2, 3, 'Julio Cesar Nevarez Torres', '2024-04-05', '', '1', 'Hewlett Packard Enterpris', 'Impresora', 6, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 1, 'TESORERIA');
INSERT INTO `producto` VALUES (38, 'U65118D0N178346', 'DCP-L2551DW', 'DCP_L2551DW_86.jpg', 2, 3, 'Julio Cesar Nevarez Torres', '2024-04-05', '', '1', 'BROTHER', 'Impresora', 6, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 1, 'SERVICIOS');
INSERT INTO `producto` VALUES (39, 'CNB2M56KMZ', 'XPRESS M2875FW', 'XPRESS_M2875FW_59.jpg', 2, 3, 'Julio Cesar Nevarez Torres', '2024-04-05', '', '1', 'Samsung', 'Impresora', 6, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 1, 'FACTURACION');
INSERT INTO `producto` VALUES (40, '76460-640-5536995-23462', 'MI PC PERSONAL', 'MI_PC_PERSONAL_91.jpg', 1, 3, 'Paul ivan gutierrez', '2024-04-09', NULL, '1', 'Toshiba', 'Computadora antigua windows xp', 8, 'escritorio', '128gb', 4, 'AMD A4-3300 APU with Radeon(tm) HD Graphics', 'HDD', './documentos/MI PC PERSONAL_76460-640-5536995-23462.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (41, 'R305763N', 'TOR2 (in WORKGROUP)', '', 1, 3, 'Paul ivan gutierrez', '2024-04-09', NULL, '1', 'Lenovo', 'Computadora ', 8, 'escritorio', '500gb', 4, 'Intel Celeron J3355', 'HDD', './documentos/TOR2 (in WORKGROUP)_R305763N.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (42, 'VNB3441309', 'Hewlett-Packard 11311', 'Hewlett_Packard_11311_11.jpg', 2, 3, 'Paul ivan gutierrez', '2024-04-09', NULL, '1', 'Hewlett Packard Enterpris', 'Impresora', 8, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (43, 'M2040DN/L', 'KYOCERA', 'KYOCERA_2.jpg', 2, 3, 'Paul ivan gutierrez', '2024-04-09', NULL, '1', 'Kyocera', 'Impresora color blanco', 8, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (44, '8CC20338LJ', 'DESKTOP-2TBHU6V', '', 1, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'HP', 'Computadora escritorio', 7, 'escritorio', '1tb', 6, 'AMD Athlon Silver 3050U with Radeon  Graphics', 'HDD', './documentos/DESKTOP-2TBHU6V_8CC20338LJ.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (45, 'ML110G7', 'TOR3', '', 1, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'HP', 'Laptop', 7, 'laptop', '256gb', 8, ' Intel Xeon E31220', 'HDD', './documentos/TOR3_ML110G7.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (46, 'U64197K2N160789', 'DCP-L5650DN', 'DCP_L5650DN_26.png', 2, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'BROTHER', 'Impresora', 7, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (47, 'VNB3J67013', 'HPLaserJetP1102w', 'HPLaserJetP1102w_14.jpg', 2, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'Hewlett Packard Enterpris', 'color negro, impresora LASER', 7, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (48, 'SS271G', 'Xpress M2020', 'Xpress_M2020_2.jpg', 2, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'Samsung', 'IMPRESORA LÁSER', 7, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (50, 'L5650DN', 'DCP', 'DCP_9.jpg', 2, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'BROTHER', 'Impresora', 7, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (51, 'D8PYB42', 'DESKTOP-6O9MA6B', '', 1, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'Dell', 'Computadora de escritorio', 7, 'escritorio', '500gb', 8, ' Intel Core i5-4590', 'SSD', './documentos/DESKTOP-6O9MA6B_D8PYB42.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (52, 'MJ01LMM3', 'DESKTOP-OH4UR9D', '', 1, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'Lenovo', 'Computadora escritorio lenovo', 7, 'escritorio', '256gb', 6, 'Intel Core i3-4130T', 'SSD', './documentos/DESKTOP-OH4UR9D_MJ01LMM3.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (53, 'N5N0CV05W34620D', 'DESKTOP-OMII7OB', '', 1, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'Asus', '(in WORKGROUP)', 7, 'escritorio', '256gb', 8, 'Intel Pentium Gold 7505', 'SSD', './documentos/DESKTOP-OMII7OB_N5N0CV05W34620D.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (55, 'BU2204060286', 'IM.05', 'IM_05_71.jpg', 2, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'Ele-Gate', 'COLOR NEGRA IMPRESORA TERMICA', 7, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (56, 'BU2204060279', 'THERMALPRINTER', 'THERMALPRINTER_57.jpg', 2, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'Ele-Gate', 'COLOR NEGRO IMPRESORA TERMICA', 8, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (57, 'MJ01FMCF', 'OCC2', '', 1, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'Lenovo', 'Computadora', 7, 'escritorio', '256gb', 6, 'Intel Core i3-4130T', 'SSD', './documentos/OCC2_MJ01FMCF.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (58, 'CND9350N00', 'ACER(WORKGROUP)', '', 1, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'HP', ' HP Laptop 15-da0xxx', 7, 'laptop', '256gb', 8, ' Intel Pentium 4417U', 'SSD', './documentos/ACER(WORKGROUP)_CND9350N00.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (59, 'R30575WQ', 'OCC5', '', 1, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'Lenovo', '(in FUNEZARCO)', 7, 'escritorio', '500gb', 4, ' Intel Celeron J3355', 'HDD', './documentos/OCC5_R30575WQ.pdf', 16, 'Funeraria');
INSERT INTO `producto` VALUES (60, 'MJ02TD2W', ' OCC1', '', 1, 3, 'Paul ivan Gutiérrez', '2024-04-10', NULL, '1', 'Lenovo', '(in FUNEZARCO)', 7, 'escritorio', '256gb', 6, 'Intel Core i3-4130T', 'SSD', './documentos/OCC1_MJ02TD2W.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (61, '8CC14857XY', 'DESKTOP-K2IIDL4', '', 1, 3, 'NO', '2024-04-16', NULL, '1', 'HP', '64-bit ready', 2, 'escritorio', '1tb', 0, 'Intel Pentium Silver J5040', 'HDD', './documentos/DESKTOP-K2IIDL4_8CC14857XY.pdf', 16, 'funeraria');
INSERT INTO `producto` VALUES (62, 'B460MH', 'ESCRITORIO-JJ2HJCU', '', 1, 3, 'NO', '2024-04-16', NULL, '1', 'Dell', 'Tipo de gabinete: Escritorio', 2, 'escritorio', '256gb', 4, 'ntel Celeron G5905', 'SSD', './documentos/ESCRITORIO-JJ2HJCU_B460MH.pdf', 16, 'Funeraria');
INSERT INTO `producto` VALUES (63, 'F3W7JB2', 'SBDVARAS', '', 1, 3, 'NO', '2024-04-16', NULL, '1', 'Dell', 'Windows 10 Home Single Language', 2, 'escritorio', '1tb', 4, ' Intel Core i3-4170', 'HDD', './documentos/SBDVARAS_F3W7JB2.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (64, '1F3W2-80018', 'Impresora Todo-en-Uno HP Smart Tank 520', 'Impresora_Todo_en_Uno_HP_Smart_Tank_520_96.jpg', 2, 3, 'NO', '2024-04-16', NULL, '1', 'HP', 'Impresora Multifuncional', 2, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (65, 'POS-8330', 'Thermal Receipt Printer', 'Thermal_Receipt_Printer_12.png', 2, 3, 'NO', '2024-04-16', NULL, '1', 'Bisofice', 'Impresora termica', 2, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'funeraria');
INSERT INTO `producto` VALUES (66, '390857', 'DESKTOP-HAM23PI', '', 1, 3, 'Araceli Villalobos', '2024-04-17', NULL, '1', '', 'Escritorio', 13, 'escritorio', '128gb', 8, 'Intel Pentium Gold G5400', 'HDD', './documentos/DESKTOP-HAM23PI_390857.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (68, 'BU2204061880', 'IM.05', 'IM_05_80.png', 2, 3, 'NO', '2024-04-18', NULL, '1', 'Ele-Gate', 'Impresora termica', 2, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (69, 'VNN3P08441', 'HP LaserJet M236sdw', 'HP_LaserJet_M236sdw_19.jpg', 2, 3, 'Marissa Robles Sosa', '2024-04-23', NULL, '1', 'HP', 'Impresora color blanco con gris', 5, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (70, '00327-31105-93843-AAOEM', 'DESKTOP-IDNSEND', '', 1, 3, 'Marissa Robles Sosa', '2024-04-23', NULL, '1', 'HP', 'All in one PC', 5, 'escritorio', '256gb', 8, 'AMD Athlon Silver 3050U with Radeon Graphics 2.30 GHz', 'HDD', './documentos/DESKTOP-IDNSEND_00327-31105-93843-AAOEM.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (71, '8CC2070F0Z', 'DESKTOP-ASURUG1', '', 1, 3, 'Araceli Villalobos', '2024-04-23', NULL, '1', 'HP', 'All-in-one PC', 13, 'escritorio', '1tb', 6, 'AMD Athlon Silver 3050U with Radeon  Graphics', 'HDD', './documentos/DESKTOP-ASURUG1_8CC2070F0Z.pdf', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (72, '405509', 'DESKTOP-2QBI7HE', '', 1, 3, 'Araceli Villalobos', '2024-04-23', NULL, '1', 'GHIA', 'GHIA DESKTOP DESKTOP', 13, 'escritorio', '256gb', 6, 'AMD Ryzen 3 3200G with Radeon Vega  Graphics', 'SSD', './documentos/DESKTOP-2QBI7HE_405509.pdf', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (73, '424010', 'DESKTOP-6UG7U6E ', '', 1, 3, 'Araceli Villalobos', '2024-04-23', NULL, '1', 'GHIA', 'GHIA DESKTOP DESKTOP', 13, 'escritorio', '256gb', 8, 'Intel Pentium Gold G6400', 'SSD', './documentos/DESKTOP-6UG7U6E _424010.pdf', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (74, '403085', 'DESKTOP-VJRPL0T', '', 1, 3, 'Araceli Villalobos', '2024-04-23', NULL, '1', 'GHIA', 'GHIA DESKTOP DESKTOP', 13, 'escritorio', '256gb', 6, 'AMD Ryzen 3 3200G with Radeon Vega  Graphics', 'SSD', './documentos/DESKTOP-VJRPL0T_403085.pdf', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (75, '8CC84625H7', 'CT3', '', 1, 3, 'Araceli Villalobos', '2024-04-23', NULL, '1', 'HP', 'HP All-in-On', 13, 'escritorio', '1tb', 4, 'AMD A4-9125 RADEON R3, 4 COMPUTE  CORES 2C+2G', 'HDD', './documentos/CT3_8CC84625H7.pdf', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (76, '8CG9485C2M', 'DESKTOP-PIGRV3T', '', 1, 3, 'Araceli Villalobos', '2024-04-23', NULL, '1', 'HP', 'HP Slim Desktop 290-a0xxx', 13, 'escritorio', '1tb', 4, 'Intel Celeron J4005', 'HDD', './documentos/DESKTOP-PIGRV3T_8CG9485C2M.pdf', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (77, '520', 'Smart Tank 520', 'Smart_Tank_520_17.jpg', 2, 3, 'Olivia Rivas', '2024-04-23', NULL, '1', 'HP', 'Impresora color azul con blanco', 4, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (78, '22102600300177', 'Thermal Receipt Printer', 'Thermal_Receipt_Printer_34.jpg', 2, 3, 'Olivia Rivas', '2024-04-23', NULL, '1', 'Bisofice', 'Impresora termica color negro', 4, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (79, 'U63980M2N377902', 'DCP-1617NW', 'DCP_1617NW_82.jpg', 2, 3, 'Araceli Villalobos', '2024-04-23', NULL, '1', 'BROTHER', 'Impresora Color negro', 13, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (80, 'CNB2NC9J67', 'HP Lasser', 'HP_Lasser_47.jpg', 2, 3, 'Araceli Villalobos', '2024-04-23', NULL, '1', 'HP', 'Impresora Color blanco', 13, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (81, 'SNPRC-2201-03', 'Series 520 Tank SmartHP', 'Series_520_Tank_SmartHP_31.jpg', 2, 3, 'Araceli Villalobos', '2024-04-23', NULL, '1', 'HP', 'Impresora', 13, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (82, 'CNB2MD1SBG', 'Impresora multifunción HP Laser 137fnw', 'Impresora_multifunción_HP_Laser_137fnw_71.png', 2, 3, 'Araceli Villalobos', '2024-04-23', NULL, '1', 'HP', 'Impresora COLOR BLANCO', 13, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (83, 'U63980M0N722932', 'DCP-1617NW', 'DCP_1617NW_32.jpg', 2, 3, 'Gabriela Galindo', '2024-05-07', NULL, '1', 'BROTHER', 'Impresora COLOR BLANCO', 15, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (84, 'YOTX20326', 'PT210', 'PT210_73.jpg', 2, 3, 'Fabian Rodriguez Pastrana', '2024-05-07', NULL, '1', 'Goojprt', 'Impresora Negro con naraja', 57, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (85, '210788777600168', 'DESKTOP-RH5UBHL', '', 1, 3, 'Gabriela Galindo', '2024-05-07', NULL, '1', 'GHIA', 'Windows  11  Professional (x64)', 15, 'escritorio', '1tb', 8, 'Intel Core Í3-10100F', 'SSD', './documentos/DESKTOP-RH5UBHL_210788777600168.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (86, '1', 'Blade A52', 'Blade_A52_80.jpg', 3, 3, 'Fabian Rodriguez Pastrana', '2024-05-07', NULL, '1', 'ZTE', 'Compañia telcel', 57, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (87, '22102600300233', 'POS8330', 'POS8330_90.jpg', 2, 3, 'Fabian Rodriguez Pastrana', '2024-05-07', NULL, '1', 'Bisofice', 'Impresora Color negro', 57, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (88, 'MP24W6VJ', 'DESKTOP-05J2FII', '', 1, 3, 'Fabian Rodriguez Pastrana', '2024-05-07', NULL, '1', 'Lenovo', 'Windows  11  Home Single Language (x64)', 57, 'escritorio', '1tb', 8, 'AMD Athlon Silver 3050U', 'HDD', './documentos/DESKTOP-05J2FII_MP24W6VJ.pdf', 16, 'FUNERARIA');
INSERT INTO `producto` VALUES (89, '8CC35117L', 'DESKTOP-1FE3N9E', '', 1, 3, 'Jesus Ortiz Moreno', '2024-05-07', NULL, '1', 'HP', 'Windows  11  Home Single Language (x64)', 57, 'escritorio', '256gb', 8, 'AMD Ryzen 3  7320U', 'SSD', './documentos/DESKTOP-1FE3N9E_8CC35117L.pdf', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (90, '8CC3382T2P', 'DESKTOP-5S5GKAI', '', 1, 3, 'Jesus Ortiz Moreno', '2024-05-07', NULL, '1', 'HP', 'Windows 10 Home Single Language (x64)', 57, 'escritorio', '256gb', 6, 'AMD Ryzen 3 3250U', 'SSD', './documentos/DESKTOP-5S5GKAI_8CC3382T2P.pdf', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (91, '420316', 'DESKTOP-6K8O4J0', '', 1, 3, 'Gabriela Galindo', '2024-05-07', NULL, '1', 'GHIA', 'Windows 10 Professional (x64', 15, 'escritorio', '256gb', 8, ' Intel Core i5-10400', 'SSD', './documentos/DESKTOP-6K8O4J0_420316.pdf', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (92, 'CS02108506', 'DESKTOP-E6L3NHK', '', 1, 3, 'Gabriela Galindo', '2024-05-07', NULL, '1', 'Lenovo', 'Windows  10  Professional (x64)', 15, 'escritorio', '1tb', 4, 'Intel Celeron J1800', 'HDD', './documentos/DESKTOP-E6L3NHK_CS02108506.pdf', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (93, 'H9KWD23', 'DESKTOP-CTPB8UR', '', 1, 3, 'Gabriela Galindo', '2024-05-07', NULL, '1', 'Dell', 'Windows 10 Professional (x64', 15, 'escritorio', '1tb', 4, 'Intel Core i3-9100', 'HDD', './documentos/DESKTOP-CTPB8UR_H9KWD23.pdf', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (94, '5CG102B8XL', 'ORDEP-COMER01', '', 1, 3, 'Gabriela Galindo', '2024-05-07', NULL, '1', 'HP', 'Windows 11 Home Single Language (x64', 15, 'escritorio', '256gb', 8, 'ntel Core i3-10110U', 'SSD', './documentos/ORDEP-COMER01_5CG102B8XL.pdf', 16, 'COBRANZA');
INSERT INTO `producto` VALUES (95, 'S9149200408', 'SP5210SF', 'SP5210SF_49.jpg', 2, 3, 'Gabriela Galindo', '2024-05-07', NULL, '1', 'Otra', 'Impresora', 15, 'NO', 'NO', 0, 'NO', 'NO', 'NO', 16, 'COBRANZA');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `usuario_apellido` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `usuario_usuario` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `usuario_clave` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `usuario_email` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `plaza` int NULL DEFAULT NULL,
  PRIMARY KEY (`usuario_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_spanish2_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (3, 'Alonso', 'Cholico', 'admin', '$2y$10$uXH9aFpErv7xh53g/NWyB.JSQCquGFIZfUlwvrW2kXqUr/7zzXj.q', 'admin@gmail.com', 16);

SET FOREIGN_KEY_CHECKS = 1;
