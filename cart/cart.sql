CREATE DATABASE BOOKSTOREBASE;
USE BOOKSTOREBASE;
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(20, 0) NULL DEFAULT NULL,
  `description` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `books` VALUES ('1', 'book', 'xx', 13, 'xx');
INSERT INTO `books` VALUES ('2', 'phone', 'xx', 2000, 'xx');
INSERT INTO `books` VALUES ('3', 'apple', 'xx', 3, 'xx');
INSERT INTO `books` VALUES ('2', 'banana', 'xx', 1, 'xx');
SET FOREIGN_KEY_CHECKS = 1;
