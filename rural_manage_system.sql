/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : rural_manage_system

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 29/05/2026 15:32:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `comment_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `comment_article_id` int(0) NOT NULL COMMENT '文章id',
  `comment_parent_id` int(0) NULL DEFAULT NULL COMMENT '父级评论id',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `comment_from_uid` int(0) NOT NULL COMMENT '评论用户id',
  `comment_to_uid` int(0) NULL DEFAULT NULL COMMENT '回复用户id',
  `comment_create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '评论时间',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `文章id`(`comment_article_id`) USING BTREE,
  INDEX `评论用户id`(`comment_from_uid`) USING BTREE,
  INDEX `回复用户id`(`comment_to_uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100078 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES (100059, 107, NULL, '我觉得这里景色还不错', 1004, NULL, '2023-04-27 18:13:47');
INSERT INTO `tb_comment` VALUES (100060, 107, NULL, '但是我感觉缺了一点什么', 1004, NULL, '2023-04-27 18:14:07');
INSERT INTO `tb_comment` VALUES (100061, 107, NULL, '我也觉得这里很美', 1001, NULL, '2023-04-27 18:14:37');
INSERT INTO `tb_comment` VALUES (100063, 107, 100060, '好像是有一点', 1001, 1001, '2023-04-27 18:15:14');
INSERT INTO `tb_comment` VALUES (100065, 107, 100061, '+1', 1002, 1001, '2023-04-27 18:16:13');
INSERT INTO `tb_comment` VALUES (100066, 107, 100059, '+1111', 1002, 1004, '2023-04-27 18:16:45');
INSERT INTO `tb_comment` VALUES (100067, 107, 100060, '我觉得没有', 1002, 1001, '2023-04-27 18:16:57');
INSERT INTO `tb_comment` VALUES (100069, 107, 100064, '不是啦', 1002, 1002, '2023-04-27 18:17:22');
INSERT INTO `tb_comment` VALUES (100070, 107, NULL, '不会啊，这里很美', 1002, NULL, '2023-04-27 18:17:49');
INSERT INTO `tb_comment` VALUES (100073, 107, NULL, '这里很漂亮', 2027, NULL, '2023-05-25 22:47:36');
INSERT INTO `tb_comment` VALUES (100075, 107, NULL, '是的 这里很美', 1001, NULL, '2023-05-26 10:28:30');
INSERT INTO `tb_comment` VALUES (100076, 107, 100073, '+1', 1001, 2027, '2023-05-26 10:28:35');
INSERT INTO `tb_comment` VALUES (100077, 107, NULL, '这很美', 1001, NULL, '2023-05-26 14:55:29');
INSERT INTO `tb_comment` VALUES (100078, 107, 100073, '是的', 1001, 2027, '2023-05-26 14:55:35');

-- ----------------------------
-- Table structure for tb_file
-- ----------------------------
DROP TABLE IF EXISTS `tb_file`;
CREATE TABLE `tb_file`  (
  `file_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
  `file_size` bigint(0) NULL DEFAULT NULL COMMENT '大小',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '下载链接',
  `file_md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件md5',
  `file_is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `file_enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_file
-- ----------------------------
INSERT INTO `tb_file` VALUES (5, 'QQ图片20210313101655.jpg', 'jpg', 658, 'http://localhost:8888/file/846da590ee35418cb04cb51386c666ce.jpg', '97ce750821a33eae65b76c3a503072c7', 0, 1);
INSERT INTO `tb_file` VALUES (6, 'QQ图片20210313101655.jpg', 'jpg', 658, 'http://localhost:8888/file/846da590ee35418cb04cb51386c666ce.jpg', '97ce750821a33eae65b76c3a503072c7', 0, 1);
INSERT INTO `tb_file` VALUES (7, 'QQ图片20210313101655.jpg', 'jpg', 658, 'http://localhost:8888/file/846da590ee35418cb04cb51386c666ce.jpg', '97ce750821a33eae65b76c3a503072c7', 0, 1);
INSERT INTO `tb_file` VALUES (8, 'QQ图片20210313101655.jpg', 'jpg', 658, 'http://localhost:8888/file/846da590ee35418cb04cb51386c666ce.jpg', '97ce750821a33eae65b76c3a503072c7', 0, 1);
INSERT INTO `tb_file` VALUES (9, 'wqf.jpg', 'jpg', 500, 'http://localhost:8888/file/08490e117e0a4a3b99a30c3646f33ff5.jpg', 'c75a9a8476d5ec4d859014e1085e73e9', 0, 1);
INSERT INTO `tb_file` VALUES (10, 'QQ图片20210313101640.jpg', 'jpg', 238, 'http://localhost:8888/file/9dc6c83ab1ad449dba35700630369db5.jpg', 'a674943c3ad552a86a40a3210ca13882', 0, 1);
INSERT INTO `tb_file` VALUES (11, '轻音.jpg', 'jpg', 580, 'http://localhost:8888/file/a3adff22560449b6bbea8449a3b33d08.jpg', '6102bb827f37ebe07d286476d471f4c8', 0, 1);
INSERT INTO `tb_file` VALUES (12, 'iTab-6q73x6.jpg', 'jpg', 839, 'http://localhost:8888/file/a820f7299a35487c804f92253e9b25e1.jpg', '0361fb08856cb74488d0c24308d22025', 0, 1);
INSERT INTO `tb_file` VALUES (13, 'iTab-rdwjj7.jpg', 'jpg', 1307, 'http://localhost:8888/file/3a544ba2be3d4eba9b293f64fd53d9e1.jpg', 'a00cf693737106cda5117130af32e95e', 0, 1);
INSERT INTO `tb_file` VALUES (14, 'iTab-9mgzgd.jpg', 'jpg', 996, 'http://localhost:8888/file/0cd79ee067824f05b6b2cf5b89f48116.jpg', 'd461f7ef3773f2dcd59b6d198f328fad', 0, 1);
INSERT INTO `tb_file` VALUES (15, '86不存在战区6.jpg', 'jpg', 2679, 'http://localhost:8888/file/2321294574a14930b42c7fcb7b6fe35c.jpg', '407e50975c94432f56eea22b3659b7c7', 0, 1);
INSERT INTO `tb_file` VALUES (16, '86不存在战区5.png', 'png', 1869, 'http://localhost:8888/file/b78627e9782440fdace71d46cb01182b.png', '46902af3ee9027f690879f9a75b306ef', 0, 1);
INSERT INTO `tb_file` VALUES (17, '86不存在战区5.png', 'png', 1869, 'http://localhost:8888/file/b78627e9782440fdace71d46cb01182b.png', '46902af3ee9027f690879f9a75b306ef', 0, 1);
INSERT INTO `tb_file` VALUES (18, '86不存在战区5.png', 'png', 1869, 'http://localhost:8888/file/b78627e9782440fdace71d46cb01182b.png', '46902af3ee9027f690879f9a75b306ef', 0, 1);
INSERT INTO `tb_file` VALUES (19, '86不存在战区5.png', 'png', 1869, 'http://localhost:8888/file/b78627e9782440fdace71d46cb01182b.png', '46902af3ee9027f690879f9a75b306ef', 0, 1);
INSERT INTO `tb_file` VALUES (20, '86不存在战区5.png', 'png', 1869, 'http://localhost:8888/file/b78627e9782440fdace71d46cb01182b.png', '46902af3ee9027f690879f9a75b306ef', 0, 1);
INSERT INTO `tb_file` VALUES (21, '86不存在战区5.png', 'png', 1869, 'http://localhost:8888/file/b78627e9782440fdace71d46cb01182b.png', '46902af3ee9027f690879f9a75b306ef', 0, 1);
INSERT INTO `tb_file` VALUES (22, '婺源1.jpg', 'jpg', 472, 'http://localhost:8888/file/46062c7de0bf46a09435ed04d7bebf2b.jpg', 'e4f5436d73941cf01410882e13a49d9d', 0, 1);
INSERT INTO `tb_file` VALUES (23, '排球少年 (1).png', 'png', 224, 'http://localhost:8888/file/f73248b2725f4d3fa6b95f2c6a5a9ef8.png', 'a157453a913805f7e65833515729bf17', 0, 1);
INSERT INTO `tb_file` VALUES (24, '排球少年 (1).png', 'png', 224, 'http://localhost:8888/file/f73248b2725f4d3fa6b95f2c6a5a9ef8.png', 'a157453a913805f7e65833515729bf17', 0, 1);
INSERT INTO `tb_file` VALUES (25, '排球少年 (1).jpg', 'jpg', 2291, 'http://localhost:8888/file/675a43a3c8964be7986cae1b118e12bd.jpg', '6118cb39a7a9ffe3829829c99b7c8822', 0, 1);
INSERT INTO `tb_file` VALUES (26, '婺源1.jpg', 'jpg', 472, 'http://localhost:8888/file/46062c7de0bf46a09435ed04d7bebf2b.jpg', 'e4f5436d73941cf01410882e13a49d9d', 0, 1);
INSERT INTO `tb_file` VALUES (27, '婺源2.jpg', 'jpg', 195, 'http://localhost:8888/file/0d7d48b1799640baa3496f7b7dcae88b.jpg', '39783de6f1c18c3ed51f384a50f73376', 0, 1);
INSERT INTO `tb_file` VALUES (28, '婺源3.jpg', 'jpg', 1457, 'http://localhost:8888/file/841aa42883664d8e85b291d4561ed2c6.jpg', 'b35a083aff8fef6d93ef248dfd184182', 0, 1);
INSERT INTO `tb_file` VALUES (29, '婺源4.jpg', 'jpg', 279, 'http://localhost:8888/file/0dbf844cf2c9421fb9b329cf5b1c94e9.jpg', '129d08f0c5a215f86aff6c85ed2fbb73', 0, 1);
INSERT INTO `tb_file` VALUES (30, '婺源5.jpg', 'jpg', 751, 'http://localhost:8888/file/be129fcf2f644dc49569cb2cc240431e.jpg', 'd9681b71b79f44e81727925733ad4a42', 0, 1);
INSERT INTO `tb_file` VALUES (31, '婺源5.jpg', 'jpg', 751, 'http://localhost:8888/file/be129fcf2f644dc49569cb2cc240431e.jpg', 'd9681b71b79f44e81727925733ad4a42', 0, 1);
INSERT INTO `tb_file` VALUES (32, '婺源5.jpg', 'jpg', 751, 'http://localhost:8888/file/be129fcf2f644dc49569cb2cc240431e.jpg', 'd9681b71b79f44e81727925733ad4a42', 0, 1);
INSERT INTO `tb_file` VALUES (33, '婺源2.jpg', 'jpg', 195, 'http://localhost:8888/file/0d7d48b1799640baa3496f7b7dcae88b.jpg', '39783de6f1c18c3ed51f384a50f73376', 0, 1);
INSERT INTO `tb_file` VALUES (34, '婺源2.jpg', 'jpg', 195, 'http://localhost:8888/file/0d7d48b1799640baa3496f7b7dcae88b.jpg', '39783de6f1c18c3ed51f384a50f73376', 0, 1);
INSERT INTO `tb_file` VALUES (35, '四月是你的谎言.jpg', 'jpg', 957, 'http://localhost:8888/file/0700eea5f8cc4efd9669e520fd08d5bd.jpg', '0bf755483f42ab5cf95ccbb3b393baac', 0, 1);
INSERT INTO `tb_file` VALUES (36, '四月是你的谎言.jpg', 'jpg', 957, 'http://localhost:8888/file/0700eea5f8cc4efd9669e520fd08d5bd.jpg', '0bf755483f42ab5cf95ccbb3b393baac', 0, 1);
INSERT INTO `tb_file` VALUES (37, '西兰花.jpg', 'jpg', 96, 'http://localhost:8888/file/983abd730dcb457eb0559cac9a89457d.jpg', '4f5dd445966ec8ccc67674797014d5e1', 0, 1);
INSERT INTO `tb_file` VALUES (38, '土豆.jpg', 'jpg', 248, 'http://localhost:8888/file/118d41a28e6b44b3a67f600376df37ac.jpg', '1e685306b7b7ae2e5ac5920abd23a61b', 0, 1);
INSERT INTO `tb_file` VALUES (39, '娃娃菜.jpg', 'jpg', 52, 'http://localhost:8888/file/9c40d476f3d64ede80f0508bd8f33008.jpg', '47ae545eba9ce356947aea29562bede1', 0, 1);
INSERT INTO `tb_file` VALUES (40, '辣椒.jpg', 'jpg', 83, 'http://localhost:8888/file/630221073b1d4f169a1f0648af0c0dd4.jpg', 'fc7cd5bb3b1a7372c41e7933cc1439a5', 0, 1);
INSERT INTO `tb_file` VALUES (41, '黄瓜.jpg', 'jpg', 546, 'http://localhost:8888/file/8b7bb6779eab496fb2fc3760d7af4bcb.jpg', 'a071b39a200c853bff569727711802f6', 0, 1);
INSERT INTO `tb_file` VALUES (42, '胡萝卜.jpg', 'jpg', 63, 'http://localhost:8888/file/ab2e1102af99457b8c88df03403c1b69.jpg', '6238f86a62c8d38ad67c4f81e5567857', 0, 1);
INSERT INTO `tb_file` VALUES (43, '番茄.jpg', 'jpg', 60, 'http://localhost:8888/file/ee4f919d0c934c688edef89d125d3392.jpg', '62e358dd30dbf2f38ff488558deda3f7', 0, 1);
INSERT INTO `tb_file` VALUES (44, '豆芽.jpg', 'jpg', 120, 'http://localhost:8888/file/fc4d6d3533fb4771b0db72fe1f804606.jpg', '1de8812e27aad47cf262671a761141c1', 0, 1);
INSERT INTO `tb_file` VALUES (45, '四月是你的谎言.jpg', 'jpg', 957, 'http://localhost:8888/file/0700eea5f8cc4efd9669e520fd08d5bd.jpg', '0bf755483f42ab5cf95ccbb3b393baac', 0, 1);
INSERT INTO `tb_file` VALUES (46, '凹凸世界1.jpg', 'jpg', 223, 'http://localhost:8888/file/e3dafd046cef4f13bdd3537214163c1d.jpg', 'f9741847d0631299c1c967719f940c82', 0, 1);
INSERT INTO `tb_file` VALUES (47, '四月是你的谎言.jpg', 'jpg', 957, 'http://localhost:8888/file/0700eea5f8cc4efd9669e520fd08d5bd.jpg', '0bf755483f42ab5cf95ccbb3b393baac', 0, 1);
INSERT INTO `tb_file` VALUES (48, '凹凸世界1.jpg', 'jpg', 223, 'http://localhost:8888/file/e3dafd046cef4f13bdd3537214163c1d.jpg', 'f9741847d0631299c1c967719f940c82', 0, 1);
INSERT INTO `tb_file` VALUES (49, '四月是你的谎言.jpg', 'jpg', 957, 'http://localhost:8888/file/0700eea5f8cc4efd9669e520fd08d5bd.jpg', '0bf755483f42ab5cf95ccbb3b393baac', 0, 1);
INSERT INTO `tb_file` VALUES (50, '四月是你的谎言.jpg', 'jpg', 957, 'http://localhost:8888/file/0700eea5f8cc4efd9669e520fd08d5bd.jpg', '0bf755483f42ab5cf95ccbb3b393baac', 0, 1);
INSERT INTO `tb_file` VALUES (51, '西兰花.jpg', 'jpg', 96, 'http://localhost:8888/file/983abd730dcb457eb0559cac9a89457d.jpg', '4f5dd445966ec8ccc67674797014d5e1', 0, 1);
INSERT INTO `tb_file` VALUES (52, '辣椒.jpg', 'jpg', 83, 'http://localhost:8888/file/630221073b1d4f169a1f0648af0c0dd4.jpg', 'fc7cd5bb3b1a7372c41e7933cc1439a5', 0, 1);
INSERT INTO `tb_file` VALUES (53, '胡萝卜.jpg', 'jpg', 63, 'http://localhost:8888/file/ab2e1102af99457b8c88df03403c1b69.jpg', '6238f86a62c8d38ad67c4f81e5567857', 0, 1);
INSERT INTO `tb_file` VALUES (54, '胡萝卜.jpg', 'jpg', 63, 'http://localhost:8888/file/ab2e1102af99457b8c88df03403c1b69.jpg', '6238f86a62c8d38ad67c4f81e5567857', 0, 1);
INSERT INTO `tb_file` VALUES (55, '番茄.jpg', 'jpg', 60, 'http://localhost:8888/file/ee4f919d0c934c688edef89d125d3392.jpg', '62e358dd30dbf2f38ff488558deda3f7', 0, 1);
INSERT INTO `tb_file` VALUES (56, '黄瓜.jpg', 'jpg', 546, 'http://localhost:8888/file/8b7bb6779eab496fb2fc3760d7af4bcb.jpg', 'a071b39a200c853bff569727711802f6', 0, 1);
INSERT INTO `tb_file` VALUES (57, '505441.jpg', 'jpg', 1540, 'http://localhost:8888/file/080d12367bda4f3d9da1a2c9dc356ace.jpg', 'ad2f9e50fbc31bcd73ba170489b71ecf', 0, 1);
INSERT INTO `tb_file` VALUES (58, '土豆.jpg', 'jpg', 248, 'http://localhost:8888/file/118d41a28e6b44b3a67f600376df37ac.jpg', '1e685306b7b7ae2e5ac5920abd23a61b', 0, 1);
INSERT INTO `tb_file` VALUES (59, '土豆.jpg', 'jpg', 248, 'http://localhost:8888/file/118d41a28e6b44b3a67f600376df37ac.jpg', '1e685306b7b7ae2e5ac5920abd23a61b', 0, 1);
INSERT INTO `tb_file` VALUES (60, '西兰花.jpg', 'jpg', 96, 'http://localhost:8888/file/983abd730dcb457eb0559cac9a89457d.jpg', '4f5dd445966ec8ccc67674797014d5e1', 0, 1);

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `notice_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `notice_describe` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `notice_create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '创建者id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者名字',
  PRIMARY KEY (`notice_id`) USING BTREE,
  INDEX `创建者id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------
INSERT INTO `tb_notice` VALUES (101, '关于日光温室蓄放热原理与技术研究进展', '长期从事设施农业理论与技术研究，先后主持承担国家和省部级课题30余项，获国家科技进步二等奖1项、国家教学成果二等奖1项、省部级科技进步一、二等奖10项，出版《园艺设施学》《设施环境工程学》《温室建造结构》等专著10余部，发表学术论文400余篇，培养博硕士研究生200余人，为我国设施农业科技创新和人才培养做出突出贡献。', '2023-03-13 22:08:34', 1001, '李明');
INSERT INTO `tb_notice` VALUES (102, '北京市数字农业农村工作部署会', '目前，北京市数字农业农村工作在数字底座和基础支撑、农业产业数字化、乡村治理数字化、数字惠民等多个方面已开始取得成效。农业农村部信息中心监测数据显示，2022年北京市数字农业农村总体水平比2020年提升5.33个百分点。北京市农村地区固定宽带通达率和光纤网络行政村通达率均达到100%，涉农区菜田信息化应用覆盖率超30%。朝阳区、海淀区国家数字农业创新应用基地已经完成建设。', '2023-03-13 22:08:42', 1111, 'admin');
INSERT INTO `tb_notice` VALUES (132, '农垦系统继续开展带头扩种大豆油料行动', '新华社北京3月20日电（记者陈冬书、于文静）农业农村部农垦局近日印发《2023年农垦带头扩种大豆油料行动工作方案》，农垦将继续开展带头扩种大豆油料行动，着力从面积、单产、管理、辐射带动等方面挖潜力提单产增总产，持续提升大豆油料供给保障能力。\n\n　　这是记者20日从农业农村部了解到的消息。\n\n　　方案要求，农垦要通过优化布局、挖掘潜力、科学轮作等方式带头扩大大豆油料种植面积，多措并举提高单产水平。鼓励农垦种业企业与高校、科研院所等开展联合攻关，选育推广高产优质大豆油料新品种，制定完善大豆油料生产技术规程，推进大豆油料标准化生产。\n\n　　方案提出，农垦要开展社会化服务。降低生产成本，扩大农机服务半径，全方位满足地方新型农业经营主体和农户多样化的服务需求。发挥农垦农业专家、基层技术人员、农场职工技术优势，宣传推广大豆油料高产高效种植技术和模式，培训提升农民种植水平。\n\n　　方案鼓励支持农垦大豆油料加工企业扩大规模，带动高质高效大豆油料生产基地建设，着力打造产业集群，推动农垦大豆油料产业整体优化升级。\n\n　　据了解，2022年农业农村部在农垦系统组织实施了农垦带头扩种大豆油料行动。农垦当年大豆播种面积达到1677万亩，比上年增加475万亩；产量292万吨，比上年增加90万吨。目前，相关垦区正积极推进2023年种植任务落实。', '2023-03-20 15:49:18', 1111, 'admin');
INSERT INTO `tb_notice` VALUES (133, '刘国中在全国春季农业生产工作会议上强调 抓紧抓好粮食和重要农产品生产 确保加快建设农业强国良好开局', '新华社成都3月23日电 全国春季农业生产工作会议3月23日在四川省德阳市召开。中共中央政治局委员、国务院副总理刘国中出席会议并讲话。他强调，要深入学习贯彻习近平总书记关于保障粮食安全的系列重要指示精神，落实李强总理要求，狠抓责任、政策和工作落实，坚决完成今年农业生产各项目标任务，努力交出加快建设农业强国开局起步之年的合格答卷。\n\n　　刘国中指出，抓好今年农业生产意义重大、任务艰巨，必须树立大抓落实的导向、真抓实干的作风，推动各项工作任务真正落地见效。要严格落实粮食安全党政同责，强化政策支持引导，全面落实好各项稳产增产措施，确保粮食产量保持在1.3万亿斤以上。要加力扩种大豆油料，扎实抓好生猪和“菜篮子”工程，因地制宜加快构建多元化食物供给体系，提高其他重要农产品稳定安全供给水平。要以实施新一轮千亿斤粮食产能提升行动为重要抓手，聚焦耕地和种子两个要害，大力强化藏粮于地、藏粮于技，加快提升粮食产能，全方位夯实粮食安全根基。要加强统筹协调，全面抓好“三农”各项工作，特别是要巩固拓展好脱贫攻坚成果，坚决守住不发生规模性返贫的底线，确保全面推进乡村振兴不断取得实际成效。\n\n　　会前，刘国中先后到河南、山东和四川的春季农业生产工作一线进行调研。', '2023-03-20 15:56:11', 1111, 'admin');
INSERT INTO `tb_notice` VALUES (134, '农业农村部部署做好春季动物疫病防控工作', '本网讯 日前，农业农村部印发《关于做好春季动物疫病防控工作的通知》（以下简称《通知》），部署加强非洲猪瘟等重大动物疫病常态化防控和重点人畜共患病源头防控，维护畜牧业生产安全、公共卫生安全和国家生物安全。 \n\n　　《通知》指出，春季是动物疫病高发期，各地要高度重视，逐级压实防控责任，逐项明确各环节监管责任单位和职责分工。进一步完善部门联防联控机制，充分发挥各级应急指挥部作用，强化部门协作配合，加强动物防疫全链条监管，严格疫情处置、调运监管、溯源追踪和案件查处，形成防控合力。督促指导生产经营主体提高防疫意识，承担防疫主体责任，落实动物疫病免疫、检测、洗消等工作，及时发现和处置风险。 \n\n　　《通知》强调，要切实强化动物疫病排查和入场采样监测，及时掌握疫病流行态势。严格疫情报告制度，按规定及时报告监测信息。会同有关部门加强境外特别是周边国家和地区动物疫情监测，强化互市贸易、进口畜禽及其产品的检疫监管，打击走私行为。按照2023年“清朗”系列专项行动计划，会同有关部门坚决查处恶意散布虚假动物疫情信息、牟利套利等行为，维护正常生产经营秩序。 \n\n　　《通知》要求，各地要按照全国动物疫病强制免疫指导意见，制定实施本辖区的强制免疫计划。督促规模养殖场做好常年程序化免疫，指导散养户落实好春秋两季集中免疫与定期补免，实现高致病性禽流感、口蹄疫等重大动物疫病“应免尽免”，确保免疫抗体水平达到规定标准。积极推进“先打后补”，进一步完善强制免疫和补助政策实施机制。加强信息调度，及时报告集中免疫等工作进展。强化物资储备和调配，确保动物防疫物资质量合格、数量充足、运输畅通，满足防疫工作需求。 ', '2023-03-21 15:56:44', 1111, 'admin');
INSERT INTO `tb_notice` VALUES (135, '《2023年春耕生产专刊》出版', '本网讯　时值春季生产关键时期，在农业农村部种植业管理司指导和全国农业技术推广服务中心支持下，中国农村杂志社于近日编辑出版《农民文摘·2023年春耕生产专刊》，免费赠阅全国粮油生产重点地区农技部门和种植大户，同时在中国农村网制作专题并利用“微观三农”微信公众号将专刊电子版进行全网推送，帮助各级干部和广大农民准确了解掌握中央三农工作决策部署，推动各项政策措施落地见效，指导农民有序开展春耕春管，为丰产增收打下基础。\n\n　　专刊内容包括卷首、决策部署、部门行动、农资安全、技术指南和地方实践六大板块，刊发了全国春季农业生产工作重要部署和新一轮千亿斤粮食产能提升行动相关解读，介绍了国家稳定大豆生产一揽子支持政策、农业农村部等四部门印发的科学抗旱春管预案、全国农业综合行政执法“稳粮保供”专项行动等政策措施，还刊发了假劣肥料辨别知识、2023年百万农民科学安全用药培训和主要粮油作物的病虫草害防治、灌溉施肥技术方案等内容，并展示了一些地方春耕备耕工作的创新实践。', '2023-03-21 15:57:24', 1111, 'admin');
INSERT INTO `tb_notice` VALUES (136, '省级春耕化肥下摆到位进度超八成', '本网讯　据农业农村部农资保供专班调度，截至3月14日，省、市、县三级春耕化肥下摆到位率分别为81.4%、74.2%、73.3%，周环比提高8.7、3.5、4.5个百分点，比去年同期快6.8、9、4.5个百分点。其中，浙江、重庆、江苏等地春耕用肥已全面到位，新疆、青海、宁夏等地到位进度近95%，陕西、西藏、上海、吉林、青海、山西等地下摆进度明显加快。', '2023-03-22 15:58:08', 1111, 'admin');
INSERT INTO `tb_notice` VALUES (137, '国家推出稳定2023年大豆生产 一揽子支持政策', '本网讯　党中央、国务院高度重视大豆生产，习近平总书记多次作出重要指示批示，强调：“要实打实地调整结构，扩种大豆和油料，见到可考核的成效”。今年中央一号文件明确提出，加力扩种大豆油料，深入推进大豆和油料产能提升工程。为贯彻落实习近平总书记重要指示精神和中央决策部署，稳定今年大豆生产，保障种豆农民合理收益，中央农办协调推动农业农村部、国家发展改革委、财政部、国家粮食和储备局等部门，统筹考虑大豆市场供需形势、比较效益和农民种植意愿等因素，出台一揽子稳定大豆生产支持政策措施，形成补贴、保险、收储协同发力的一套政策“组合拳”，多措并举、综合施策，释放明确信号。\n　　一是完善玉米大豆生产者补贴政策，增加补贴总额，指导东北四省区合理确定玉米大豆补贴标准，调高大豆补贴标准，并着力加大高油高产大豆支持，促进稳定东北大豆生产。\n　　二是加大产粮大县奖励力度，引导大豆主产区发展大豆生产，持续巩固和扩大稳粮扩豆成效。加大大豆金融信贷支持，支持大豆完全成本保险和种植收入保险试点县扩大覆盖面。持续支持建设大豆国家现代农业产业园、产业集群、产业强镇。\n　　三是扩大东北地区耕地轮作实施面积，支持开展粮豆轮作，促进用地养地相结合，探索科学有效轮作模式，引导农民合理安排种植结构扩种大豆。\n　　四是扩大黄淮海、西南、长江中下游和西北地区大豆玉米带状复合种植示范面积，鼓励地方探索发展幼龄果树、高粱等作物套种大豆种植模式。\n　　五是加强技术指导服务，指导农民做好大豆春耕备耕工作。对906个大豆生产县形成“一县一策”的综合性提单产解决方案，聚焦100个重点县整建制实施大豆单产提升行动，集成推广高产高油品种和良法良机，带动大豆大面积稳产增产、提质增效。\n　　六是引导家庭农场、农民合作社、农业企业等经营主体，承担大豆生产。组织一批专业化、社会化服务主体，通过全程托管或环节托管，为大豆生产提供低成本、便利化、全方位的服务。\n　　七是加快组织大豆收储，指导中储粮集团公司在黑龙江、内蒙古两个主产区新增国产大豆收购计划，加大收储力度，发挥市场引导作用。\n　　八是积极引导中储粮集团、中粮集团等国有大型企业及规模以上大豆加工企业，与主产区市县对接，做好大豆产销衔接。\n　　九是加密大豆生产和市场调度，及时了解掌握大豆生产、收储进度和价格情况，及时发布信息合理引导市场预期。\n　　十是压紧压实地方责任，明确2023年大豆生产目标，并纳入省级党委和政府落实耕地保护和粮食安全党政同责考核。\n　　农业农村部要求各级农业农村部门要继续协调对接，增加投入、整合资金重点支持大豆生产；要加快项目资金落实，做好政策宣传解读，多措并举释放明确信号，提高农民种豆积极性，引导农民合理安排种植结构，稳定大豆种植面积，落实增产增效关键技术，力争今年大豆油料扩种取得新的成效。', '2023-03-24 15:58:33', 1111, 'admin');
INSERT INTO `tb_notice` VALUES (138, '全国各地掀起春管热潮', '本网讯  农谚讲“惊蛰麦返青，农夫闲转忙”。目前，江苏、安徽等地小麦陆续开始起身拔节，河南、山东、山西、陕西等地小麦已全面返青，河北除北部唐山、保定、廊坊外也大面积返青，进入春季田间管理关键时期。各地因苗因墒推进分类田管，科学追施返青肥、浇灌返青水，迅速掀起春季田管热潮。近期，农业农村部组织各级农技人员查苗情、查墒情、查虫情，据专家分析，全国冬小麦长势总体较好，好于大面积晚播的上年，也好于常年。河北、山东、陕西等地前期受寒旱叠加等因素影响，一些小麦叶片出现枯黄，但经过实地查看，绝大部分小麦生长点和根系未受影响，随着气温回暖已经返青，可逐步恢复正常。\n　　现在距冬小麦大面积收获还有3个月左右，夺取丰收还要过春旱、“倒春寒”、“干热风”、倒伏、病虫害等关口。据气象部门预测，春季北方冬麦区大部降水偏少，华北、胶东半岛等地可能出现春旱，气温起伏大、“倒春寒”“干热风”等灾害风险较高，同时小麦条锈病、赤霉病等重大病虫害可能偏重发生。针对这一情况，农业农村部牢固树立抗灾夺丰收的思想，正组织各地毫不放松抓好春季田间管理，努力赢得夏粮丰收主动权。一是加强分类管理。对三类弱苗和受冻麦田，抓住返青起身期，增施肥促苗早发快长；对旺长麦田，推迟肥水、适当镇压；对一二类苗，坚持促控结合，肥水后移至拔节期，保苗稳健生长。二是狠抓防灾减灾。密切关注天气变化，及时发布预警信息，提早做好抗旱、防“倒春寒”各项准备工作。抓好小麦条锈病、赤霉病等重大病虫害监测防控，大力推广统防统治，减轻病虫危害。三是加强技术指导。发挥科技小分队作用，组织专家驻县驻乡、进村入户，深入田间地头查苗情、查墒情，开展巡回指导。继续开展冬小麦田间管理大培训，通过《春耕大师课》等在线指导答疑，落实春季田管关键措施。', '2023-03-24 15:59:30', 1111, 'admin');
INSERT INTO `tb_notice` VALUES (139, '农业农村部部署2023年水产绿色健康 养殖技术推广“五大行动”', '本网讯 近日，农业农村部办公厅印发《关于做好2023年水产绿色健康养殖技术推广“五大行动”工作的通知》，部署开展2023年生态健康养殖模式示范推广、养殖尾水治理模式推广、水产养殖用药减量、配合饲料替代幼杂鱼和水产种业质量提升等水产绿色健康养殖技术推广“五大行动”（以下简称“五大行动”）。 \n\n　　农业农村部自2020年启动实施“五大行动”以来，取得显著成效。截至2022年底，全国共培育“五大行动”骨干基地1265个，面积771万亩，推广水产新品种100个，骨干基地基本实现生态健康养殖模式全覆盖、养殖尾水循环综合利用或达标排放全覆盖，水产养殖用兽药总使用量同比减少9%，配合饲料替代率平均达到84%。“五大行动”已成为渔业绿色高质量发展的重要抓手和响亮名片。 \n\n　　2023年，农业农村部结合贯彻落实大食物观、种业振兴行动、发展设施农业等最新要求，对“五大行动”进行了调整优化。以提质量、上水平、强标准为着力点，以渔业绿色高质量发展和现代化建设为目标，将示范推广一批水产养殖品种和技术，集成制定一批良种良法技术规范，支持尾水处理设施升级改造，指导养殖生产者科学规范使用水产养殖用兽药，不断提高配合饲料替代率。 ', '2023-03-24 16:00:31', 1111, 'admin');
INSERT INTO `tb_notice` VALUES (140, '全国“农机3·15”活动举行', '　近日，全国“农机3·15”消费者权益日主会场活动在山西省太原市举行。此次活动以“提质强农护农，助力春管春耕”为主题，旨在深入贯彻今年中央一号文件精神，落实“全国春季田管暨春耕备耕工作视频会议”部署要求，动员各方力量，加强政策宣传，推动技术到田，做好春管春耕各项工作，维护农机所有者、使用者和生产者的合法权益，为奋力夺取夏季粮油丰收作出贡献。\n\n　　围绕上述目标，主会场将全国“农机3·15”活动与山西省春季农机化生产田间演示活动相融合，向参与活动的农民发放农机购机指南、维权手册、投诉服务卡等宣传材料，并向农机用户提供农机投诉受理、农机化政策法规和农机使用、维修技术咨询，山西省农机产业集群相关企业也在现场进行了粮食生产机械、智能化装备现场演示。活动同期，还举办了“2023农机化发展高峰论坛”。\n\n　　除主会场外，今年的全国“农机3·15”消费者权益日活动还在山东省临沂市设立分会场。该系列活动由农业农村部农业机械化总站联合中国农业机械化协会、山西省农业农村厅、山东省农业农村厅等单位主办，山西省农业机械发展中心、山东省农业机械发展中心等单位承办。\n\n　　农业农村部农业机械化总站负责人表示，今年是全面贯彻党的二十大精神的开局之年，抓好粮食生产意义重大。我们要深入贯彻中央农村工作会议精神和全国农业农村厅局长会议部署，大力推广先进适用安全的农业机械装备和农机化技术，提高农机产品质量和作业质量，充分发挥机械化增产减损、节本增效作用，为夯实大国粮仓根基，端牢中国人的饭碗，加快建设农业强国，提供强有力的技术装备支撑。\n\n　　为全面推进农业机械质量提升、更好地保护农民利益，农业农村部农业机械化管理司近期通报了2022年自走式小麦联合收割机质量调查情况。该调查由农业农村部农业机械化总站与9个省（区）鉴定、推广机构联合，对9家生产企业的17个型号1000台产品展开调查。结果显示，用户对水稻收割机总体满意度评价得分为83.31分，属于“满意”级别。针对小麦联合收割机质量调查中发现的问题，将向生产企业发送整改通知，推动企业强化质量安全意识，增强诚信经营理念和社会责任，积极采取有效措施进行整改。2023年将继续开展主粮生产地区的玉米联合收割机质量调查。部分省（区、市）也将在“农机3·15”活动期间发布2022年农机质量调查结果，并陆续启动今年的质量调查任务。\n\n　　本次活动还向广大农机用户发出了“提质强农护农，助力春管春耕”倡议，一大批农机生产的龙头企业向社会作出“提质强农护农，助力春管春耕”承诺。各地农机推广、鉴定以及行业组织，强化质量责任担当，提升公共服务能力，做好农机鉴定、技术推广、质量认证、质量调查、投诉监督、安全监理等工作，用助农、护农实际行动保障春耕生产，助力农业稳产增产、农民稳定增收、农村稳定安宁。\n\n　　据了解，全国“农机3·15”活动已连续举办了多年，形成了部省市县四级联动模式。今年全国30多个省（区、市）、新疆生产建设兵团和北大荒农垦集团等农机部门通过线上和线下方式同步开展相关活动，为农民办实事。', '2023-04-01 16:02:44', 1111, 'admin');
INSERT INTO `tb_notice` VALUES (141, '农业农村部部署做好春季动物疫病防控工作', '本网讯 日前，农业农村部印发《关于做好春季动物疫病防控工作的通知》（以下简称《通知》），部署加强非洲猪瘟等重大动物疫病常态化防控和重点人畜共患病源头防控，维护畜牧业生产安全、公共卫生安全和国家生物安全。 \n\n　　《通知》指出，春季是动物疫病高发期，各地要高度重视，逐级压实防控责任，逐项明确各环节监管责任单位和职责分工。进一步完善部门联防联控机制，充分发挥各级应急指挥部作用，强化部门协作配合，加强动物防疫全链条监管，严格疫情处置、调运监管、溯源追踪和案件查处，形成防控合力。督促指导生产经营主体提高防疫意识，承担防疫主体责任，落实动物疫病免疫、检测、洗消等工作，及时发现和处置风险。 \n\n　　《通知》强调，要切实强化动物疫病排查和入场采样监测，及时掌握疫病流行态势。严格疫情报告制度，按规定及时报告监测信息。会同有关部门加强境外特别是周边国家和地区动物疫情监测，强化互市贸易、进口畜禽及其产品的检疫监管，打击走私行为。按照2023年“清朗”系列专项行动计划，会同有关部门坚决查处恶意散布虚假动物疫情信息、牟利套利等行为，维护正常生产经营秩序。 \n\n　　《通知》要求，各地要按照全国动物疫病强制免疫指导意见，制定实施本辖区的强制免疫计划。督促规模养殖场做好常年程序化免疫，指导散养户落实好春秋两季集中免疫与定期补免，实现高致病性禽流感、口蹄疫等重大动物疫病“应免尽免”，确保免疫抗体水平达到规定标准。积极推进“先打后补”，进一步完善强制免疫和补助政策实施机制。加强信息调度，及时报告集中免疫等工作进展。强化物资储备和调配，确保动物防疫物资质量合格、数量充足、运输畅通，满足防疫工作需求。 ', '2023-04-02 16:03:37', 1111, 'admin');
INSERT INTO `tb_notice` VALUES (142, '农业农村部首次发布《国家农作物优良品种推广目录》', '本网讯 近日，农业农村部发布《国家农作物优良品种推广目录（2023年）》，重点推介10种农作物、241个优良品种，旨在加快推广应用步伐，促进大面积生产单产水平提升。 \n\n　　该目录从当前农业生产紧迫需求出发，聚焦“米袋子”（水稻、小麦、玉米）、“油瓶子”（大豆、油菜、花生）、“菜篮子”（马铃薯、大白菜、结球甘蓝）及重要战略农产品（棉花），按照品种推广应用规律，将推广品种划分为骨干型、成长型、苗头型和特专型等四种类型，推出较为完整、递次推进的品种推广梯队，引导推动品种更新换代。此次共推介水稻品种36个、小麦品种29个、玉米品种32个、大豆品种22个、油菜品种26个、花生品种22个、棉花品种13个、马铃薯品种20个、大白菜品种21个、结球甘蓝品种20个，涉及骨干型品种80个、成长型品种66个、苗头型品种64个、特专型品种31个。 \n\n　　近年来，农业农村部通过严格品种审定管理、强化知识产权保护等措施，加快解决品种同质化问题，2022年国家级品种审定数量由快速增长开始转向平稳回落，水稻品种审定通过率26%，下降了15个百分点，玉米品种审定通过率23%，下降了38个百分点。同时，依托开展品种展示评价、遴选推介优良品种，定期编制发布国家农作物优良品种推广目录，帮助指导农民科学选种、正确用种，强化品种推广全生命周期管理，加快推动品种更新换代。 ', '2023-04-03 16:04:09', 1111, 'admin');
INSERT INTO `tb_notice` VALUES (143, '农业农村部等四部门联合印发 《科学抗旱春管夺夏季粮油丰收预案》', '　本网讯　为贯彻落实党的二十大部署和中央经济工作会议、中央农村工作会议以及中央一号文件精神，确保粮食和重要农产品稳定安全供给，日前，农业农村部会同水利部、应急管理部、中国气象局制定了《科学抗旱春管夺夏季粮油丰收预案》（以下简称《预案》），要求各地要坚持底线思维，增强风险意识和危机意识，充分估计干旱可能对夏季粮油生产的不利影响，提早落实防范措施，努力保障农作物灌溉用水，促进小麦、油菜正常生长发育，全力以赴夺取夏季粮油丰收。\n　　《预案》指出，2022年入冬以来，我国降水总体偏少，预计今年春季全国大部气温偏高，部分地区可能发生春旱，抗旱春管夺夏季粮油丰收任务艰巨。各地要积极有效应对干旱，切实减轻灾害损失。一是做好各项抗旱准备。储备抗旱水源，及时修缮建设水利设施，及早做好抗旱机井检修，农灌渠道清淤等工作，抓住有利时机做好人工增雨作业；备足抗旱物资，做好抗旱设备准备，搞好种子、肥料、农药、农膜和柴油等农业生产救灾物资储备和调剂调运；细化抗旱预案，摸清基本情况，精准对接灌区用水需求，分区域、分苗情、分灌溉条件制定抗旱春管预案；建好抗旱队伍，加强社会化服务组织摸底调查和动员，开展大规模技术培训。二是强化旱情预报预警和会商研判。加强监测预报，分区域、分类型对小麦、油菜开展标准化、精细化气象服务，加强灾害性天气监测预报，加密农情、墒情、旱情监测；密切会商研判，加强苗情、雨情、水情、墒情、旱情、灾情等信息共享共用，对干旱等农业灾害发生趋势开展精准评估；强化预警服务，完善农村基层气象防灾减灾组织体系，开展点对点灾害预警服务，推进信息进村入户。三是落细冬小麦抗旱促生长措施。返青期墒情不足的地块采取小水细灌方式，避免大水漫灌，拔节期表墒不足的地块，千方百计扩大灌溉面积，能浇一亩是一亩，抽穗扬花至灌浆期要浇好扬花灌浆水；对浇水补墒的地块，采取浅中耕，减少蒸发，对无灌溉条件的旱地小麦，集成推广叶面喷施尿素、抗旱保水剂等措施，提高作物抗旱能力；因地制宜推广节水灌溉技术，减少水分流失，扩大浇灌面积；统筹防好“倒春寒”等灾害，低温来临前及时浇水、以水调温，冻害发生后，及时追施适量氮肥或叶面喷施磷酸二氢钾，适时浇水。四是落细冬油菜抗旱促生长措施。浇水抗旱，千方百计调度水源灌溉，没有灌溉水源的油菜田，可叶面喷施黄腐酸，增强植株抗逆能力；中耕培土，抓住封行的时机，中耕培土，清除杂草，增强植株抗倒伏能力；早施薹肥，确保薹期养分供应；防病治虫，紧盯菌核病等重大病虫害，及时喷药防治。\n　　《预案》强调，强化责任落实，要把抗旱春管夺夏季粮油丰收作为落实粮食安全党政同责的重要内容来抓，把责任落实到县乡、落实到人，把抗旱措施落实到田。做好技术指导，小麦油菜生产关键期和灾害重发期，各级农业农村部门的力量都要压到一线，推进措施落实到户到田，切实帮助农民解决实际问题。聚合部门力量，各地农业农村、水利、应急、气象等部门要明确职责分工，加强协调配合，形成工作合力。加强宣传引导，充分利用网络、电视、报纸等平台，主动引导和正面宣传抗旱春管工作，营造良好舆论氛围，推动抗旱春管夺夏季粮油丰收工作顺利开展。', '2023-04-03 16:04:36', 1111, 'admin');
INSERT INTO `tb_notice` VALUES (144, '山西省2023年大豆、油料支持政策来了', '从山西省农业农村厅传来消息：为进一步调动农民种植大豆、油料积极性，中央、省财政安排专项资金，对大豆、油料种植者发放一次性补贴。 \n\n　　种植大豆、油料一次性补贴。2023年，中央、省财政安排补贴资金对大豆、油料种植者发放一次性补贴。大豆种植者每亩补贴20元、油料作物种植者每亩补贴10元。 \n\n　　大豆玉米复合种植。中央、省财政安排补助资金，支持74个县推广大豆玉米带状复合种植技术，对大豆玉米带状复合种植者每亩补助200元。 ', '2023-05-10 21:05:48', 1005, '李响');
INSERT INTO `tb_notice` VALUES (145, '机械赋能绘就“粮”辰美景', '春播时节，海北藏族自治州门源回族自治县抢抓天气晴好、气温回暖的有利时机，积极开展选种、平整土地、耕作、施肥，田地里机械轰鸣，一派“春早人勤忙农耕”的忙碌景象。  \n\n　　4月19日，记者走进浩门镇土墩湾田间地头，只见一辆辆大中小型旋耕机、播种机“轰隆轰隆”在田间穿梭不停，村民在田间地头轻轻松松地拿着工具“打下手”，全程机械化作业不仅让春播生产跑出了“加速度”，也让农民实现了“种田一身轻”。“这几天我们合作社正在加紧进行土地深耕作业，用不了几天，村里的地就能全部翻耕完成。”门源浩青生态农牧业专业合作社负责人李维军说，“过去这些费时费力的农活，现在几台拖拉机就能轻松搞定，不仅节省人工，还不误农时”。  \n\n　　春风习习，广袤的田野上一辆辆农机忙碌地“翻金覆银”，马达声、打趣声、欢笑声在田野中荡漾，在远处雪山的映衬下，呈现一派农机奔腾“唱”和谐的美好景象。  ', '2023-05-10 21:06:19', 1005, '李响');

-- ----------------------------
-- Table structure for tb_produce
-- ----------------------------
DROP TABLE IF EXISTS `tb_produce`;
CREATE TABLE `tb_produce`  (
  `produce_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '农产品id',
  `produce_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `produce_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `produce_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `produce_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `produce_create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `user_id` int(0) NOT NULL COMMENT '发布者id',
  PRIMARY KEY (`produce_id`) USING BTREE,
  INDEX `用户ID`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10020 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_produce
-- ----------------------------
INSERT INTO `tb_produce` VALUES (10001, '西兰花', '因为西蓝花原产于西方欧洲地中海沿岸的意大利一带，外观又像花，所以被称为“西蓝花”。因以采带花蕾的嫩茎供食，故名嫩茎花椰菜，又因与花椰菜相似而成球状花蕾群，呈绿色，故又名西蓝花。', 6.64, 'http://localhost:8888/file/983abd730dcb457eb0559cac9a89457d.jpg', '2023-04-03 14:20:03', 1001);
INSERT INTO `tb_produce` VALUES (10002, '土豆', '“马铃薯”因酷似马铃铛而得名，此称呼最早见于康熙年间的《松溪县志食货》。中国东北、河北称土豆，华北称山药蛋，西北和两湖地区称洋芋，江浙一带称洋番芋或洋山芋，广东称之为薯仔，粤东一带称荷兰薯，闽东地区则称之为番仔薯，在鄂西北一带被称为“土豆”。', 2.30, 'http://localhost:8888/file/118d41a28e6b44b3a67f600376df37ac.jpg', '2023-04-03 14:20:25', 1002);
INSERT INTO `tb_produce` VALUES (10005, '娃娃菜', '娃娃菜也富含胡萝卜素和微量元素锌，对儿童的智力发育很有帮助。娃娃菜的药用价值很高，中医认为其性微寒无毒，经常食用具有清热解毒之功效。娃娃菜营养丰富，味甘性微寒，常食可清热解烦，利小便；含有人体必需的蛋白质、脂肪、还含有大量的粗纤维。', 1.63, 'http://localhost:8888/file/9c40d476f3d64ede80f0508bd8f33008.jpg', '2023-04-03 15:25:41', 1002);
INSERT INTO `tb_produce` VALUES (10006, '胡萝卜', '胡萝卜，是伞形科胡萝卜属一年生或二年生草本植物。根肉质，长圆锥形，呈橙红色或黄色；茎单生，全株被白色粗硬毛；叶片长圆形，先端尖锐；茎生叶近无柄，有叶鞘，末回裂片小或细长；花通常白色，有时带淡红色；花柄不等长；果实圆卵形，棱上有白色刺毛。花期5-7月。', 6.23, 'http://localhost:8888/file/ab2e1102af99457b8c88df03403c1b69.jpg', '2023-04-03 14:21:30', 1003);
INSERT INTO `tb_produce` VALUES (10007, '番茄', '番茄含有丰富的胡萝卜素、维生素C和B族维生素，营养价值高，既可作为蔬菜也可作为水果，既可生食也可熟食；番茄可用来加工制作番茄酱、番茄汁和番茄丁等；番茄富含番茄红素，具有很强的抗氧化能力，能降低血压、清热解毒之效，还可提取作为保健品。', 2.66, 'http://localhost:8888/file/ee4f919d0c934c688edef89d125d3392.jpg', '2023-04-03 14:44:17', 1004);
INSERT INTO `tb_produce` VALUES (10008, '黄瓜', '黄瓜，葫芦科甜瓜属一年生攀援草本植物，茎部细长和糙硬毛；叶片呈宽卵状心形或裂片三角形；花呈微柔毛黄白色；果实长圆形或圆柱形熟时黄绿色；种子呈狭卵形白色；花果期为夏季。 黄瓜是汉朝张骞出使西域时带回来的，后赵王朝的建立者石勒，一律严禁出现“胡”字，胡瓜更名为黄瓜。', 3.54, 'http://localhost:8888/file/8b7bb6779eab496fb2fc3760d7af4bcb.jpg', '2023-04-03 14:44:18', 1004);
INSERT INTO `tb_produce` VALUES (10009, '豆芽', '豆芽，也称芽苗菜，又名巧芽、豆芽菜、如意菜、掐菜、银芽、银针、银苗、芽心、大豆芽、清水豆芽，是各种谷类、豆类、树类的种子培育出可以食用的“芽菜”，也称“活体蔬菜”。品种丰富，营养全面，是常见的蔬菜。食用的主要部分为下胚轴。', 0.23, 'http://localhost:8888/file/fc4d6d3533fb4771b0db72fe1f804606.jpg', '2023-04-03 14:54:53', 1004);
INSERT INTO `tb_produce` VALUES (10010, '辣椒', '辣椒是茄科辣椒属的一年生草本植物，其根系不发达，茎直立；单叶互生，卵圆形，叶面光滑；花单生或簇生，多为白色；果面平滑或皱褶，具光泽；果实呈扁圆、圆球、圆锥或线形，种子为淡黄色的扁肾形；花果期５-11月。', 4.21, 'http://localhost:8888/file/630221073b1d4f169a1f0648af0c0dd4.jpg', '2023-04-03 15:26:35', 1002);
INSERT INTO `tb_produce` VALUES (10011, '娃娃菜', '娃娃菜也富含胡萝卜素和微量元素锌，对儿童的智力发育很有帮助。娃娃菜的药用价值很高，中医认为其性微寒无毒，经常食用具有清热解毒之功效。娃娃菜营养丰富，味甘性微寒，常食可清热解烦，利小便；含有人体必需的蛋白质、脂肪、还含有大量的粗纤维。', 1.63, 'http://localhost:8888/file/9c40d476f3d64ede80f0508bd8f33008.jpg', '2023-04-03 15:25:43', 1003);
INSERT INTO `tb_produce` VALUES (10012, '番茄', '番茄含有丰富的胡萝卜素、维生素C和B族维生素，营养价值高，既可作为蔬菜也可作为水果，既可生食也可熟食；番茄可用来加工制作番茄酱、番茄汁和番茄丁等；番茄富含番茄红素，具有很强的抗氧化能力，能降低血压、清热解毒之效，还可提取作为保健品。', 6.23, 'http://localhost:8888/file/ee4f919d0c934c688edef89d125d3392.jpg', '2023-04-03 14:44:27', 1004);
INSERT INTO `tb_produce` VALUES (10013, '豆芽', '豆芽，也称芽苗菜，又名巧芽、豆芽菜、如意菜、掐菜、银芽、银针、银苗、芽心、大豆芽、清水豆芽，是各种谷类、豆类、树类的种子培育出可以食用的“芽菜”，也称“活体蔬菜”。品种丰富，营养全面，是常见的蔬菜。食用的主要部分为下胚轴。', 0.23, 'http://localhost:8888/file/fc4d6d3533fb4771b0db72fe1f804606.jpg', '2023-04-03 14:54:50', 1001);
INSERT INTO `tb_produce` VALUES (10014, '土豆', '“马铃薯”因酷似马铃铛而得名，此称呼最早见于康熙年间的《松溪县志食货》。中国东北、河北称土豆，华北称山药蛋，西北和两湖地区称洋芋，江浙一带称洋番芋或洋山芋，广东称之为薯仔，粤东一带称荷兰薯，闽东地区则称之为番仔薯，在鄂西北一带被称为“土豆”。', 2.30, 'http://localhost:8888/file/118d41a28e6b44b3a67f600376df37ac.jpg', '2023-04-03 14:44:28', 1004);
INSERT INTO `tb_produce` VALUES (10015, '西兰花', '因为西蓝花原产于西方欧洲地中海沿岸的意大利一带，外观又像花，所以被称为“西蓝花”。因以采带花蕾的嫩茎供食，故名嫩茎花椰菜，又因与花椰菜相似而成球状花蕾群，呈绿色，故又名西蓝花。', 6.64, 'http://localhost:8888/file/983abd730dcb457eb0559cac9a89457d.jpg', '2023-04-03 14:44:32', 1003);
INSERT INTO `tb_produce` VALUES (10019, '土豆', '生产于江西南昌', 2.30, 'http://localhost:8888/file/118d41a28e6b44b3a67f600376df37ac.jpg', '2023-05-24 21:31:45', 1001);
INSERT INTO `tb_produce` VALUES (10020, '西兰花', '这里的西兰花特别好吃', 3.10, 'http://localhost:8888/file/983abd730dcb457eb0559cac9a89457d.jpg', '2023-05-25 22:49:22', 2027);

-- ----------------------------
-- Table structure for tb_purchase
-- ----------------------------
DROP TABLE IF EXISTS `tb_purchase`;
CREATE TABLE `tb_purchase`  (
  `purchase_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `purchase_buyer_id` int(0) NULL DEFAULT NULL COMMENT '买方Id',
  `purchase_produce_id` int(0) NULL DEFAULT NULL COMMENT '商品Id',
  `purchase_num` float(255, 2) NULL DEFAULT NULL COMMENT '数量',
  `purchase_total_price` float(255, 2) NULL DEFAULT NULL COMMENT '总价',
  `purchase_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `purchase_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `purchase_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '下单时间',
  `purchase_active` int(0) NULL DEFAULT 0 COMMENT '是否下单【0未下单  1已下单】',
  `purchase_delivery` int(0) NULL DEFAULT 0 COMMENT '是否配送【0未配送  1已配送】',
  `purchase_receipt` int(0) NULL DEFAULT 0 COMMENT '是否确认收货【0未收货  1已收货】',
  PRIMARY KEY (`purchase_id`) USING BTREE,
  INDEX `买方ID`(`purchase_buyer_id`) USING BTREE,
  INDEX `农产品ID`(`purchase_produce_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000014 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_purchase
-- ----------------------------
INSERT INTO `tb_purchase` VALUES (1000001, 1001, 10002, 3.00, 6.90, '我家住在八里屯', '最好使用顺丰速递运', '2023-04-10 22:06:37', 1, 1, 0);
INSERT INTO `tb_purchase` VALUES (1000002, 1003, 10011, 1.00, 6.64, '我家住在八里屯', NULL, '2023-04-12 21:21:07', 0, 0, 0);
INSERT INTO `tb_purchase` VALUES (1000003, 1002, 10009, 5.00, 8.15, '我家住在八里屯', NULL, '2023-05-03 21:27:41', 1, 1, 1);
INSERT INTO `tb_purchase` VALUES (1000006, 1001, 10012, 2.00, NULL, '我家住在八里屯', NULL, '2023-04-10 22:43:03', 0, 0, 0);
INSERT INTO `tb_purchase` VALUES (1000007, 1005, 10007, 5.00, 13.30, '我家住在八里屯', NULL, '2023-04-10 21:57:46', 1, 0, 0);
INSERT INTO `tb_purchase` VALUES (1000008, 1002, 10006, 2.00, 12.46, '我家住在八里屯', NULL, '2023-04-10 21:57:47', 0, 0, 0);
INSERT INTO `tb_purchase` VALUES (1000009, 1004, 10005, 2.30, 3.75, '浙江温州', NULL, '2023-05-03 21:28:04', 0, 0, 0);
INSERT INTO `tb_purchase` VALUES (1000010, 1001, 10007, 2.30, 3.75, '北京东路', NULL, '2023-04-11 21:33:48', 0, 0, 0);
INSERT INTO `tb_purchase` VALUES (1000011, 1001, 10001, 5.20, 34.53, '东北澡堂', NULL, '2023-05-03 21:27:55', 1, 1, 1);
INSERT INTO `tb_purchase` VALUES (1000012, 1019, 10005, 2.00, 3.26, '石家庄', NULL, '2023-04-12 23:03:58', 1, 1, 1);

-- ----------------------------
-- Table structure for tb_scene
-- ----------------------------
DROP TABLE IF EXISTS `tb_scene`;
CREATE TABLE `tb_scene`  (
  `scene_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '景色id',
  `scene_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `scene_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `scene_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地点',
  `scene_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `scene_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `scene_policies` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优待政策',
  `scene_service_facility` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务设施',
  PRIMARY KEY (`scene_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_scene
-- ----------------------------
INSERT INTO `tb_scene` VALUES (101, '婺源篁岭', '婺源篁岭旅游度假区是婺源旅游的浓缩，集古村落、古树群、梯田花海、民俗晒秋为一体的最美乡村景致。篁岭旅游不受季节影响，春观油菜花海、夏戏峡谷溯溪、秋赏古村晒秋、冬品民俗度假。在篁岭，与“晒秋”同样摄人心魂的是水墨梯田。篁岭梯田被网友评为“全球十大最美梯田”。', '江西省上饶市婺源县', 0.00, 'http://localhost:8888/file/0dbf844cf2c9421fb9b329cf5b1c94e9.jpg', '儿童：身高1.2米（含）以下，免费；身高1.2米（不含）至1.5米（含），优惠\r\n老人：65周岁（含）以上老人持有效证件 ，免费；60周岁（含）至65周岁（不含）的老年人持有效证件 ，优惠\r\n学生：18周岁（含）~26周岁（不含）全日制本科（含）及以下的学生凭学生证，优惠\r\n残疾人：持有效证件 ，免费\r\n现役军人：持有效证件 ，免费\r\n带团导游、旅行社经理：凭领队证、国家导游有效IC卡证（国导证）、国家颁发的旅行社总经理资格证者公务出行，带团或跟团。，免费\r\n随团司机：随团司机凭A1类驾照客运驾驶证者（带团）；持本人有效证件在售票窗口办理免票手续。，免费\r\n记者：持有省级以上新闻总署或广电总局颁发的新闻记者证 ，免费\r\n艺术家：省级以上画家、摄影家证者 ，免费\r\n补充说明：以上为各内部景点优待政策', '停车场：【婺源停车场】参考价格：免费；地址：婺源12景点门口\r\n卫生间：婺源旅游集散中心及12个开放的景区内均设有卫生间\r\n便利店：整个小镇附近都有便利店');
INSERT INTO `tb_scene` VALUES (102, '婺源篁岭', '婺源境内林木葱郁、峰峦叠嶂、峡谷深秀、溪流潺潺，奇峰、怪石、驿道、古树、茶亭、廊桥及多个生态保护小区构成了婺源美丽的自然景观。这里民风纯朴，文风鼎盛，名胜古迹遍布全县。有保持完整的明清古建筑，有田园牧歌式的氛围和景色，自古有“书乡”的美称。', '江西省上饶市婺源县', 0.00, 'http://localhost:8888/file/841aa42883664d8e85b291d4561ed2c6.jpg', '儿童：身高1.2米（含）以下，免费；身高1.2米（不含）至1.5米（含），优惠\r\n老人：65周岁（含）以上老人持有效证件 ，免费；60周岁（含）至65周岁（不含）的老年人持有效证件 ，优惠\r\n学生：18周岁（含）~26周岁（不含）全日制本科（含）及以下的学生凭学生证，优惠\r\n残疾人：持有效证件 ，免费\r\n现役军人：持有效证件 ，免费\r\n带团导游、旅行社经理：凭领队证、国家导游有效IC卡证（国导证）、国家颁发的旅行社总经理资格证者公务出行，带团或跟团。，免费\r\n随团司机：随团司机凭A1类驾照客运驾驶证者（带团）；持本人有效证件在售票窗口办理免票手续。，免费\r\n记者：持有省级以上新闻总署或广电总局颁发的新闻记者证 ，免费\r\n艺术家：省级以上画家、摄影家证者 ，免费\r\n补充说明：以上为各内部景点优待政策', '停车场：【婺源停车场】参考价格：免费；地址：婺源12景点门口\r\n卫生间：婺源旅游集散中心及12个开放的景区内均设有卫生间\r\n便利店：整个小镇附近都有便利店');
INSERT INTO `tb_scene` VALUES (103, '婺源篁岭', '篁岭石门峡，是婺源篁岭旅游度假区旗下又一精品景区，延续打造篁岭的用心与创新，生成一个融合在峡谷风光之上的趣味乐园。谷内飞瀑流泉、怪石嶙峋，峡谷幽深、峭壁如门，是一处纯原始的峡谷风光。除纳凉戏水外，石门峡还有各种闯关类的体验项目，是一个团建拓展的好去处。', '江西省上饶市婺源县', 0.00, 'http://localhost:8888/file/0d7d48b1799640baa3496f7b7dcae88b.jpg', '儿童：身高1.2米（含）以下，免费；身高1.2米（不含）至1.5米（含），优惠\r\n老人：65周岁（含）以上老人持有效证件 ，免费；60周岁（含）至65周岁（不含）的老年人持有效证件 ，优惠\r\n学生：18周岁（含）~26周岁（不含）全日制本科（含）及以下的学生凭学生证，优惠\r\n残疾人：持有效证件 ，免费\r\n现役军人：持有效证件 ，免费\r\n带团导游、旅行社经理：凭领队证、国家导游有效IC卡证（国导证）、国家颁发的旅行社总经理资格证者公务出行，带团或跟团。，免费\r\n随团司机：随团司机凭A1类驾照客运驾驶证者（带团）；持本人有效证件在售票窗口办理免票手续。，免费\r\n记者：持有省级以上新闻总署或广电总局颁发的新闻记者证 ，免费\r\n艺术家：省级以上画家、摄影家证者 ，免费\r\n补充说明：以上为各内部景点优待政策', '停车场：【婺源停车场】参考价格：免费；地址：婺源12景点门口\r\n卫生间：婺源旅游集散中心及12个开放的景区内均设有卫生间\r\n便利店：整个小镇附近都有便利店');
INSERT INTO `tb_scene` VALUES (104, '婺源篁岭', '婺源江岭景区，中国四大花海之一，位于婺源县东北部，距县城45公里，总面积38平方公里，每当春暖花开时，置身于江岭万亩梯田中，黄灿灿的油菜花与远山、近水、粉墙、黛瓦相映成趣，构成一幅天人合一的画卷，在这里您可以尽情的释放，让心灵自由飞翔。', '江西省上饶市婺源县', 0.00, 'http://localhost:8888/file/46062c7de0bf46a09435ed04d7bebf2b.jpg', '儿童：身高1.2米（含）以下，免费；身高1.2米（不含）至1.5米（含），优惠\r\n老人：65周岁（含）以上老人持有效证件 ，免费；60周岁（含）至65周岁（不含）的老年人持有效证件 ，优惠\r\n学生：18周岁（含）~26周岁（不含）全日制本科（含）及以下的学生凭学生证，优惠\r\n残疾人：持有效证件 ，免费\r\n现役军人：持有效证件 ，免费\r\n带团导游、旅行社经理：凭领队证、国家导游有效IC卡证（国导证）、国家颁发的旅行社总经理资格证者公务出行，带团或跟团。，免费\r\n随团司机：随团司机凭A1类驾照客运驾驶证者（带团）；持本人有效证件在售票窗口办理免票手续。，免费\r\n记者：持有省级以上新闻总署或广电总局颁发的新闻记者证 ，免费\r\n艺术家：省级以上画家、摄影家证者 ，免费\r\n补充说明：以上为各内部景点优待政策', '停车场：【婺源停车场】参考价格：免费；地址：婺源12景点门口\r\n卫生间：婺源旅游集散中心及12个开放的景区内均设有卫生间\r\n便利店：整个小镇附近都有便利店');
INSERT INTO `tb_scene` VALUES (107, '婺源篁岭', '婺源境内林木葱郁、峰峦叠嶂、峡谷深秀、溪流潺潺，奇峰、怪石、驿道、古树、茶亭、廊桥及多个生态保护小区构成了婺源美丽的自然景观。这里民风纯朴，文风鼎盛，名胜古迹遍布全县。有保持完整的明清古建筑，有田园牧歌式的氛围和景色，自古有“书乡”的美称。', '江西省上饶市婺源县', 0.00, 'http://localhost:8888/file/0d7d48b1799640baa3496f7b7dcae88b.jpg', '儿童：身高1.2米（含）以下，免费；身高1.2米（不含）至1.5米（含），优惠\r\n老人：65周岁（含）以上老人持有效证件 ，免费；60周岁（含）至65周岁（不含）的老年人持有效证件 ，优惠\r\n学生：18周岁（含）~26周岁（不含）全日制本科（含）及以下的学生凭学生证，优惠\r\n残疾人：持有效证件 ，免费\r\n现役军人：持有效证件 ，免费\r\n带团导游、旅行社经理：凭领队证、国家导游有效IC卡证（国导证）、国家颁发的旅行社总经理资格证者公务出行，带团或跟团。，免费\r\n随团司机：随团司机凭A1类驾照客运驾驶证者（带团）；持本人有效证件在售票窗口办理免票手续。，免费\r\n记者：持有省级以上新闻总署或广电总局颁发的新闻记者证 ，免费\r\n艺术家：省级以上画家、摄影家证者 ，免费\r\n补充说明：以上为各内部景点优待政策', '停车场：【婺源停车场】参考价格：免费；地址：婺源12景点门口\r\n卫生间：婺源旅游集散中心及12个开放的景区内均设有卫生间\r\n便利店：整个小镇附近都有便利店');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_sex` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `user_age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `user_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `user_create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `user_role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '角色（群众，中共党员，中共预备党员）',
  `user_avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `user_power` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份（超级管理员）',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2027 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1001, '李明明', '男', 32, '12345678901', 'fdjfh@163.com', '123456', '2023-04-07 14:56:28', '群众', 'http://localhost:8888/file/f73248b2725f4d3fa6b95f2c6a5a9ef8.png', NULL);
INSERT INTO `tb_user` VALUES (1002, '王小伟', '男', 26, '15622648552', 'dnhn@163.com', '123456', '2023-04-15 22:37:49', '群众', 'http://localhost:8888/file/b78627e9782440fdace71d46cb01182b.png', NULL);
INSERT INTO `tb_user` VALUES (1003, '何家', '女', 22, '13548555953', 'fksh@163.com', '123456', '2023-05-10 20:38:50', '中共预备党员', NULL, '');
INSERT INTO `tb_user` VALUES (1004, '王谢加', '女', 54, '15653345459', 'dfsff@163.com', '123456', '2023-04-16 10:57:35', '群众', 'http://localhost:8888/file/08490e117e0a4a3b99a30c3646f33ff5.jpg', NULL);
INSERT INTO `tb_user` VALUES (1005, '李响', '男', 69, '11322325466', '1354@163.com', '123456', '2023-05-10 21:55:53', '中共预备党员', 'http://localhost:8888/file/080d12367bda4f3d9da1a2c9dc356ace.jpg', '');
INSERT INTO `tb_user` VALUES (1006, '陌陌', '女', 33, '15464888956', 'sdf@163.com', '123456', '2023-05-10 21:54:31', '中共党员', 'http://localhost:8888/file/f73248b2725f4d3fa6b95f2c6a5a9ef8.png', NULL);
INSERT INTO `tb_user` VALUES (1111, 'admin', '男', 20, '12312345645', 'dsfhs@63.com', 'admin', '2023-05-10 20:38:52', '中共预备党员', 'http://localhost:8888/file/b78627e9782440fdace71d46cb01182b.png', '超级管理员');
INSERT INTO `tb_user` VALUES (2027, '丽丽丽', '女', 22, '18801345802', 'hjk@163.com', '123456', '2023-05-25 22:46:16', '中共预备党员', NULL, NULL);

-- ----------------------------
-- Table structure for tb_wish
-- ----------------------------
DROP TABLE IF EXISTS `tb_wish`;
CREATE TABLE `tb_wish`  (
  `wish_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '心愿id',
  `wish_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `wish_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `wish_create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `wish_finish_time` timestamp(0) NULL DEFAULT NULL COMMENT '结束时间',
  `user_create_id` int(0) NOT NULL COMMENT '发布者id',
  `user_finish_id` int(0) NULL DEFAULT NULL COMMENT '完成者id',
  `wish_feedback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '反馈',
  `wish_score` int(0) NULL DEFAULT NULL COMMENT '分数（百分制）',
  `wish_active` int(0) NULL DEFAULT 1 COMMENT '状态（创建-完成-反馈）',
  PRIMARY KEY (`wish_id`) USING BTREE,
  INDEX `发布者ID`(`user_create_id`) USING BTREE,
  INDEX `完成者ID`(`user_finish_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1030 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_wish
-- ----------------------------
INSERT INTO `tb_wish` VALUES (1001, '打扫卫生', '家中杂乱，打扫干净卫生', '2022-01-24 14:54:16', '2022-01-25 14:53:59', 1001, 1111, '完成非常好', 80, 3);
INSERT INTO `tb_wish` VALUES (1002, '打扫卫生', '家中杂乱，打扫干净卫生', '2022-02-02 14:56:15', '2022-02-08 14:54:05', 1001, 1111, '好', 78, 3);
INSERT INTO `tb_wish` VALUES (1003, '打扫卫生', '家中杂乱，打扫干净卫生', '2022-03-18 14:55:23', '2022-03-20 14:54:08', 1002, 1111, '好', 86, 3);
INSERT INTO `tb_wish` VALUES (1004, '打扫卫生', '家中杂乱，打扫干净卫生', '2022-04-20 14:55:19', '2022-04-24 14:47:56', 1005, 1111, '好', 88, 3);
INSERT INTO `tb_wish` VALUES (1005, '打扫卫生', '家中杂乱，打扫干净卫生', '2022-05-10 14:56:46', '2022-05-15 14:47:56', 1003, 1111, '好', 75, 3);
INSERT INTO `tb_wish` VALUES (1011, '清理垃圾', '外面的农场', '2022-05-24 14:53:06', '2022-06-25 14:48:00', 1001, 1111, '好', 70, 3);
INSERT INTO `tb_wish` VALUES (1012, '打扫院子', '打扫干净', '2022-06-24 14:56:43', '2022-07-12 14:48:04', 1001, 1111, '好', 96, 3);
INSERT INTO `tb_wish` VALUES (1013, '清理储藏间', '主要是里面的灰尘', '2022-08-01 14:56:39', '2022-08-04 14:50:58', 1002, 1111, '好', 86, 3);
INSERT INTO `tb_wish` VALUES (1014, '清除公共厕所', '公共厕所太久没进行清理', '2022-09-03 14:56:34', '2022-09-05 14:50:48', 1005, 1111, '好', 86, 3);
INSERT INTO `tb_wish` VALUES (1015, '完成问卷表的调查', '主要是心理问题上的问题', '2022-10-05 14:56:52', '2022-10-10 14:48:22', 1003, 1111, '好', 87, 3);
INSERT INTO `tb_wish` VALUES (1016, '打扫祠堂', '清理干净', '2022-11-01 14:56:58', '2022-11-05 14:51:05', 1002, 1111, '好', 80, 3);
INSERT INTO `tb_wish` VALUES (1017, '打扫卫生', '主要是卫生问题', '2023-02-12 14:57:02', '2023-02-20 14:49:51', 1001, 1111, '好', 96, 3);
INSERT INTO `tb_wish` VALUES (1018, '完成调查问卷', '农作物上的调查', '2022-12-10 14:57:04', '2022-12-17 14:51:01', 1002, 1111, '好', 92, 3);
INSERT INTO `tb_wish` VALUES (1019, '清理垃圾', '主要是路面上的垃圾', '2023-03-10 14:57:08', '2023-03-14 14:47:56', 1005, 1111, '好', 83, 3);
INSERT INTO `tb_wish` VALUES (1020, '开展公共课', '关于党史的普及', '2023-04-24 16:47:26', '2023-04-24 14:52:42', 1001, 1111, '好', 88, 3);
INSERT INTO `tb_wish` VALUES (1022, '调查问卷', '农作物上的调查', '2023-04-22 21:30:23', '2023-04-25 16:44:37', 1111, 1111, NULL, NULL, 2);
INSERT INTO `tb_wish` VALUES (1023, '打扫院子', '家中杂乱，打扫干净卫生', '2023-05-01 21:31:09', '2023-05-05 15:32:38', 1001, 1111, '你做的好', 86, 3);
INSERT INTO `tb_wish` VALUES (1024, '清扫垃圾', '院中垃圾', '2023-02-11 00:33:38', '2023-03-22 00:00:00', 1001, 1111, '好', 90, 3);
INSERT INTO `tb_wish` VALUES (1025, '填写问卷', '关于电信诈骗', '2022-12-11 00:42:06', '2022-12-16 00:42:06', 1002, 1111, '好', 95, 3);
INSERT INTO `tb_wish` VALUES (1026, '志愿服务', '打扫院子', '2023-01-11 00:44:08', '2023-01-22 00:00:00', 1003, 1111, '好', 86, 3);
INSERT INTO `tb_wish` VALUES (1028, '发宣传单', '在街道办', '2023-05-25 23:53:15', '2023-05-25 23:55:14', 1001, 1111, '做的很好', 88, 3);
INSERT INTO `tb_wish` VALUES (1029, '清扫垃圾', '在院子里清扫', '2023-05-26 10:31:18', '2023-05-26 10:31:36', 1001, 1111, '做的很好', 89, 3);
INSERT INTO `tb_wish` VALUES (1030, '打扫卫生', '是的', '2023-05-26 15:00:16', NULL, 1001, NULL, NULL, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
