/*
Navicat MySQL Data Transfer

Source Server         : MxOnline
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : mxonline

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-07-16 15:50:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '编辑部门');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES ('14', '1', '25');
INSERT INTO `auth_group_permissions` VALUES ('15', '1', '26');
INSERT INTO `auth_group_permissions` VALUES ('2', '1', '34');
INSERT INTO `auth_group_permissions` VALUES ('3', '1', '35');
INSERT INTO `auth_group_permissions` VALUES ('6', '1', '37');
INSERT INTO `auth_group_permissions` VALUES ('8', '1', '38');
INSERT INTO `auth_group_permissions` VALUES ('10', '1', '49');
INSERT INTO `auth_group_permissions` VALUES ('11', '1', '50');
INSERT INTO `auth_group_permissions` VALUES ('12', '1', '52');
INSERT INTO `auth_group_permissions` VALUES ('13', '1', '53');
INSERT INTO `auth_group_permissions` VALUES ('1', '1', '65');
INSERT INTO `auth_group_permissions` VALUES ('4', '1', '66');
INSERT INTO `auth_group_permissions` VALUES ('5', '1', '69');
INSERT INTO `auth_group_permissions` VALUES ('7', '1', '71');
INSERT INTO `auth_group_permissions` VALUES ('9', '1', '75');

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO `auth_permission` VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add content type', '3', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('8', 'Can change content type', '3', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete content type', '3', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('10', 'Can add 用户信息', '4', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('11', 'Can change 用户信息', '4', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete 用户信息', '4', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('13', 'Can add log entry', '5', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('14', 'Can change log entry', '5', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete log entry', '5', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 轮播图', '7', 'add_banner');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 轮播图', '7', 'change_banner');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 轮播图', '7', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 邮箱验证码', '8', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 邮箱验证码', '8', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 邮箱验证码', '8', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 课程资源', '9', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 课程资源', '9', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 课程资源', '9', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 章节', '10', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 章节', '10', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 章节', '10', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 视频', '11', 'add_video');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 视频', '11', 'change_video');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 视频', '11', 'delete_video');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 课程', '12', 'add_course');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 课程', '12', 'change_course');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 课程', '12', 'delete_course');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 课程机构', '13', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 课程机构', '13', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 课程机构', '13', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 教师', '14', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 教师', '14', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 教师', '14', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 城市', '15', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 城市', '15', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 城市', '15', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 用户咨询', '16', 'add_userask');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 用户咨询', '16', 'change_userask');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 用户咨询', '16', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 用户课程', '17', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 用户课程', '17', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 用户课程', '17', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 课程评论', '18', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 课程评论', '18', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 课程评论', '18', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 用户收藏', '19', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 用户收藏', '19', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 用户收藏', '19', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('58', 'Can add 用户消息', '20', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('59', 'Can change 用户消息', '20', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete 用户消息', '20', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('61', 'Can view log entry', '5', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('62', 'Can view group', '2', 'view_group');
INSERT INTO `auth_permission` VALUES ('63', 'Can view permission', '1', 'view_permission');
INSERT INTO `auth_permission` VALUES ('64', 'Can view content type', '3', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('65', 'Can view 课程', '12', 'view_course');
INSERT INTO `auth_permission` VALUES ('66', 'Can view 课程资源', '9', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('67', 'Can view 章节', '10', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 视频', '11', 'view_video');
INSERT INTO `auth_permission` VALUES ('69', 'Can view 课程评论', '18', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('70', 'Can view 用户咨询', '16', 'view_userask');
INSERT INTO `auth_permission` VALUES ('71', 'Can view 用户课程', '17', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 用户收藏', '19', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('73', 'Can view 用户消息', '20', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('74', 'Can view 城市', '15', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('75', 'Can view 课程机构', '13', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 教师', '14', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('77', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('78', 'Can view 轮播图', '7', 'view_banner');
INSERT INTO `auth_permission` VALUES ('79', 'Can view 邮箱验证码', '8', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 用户信息', '4', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('81', 'Can add Bookmark', '21', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('82', 'Can change Bookmark', '21', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete Bookmark', '21', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('84', 'Can add User Setting', '22', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('85', 'Can change User Setting', '22', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('86', 'Can delete User Setting', '22', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('87', 'Can add User Widget', '23', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('88', 'Can change User Widget', '23', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('89', 'Can delete User Widget', '23', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('90', 'Can add log entry', '24', 'add_log');
INSERT INTO `auth_permission` VALUES ('91', 'Can change log entry', '24', 'change_log');
INSERT INTO `auth_permission` VALUES ('92', 'Can delete log entry', '24', 'delete_log');
INSERT INTO `auth_permission` VALUES ('93', 'Can view Bookmark', '21', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('94', 'Can view log entry', '24', 'view_log');
INSERT INTO `auth_permission` VALUES ('95', 'Can view User Setting', '22', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('96', 'Can view User Widget', '23', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('97', 'Can add captcha store', '25', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('98', 'Can change captcha store', '25', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete captcha store', '25', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('100', 'Can view captcha store', '25', 'view_captchastore');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(4) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_advice` varchar(300) NOT NULL,
  `youneed_know` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES ('1', 'django入门', 'django入门django入门', 'django入门django入门django入门django入门', 'cj', '0', '5', '0', 'courses/2018/06/01_small.jpg', '34', '2018-06-06 16:33:00.000000', '1', '后端开发', 'python', '1', 'django进阶开发', 'python基础要有', '0');
INSERT INTO `courses_course` VALUES ('2', 'django入门1', 'django入门1', 'django入门1django入门1django入门1django入门1django入门1', 'cj', '0', '2', '0', 'courses/2018/07/540e57300001d6d906000338-240-135_MSIqfvw.jpg', '7', '2018-06-13 11:21:00.000000', '1', '后端开发', 'python', null, 'django进阶开发', 'python基础要有', '1');
INSERT INTO `courses_course` VALUES ('3', 'django入门2', 'django入门2', 'django入门2django入门2django入门2', 'cj', '0', '1', '0', 'courses/2018/07/57035ff200014b8a06000338-240-135_0nFiBSI.jpg', '2', '2018-06-06 11:22:00.000000', '2', '后端开发', 'python', null, 'django进阶开发', 'python基础要有', '1');
INSERT INTO `courses_course` VALUES ('4', 'django入门3', 'django入门3', 'django入门3django入门3django入门3django入门3', 'zj', '0', '10', '0', 'courses/2018/06/57035ff200014b8a06000338-240-135.jpg', '0', '2018-06-13 11:23:00.000000', '5', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('5', 'django入门4', 'django入门4', 'django入门4django入门4django入门4django入门4', 'gj', '0', '0', '0', 'courses/2018/06/mysql.jpg', '0', '2018-06-13 11:23:00.000000', '6', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('6', 'django入门5', 'django入门5', 'django入门5django入门5django入门5django入门5', 'zj', '0', '0', '0', 'courses/2018/06/default_middile_1.png', '0', '2018-06-13 11:24:00.000000', '4', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('7', 'django入门6', 'django入门6', 'django入门6django入门6django入门6', 'zj', '0', '0', '0', 'courses/2018/06/540e57300001d6d906000338-240-135_mvvGYHL.jpg', '0', '2018-06-13 11:24:00.000000', '3', '后端开发', 'python', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('8', 'django入门8', 'django入门8', 'django入门8django入门8django入门8django入门8', 'zj', '0', '0', '0', 'courses/2018/07/540e57300001d6d906000338-240-135_mvvGYHL.jpg', '54', '2018-06-13 11:25:00.000000', '1', '后端开发', 'python', null, 'django进阶开发', 'python基础要有', '0');
INSERT INTO `courses_course` VALUES ('9', 'django入门9', 'django入门9django入门9django入门9django入门9', 'django入门9django入门9django入门9django入门9', 'zj', '0', '0', '0', 'courses/2018/06/mysql_aOfBGRT.jpg', '0', '2018-06-13 11:25:00.000000', '1', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('10', 'django入门91', 'django入门9django入门9django入门9', 'django入门9django入门9django入门9django入门9django入门9django入门9', 'cj', '0', '0', '0', 'courses/2018/06/540e57300001d6d906000338-240-135_MSIqfvw_Gg8zWy1.jpg', '3', '2018-06-13 11:25:00.000000', '1', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('11', 'django入门92', 'django入门9django入门9', 'django入门9django入门9django入门9django入门9django入门9', 'gj', '0', '0', '0', 'courses/2018/06/mysql_okMXY2X.jpg', '0', '2018-06-13 11:26:00.000000', '1', '后端开发', '', null, '', '', '0');

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES ('1', '前端页面', 'course/resource/2018/06/index.html', '2018-06-14 14:26:00.000000', '1');

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES ('1', '第一节', '2018-06-06 16:34:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('2', '第一章', '2018-06-14 11:21:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('3', '第二章', '2018-06-14 11:23:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('4', '第三章', '2018-06-14 11:23:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('5', '第四章', '2018-06-14 11:24:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('6', '第五章', '2018-06-14 11:24:00.000000', '1');

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES ('1', '1.1 hello world', '2018-06-14 11:26:00.000000', '2', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '0');
INSERT INTO `courses_video` VALUES ('2', '1.2 基本概念', '2018-06-14 11:31:00.000000', '2', 'https://www.imooc.com/video/1430', '0');
INSERT INTO `courses_video` VALUES ('3', 'django settings.py 配置', '2018-06-14 11:31:00.000000', '2', 'https://www.imooc.com/video/1430', '0');
INSERT INTO `courses_video` VALUES ('4', '2.1 test', '2018-06-14 11:31:00.000000', '3', 'https://www.imooc.com/video/1430', '0');
INSERT INTO `courses_video` VALUES ('5', '2.2 test', '2018-06-14 11:32:00.000000', '3', 'https://www.imooc.com/video/1430', '0');
INSERT INTO `courses_video` VALUES ('6', '3.1 django app设计', '2018-06-14 11:32:00.000000', '4', 'https://www.imooc.com/video/1430', '0');
INSERT INTO `courses_video` VALUES ('7', '3.2 django model设计', '2018-06-14 11:32:00.000000', '4', 'https://www.imooc.com/video/1430', '0');
INSERT INTO `courses_video` VALUES ('8', '3.3 django users models设计', '2018-06-14 11:32:00.000000', '4', 'https://www.imooc.com/video/1430', '0');
INSERT INTO `courses_video` VALUES ('9', '3.4 django course models设计', '2018-06-14 11:32:00.000000', '4', 'https://www.imooc.com/video/1430', '0');
INSERT INTO `courses_video` VALUES ('10', '3.5 organization models设计', '2018-06-14 11:32:00.000000', '4', 'https://www.imooc.com/video/1430', '0');
INSERT INTO `courses_video` VALUES ('11', '4.1 django settings配置', '2018-06-14 11:32:00.000000', '5', 'https://www.imooc.com/video/1430', '0');
INSERT INTO `courses_video` VALUES ('12', '4.2 models设计', '2018-06-14 11:33:00.000000', '5', 'https://www.imooc.com/video/1430', '0');
INSERT INTO `courses_video` VALUES ('13', '5.1 django admin讲解', '2018-06-14 11:33:00.000000', '6', '', '0');
INSERT INTO `courses_video` VALUES ('14', '5.2 xadmin的安装和注册', '2018-06-14 11:33:00.000000', '6', 'https://www.imooc.com/video/1430', '0');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-06-06 10:55:54.658264', '2', 'dongyic', '1', '[{\"added\": {}}]', '4', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('5', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('1', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('25', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('3', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('12', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('9', 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('11', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('18', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('16', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('17', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('19', 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('20', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('15', 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES ('13', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('14', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('4', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-06-05 07:31:47.224997');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-06-05 07:31:49.594234');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-06-05 07:31:54.886763');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-06-05 07:31:55.918866');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-06-05 07:31:55.962870');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-06-05 07:31:56.025877');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-06-05 07:31:56.082882');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-06-05 07:31:56.117886');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-06-05 07:31:56.187893');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-06-05 07:31:56.229897');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2018-06-05 07:31:56.347909');
INSERT INTO `django_migrations` VALUES ('12', 'users', '0001_initial', '2018-06-05 07:32:02.473521');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0001_initial', '2018-06-05 07:32:10.721346');
INSERT INTO `django_migrations` VALUES ('14', 'admin', '0002_logentry_remove_auto_add', '2018-06-05 07:32:10.823356');
INSERT INTO `django_migrations` VALUES ('15', 'sessions', '0001_initial', '2018-06-05 07:32:12.184492');
INSERT INTO `django_migrations` VALUES ('16', 'users', '0002_banner_emailverifyrecord', '2018-06-05 08:18:57.714050');
INSERT INTO `django_migrations` VALUES ('17', 'courses', '0001_initial', '2018-06-05 08:21:41.985476');
INSERT INTO `django_migrations` VALUES ('18', 'organization', '0001_initial', '2018-06-05 08:37:40.703338');
INSERT INTO `django_migrations` VALUES ('19', 'operation', '0001_initial', '2018-06-06 02:05:59.881264');
INSERT INTO `django_migrations` VALUES ('20', 'users', '0003_auto_20180606_1045', '2018-06-06 10:45:21.113264');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0001_initial', '2018-06-06 15:23:05.022523');
INSERT INTO `django_migrations` VALUES ('22', 'xadmin', '0002_log', '2018-06-06 15:23:09.761997');
INSERT INTO `django_migrations` VALUES ('23', 'xadmin', '0003_auto_20160715_0100', '2018-06-06 15:23:12.052226');
INSERT INTO `django_migrations` VALUES ('24', 'captcha', '0001_initial', '2018-06-07 17:12:26.536160');
INSERT INTO `django_migrations` VALUES ('25', 'courses', '0002_auto_20180607_1712', '2018-06-07 17:12:26.659172');
INSERT INTO `django_migrations` VALUES ('26', 'users', '0004_auto_20180607_1712', '2018-06-07 17:12:26.702177');
INSERT INTO `django_migrations` VALUES ('27', 'organization', '0002_courseorg_category', '2018-06-11 14:28:28.820292');
INSERT INTO `django_migrations` VALUES ('28', 'organization', '0003_auto_20180611_1809', '2018-06-11 18:10:07.073889');
INSERT INTO `django_migrations` VALUES ('29', 'courses', '0003_course_course_org', '2018-06-12 14:26:42.730077');
INSERT INTO `django_migrations` VALUES ('30', 'organization', '0004_teacher_image', '2018-06-12 15:15:56.669441');
INSERT INTO `django_migrations` VALUES ('31', 'courses', '0004_course_category', '2018-06-13 17:01:09.631064');
INSERT INTO `django_migrations` VALUES ('32', 'courses', '0005_course_tag', '2018-06-14 10:01:33.027323');
INSERT INTO `django_migrations` VALUES ('33', 'courses', '0006_video_url', '2018-06-14 14:17:07.434639');
INSERT INTO `django_migrations` VALUES ('34', 'courses', '0007_video_learn_times', '2018-06-14 14:25:59.272750');
INSERT INTO `django_migrations` VALUES ('35', 'courses', '0008_course_teacher', '2018-06-14 14:36:15.964097');
INSERT INTO `django_migrations` VALUES ('36', 'courses', '0009_auto_20180614_1533', '2018-06-14 15:33:39.739914');
INSERT INTO `django_migrations` VALUES ('37', 'organization', '0005_teacher_age', '2018-06-15 14:59:41.852231');
INSERT INTO `django_migrations` VALUES ('38', 'users', '0005_auto_20180621_1444', '2018-06-21 14:45:02.782082');
INSERT INTO `django_migrations` VALUES ('39', 'courses', '0010_course_is_banner', '2018-07-10 14:55:22.933203');
INSERT INTO `django_migrations` VALUES ('40', 'organization', '0006_courseorg_tag', '2018-07-10 16:25:30.944486');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('hax8sqz6gmpvf14rxupp5rb12egvad84', 'ZTRkNTQ5M2VhZDk0MDBhYjdhNGM4MzAzZGUyYmIxMWNiYTFhZWNlODp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjVjMmUzNTQyZTQ5NDg1ZTdlOWJjNmNmNzA1YTkzN2VjZWU1ZWUwNGUiLCJMSVNUX1FVRVJZIjpbWyJvcGVyYXRpb24iLCJjb3Vyc2Vjb21tZW50cyJdLCIiXX0=', '2018-07-26 14:49:51.118059');
INSERT INTO `django_session` VALUES ('li1lm6sadyg0e08imcrmgubuv1vm3d4h', 'MTU0ZTUxMTE1NTcxNWNmODkxMjU2ZGIyY2M1ZDc0ZjdiN2RhODJiYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA5OTUxOGE4ZGMyMmYwODM2MTYzODY3MWU3NGFmMDE1N2IyOTkxYmUiLCJMSVNUX1FVRVJZIjpbWyJvcGVyYXRpb24iLCJ1c2VyY291cnNlIl0sIiJdfQ==', '2018-07-06 17:25:16.957136');
INSERT INTO `django_session` VALUES ('upsycjn1cpk7zv3cd1uq5asdvuz37427', 'ZGExYjZmYmQ1ZjNjNGY2NGViOTUwZTA5MDA4Zjk3ZmNmOGZmYTIyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA5OTUxOGE4ZGMyMmYwODM2MTYzODY3MWU3NGFmMDE1N2IyOTkxYmUiLCJMSVNUX1FVRVJZIjpbWyJvcmdhbml6YXRpb24iLCJjb3Vyc2VvcmciXSwiIl19', '2018-07-26 17:27:06.619262');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomm_user_id_f5ff70b3_fk_users_use` (`user_id`),
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES ('1', '看到第三章了，虽然有些知识还不是听得很懂，但是感觉很有用的样子，想的是先听完一遍再说。然后再来听第二遍。最后想说老师棒棒哒！！！', '2018-06-14 16:30:00.000000', '1', '2');
INSERT INTO `operation_coursecomments` VALUES ('2', '老师您讲的很好，很期待下次的课程。我有个小问题，jedi我用git clone 和 apt-get 都装上了，:help jedi-vim ,提示我E149: 抱歉，没有 jedi-vim 的说明，补全也不能用，有点搞不清楚了。我安装vim插件python-mode也不能用...', '2018-06-14 16:31:00.000000', '1', '2');
INSERT INTO `operation_coursecomments` VALUES ('3', '你好。我在看7.3节 关于使用上下文管理的那个例子。关于telnetlib库使用的一些问题。 Telnet.read_until(expected, timeout=None) ;使用这个方法容易卡在输入登陆用户名的位置就不执行了。假如telnet到目标主机，如果提示符不是login ，就无法登陆吗？', '2018-06-14 16:31:00.000000', '1', '2');
INSERT INTO `operation_coursecomments` VALUES ('4', '精品，老早就听医生的课了，这次的课程又让我长见识了，就像别的同学说的那样，如此简洁的实现酷炫动画的方式让我激动，赶快学完视频内容好去实现那10个任务，到时候希望徐大神好好指导指导我，如果学完后能给我个行业推荐啥的就更好了，明年就开始实习了！老紧张了--', '2018-06-14 16:31:00.000000', '1', '2');
INSERT INTO `operation_coursecomments` VALUES ('5', '测试一下', '2018-06-14 16:31:00.000000', '1', '2');
INSERT INTO `operation_coursecomments` VALUES ('6', 'atrawr arWA Ra RASFAFsfe啊发文', '2018-06-14 16:58:55.255414', '1', '1');
INSERT INTO `operation_coursecomments` VALUES ('7', '阿瓦尔污染 发发双方首发身份', '2018-06-14 16:59:18.320721', '1', '1');

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------
INSERT INTO `operation_userask` VALUES ('1', 'dongyic', '12345678901', 'hahadee', '2018-06-12 10:33:04.245616');
INSERT INTO `operation_userask` VALUES ('2', 'dongyi', '90876543213', 'ouwarrwe', '2018-06-12 10:49:23.706553');
INSERT INTO `operation_userask` VALUES ('3', 'dongyic', '13312312312', 'django', '2018-06-12 11:17:11.353301');
INSERT INTO `operation_userask` VALUES ('4', 'dongyi', '13312312312', 'django', '2018-06-12 11:19:59.221086');
INSERT INTO `operation_userask` VALUES ('5', 'dongyic', '13312312312', 'djkasdad', '2018-06-12 11:21:01.457309');
INSERT INTO `operation_userask` VALUES ('6', 'dongyi', '13312312312', 'ddasd', '2018-06-12 11:22:57.110873');
INSERT INTO `operation_userask` VALUES ('7', 'luli', '13312312312', 'aweee', '2018-06-12 11:26:35.485708');
INSERT INTO `operation_userask` VALUES ('8', 'dongyi', '13312312311', 'aweawe', '2018-06-12 14:06:26.453478');
INSERT INTO `operation_userask` VALUES ('9', 'dongyi', '17712312311', 'htyert', '2018-06-12 14:08:26.303478');

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES ('1', '2018-06-14 09:44:00.000000', '1', '4');
INSERT INTO `operation_usercourse` VALUES ('2', '2018-06-14 09:45:00.000000', '1', '1');
INSERT INTO `operation_usercourse` VALUES ('3', '2018-06-14 09:45:00.000000', '1', '2');
INSERT INTO `operation_usercourse` VALUES ('4', '2018-06-14 17:27:26.131485', '2', '1');
INSERT INTO `operation_usercourse` VALUES ('5', '2018-06-14 17:27:34.640336', '3', '1');

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES ('8', '1', '1', '2018-06-14 10:56:45.751590', '1');
INSERT INTO `operation_userfavorite` VALUES ('13', '6', '2', '2018-06-21 16:58:59.530082', '1');
INSERT INTO `operation_userfavorite` VALUES ('15', '2', '3', '2018-06-22 10:02:29.067512', '1');
INSERT INTO `operation_userfavorite` VALUES ('16', '2', '2', '2018-06-22 10:43:49.288855', '1');
INSERT INTO `operation_userfavorite` VALUES ('17', '1', '3', '2018-06-22 10:50:19.071830', '1');
INSERT INTO `operation_userfavorite` VALUES ('18', '1', '2', '2018-06-22 17:24:13.588799', '1');

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------
INSERT INTO `operation_usermessage` VALUES ('1', '1', '欢迎注册', '1', '2018-06-22 15:15:00.000000');

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `desc` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES ('1', '北京市', '2018-06-11 11:47:00.000000', '北京市');
INSERT INTO `organization_citydict` VALUES ('2', '上海市', '2018-06-11 11:48:00.000000', '上海市');
INSERT INTO `organization_citydict` VALUES ('3', '广州市', '2018-06-11 11:48:00.000000', '广州市');
INSERT INTO `organization_citydict` VALUES ('4', '南京市', '2018-06-11 11:48:00.000000', '南京市');
INSERT INTO `organization_citydict` VALUES ('5', '深圳市', '2018-06-11 11:48:00.000000', '深圳市');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES ('1', '慕课网', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n  慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] \r\n4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。 [2]', '2', '1', 'org/2018/07/57035ff200014b8a06000338-240-135.jpg', '北京', '2018-06-11 11:51:00.000000', '1', 'pxjg', '6', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('2', '慕课网2', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。 [2]', '1', '0', 'org/2018/06/imooc_UnGjmDd.png', '南京', '2018-06-11 14:21:00.000000', '4', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('3', '慕课网3', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。 [2]', '0', '0', 'org/2018/06/njdx.jpg', '上海', '2018-06-11 14:22:00.000000', '2', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('4', '慕课网4', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。 [2]', '0', '0', 'org/2018/06/imooc_QIBWOq5.png', '深圳', '2018-06-11 14:22:00.000000', '5', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('5', '清华大学', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。 [2]', '0', '0', 'org/2018/06/qhdx-logo.png', '北京', '2018-06-11 14:23:00.000000', '1', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('6', '北京大学', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。 [2]', '0', '0', 'org/2018/06/bjdx.jpg', '北京', '2018-06-11 14:23:00.000000', '1', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('7', '南京大学', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。 [2]', '0', '0', 'org/2018/06/njdx_UA7vRL0.jpg', '南京', '2018-06-11 14:23:00.000000', '4', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('8', '慕课网5', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。 [2]', '0', '0', 'org/2018/06/imooc_uvuBy0R.png', '广州', '2018-06-11 14:24:00.000000', '3', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('9', '慕课网6', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。 [2]', '0', '0', 'org/2018/06/imooc_YlH8D3r.png', '上海', '2018-06-11 14:24:00.000000', '2', 'pxjg', '0', '0', '全国知名');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES ('1', 'chendongyi', '0', 'axax', 'xxxx', 'xxxxxx', '0', '0', '2018-06-12 14:18:00.000000', '1', 'teacher/2018/06/aobama_tPlvhGQ.png', '18');
INSERT INTO `organization_teacher` VALUES ('2', 'dongyi12', '0', 'xxxx', 'xxxxx', 'xxxxxxxxxxxxxxxxx', '0', '0', '2018-06-12 14:20:00.000000', '1', 'teacher/2018/06/aobama.png', '18');

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
INSERT INTO `users_banner` VALUES ('1', '第一个', 'banner/2018/07/57a801860001c34b12000460.jpg', 'http://www.imooc.com', '1', '2018-07-10 15:04:00.000000');
INSERT INTO `users_banner` VALUES ('2', '第二个', 'banner/2018/07/57aa86a0000145c512000460.jpg', 'http://www.projectsedu.com', '2', '2018-07-10 15:05:00.000000');
INSERT INTO `users_banner` VALUES ('3', '第三个', 'banner/2018/07/57a801860001c34b12000460_z4Vb8zl.jpg', 'http://www.baidu.com', '3', '2018-07-10 15:06:00.000000');
INSERT INTO `users_banner` VALUES ('4', '第四个', 'banner/2018/07/57aa86a0000145c512000460_GXIBATC.jpg', 'http://www.163.com', '4', '2018-07-10 15:06:00.000000');
INSERT INTO `users_banner` VALUES ('5', '第五个', 'banner/2018/07/57aa86a0000145c512000460_nMwvoQD.jpg', 'http://www.qq.com', '5', '2018-07-10 15:07:00.000000');

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(20) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES ('1', 'admin', '233@qq.com', 'register', '2018-06-06 15:42:00.000000');
INSERT INTO `users_emailverifyrecord` VALUES ('2', 'admin', 'qq@qq.com', 'forget', '2018-06-06 15:49:00.000000');
INSERT INTO `users_emailverifyrecord` VALUES ('3', 'dongyic', 'aadd@ee.com', 'register', '2018-06-06 16:12:00.000000');
INSERT INTO `users_emailverifyrecord` VALUES ('4', 'yVfgTSjlaNQPaJIj', 'cdy19861111@163.com', 'register', '2018-06-08 10:02:13.671653');
INSERT INTO `users_emailverifyrecord` VALUES ('5', 'UK30KmLeL2bnubrY', 'cdy19861111@163.com', 'register', '2018-06-08 11:23:07.358973');
INSERT INTO `users_emailverifyrecord` VALUES ('6', 'PXf1ERos5nycmKrz', 'cdy19861111@163.com', 'forget', '2018-06-08 15:26:15.256707');
INSERT INTO `users_emailverifyrecord` VALUES ('7', 'cH3CIqfWyiB9D9iK', '305139630@qq.com', 'update_email', '2018-06-21 14:45:21.346082');
INSERT INTO `users_emailverifyrecord` VALUES ('8', 'ZhBv', '305139630@163.com', 'update_email', '2018-06-21 14:49:17.702082');
INSERT INTO `users_emailverifyrecord` VALUES ('9', 'n96F', '305139630@qq.com', 'update_email', '2018-06-21 14:50:24.907082');
INSERT INTO `users_emailverifyrecord` VALUES ('10', '95Ap', '305139630@qq.com', 'update_email', '2018-06-21 15:18:54.364082');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$100000$KcCCkjNm5Ij2$0sck/GFZXYoBpK0YOpSpXjytvewT59wOKaBHPrrMyZ8=', '2018-07-12 15:29:11.824059', '1', 'admin', '', '', '305139630@qq.com', '1', '1', '2018-06-06 10:46:00.000000', 'django是最稀罕', '2018-06-13', 'female', '挨打埃杜阿多ad', null, 'image/2018/06/aobama_OCzu5bH.png');
INSERT INTO `users_userprofile` VALUES ('2', 'admin123', '2018-06-06 10:51:00.000000', '0', 'dongyic', '', '', '', '0', '1', '2018-06-06 10:51:00.000000', 'dongyic', null, 'female', 'nanjing', null, 'courses/2018/06/imooc.png');
INSERT INTO `users_userprofile` VALUES ('4', 'pbkdf2_sha256$100000$uTnZy09YB7uu$UFNivYG9PBDSkCbWgHNGL5SpWGMcXOaSDHbETLHk3T0=', '2018-07-12 14:08:00.000000', '0', 'cdy19861111@163.com', '', '', 'cdy19861111@163.com', '1', '1', '2018-06-08 11:23:00.000000', '安纳金', null, 'male', '南京', null, 'image/2018/07/default_middile_1_32FSQ1W.png');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------
INSERT INTO `users_userprofile_groups` VALUES ('1', '4', '1');

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-06-06 15:43:11.127122', '127.0.0.1', '1', 'EmailVerifyRecord object (1)', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-06-06 15:49:46.322637', '127.0.0.1', '2', 'qq@qq.com', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-06-06 16:12:54.458437', '127.0.0.1', '3', 'dongyic(aadd@ee.com)', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-06-06 16:33:58.720851', '127.0.0.1', '1', 'Course object (1)', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-06-06 16:34:53.571335', '127.0.0.1', '1', 'Lesson object (1)', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-06-11 11:47:46.483923', '127.0.0.1', '1', 'CityDict object (1)', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-06-11 11:48:14.535728', '127.0.0.1', '2', 'CityDict object (2)', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-06-11 11:48:22.859560', '127.0.0.1', '3', 'CityDict object (3)', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-06-11 11:48:34.429717', '127.0.0.1', '4', 'CityDict object (4)', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-06-11 11:48:46.223896', '127.0.0.1', '5', 'CityDict object (5)', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-06-11 12:25:01.343186', '127.0.0.1', '1', 'CourseOrg object (1)', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-06-11 14:22:10.747488', '127.0.0.1', '2', '慕课网2', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-06-11 14:22:45.997013', '127.0.0.1', '3', '慕课网3', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-06-11 14:23:08.102223', '127.0.0.1', '4', '慕课网4', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-06-11 14:23:33.200733', '127.0.0.1', '5', '清华大学', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-06-11 14:23:53.208733', '127.0.0.1', '6', '北京大学', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-06-11 14:24:18.711283', '127.0.0.1', '7', '南京大学', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-06-11 14:24:39.729385', '127.0.0.1', '8', '慕课网5', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-06-11 14:24:57.313143', '127.0.0.1', '9', '慕课网6', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-06-12 14:18:41.237328', '127.0.0.1', '1', 'Teacher object (1)', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-06-12 14:20:32.946314', '127.0.0.1', '2', 'dongyi12', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-06-12 14:59:42.507035', '127.0.0.1', '1', 'django入门', 'change', '修改 course_org 和 image', '12', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-06-12 15:16:18.129587', '127.0.0.1', '2', 'dongyi12', 'change', '修改 image', '14', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-06-12 15:22:25.040274', '127.0.0.1', '1', 'chendongyi', 'change', '修改 image', '14', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2018-06-13 11:22:09.724422', '127.0.0.1', '2', 'django入门1', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2018-06-13 11:23:29.996449', '127.0.0.1', '3', 'django入门2', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2018-06-13 11:23:47.816231', '127.0.0.1', '4', 'django入门3', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2018-06-13 11:24:07.184167', '127.0.0.1', '5', 'django入门4', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2018-06-13 11:24:33.869835', '127.0.0.1', '6', 'django入门5', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2018-06-13 11:25:05.955044', '127.0.0.1', '7', 'django入门6', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-06-13 11:25:33.344782', '127.0.0.1', '8', 'django入门8', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-06-13 11:25:50.698518', '127.0.0.1', '9', 'django入门9', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2018-06-13 11:26:05.291977', '127.0.0.1', '10', 'django入门91', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2018-06-13 11:26:22.366684', '127.0.0.1', '11', 'django入门92', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2018-06-14 09:45:04.035434', '127.0.0.1', '1', 'UserCourse object (1)', 'create', '已添加。', '17', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2018-06-14 09:45:09.095940', '127.0.0.1', '2', 'UserCourse object (2)', 'create', '已添加。', '17', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2018-06-14 09:45:14.939524', '127.0.0.1', '3', 'UserCourse object (3)', 'create', '已添加。', '17', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2018-06-14 10:21:45.983606', '127.0.0.1', '1', 'django入门', 'change', '修改 image 和 tag', '12', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2018-06-14 10:22:14.217430', '127.0.0.1', '7', 'django入门6', 'change', '修改 image 和 tag', '12', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2018-06-14 10:22:32.884296', '127.0.0.1', '1', 'django入门', 'change', '修改 image 和 tag', '12', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2018-06-14 11:22:18.143814', '127.0.0.1', '2', 'Lesson object (2)', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2018-06-14 11:23:53.282327', '127.0.0.1', '3', 'Lesson object (3)', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2018-06-14 11:24:00.206020', '127.0.0.1', '4', 'Lesson object (4)', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2018-06-14 11:24:05.686568', '127.0.0.1', '5', 'Lesson object (5)', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2018-06-14 11:24:11.810180', '127.0.0.1', '6', 'Lesson object (6)', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2018-06-14 11:31:46.831677', '127.0.0.1', '1', '1.1 hello world', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2018-06-14 11:31:51.695164', '127.0.0.1', '2', '1.2 基本概念', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2018-06-14 11:31:57.936788', '127.0.0.1', '3', 'django settings.py 配置', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2018-06-14 11:32:13.546349', '127.0.0.1', '4', '2.1 test', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2018-06-14 11:32:20.146009', '127.0.0.1', '5', '2.2 test', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2018-06-14 11:32:26.855679', '127.0.0.1', '6', '3.1 django app设计', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2018-06-14 11:32:36.829677', '127.0.0.1', '7', '3.2 django model设计', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2018-06-14 11:32:43.507344', '127.0.0.1', '8', '3.3 django users models设计', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2018-06-14 11:32:49.807974', '127.0.0.1', '9', '3.4 django course models设计', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2018-06-14 11:32:55.414535', '127.0.0.1', '10', '3.5 organization models设计', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2018-06-14 11:33:01.929186', '127.0.0.1', '11', '4.1 django settings配置', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2018-06-14 11:33:08.331827', '127.0.0.1', '12', '4.2 models设计', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2018-06-14 11:33:14.661460', '127.0.0.1', '13', '5.1 django admin讲解', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2018-06-14 11:33:21.450138', '127.0.0.1', '14', '5.2 xadmin的安装和注册', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2018-06-14 14:20:09.941658', '127.0.0.1', '14', '5.2 xadmin的安装和注册', 'change', '修改 url', '11', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2018-06-14 14:27:55.808778', '127.0.0.1', '1', '前端页面', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('62', '2018-06-14 14:31:31.436091', '127.0.0.1', '1', '前端页面', 'change', '没有字段被修改。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('63', '2018-06-14 15:27:53.555176', '127.0.0.1', '1', 'django入门', 'change', '修改 teacher 和 image', '12', '1');
INSERT INTO `xadmin_log` VALUES ('64', '2018-06-14 15:50:36.805610', '127.0.0.1', '1', 'django入门', 'change', '修改 image，youneed_know 和 teacher_advice', '12', '1');
INSERT INTO `xadmin_log` VALUES ('65', '2018-06-14 16:31:14.718377', '127.0.0.1', '1', 'CourseComments object (1)', 'create', '已添加。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('66', '2018-06-14 16:31:27.635669', '127.0.0.1', '2', 'CourseComments object (2)', 'create', '已添加。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('67', '2018-06-14 16:31:35.736479', '127.0.0.1', '3', 'CourseComments object (3)', 'create', '已添加。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('68', '2018-06-14 16:31:43.864292', '127.0.0.1', '4', 'CourseComments object (4)', 'create', '已添加。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('69', '2018-06-14 16:31:53.684274', '127.0.0.1', '5', 'CourseComments object (5)', 'create', '已添加。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('70', '2018-06-15 10:23:10.119663', '127.0.0.1', '1', '1.1 hello world', 'change', '修改 url', '11', '1');
INSERT INTO `xadmin_log` VALUES ('71', '2018-06-21 15:18:31.981082', '127.0.0.1', '1', 'admin', 'change', '修改 last_login，email，nick_name，address 和 image', '4', '1');
INSERT INTO `xadmin_log` VALUES ('72', '2018-06-22 15:15:42.233943', '127.0.0.1', '1', 'UserMessage object (1)', 'create', '已添加。', '20', '1');
INSERT INTO `xadmin_log` VALUES ('73', '2018-07-10 15:05:55.953273', '127.0.0.1', '1', 'Banner object (1)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('74', '2018-07-10 15:06:30.809758', '127.0.0.1', '2', 'Banner object (2)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('75', '2018-07-10 15:06:52.533930', '127.0.0.1', '3', 'Banner object (3)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('76', '2018-07-10 15:07:11.933870', '127.0.0.1', '4', 'Banner object (4)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('77', '2018-07-10 15:07:34.720148', '127.0.0.1', '5', 'Banner object (5)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('78', '2018-07-10 16:16:46.716068', '127.0.0.1', '3', 'django入门2', 'change', '修改 image，tag，youneed_know，teacher_advice 和 is_banner', '12', '1');
INSERT INTO `xadmin_log` VALUES ('79', '2018-07-10 16:17:28.718268', '127.0.0.1', '2', 'django入门1', 'change', '修改 image，tag，youneed_know，teacher_advice 和 is_banner', '12', '1');
INSERT INTO `xadmin_log` VALUES ('80', '2018-07-12 14:08:08.328364', '127.0.0.1', '4', 'cdy19861111@163.com', 'change', '修改 last_login，is_staff，nick_name，gender，address 和 image', '4', '1');
INSERT INTO `xadmin_log` VALUES ('81', '2018-07-12 14:10:04.868017', '127.0.0.1', '4', 'cdy19861111@163.com', 'change', '修改 last_login，user_permissions 和 image', '4', '1');
INSERT INTO `xadmin_log` VALUES ('82', '2018-07-12 14:45:27.324059', '127.0.0.1', '4', 'cdy19861111@163.com', 'change', '修改 user_permissions 和 image', '4', '1');
INSERT INTO `xadmin_log` VALUES ('83', '2018-07-12 14:48:09.183059', '127.0.0.1', '1', '编辑部门', 'create', '已添加。', '2', '1');
INSERT INTO `xadmin_log` VALUES ('84', '2018-07-12 14:49:12.792059', '127.0.0.1', '4', 'cdy19861111@163.com', 'change', '修改 groups 和 image', '4', '1');
INSERT INTO `xadmin_log` VALUES ('85', '2018-07-12 14:56:10.475059', '127.0.0.1', '4', 'cdy19861111@163.com', 'change', '修改 user_permissions 和 image', '4', '1');
INSERT INTO `xadmin_log` VALUES ('86', '2018-07-12 16:59:46.945737', '127.0.0.1', '1', '慕课网', 'change', '修改 image 和 course_nums', '13', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', '1');
INSERT INTO `xadmin_usersettings` VALUES ('3', 'users_userprofile_editform_portal', 'box-0,box-1,box-2,box-3,box-4|box-5', '1');
INSERT INTO `xadmin_usersettings` VALUES ('4', 'dashboard:home:pos', '', '4');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
