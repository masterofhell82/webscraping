/*
 Navicat Premium Data Transfer

 Source Server         : LocalMSQ
 Source Server Type    : MySQL
 Source Server Version : 100327
 Source Host           : 127.0.0.1:3306
 Source Schema         : webscraping

 Target Server Type    : MySQL
 Target Server Version : 100327
 File Encoding         : 65001

 Date: 17/06/2021 16:16:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES (2, 'Viviendas - Locales', 'Esta categoria pertenece Viviendas - Locales', NULL, NULL, NULL);
INSERT INTO `categories` VALUES (3, 'Informática', 'Esta categoria pertenece Informática', NULL, NULL, NULL);
INSERT INTO `categories` VALUES (4, 'Formación', 'Esta categoria pertenece Formación', NULL, NULL, NULL);
INSERT INTO `categories` VALUES (5, 'Motor', 'Esta categoria pertenece Motor', NULL, NULL, NULL);
INSERT INTO `categories` VALUES (6, 'Servicios', 'Esta categoria pertenece Servicios', NULL, NULL, NULL);
INSERT INTO `categories` VALUES (7, 'Gratis', 'Esta categoria pertenece Gratis', NULL, NULL, NULL);
INSERT INTO `categories` VALUES (8, 'Compra - Venta', 'Esta categoria pertenece Compra - Venta', NULL, NULL, NULL);
INSERT INTO `categories` VALUES (9, 'Móviles', 'Esta categoria pertenece Móviles', NULL, NULL, NULL);
INSERT INTO `categories` VALUES (10, 'Empleo', 'Esta categoria pertenece Empleo', NULL, NULL, NULL);
INSERT INTO `categories` VALUES (11, 'Comunidad', 'Esta categoria pertenece Comunidad', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2021_06_17_174850_create_categories_table', 2);
INSERT INTO `migrations` VALUES (5, '2021_06_17_174900_create_sub_categories_table', 2);
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for sub_categories
-- ----------------------------
DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE `sub_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_categories_id_foreign` (`categories_id`),
  CONSTRAINT `sub_categories_categories_id_foreign` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sub_categories
-- ----------------------------
BEGIN;
INSERT INTO `sub_categories` VALUES (2, 'Alquiler temporal', 'Esta subcategoria pertenece Viviendas - Locales', 2, NULL, NULL);
INSERT INTO `sub_categories` VALUES (3, 'Apartamentos', 'Esta subcategoria pertenece Viviendas - Locales', 2, NULL, NULL);
INSERT INTO `sub_categories` VALUES (4, 'Casas rurales', 'Esta subcategoria pertenece Viviendas - Locales', 2, NULL, NULL);
INSERT INTO `sub_categories` VALUES (5, 'Habitación en alquiler', 'Esta subcategoria pertenece Viviendas - Locales', 2, NULL, NULL);
INSERT INTO `sub_categories` VALUES (6, 'Oficinas - Locales', 'Esta subcategoria pertenece Viviendas - Locales', 2, NULL, NULL);
INSERT INTO `sub_categories` VALUES (7, 'Piso - casa en alquiler', 'Esta subcategoria pertenece Viviendas - Locales', 2, NULL, NULL);
INSERT INTO `sub_categories` VALUES (8, 'Plazas de parking', 'Esta subcategoria pertenece Viviendas - Locales', 2, NULL, NULL);
INSERT INTO `sub_categories` VALUES (9, 'Terrenos', 'Esta subcategoria pertenece Viviendas - Locales', 2, NULL, NULL);
INSERT INTO `sub_categories` VALUES (10, 'Vendo piso - casa', 'Esta subcategoria pertenece Viviendas - Locales', 2, NULL, NULL);
INSERT INTO `sub_categories` VALUES (11, 'Accesorios de PC', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (12, 'Accesorios de Portátiles', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (13, 'Cables y Redes', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (14, 'Cartuchos - Papeles - Toner', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (15, 'CDs - DVDs Vírgenes', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (16, 'Discos Duros', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (17, 'Fuentes - UPS - Estabilizadores', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (18, 'Grabadoras DVDs - CDs', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (19, 'Impresoras', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (20, 'MAC - Apple', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (21, 'Memorias RAM', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (22, 'Modems', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (23, 'Monitores - Proyectores', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (24, 'Multimedia', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (25, 'Netbooks', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (26, 'Ordenadores - Servidores', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (27, 'Palms y Handhelds', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (28, 'Pen Drives', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (29, 'Placas Base', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (30, 'Portátiles', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (31, 'Procesadores - CPU', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (32, 'Ratones', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (33, 'Scanners', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (34, 'Software', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (35, 'Tarjetas gráficas', 'Esta subcategoria pertenece Informática', 3, NULL, NULL);
INSERT INTO `sub_categories` VALUES (36, 'Contabilidad', 'Esta subcategoria pertenece Formación', 4, NULL, NULL);
INSERT INTO `sub_categories` VALUES (37, 'Danza', 'Esta subcategoria pertenece Formación', 4, NULL, NULL);
INSERT INTO `sub_categories` VALUES (38, 'Derecho', 'Esta subcategoria pertenece Formación', 4, NULL, NULL);
INSERT INTO `sub_categories` VALUES (39, 'Educación', 'Esta subcategoria pertenece Formación', 4, NULL, NULL);
INSERT INTO `sub_categories` VALUES (40, 'Idiomas', 'Esta subcategoria pertenece Formación', 4, NULL, NULL);
INSERT INTO `sub_categories` VALUES (41, 'Imagen y sonido', 'Esta subcategoria pertenece Formación', 4, NULL, NULL);
INSERT INTO `sub_categories` VALUES (42, 'Informática', 'Esta subcategoria pertenece Formación', 4, NULL, NULL);
INSERT INTO `sub_categories` VALUES (43, 'Música', 'Esta subcategoria pertenece Formación', 4, NULL, NULL);
INSERT INTO `sub_categories` VALUES (44, 'Otras', 'Esta subcategoria pertenece Formación', 4, NULL, NULL);
INSERT INTO `sub_categories` VALUES (45, 'Talleres', 'Esta subcategoria pertenece Formación', 4, NULL, NULL);
INSERT INTO `sub_categories` VALUES (46, 'Accesorios de coches', 'Esta subcategoria pertenece Motor', 5, NULL, NULL);
INSERT INTO `sub_categories` VALUES (47, 'Camiones', 'Esta subcategoria pertenece Motor', 5, NULL, NULL);
INSERT INTO `sub_categories` VALUES (48, 'Caravanas', 'Esta subcategoria pertenece Motor', 5, NULL, NULL);
INSERT INTO `sub_categories` VALUES (49, 'Coches', 'Esta subcategoria pertenece Motor', 5, NULL, NULL);
INSERT INTO `sub_categories` VALUES (50, 'Motos', 'Esta subcategoria pertenece Motor', 5, NULL, NULL);
INSERT INTO `sub_categories` VALUES (51, 'Náutica y navegación', 'Esta subcategoria pertenece Motor', 5, NULL, NULL);
INSERT INTO `sub_categories` VALUES (52, 'Otros vehículos', 'Esta subcategoria pertenece Motor', 5, NULL, NULL);
INSERT INTO `sub_categories` VALUES (53, 'Abogados', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (54, 'Albañilería - Reformas', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (55, 'Asesores', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (56, 'Carpintería', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (57, 'Cerrajeros', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (58, 'Cuidado de personas', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (59, 'Decoradores', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (60, 'Electricistas', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (61, 'Fiestas y eventos', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (62, 'Fontanería', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (63, 'Informáticos', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (64, 'Jardines y piscinas', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (65, 'Limpieza doméstica', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (66, 'Otros', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (67, 'Pintores', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (68, 'Reparación electrodomésticos', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (69, 'Salud', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (70, 'Seguridad y Vigilancia', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (71, 'Tarot - Adivinación', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (72, 'Transportes y mudanzas', 'Esta subcategoria pertenece Servicios', 6, NULL, NULL);
INSERT INTO `sub_categories` VALUES (73, 'Alojamiento web', 'Esta subcategoria pertenece Gratis', 7, NULL, NULL);
INSERT INTO `sub_categories` VALUES (74, 'Cursos', 'Esta subcategoria pertenece Gratis', 7, NULL, NULL);
INSERT INTO `sub_categories` VALUES (75, 'Libros', 'Esta subcategoria pertenece Gratis', 7, NULL, NULL);
INSERT INTO `sub_categories` VALUES (76, 'Mascotas', 'Esta subcategoria pertenece Gratis', 7, NULL, NULL);
INSERT INTO `sub_categories` VALUES (77, 'Otros', 'Esta subcategoria pertenece Gratis', 7, NULL, NULL);
INSERT INTO `sub_categories` VALUES (78, 'Ropa', 'Esta subcategoria pertenece Gratis', 7, NULL, NULL);
INSERT INTO `sub_categories` VALUES (79, 'Software', 'Esta subcategoria pertenece Gratis', 7, NULL, NULL);
INSERT INTO `sub_categories` VALUES (80, 'Animales - Mascotas', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (81, 'Antigüedades', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (82, 'Colecciones', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (83, 'Deporte', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (84, 'Electrodomésticos', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (85, 'Electrónica', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (86, 'Imagen y sonido', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (87, 'Infantil', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (88, 'Intercambio', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (89, 'Joyas - Relojes', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (90, 'Juegos', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (91, 'Libros - Revistas', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (92, 'Muebles', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (93, 'Otros', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (94, 'Ropa - Accesorios', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (95, 'Video juegos', 'Esta subcategoria pertenece Compra - Venta', 8, NULL, NULL);
INSERT INTO `sub_categories` VALUES (96, 'A tiempo parcial', 'Esta subcategoria pertenece Empleo', 10, NULL, NULL);
INSERT INTO `sub_categories` VALUES (97, 'Autónomos', 'Esta subcategoria pertenece Empleo', 10, NULL, NULL);
INSERT INTO `sub_categories` VALUES (98, 'Comercial y ventas', 'Esta subcategoria pertenece Empleo', 10, NULL, NULL);
INSERT INTO `sub_categories` VALUES (99, 'Informática', 'Esta subcategoria pertenece Empleo', 10, NULL, NULL);
INSERT INTO `sub_categories` VALUES (100, 'Prácticas en empresa', 'Esta subcategoria pertenece Empleo', 10, NULL, NULL);
INSERT INTO `sub_categories` VALUES (101, 'Producción', 'Esta subcategoria pertenece Empleo', 10, NULL, NULL);
INSERT INTO `sub_categories` VALUES (102, 'Servicios domésticos', 'Esta subcategoria pertenece Empleo', 10, NULL, NULL);
INSERT INTO `sub_categories` VALUES (103, 'Servicios sanitarios', 'Esta subcategoria pertenece Empleo', 10, NULL, NULL);
INSERT INTO `sub_categories` VALUES (104, 'Sin experiencia', 'Esta subcategoria pertenece Empleo', 10, NULL, NULL);
INSERT INTO `sub_categories` VALUES (105, 'Trabajo en casa', 'Esta subcategoria pertenece Empleo', 10, NULL, NULL);
INSERT INTO `sub_categories` VALUES (106, 'Animales', 'Esta subcategoria pertenece Comunidad', 11, NULL, NULL);
INSERT INTO `sub_categories` VALUES (107, 'Cine', 'Esta subcategoria pertenece Comunidad', 11, NULL, NULL);
INSERT INTO `sub_categories` VALUES (108, 'Compartir coche', 'Esta subcategoria pertenece Comunidad', 11, NULL, NULL);
INSERT INTO `sub_categories` VALUES (109, 'Famosos', 'Esta subcategoria pertenece Comunidad', 11, NULL, NULL);
INSERT INTO `sub_categories` VALUES (110, 'Hobbies', 'Esta subcategoria pertenece Comunidad', 11, NULL, NULL);
INSERT INTO `sub_categories` VALUES (111, 'Idiomas', 'Esta subcategoria pertenece Comunidad', 11, NULL, NULL);
INSERT INTO `sub_categories` VALUES (112, 'Música', 'Esta subcategoria pertenece Comunidad', 11, NULL, NULL);
INSERT INTO `sub_categories` VALUES (113, 'Otros', 'Esta subcategoria pertenece Comunidad', 11, NULL, NULL);
INSERT INTO `sub_categories` VALUES (114, 'Voluntariado', 'Esta subcategoria pertenece Comunidad', 11, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'Angelica Aufderhar', 'rey40@example.net', '2021-06-17 14:00:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xFVnS8ZByTyQocQdX04zzOqhqcMR23rplOGJPLMCM60j4fsFoR0LSu572RcF', '2021-06-17 14:00:19', '2021-06-17 14:00:19');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
