/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - guanhuaifuwu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`guanhuaifuwu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `guanhuaifuwu`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

/*Data for the table `config` */

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='字典';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'sex_types','性别类型',1,'男',NULL,NULL,'2022-03-11 17:21:49'),(2,'sex_types','性别类型',2,'女',NULL,NULL,'2022-03-11 17:21:49'),(3,'guanhuaifuwu_types','服务类型',1,'固定服务',NULL,NULL,'2022-03-11 17:21:49'),(4,'guanhuaifuwu_types','服务类型',2,'其他服务',NULL,NULL,'2022-03-11 17:21:49'),(5,'wancheng_types','完成情况',1,'待完成',NULL,NULL,'2022-03-11 17:21:49'),(6,'wancheng_types','完成情况',2,'已完成',NULL,NULL,'2022-03-11 17:21:49'),(7,'pingjia_types','评价等级',1,'差',NULL,NULL,'2022-03-11 17:21:49'),(8,'pingjia_types','评价等级',2,'好',NULL,NULL,'2022-03-11 17:21:49'),(9,'pingjia_types','评价等级',3,'非常好',NULL,NULL,'2022-03-11 17:21:49');

/*Table structure for table `fuwurenyuan` */

DROP TABLE IF EXISTS `fuwurenyuan`;

CREATE TABLE `fuwurenyuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `fuwurenyuan_uuid_number` varchar(200) DEFAULT NULL COMMENT '服务人员编号 Search111 ',
  `fuwurenyuan_name` varchar(200) DEFAULT NULL COMMENT '服务人员姓名 Search111 ',
  `fuwurenyuan_phone` varchar(200) DEFAULT NULL COMMENT '服务人员手机号',
  `fuwurenyuan_photo` varchar(200) DEFAULT NULL COMMENT '服务人员头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `fuwurenyuan_email` varchar(200) DEFAULT NULL COMMENT '服务人员电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='服务人员';

/*Data for the table `fuwurenyuan` */

insert  into `fuwurenyuan`(`id`,`username`,`password`,`fuwurenyuan_uuid_number`,`fuwurenyuan_name`,`fuwurenyuan_phone`,`fuwurenyuan_photo`,`sex_types`,`fuwurenyuan_email`,`create_time`) values (1,'a1','123456','164699051597016','服务人员姓名1','17703786901','http://localhost:8080/guanhuaifuwu/upload/fuwurenyuan1.jpg',1,'1@qq.com','2022-03-11 17:21:55'),(2,'a2','123456','16469905159706','服务人员姓名2','17703786902','http://localhost:8080/guanhuaifuwu/upload/fuwurenyuan2.jpg',1,'2@qq.com','2022-03-11 17:21:55'),(3,'a3','123456','16469905159700','服务人员姓名3','17703786903','http://localhost:8080/guanhuaifuwu/upload/fuwurenyuan3.jpg',2,'3@qq.com','2022-03-11 17:21:55');

/*Table structure for table `guanhuaifuwu` */

DROP TABLE IF EXISTS `guanhuaifuwu`;

CREATE TABLE `guanhuaifuwu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fuwurenyuan_id` int(11) DEFAULT NULL COMMENT '服务人员',
  `laoren_id` int(11) DEFAULT NULL COMMENT '老人',
  `guanhuaifuwu_uuid_number` varchar(200) DEFAULT NULL COMMENT '服务编号 Search111 ',
  `guanhuaifuwu_name` varchar(200) DEFAULT NULL COMMENT '服务名称 Search111  ',
  `guanhuaifuwu_types` int(11) DEFAULT NULL COMMENT '服务类型  Search111 ',
  `yujikaishi_time` timestamp NULL DEFAULT NULL COMMENT '预计开始时间',
  `yujijieshu_time` timestamp NULL DEFAULT NULL COMMENT '预计结束时间',
  `fuwu_time` date DEFAULT NULL COMMENT '服务日期',
  `guanhuaifuwu_content` text COMMENT '服务详情 ',
  `wancheng_types` int(11) DEFAULT NULL COMMENT '状态 Search111 ',
  `pingjia_types` int(11) DEFAULT NULL COMMENT '评价等级 Search111 ',
  `pingjia_text` text COMMENT '评价结果 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='关怀服务';

/*Data for the table `guanhuaifuwu` */

insert  into `guanhuaifuwu`(`id`,`fuwurenyuan_id`,`laoren_id`,`guanhuaifuwu_uuid_number`,`guanhuaifuwu_name`,`guanhuaifuwu_types`,`yujikaishi_time`,`yujijieshu_time`,`fuwu_time`,`guanhuaifuwu_content`,`wancheng_types`,`pingjia_types`,`pingjia_text`,`insert_time`,`create_time`) values (1,1,1,'16469905159784','服务名称1',2,'2022-03-11 17:21:55','2022-03-11 17:21:55','2022-03-11','服务详情1',1,NULL,NULL,'2022-03-11 17:21:55','2022-03-11 17:21:55'),(2,3,2,'16469905159785','服务名称2',2,'2022-03-11 17:21:55','2022-03-11 17:21:55','2022-03-11','服务详情2',1,NULL,NULL,'2022-03-11 17:21:55','2022-03-11 17:21:55'),(3,3,3,'16469905159797','服务名称3',1,'2022-03-11 17:21:55','2022-03-11 17:21:55','2022-03-11','服务详情3',1,NULL,NULL,'2022-03-11 17:21:55','2022-03-11 17:21:55'),(4,1,2,'164699051597919','服务名称4',2,'2022-03-11 17:21:55','2022-03-11 17:21:55','2022-03-11','服务详情4',2,NULL,NULL,'2022-03-11 17:21:55','2022-03-11 17:21:55'),(5,1,1,'164699051597916','服务名称5',2,'2022-03-11 17:21:55','2022-03-11 17:21:55','2022-03-11','<p>服务详情5</p>',2,1,'sadwqe','2022-03-11 17:21:55','2022-03-11 17:21:55'),(6,1,3,'1646991910015','dujaidfjsaof',2,'2022-03-16 00:00:00','2022-03-16 10:00:00','2022-03-16','<p>sd</p>',1,NULL,NULL,'2022-03-11 17:45:39','2022-03-11 17:45:39'),(7,1,3,'1646992064072','sda',2,'2022-03-12 02:00:00','2022-03-12 04:00:00','2022-03-12','<p>5648wsedas</p>',2,NULL,NULL,'2022-03-11 17:48:12','2022-03-11 17:48:12');

/*Table structure for table `laoren` */

DROP TABLE IF EXISTS `laoren`;

CREATE TABLE `laoren` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `laoren_uuid_number` varchar(200) DEFAULT NULL COMMENT '老人编号 Search111 ',
  `laoren_name` varchar(200) DEFAULT NULL COMMENT '老人姓名 Search111 ',
  `laoren_phone` varchar(200) DEFAULT NULL COMMENT '老人手机号',
  `laoren_photo` varchar(200) DEFAULT NULL COMMENT '老人照片',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `laoren_address` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `laoren_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号',
  `qinshuxingming` varchar(200) DEFAULT NULL COMMENT '亲属姓名',
  `qinshuxingming_phone` varchar(200) DEFAULT NULL COMMENT '亲属联系方式',
  `yiliaokahao` varchar(200) DEFAULT NULL COMMENT '医疗卡号',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='老人';

/*Data for the table `laoren` */

insert  into `laoren`(`id`,`username`,`password`,`laoren_uuid_number`,`laoren_name`,`laoren_phone`,`laoren_photo`,`sex_types`,`nianling`,`laoren_address`,`laoren_id_number`,`qinshuxingming`,`qinshuxingming_phone`,`yiliaokahao`,`create_time`) values (1,'a1','123456','16469905159810','老人姓名1','17703786901','http://localhost:8080/guanhuaifuwu/upload/laoren1.jpg',1,33,'联系方式1','410224199610232001','亲属姓名1','17703786901','医疗卡号1','2022-03-11 17:21:55'),(2,'a2','123456','16469905159810','老人姓名2','17703786902','http://localhost:8080/guanhuaifuwu/upload/laoren2.jpg',1,152,'联系方式2','410224199610232002','亲属姓名2','17703786902','医疗卡号2','2022-03-11 17:21:55'),(3,'a3','123456','164699051598119','老人姓名3','17703786903','http://localhost:8080/guanhuaifuwu/upload/laoren3.jpg',1,75,'联系方式3','410224199610232003','亲属姓名3','17703786903','医疗卡号3','2022-03-11 17:21:55');

/*Table structure for table `shentizhuangkuang` */

DROP TABLE IF EXISTS `shentizhuangkuang`;

CREATE TABLE `shentizhuangkuang` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `laoren_id` int(11) DEFAULT NULL COMMENT '老人',
  `jibing_text` text COMMENT '疾病状况 ',
  `huanbingshichang` varchar(200) DEFAULT NULL COMMENT '患病时长',
  `zhiliaoyiyuan` varchar(200) DEFAULT NULL COMMENT '治疗医院',
  `zhiliaoshichang` varchar(200) DEFAULT NULL COMMENT '患病时长',
  `fuzhenzhouqi` varchar(200) DEFAULT NULL COMMENT '复诊周期',
  `jibingzhuyishixiang_text` text COMMENT '疾病注意事项 ',
  `yongyaoqingkuang_text` text COMMENT '用药情况 ',
  `yongyaoshixiang_text` text COMMENT '用药事项 ',
  `beizhu_content` text COMMENT '备注 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='身体状况';

/*Data for the table `shentizhuangkuang` */

insert  into `shentizhuangkuang`(`id`,`laoren_id`,`jibing_text`,`huanbingshichang`,`zhiliaoyiyuan`,`zhiliaoshichang`,`fuzhenzhouqi`,`jibingzhuyishixiang_text`,`yongyaoqingkuang_text`,`yongyaoshixiang_text`,`beizhu_content`,`insert_time`,`create_time`) values (1,3,'疾病状况1','患病时长1','治疗医院1','患病时长1','复诊周期1','疾病注意事项1','用药情况1','用药事项1','备注1','2022-03-11 17:21:55','2022-03-11 17:21:55'),(2,2,'疾病状况2','患病时长2','治疗医院2','患病时长2','复诊周期2','疾病注意事项2','用药情况2','用药事项2','备注2','2022-03-11 17:21:55','2022-03-11 17:21:55'),(3,3,'疾病状况3','患病时长3','治疗医院3','患病时长3','复诊周期3','疾病注意事项3','用药情况3','用药事项3','备注3','2022-03-11 17:21:55','2022-03-11 17:21:55'),(4,1,'疾病状况4','患病时长4','治疗医院4','患病时长4','复诊周期4','疾病注意事项4','用药情况4','用药事项4','备注4','2022-03-11 17:21:55','2022-03-11 17:21:55'),(5,3,'疾病状况5','患病时长5','治疗医院5','患病时长5','复诊周期5','疾病注意事项5','用药情况5','用药事项511','<p>备注5</p>','2022-03-11 17:21:55','2022-03-11 17:21:55');

/*Table structure for table `shequguanliyuan` */

DROP TABLE IF EXISTS `shequguanliyuan`;

CREATE TABLE `shequguanliyuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `shequguanliyuan_uuid_number` varchar(200) DEFAULT NULL COMMENT '社区管理员编号 Search111 ',
  `shequguanliyuan_name` varchar(200) DEFAULT NULL COMMENT '社区管理员姓名 Search111 ',
  `shequguanliyuan_phone` varchar(200) DEFAULT NULL COMMENT '社区管理员手机号',
  `shequguanliyuan_photo` varchar(200) DEFAULT NULL COMMENT '社区管理员头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `shequguanliyuan_email` varchar(200) DEFAULT NULL COMMENT '社区管理员电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='社区管理员';

/*Data for the table `shequguanliyuan` */

insert  into `shequguanliyuan`(`id`,`username`,`password`,`shequguanliyuan_uuid_number`,`shequguanliyuan_name`,`shequguanliyuan_phone`,`shequguanliyuan_photo`,`sex_types`,`shequguanliyuan_email`,`create_time`) values (1,'a1','123456','16469905159864','社区管理员姓名1','17703786901','http://localhost:8080/guanhuaifuwu/upload/shequguanliyuan1.jpg',1,'1@qq.com','2022-03-11 17:21:55'),(2,'a2','123456','164699051598616','社区管理员姓名2','17703786902','http://localhost:8080/guanhuaifuwu/upload/shequguanliyuan2.jpg',1,'2@qq.com','2022-03-11 17:21:55'),(3,'a3','123456','16469905159861','社区管理员姓名3','17703786903','http://localhost:8080/guanhuaifuwu/upload/shequguanliyuan3.jpg',1,'3@qq.com','2022-03-11 17:21:55');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,6,'admin','users','管理员','8r2jzwhigec4i31mz4w3pfq5pgdin6yi','2022-03-11 16:42:36','2022-03-11 18:51:36'),(2,1,'a1','laoren','老人','6h2slpo78tftxytsadg7vc2ty3sxuqxj','2022-03-11 17:13:33','2022-03-11 18:48:48'),(3,1,'a1','fuwurenyuan','服务人员','gqwrhu8fsihzagm1s9q9ummu2vn0i2ni','2022-03-11 17:17:04','2022-03-11 18:47:32'),(4,1,'a1','shequguanliyuan','社区管理员','dwpi9qsnp12dn03xcvy9g9ebdix40slg','2022-03-11 17:47:15','2022-03-11 18:47:15');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (6,'admin','admin','管理员','2022-05-02 14:51:13');

/*Table structure for table `yiliaobaoxian` */

DROP TABLE IF EXISTS `yiliaobaoxian`;

CREATE TABLE `yiliaobaoxian` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `laoren_id` int(11) DEFAULT NULL COMMENT '老人',
  `yibaokahao` varchar(200) DEFAULT NULL COMMENT '医疗卡号',
  `yiliaobaoxian_number` decimal(10,2) DEFAULT NULL COMMENT '账户余额 ',
  `diqu` varchar(200) DEFAULT NULL COMMENT '可报销地区',
  `yiyuan` varchar(200) DEFAULT NULL COMMENT '主要合作医院',
  `beizhu_content` text COMMENT '备注 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='医疗保险';

/*Data for the table `yiliaobaoxian` */

insert  into `yiliaobaoxian`(`id`,`laoren_id`,`yibaokahao`,`yiliaobaoxian_number`,`diqu`,`yiyuan`,`beizhu_content`,`insert_time`,`create_time`) values (1,3,'医疗卡号1','799.48','可报销地区1','主要合作医院1','备注1','2022-03-11 17:21:55','2022-03-11 17:21:55'),(2,2,'医疗卡号2','300.79','可报销地区2','主要合作医院2','备注2','2022-03-11 17:21:55','2022-03-11 17:21:55'),(3,1,'医疗卡号3','205.47','可报销地区3','主要合作医院3','备注3','2022-03-11 17:21:55','2022-03-11 17:21:55'),(4,3,'医疗卡号4','832.47','可报销地区4','主要合作医院4','备注4','2022-03-11 17:21:55','2022-03-11 17:21:55'),(5,1,'医疗卡号5','336.22','可报销地区5','主要合作医院5','备注5','2022-03-11 17:21:55','2022-03-11 17:21:55');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
