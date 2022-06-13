-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 13, 2022 lúc 06:44 AM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `movies`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_actor`
--

CREATE TABLE `table_actor` (
  `id_actor` bigint(20) NOT NULL,
  `name_actor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_actor` text COLLATE utf8_unicode_ci NOT NULL,
  `country_actor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age_actor` int(11) NOT NULL,
  `follow_actor` bigint(20) NOT NULL,
  `update_actor` date NOT NULL,
  `modify_actor` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `table_actor`
--

INSERT INTO `table_actor` (`id_actor`, `name_actor`, `image_actor`, `country_actor`, `age_actor`, `follow_actor`, `update_actor`, `modify_actor`) VALUES
(1, 'vytu', 'actorvy.jpg', 'usa', 20, 255, '2022-05-03', '2022-05-05'),
(2, 'dangvy', '', 'usa', 31, 255, '2022-05-03', '2022-05-05'),
(3, 'dfgvvvv', 'testpicture.jpg', 'vietnamaaaaaaa', 23, 500, '2022-06-05', '2022-06-06'),
(4, 'aaaaaaaaaaaaaaaaaaaa', 'shope-img.jpg', 'vietnam', 23, 500, '2022-06-06', '2022-06-06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_categories`
--

CREATE TABLE `table_categories` (
  `id_categories` bigint(20) NOT NULL,
  `name_categories` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status_categories` tinyint(1) NOT NULL,
  `update_categories` date NOT NULL,
  `modify_categories` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `table_categories`
--

INSERT INTO `table_categories` (`id_categories`, `name_categories`, `status_categories`, `update_categories`, `modify_categories`) VALUES
(1, 'test add', 1, '2022-05-04', '2022-06-05'),
(2, 'test update ne hihi', 0, '2022-05-29', '2022-06-05'),
(7, 'gangbang', 1, '2022-06-02', '2022-06-05'),
(8, 'a', 0, '2022-06-05', '2022-06-07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_comment`
--

CREATE TABLE `table_comment` (
  `id_comment` bigint(20) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `status_comment` tinyint(1) NOT NULL,
  `update_comment` datetime NOT NULL,
  `modify_comment` datetime NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `id_ratting` bigint(20) NOT NULL,
  `id_film` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `table_comment`
--

INSERT INTO `table_comment` (`id_comment`, `comment`, `status_comment`, `update_comment`, `modify_comment`, `id_user`, `id_ratting`, `id_film`) VALUES
(1, 'phim hay qua', 1, '2022-05-29 00:00:00', '2022-06-07 00:00:00', 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_contact`
--

CREATE TABLE `table_contact` (
  `id_contact` bigint(20) NOT NULL,
  `title_contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message_contact` text COLLATE utf8_unicode_ci NOT NULL,
  `email_contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_contact` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `update_contact` date NOT NULL,
  `modify_contact` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `table_contact`
--

INSERT INTO `table_contact` (`id_contact`, `title_contact`, `message_contact`, `email_contact`, `phone_contact`, `update_contact`, `modify_contact`) VALUES
(1, 'asd', 'afaf', 'asfaf', 'afsaf', '2022-06-15', '2022-06-10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_crawl_data`
--

CREATE TABLE `table_crawl_data` (
  `id_element_crawl` bigint(20) NOT NULL,
  `name_web_crawl` text COLLATE utf8_unicode_ci NOT NULL,
  `url_crawl` text COLLATE utf8_unicode_ci NOT NULL,
  `number_tag_crawl` bigint(20) NOT NULL,
  `card_tag_crawl` text COLLATE utf8_unicode_ci NOT NULL,
  `content_crawl` text COLLATE utf8_unicode_ci NOT NULL,
  `status_crawl` tinyint(1) NOT NULL,
  `id_categories` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `table_crawl_data`
--

INSERT INTO `table_crawl_data` (`id_element_crawl`, `name_web_crawl`, `url_crawl`, `number_tag_crawl`, `card_tag_crawl`, `content_crawl`, `status_crawl`, `id_categories`) VALUES
(1, 'test edit', 'test edit', 23, 'div[class=thumb-block]', '', 0, 2);
INSERT INTO `table_crawl_data` (`id_element_crawl`, `name_web_crawl`, `url_crawl`, `number_tag_crawl`, `card_tag_crawl`, `content_crawl`, `status_crawl`, `id_categories`) VALUES
(2, 'asdasdtest', 'https://www.asdadad.com/', 2, 'div[class=thumb-block]', '<200 OK OK,[<div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video31116015/porn-vi/0/dich_vu_massage_yoni_cho_nu._ktv_nam._tung_yoni_091.5555.904\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/18/94/87/18948736ec16dfa05aaadc374eeae114-1/18948736ec16dfa05aaadc374eeae114.23.jpg\" data-idcdn=\"2\" data-videoid=\"31116015\" id=\"pic_31116015\"><span class=\"video-hd-mark\">720p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video31116015/porn-vi/0/dich_vu_massage_yoni_cho_nu._ktv_nam._tung_yoni_091.5555.904\" title=\"dịch vụ massage yoni cho nữ. Ktv Nam. Tùng Yoni 091.5555.904\">dịch vụ massage yoni cho nữ. Ktv Nam. Tùng Yoni 091.5555.904 <span class=\"duration\">40 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">40 sec</span><span><a href=\"/profiles/tung_yoni\"><span class=\"name\">Tung Yoni</span></a><span><span class=\"sprfluous\"> - </span> 269.8k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(31116015);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video31467413/porn-vi/0/cuongdam\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/2a/76/75/2a76759a76de863f6da050fb8ea5367b-2/2a76759a76de863f6da050fb8ea5367b.11.jpg\" data-idcdn=\"2\" data-videoid=\"31467413\" id=\"pic_31467413\"><span class=\"video-hd-mark\">1080p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video31467413/porn-vi/0/cuongdam\" title=\"cuongdam\">cuongdam <span class=\"duration\">71 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">71 sec</span><span><a href=\"/profiles/minh-son12\"><span class=\"name\">Minh-Son12</span></a><span><span class=\"sprfluous\"> - </span> 405.8k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(31467413);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video3549666/porn-vi/0/clip_sex_em_trinh_dam_a_ang\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/fa/7e/80/fa7e8011bbe4e4e4cb17131811ce3be1/fa7e8011bbe4e4e4cb17131811ce3be1.1.jpg\" data-idcdn=\"2\" data-videoid=\"3549666\" id=\"pic_3549666\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video3549666/porn-vi/0/clip_sex_em_trinh_dam_a_ang\" title=\"Clip Sex em Trinh dâm Ä‘ãng\">Clip Sex em Trinh dâm Ä‘ãng <span class=\"duration\">15 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">15 min</span><span><a href=\"/profiles/giahuy354\"><span class=\"name\">Giahuy354</span></a><span><span class=\"sprfluous\"> - </span> 998.8k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(3549666);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video11585487/porn-vi/0/viet_nam0098\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://cdn77-pic.xvideos-cdn.com/videos/thumbs169ll/eb/0b/fa/eb0bfacbcccf43e066bf2b04b73236be/eb0bfacbcccf43e066bf2b04b73236be.18.jpg\" data-idcdn=\"10\" data-videoid=\"11585487\" id=\"pic_11585487\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video11585487/porn-vi/0/viet_nam0098\" title=\"viet nam0098\">viet nam0098 <span class=\"duration\">10 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">10 min</span><span><a href=\"/profiles/tamnguyenngoc\"><span class=\"name\">Tamnguyenngoc</span></a><span><span class=\"sprfluous\"> - </span> 675.8k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(11585487);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video30207741/porn-vi/0/nguoi_mau_va_ban_trai\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/ac/ce/c0/accec0b4e8e1a6cb68eca427ce5b0b09/accec0b4e8e1a6cb68eca427ce5b0b09.9.jpg\" data-idcdn=\"2\" data-videoid=\"30207741\" id=\"pic_30207741\"></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video30207741/porn-vi/0/nguoi_mau_va_ban_trai\" title=\"người mẫu và bạn trai\">người mẫu và bạn trai <span class=\"duration\">10 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">10 min</span><span><a href=\"/profiles/dangkiphimsex\"><span class=\"name\">Dangkiphimsex</span></a><span><span class=\"sprfluous\"> - </span> 1.8M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(30207741);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video20869635/porn-vi/0/clip_chich_em_giang_dang_chuan_cuoi_ngua_dam_ang.flv\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://cdn77-pic.xvideos-cdn.com/videos/thumbs169ll/ab/cd/10/abcd10a12d16ca40e021ab4eb68bec9e/abcd10a12d16ca40e021ab4eb68bec9e.3.jpg\" data-idcdn=\"10\" data-videoid=\"20869635\" id=\"pic_20869635\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video20869635/porn-vi/0/clip_chich_em_giang_dang_chuan_cuoi_ngua_dam_ang.flv\" title=\"Clip  Chịch Em Giang dáng chuẩn, cưỡi ngựa dâm đãng.FLV\">Clip Chịch Em Giang dáng chuẩn, cưỡi ngựa dâm đãng.FLV <span class=\"duration\">42 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">42 sec</span><span><a href=\"/profiles/tranmannhi\"><span class=\"name\">Tranmannhi</span></a><span><span class=\"sprfluous\"> - </span> 2.7M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(20869635);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video25020101/porn-vi/0/_inh_cao_cua_khoai_lac.\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/ea/13/b5/ea13b563d5b76d15c575c1782ea8293e-1/ea13b563d5b76d15c575c1782ea8293e.25.jpg\" data-idcdn=\"2\" data-videoid=\"25020101\" id=\"pic_25020101\"><span class=\"video-hd-mark\">720p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video25020101/porn-vi/0/_inh_cao_cua_khoai_lac.\" title=\"đỉnh cao của khoái lạc.\">đỉnh cao của khoái lạc. <span class=\"duration\">31 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">31 sec</span><span><a href=\"/profiles/lacksock\"><span class=\"name\">Lacksock</span></a><span><span class=\"sprfluous\"> - </span> 2.9M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(25020101);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video25591657/porn-vi/0/_hd_nu_hoang_so_long\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/3d/ee/02/3dee020434c46da738927352ccabf7d2/3dee020434c46da738927352ccabf7d2.24.jpg\" data-idcdn=\"2\" data-videoid=\"25591657\" id=\"pic_25591657\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video25591657/porn-vi/0/_hd_nu_hoang_so_long\" title=\"[hd] Nữ Hoàng Sò Lông\">[hd] Nữ Hoàng Sò Lông <span class=\"duration\">44 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">44 min</span><span><a href=\"/profiles/huni01\"><span class=\"name\">Huni01</span></a><span><span class=\"sprfluous\"> - </span> 427.1k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(25591657);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video18819219/porn-vi/0/truc_tuong_vi_le_-_facebook.mp4\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/ad/b2/82/adb2827d3569a8a610cc2ec03f4e4338/adb2827d3569a8a610cc2ec03f4e4338.9.jpg\" data-idcdn=\"2\" data-videoid=\"18819219\" id=\"pic_18819219\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video18819219/porn-vi/0/truc_tuong_vi_le_-_facebook.mp4\" title=\"Trúc Tường Vi Lê - Facebook.MP4\">Trúc Tường Vi Lê - Facebook.MP4 <span class=\"duration\">17 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">17 sec</span><span><a href=\"/profiles/fappy-bird\"><span class=\"name\">Fappy-Bird</span></a><span><span class=\"sprfluous\"> - </span> 302.5k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(18819219);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video33130837/porn-vi/0/quay_len_phong_tro_2\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/7c/25/9b/7c259be8c85f2eb8a056e8bc547736e7-1/7c259be8c85f2eb8a056e8bc547736e7.15.jpg\" data-idcdn=\"3\" data-videoid=\"33130837\" id=\"pic_33130837\"><span class=\"video-hd-mark\">1080p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video33130837/porn-vi/0/quay_len_phong_tro_2\" title=\"Quay len phong tro 2\">Quay len phong tro 2 <span class=\"duration\">2 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">2 min</span><span><a href=\"/profiles/tacaoca\"><span class=\"name\">Tacaoca</span></a><span><span class=\"sprfluous\"> - </span> 2.4M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(33130837);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video26862367/porn-vi/0/girl_thu_dam_1\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/56/98/bd/5698bd70116bdd02ddb0a1fbe5ebf465/5698bd70116bdd02ddb0a1fbe5ebf465.1.jpg\" data-idcdn=\"3\" data-videoid=\"26862367\" id=\"pic_26862367\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video26862367/porn-vi/0/girl_thu_dam_1\" title=\"Girl thu dam 1\">Girl thu dam 1 <span class=\"duration\">16 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">16 sec</span><span><a href=\"/profiles/mobiblog-org\"><span class=\"name\">Mobiblog-Org</span></a><span><span class=\"sprfluous\"> - </span> 229.8k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(26862367);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video30282191/porn-vi/0/anh_mang_bao_vao_i_em_nung_lam_roi\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/7c/4d/91/7c4d918e3bd1ba3e1c89cc3c59096eee/7c4d918e3bd1ba3e1c89cc3c59096eee.30.jpg\" data-idcdn=\"3\" data-videoid=\"30282191\" id=\"pic_30282191\"></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video30282191/porn-vi/0/anh_mang_bao_vao_i_em_nung_lam_roi\" title=\"Anh mang bao vào đi, em nứng lắm rồi\">Anh mang bao vào đi, em nứng lắm rồi <span class=\"duration\">29 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">29 min</span><span><a href=\"/profiles/dangkiphimsex\"><span class=\"name\">Dangkiphimsex</span></a><span><span class=\"sprfluous\"> - </span> 7.5M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(30282191);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video30205059/porn-vi/0/vo_chong_it_nhau_tren_bigo\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/1b/39/0f/1b390fae05a3a10b66365365e3fb311e/1b390fae05a3a10b66365365e3fb311e.3.jpg\" data-idcdn=\"2\" data-videoid=\"30205059\" id=\"pic_30205059\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video30205059/porn-vi/0/vo_chong_it_nhau_tren_bigo\" title=\"vợ chồng địt nhau trên bigo\">vợ chồng địt nhau trên bigo <span class=\"duration\">35 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">35 min</span><span><a href=\"/profiles/dangkiphimsex\"><span class=\"name\">Dangkiphimsex</span></a><span><span class=\"sprfluous\"> - </span> 1.5M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(30205059);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video1888659/porn-vi/0/day_mua_thoat_y_18_the_gioi_nguoi_lon\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/f3/d7/a8/f3d7a8522493cf576f827743a94823cf/f3d7a8522493cf576f827743a94823cf.1.jpg\" data-idcdn=\"2\" data-videoid=\"1888659\" id=\"pic_1888659\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video1888659/porn-vi/0/day_mua_thoat_y_18_the_gioi_nguoi_lon\" title=\"Dạy múa thoát y 18  « THẾ GIỚI NGƯỜI LỚN\">Dạy múa thoát y 18 « THẾ GIỚI NGƯỜI LỚN <span class=\"duration\">3 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">3 min</span><span><a href=\"/profiles/copland\"><span class=\"name\">Copland</span></a><span><span class=\"sprfluous\"> - </span> 456.5k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(1888659);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video30723893/porn-vi/0/choi_nhau_tren_may_-_phim_sex_viet_hay\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/90/e0/e0/90e0e0b115afc38bf3cf720f1275b5b0-2/90e0e0b115afc38bf3cf720f1275b5b0.27.jpg\" data-idcdn=\"3\" data-videoid=\"30723893\" id=\"pic_30723893\"><span class=\"video-hd-mark\">1080p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video30723893/porn-vi/0/choi_nhau_tren_may_-_phim_sex_viet_hay\" title=\"Choi Nhau Tren May - Phim Sex Viet Hay\">Choi Nhau Tren May - Phim Sex Viet Hay <span class=\"duration\">12 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">12 min</span><span><a href=\"/profiles/hieudang1500\"><span class=\"name\">Hieudang1500</span></a><span><span class=\"sprfluous\"> - </span> 1.5M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(30723893);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video8944083/porn-vi/0/zphimsex.com_-_em_sv_dam\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/0b/db/38/0bdb3865296364aac9df5612e5b9a9a9/0bdb3865296364aac9df5612e5b9a9a9.4.jpg\" data-idcdn=\"2\" data-videoid=\"8944083\" id=\"pic_8944083\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video8944083/porn-vi/0/zphimsex.com_-_em_sv_dam\" title=\"ZPhimsex.com - Em sv dâm\">ZPhimsex.com - Em sv dâm <span class=\"duration\">7 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">7 min</span><span><a href=\"/profiles/zphimsex\"><span class=\"name\">Zphimsex</span></a><span><span class=\"sprfluous\"> - </span> 4.6M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(8944083);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video9173333/porn-vi/THUMBNUM/sex_girl_teen_-_www.cromweltube.com\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/22/19/c0/2219c0cd40c1611fa045da8304a39b88/2219c0cd40c1611fa045da8304a39b88.THUMBNUM.jpg\" data-idcdn=\"3\" data-videoid=\"9173333\" id=\"pic_9173333\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video9173333/porn-vi/THUMBNUM/sex_girl_teen_-_www.cromweltube.com\" title=\"SEX girl teen - WWW.CROMWELTUBE.COM\">SEX girl teen - WWW.CROMWELTUBE.COM <span class=\"duration\">9 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">9 min</span><span><a href=\"/profiles/dianadejo\"><span class=\"name\">Dianadejo</span></a><span><span class=\"sprfluous\"> - </span> 31.1k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(9173333);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video28921695/porn-vi/0/em_gai_viet_nam_sexy_dance\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/df/d8/27/dfd82701986414fb00d70bcff2933375-2/dfd82701986414fb00d70bcff2933375.27.jpg\" data-idcdn=\"2\" data-videoid=\"28921695\" id=\"pic_28921695\"><span class=\"video-hd-mark\">1080p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video28921695/porn-vi/0/em_gai_viet_nam_sexy_dance\" title=\"em gai viet nam sexy dance\">em gai viet nam sexy dance <span class=\"duration\">35 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">35 sec</span><span><a href=\"/profiles/coffeexhn\"><span class=\"name\">Coffeexhn</span></a><span><span class=\"sprfluous\"> - </span> 117.1k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(28921695);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video25379827/porn-vi/0/lam_tinh_tap_the_tren_bingo\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/bd/59/e1/bd59e176d5f258a5f1725b1bfa986134-2/bd59e176d5f258a5f1725b1bfa986134.20.jpg\" data-idcdn=\"3\" data-videoid=\"25379827\" id=\"pic_25379827\"><span class=\"video-hd-mark\">1080p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video25379827/porn-vi/0/lam_tinh_tap_the_tren_bingo\" title=\"Làm tình tập thể trên Bingo\">Làm tình tập thể trên Bingo <span class=\"duration\">2 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">2 min</span><span><a href=\"/profiles/gaigoivn\"><span class=\"name\">Gaigoivn</span></a><span><span class=\"sprfluous\"> - </span> 4.2M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(25379827);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video27544597/porn-vi/0/choi_threesome\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/9c/f6/12/9cf6123a6aa39c6a6b6f66149ed9be7e/9cf6123a6aa39c6a6b6f66149ed9be7e.21.jpg\" data-idcdn=\"2\" data-videoid=\"27544597\" id=\"pic_27544597\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video27544597/porn-vi/0/choi_threesome\" title=\"chơi threesome\">chơi threesome <span class=\"duration\">32 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">32 min</span><span><a href=\"/profiles/adzamdang\"><span class=\"name\">Adzamdang</span></a><span><span class=\"sprfluous\"> - </span> 641.2k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(27544597);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video5177866/porn-vi/0/clip_sex_sinh_vien_a_h_cn_tp_hcm\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/fd/b7/a8/fdb7a8b13a06b8830d96f6b6049b47e6/fdb7a8b13a06b8830d96f6b6049b47e6.4.jpg\" data-idcdn=\"3\" data-videoid=\"5177866\" id=\"pic_5177866\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video5177866/porn-vi/0/clip_sex_sinh_vien_a_h_cn_tp_hcm\" title=\"Clip sex Sinh viên ÄH CN TP HCM\">Clip sex Sinh viên ÄH CN TP HCM <span class=\"duration\">13 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">13 min</span><span><a href=\"/profiles/x30s\"><span class=\"name\">X30S</span></a><span><span class=\"sprfluous\"> - </span> 10.7M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(5177866);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video35186243/porn-vi/0/anh_shipper_giao_hang_nhanh_quan_2_ang_giao_nung_qua_kiem_cho_suc\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/e2/66/06/e26606c3940d0f7f6ea7c68d4c01b07e/e26606c3940d0f7f6ea7c68d4c01b07e.22.jpg\" data-idcdn=\"2\" data-videoid=\"35186243\" id=\"pic_35186243\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video35186243/porn-vi/0/anh_shipper_giao_hang_nhanh_quan_2_ang_giao_nung_qua_kiem_cho_suc\" title=\"Anh shipper giao hàng nhanh quận 2 đang giao nứng quá kiếm chổ sục\">Anh shipper giao hàng nhanh quận 2 đang giao nứng quá kiếm chổ sục <span class=\"duration\">5 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">5 min</span><span><a href=\"/profiles/dutraithang123\"><span class=\"name\">Dutraithang123</span></a><span><span class=\"sprfluous\"> - </span> 1.2M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(35186243);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video31017287/porn-vi/0/dan_gau_cung_ve_nha\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/90/64/71/906471107d5b28c4d24924b4f97084c6/906471107d5b28c4d24924b4f97084c6.19.jpg\" data-idcdn=\"2\" data-videoid=\"31017287\" id=\"pic_31017287\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video31017287/porn-vi/0/dan_gau_cung_ve_nha\" title=\"Dẫn gấu cưng về nhà\">Dẫn gấu cưng về nhà <span class=\"duration\">13 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">13 min</span><span><a href=\"/profiles/ivancollins\"><span class=\"name\">Ivancollins</span></a><span><span class=\"sprfluous\"> - </span> 582.7k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(31017287);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video8870383/porn-vi/THUMBNUM/ecchi_a_ecchi_collection_2011v2_nude\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/0a/57/7a/0a577a6af14c8819775ee4469e962b41/0a577a6af14c8819775ee4469e962b41.THUMBNUM.jpg\" data-idcdn=\"2\" data-videoid=\"8870383\" id=\"pic_8870383\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video8870383/porn-vi/THUMBNUM/ecchi_a_ecchi_collection_2011v2_nude\" title=\"ecchi A Ecchi Collection 2011V2 nude\">ecchi A Ecchi Collection 2011V2 nude <span class=\"duration\">10 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">10 min</span><span><a href=\"/profiles/ckpeterman77\"><span class=\"name\">Ckpeterman77</span></a><span><span class=\"sprfluous\"> - </span> 10.6k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(8870383);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video25359765/porn-vi/0/vietnam_couple_fuck_nhau.mov\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/73/c2/03/73c2030833e44ade821ef4b4a9448249/73c2030833e44ade821ef4b4a9448249.15.jpg\" data-idcdn=\"3\" data-videoid=\"25359765\" id=\"pic_25359765\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video25359765/porn-vi/0/vietnam_couple_fuck_nhau.mov\" title=\"VietNam couple fuck nhau.MOV\">VietNam couple fuck nhau.MOV <span class=\"duration\">17 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">17 min</span><span><a href=\"/profiles/onika6921\"><span class=\"name\">Onika6921</span></a><span><span class=\"sprfluous\"> - </span> 182.3k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(25359765);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video20366793/porn-vi/THUMBNUM/cam_colombian_gilr_sexy\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/57/3a/ba/573abae0ef0219a8798106f4492e662e/573abae0ef0219a8798106f4492e662e.THUMBNUM.jpg\" data-idcdn=\"2\" data-videoid=\"20366793\" id=\"pic_20366793\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video20366793/porn-vi/THUMBNUM/cam_colombian_gilr_sexy\" title=\"cam colombian gilr sexy\">cam colombian gilr sexy <span class=\"duration\">28 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">28 min</span><span><a href=\"/profiles/thecoyotte\"><span class=\"name\">Thecoyotte</span></a><span><span class=\"sprfluous\"> - </span> 24k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(20366793);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video65329575/porn-vi/0/lesbian_babe_facesitting_asian_teacher\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos_new/thumbs169ll/f5/9f/8a/f59f8ac33cdb7033637bc84027fefa63/f59f8ac33cdb7033637bc84027fefa63.10.jpg\" data-idcdn=\"2\" data-videoid=\"65329575\" id=\"pic_65329575\"><span class=\"video-hd-mark\">720p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video65329575/porn-vi/0/lesbian_babe_facesitting_asian_teacher\" title=\"Lesbian babe facesitting asian teacher\">Lesbian babe facesitting asian teacher <span class=\"duration\">6 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">6 min</span><span><a href=\"/profiles/gody80\"><span class=\"name\">Gody80</span></a><span><span class=\"sprfluous\"> - </span> 61.8k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(65329575);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video34701949/porn-vi/0/chat_sex_dien_thoai1\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/c2/03/97/c20397d9441fab5077285918b75a1a5f/c20397d9441fab5077285918b75a1a5f.19.jpg\" data-idcdn=\"2\" data-videoid=\"34701949\" id=\"pic_34701949\"><span class=\"video-hd-mark\">720p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video34701949/porn-vi/0/chat_sex_dien_thoai1\" title=\"chat sex dien thoai1\">chat sex dien thoai1 <span class=\"duration\">17 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">17 min</span><span><a href=\"/profiles/minicocker\"><span class=\"name\">Minicocker</span></a><span><span class=\"sprfluous\"> - </span> 805.9k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(34701949);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video28268083/porn-vi/0/em_trinh_hn_show_hang\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/e3/6e/79/e36e79a5da7f1590deb7755ce455d860/e36e79a5da7f1590deb7755ce455d860.17.jpg\" data-idcdn=\"3\" data-videoid=\"28268083\" id=\"pic_28268083\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video28268083/porn-vi/0/em_trinh_hn_show_hang\" title=\"Em trinh HN show hang\">Em trinh HN show hang <span class=\"duration\">83 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">83 sec</span><span><a href=\"/profiles/vietnamloli\"><span class=\"name\">Vietnamloli</span></a><span><span class=\"sprfluous\"> - </span> 175.1k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(28268083);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video32868493/porn-vi/0/em_gai_khoe_buom_nhung_khong_lo_mat\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/9b/fa/3f/9bfa3fccf4028590ccabffbb7f497289/9bfa3fccf4028590ccabffbb7f497289.8.jpg\" data-idcdn=\"2\" data-videoid=\"32868493\" id=\"pic_32868493\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video32868493/porn-vi/0/em_gai_khoe_buom_nhung_khong_lo_mat\" title=\"em gái khoe bướm nhưng không lộ mặt\">em gái khoe bướm nhưng không lộ mặt <span class=\"duration\">6 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">6 min</span><span><a href=\"/profiles/minicocker\"><span class=\"name\">Minicocker</span></a><span><span class=\"sprfluous\"> - </span> 182.2k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(32868493);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video12303139/porn-vi/0/em_xinh_cute_11\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/f3/af/00/f3af0011cf47b0e0d40019f0727aacc9/f3af0011cf47b0e0d40019f0727aacc9.7.jpg\" data-idcdn=\"2\" data-videoid=\"12303139\" id=\"pic_12303139\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video12303139/porn-vi/0/em_xinh_cute_11\" title=\"em xinh cute 11\">em xinh cute 11 <span class=\"duration\">93 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">93 sec</span><span><a href=\"/profiles/phanhtho2303\"><span class=\"name\">Phanhtho2303</span></a><span><span class=\"sprfluous\"> - </span> 874.6k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(12303139);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video9647145/porn-vi/0/hai_vo_chong_quang_ninh_sieu_dam\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/12/30/2d/12302d829fbb504789f40cc990dcf3f2-2/12302d829fbb504789f40cc990dcf3f2.28.jpg\" data-idcdn=\"2\" data-videoid=\"9647145\" id=\"pic_9647145\"><span class=\"video-hd-mark\">720p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video9647145/porn-vi/0/hai_vo_chong_quang_ninh_sieu_dam\" title=\"Hai vợ chồng Quảng ninh siêu dâm\">Hai vợ chồng Quảng ninh siêu dâm <span class=\"duration\">3 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">3 min</span><span><a href=\"/profiles/sexvnvnvn\"><span class=\"name\">Sexvnvnvn</span></a><span><span class=\"sprfluous\"> - </span> 7.6M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(9647145);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video25628507/porn-vi/0/bu_moc_lon_ban_gai_ren_la_tham_thiet\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/cc/df/61/ccdf61fdfacc0730aa03831e8fe1509e/ccdf61fdfacc0730aa03831e8fe1509e.1.jpg\" data-idcdn=\"2\" data-videoid=\"25628507\" id=\"pic_25628507\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video25628507/porn-vi/0/bu_moc_lon_ban_gai_ren_la_tham_thiet\" title=\"Bú móc lồn bạn gái rên la tham thiết\">Bú móc lồn bạn gái rên la tham thiết <span class=\"duration\">8 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">8 min</span><span><a href=\"/profiles/emthichbulon\"><span class=\"name\">Emthichbulon</span></a><span><span class=\"sprfluous\"> - </span> 3.6M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(25628507);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video11460365/porn-vi/0/viet_nam0043\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/74/0d/b2/740db20fe7deb8f97f900cfb74bba453/740db20fe7deb8f97f900cfb74bba453.23.jpg\" data-idcdn=\"3\" data-videoid=\"11460365\" id=\"pic_11460365\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video11460365/porn-vi/0/viet_nam0043\" title=\"viet nam0043\">viet nam0043 <span class=\"duration\">63 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">63 sec</span><span><a href=\"/profiles/tamnguyenngoc\"><span class=\"name\">Tamnguyenngoc</span></a><span><span class=\"sprfluous\"> - </span> 47.2k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(11460365);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video12835245/porn-vi/0/em_xitin_cua_thang_ban\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/53/8f/04/538f04bafbe2a5c40e1342dabb57619d/538f04bafbe2a5c40e1342dabb57619d.4.jpg\" data-idcdn=\"2\" data-videoid=\"12835245\" id=\"pic_12835245\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video12835245/porn-vi/0/em_xitin_cua_thang_ban\" title=\"Em xitin của thằng bạn\">Em xitin của thằng bạn <span class=\"duration\">18 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">18 min</span><span><a href=\"/profiles/lumia102010\"><span class=\"name\">Lumia102010</span></a><span><span class=\"sprfluous\"> - </span> 1.8M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(12835245);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video22002417/porn-vi/0/_it_mot_em_sinh_nam_97_o_nam_inh_vu_to_phe_loi_-_hay88\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/7b/32/b0/7b32b0ea59115c667a30f4ed9578081a/7b32b0ea59115c667a30f4ed9578081a.14.jpg\" data-idcdn=\"2\" data-videoid=\"22002417\" id=\"pic_22002417\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video22002417/porn-vi/0/_it_mot_em_sinh_nam_97_o_nam_inh_vu_to_phe_loi_-_hay88\" title=\"Địt một em sinh năm 97 ở Nam Định vú to phê lòi - HAY88\">Địt một em sinh năm 97 ở Nam Định vú to phê lòi - HAY88 <span class=\"duration\">2 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">2 min</span><span><a href=\"/profiles/huanzu\"><span class=\"name\">Huanzu</span></a><span><span class=\"sprfluous\"> - </span> 3.4M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(22002417);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video34042763/porn-vi/0/1_con_cave_tut_quan_1_con_lon_nai_2_con_i_\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/58/e2/96/58e296068a6db982675e403d79e29a36/58e296068a6db982675e403d79e29a36.28.jpg\" data-idcdn=\"2\" data-videoid=\"34042763\" id=\"pic_34042763\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video34042763/porn-vi/0/1_con_cave_tut_quan_1_con_lon_nai_2_con_i_\" title=\"1 con cave tụt quần 1 con lợn nái ( 2 con đĩ )\">1 con cave tụt quần 1 con lợn nái ( 2 con đĩ ) <span class=\"duration\">60 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">60 sec</span><span><a href=\"/profiles/lodithocsinh\"><span class=\"name\">Lodithocsinh</span></a><span><span class=\"sprfluous\"> - </span> 213k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(34042763);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video22857161/porn-vi/0/dan_ban_trai_ve_phong_-y._homesex\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/66/1e/5d/661e5da1e4ab4f860c806ece03aea422/661e5da1e4ab4f860c806ece03aea422.20.jpg\" data-idcdn=\"2\" data-videoid=\"22857161\" id=\"pic_22857161\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video22857161/porn-vi/0/dan_ban_trai_ve_phong_-y._homesex\" title=\"Dan ban trai ve phong -y. homesex\">Dan ban trai ve phong -y. homesex <span class=\"duration\">97 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">97 sec</span><span><a href=\"/profiles/jonh-tran-3714\"><span class=\"name\">Jonh-Tran-3714</span></a><span><span class=\"sprfluous\"> - </span> 2.8M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(22857161);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video35143631/porn-vi/0/screenrecording_20180326_204057\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/82/80/af/8280afdb645674069493e18be56e6e14/8280afdb645674069493e18be56e6e14.26.jpg\" data-idcdn=\"2\" data-videoid=\"35143631\" id=\"pic_35143631\"><span class=\"video-hd-mark\">720p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video35143631/porn-vi/0/screenrecording_20180326_204057\" title=\"Screenrecording 20180326 204057\">Screenrecording 20180326 204057 <span class=\"duration\">5 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">5 min</span><span><a href=\"/profiles/botcucdam\"><span class=\"name\">Botcucdam</span></a><span><span class=\"sprfluous\"> - </span> 20.3k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(35143631);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video32050137/porn-vi/0/con_vo_nung_lon\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/b3/38/ba/b338ba1f7e4937b953d008ebb8b9f9b5/b338ba1f7e4937b953d008ebb8b9f9b5.6.jpg\" data-idcdn=\"2\" data-videoid=\"32050137\" id=\"pic_32050137\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video32050137/porn-vi/0/con_vo_nung_lon\" title=\"Con vo nung lon\">Con vo nung lon <span class=\"duration\">94 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">94 sec</span><span><a href=\"/profiles/dihangdamdang\"><span class=\"name\">Dihangdamdang</span></a><span><span class=\"sprfluous\"> - </span> 151.6k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(32050137);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video3226414/porn-vi/0/mmy_cute_classmate\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/c0/13/82/c01382c050fce9922791828d70255c9c/c01382c050fce9922791828d70255c9c.19.jpg\" data-idcdn=\"2\" data-videoid=\"3226414\" id=\"pic_3226414\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video3226414/porn-vi/0/mmy_cute_classmate\" title=\"mmy cute classmate\">mmy cute classmate <span class=\"duration\">80 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">80 sec</span><span><a href=\"/profiles/tiger786\"><span class=\"name\">Tiger786</span></a><span><span class=\"sprfluous\"> - </span> 938.2k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(3226414);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video24573949/porn-vi/0/cuoi_ngua\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/b0/a6/15/b0a615be8423fba2bd2693aaec0a789e-1/b0a615be8423fba2bd2693aaec0a789e.5.jpg\" data-idcdn=\"2\" data-videoid=\"24573949\" id=\"pic_24573949\"><span class=\"video-hd-mark\">720p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video24573949/porn-vi/0/cuoi_ngua\" title=\"cuoi ngua\">cuoi ngua <span class=\"duration\">2 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">2 min</span><span><a href=\"/profiles/mylove1308\"><span class=\"name\">Mylove1308</span></a><span><span class=\"sprfluous\"> - </span> 1.5M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(24573949);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video10526373/porn-vi/0/coi_ngua_-_kn_thoi_sv\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/bf/92/38/bf92385c0e030882abb8f6278951e2cc/bf92385c0e030882abb8f6278951e2cc.20.jpg\" data-idcdn=\"3\" data-videoid=\"10526373\" id=\"pic_10526373\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video10526373/porn-vi/0/coi_ngua_-_kn_thoi_sv\" title=\"coi ngua - kn thoi sv\">coi ngua - kn thoi sv <span class=\"duration\">20 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">20 sec</span><span><a href=\"/profiles/thuylamnguyen\"><span class=\"name\">Thuylamnguyen</span></a><span><span class=\"sprfluous\"> - </span> 222.8k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(10526373);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video33965277/porn-vi/0/khi_vk_phai_o_nha_mot_minh\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/98/46/c4/9846c4e1e68b26926f2050aed5d12e96/9846c4e1e68b26926f2050aed5d12e96.17.jpg\" data-idcdn=\"2\" data-videoid=\"33965277\" id=\"pic_33965277\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video33965277/porn-vi/0/khi_vk_phai_o_nha_mot_minh\" title=\"Khi vk phải ở nhà một mình\">Khi vk phải ở nhà một mình <span class=\"duration\">2 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">2 min</span><span><a href=\"/profiles/honemtronggiacmo\"><span class=\"name\">Honemtronggiacmo</span></a><span><span class=\"sprfluous\"> - </span> 459.7k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(33965277);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video23910310/porn-vi/0/em_tu_moc_lon\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/fd/87/5e/fd875e84af7f298cf3e32ba1e40da7ee/fd875e84af7f298cf3e32ba1e40da7ee.12.jpg\" data-idcdn=\"3\" data-videoid=\"23910310\" id=\"pic_23910310\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video23910310/porn-vi/0/em_tu_moc_lon\" title=\"em tự móc lồn\">em tự móc lồn <span class=\"duration\">51 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">51 sec</span><span><a href=\"/profiles/minhquoocs\"><span class=\"name\">Minhquoocs</span></a><span><span class=\"sprfluous\"> - </span> 460.7k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(23910310);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video27001749/porn-vi/0/thu_ne\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/64/ad/90/64ad902fcaac5654e1281e2d1a072198/64ad902fcaac5654e1281e2d1a072198.3.jpg\" data-idcdn=\"3\" data-videoid=\"27001749\" id=\"pic_27001749\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video27001749/porn-vi/0/thu_ne\" title=\"Thủ Nè\">Thủ Nè <span class=\"duration\">5 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">5 min</span><span><a href=\"/profiles/thuyduong1995\"><span class=\"name\">Thuyduong1995</span></a><span><span class=\"sprfluous\"> - </span> 740.8k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(27001749);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video29205885/porn-vi/0/_some_ko_dc_quay_-_co_quay_deo_dau\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/d5/a5/8e/d5a58ea57b8e431d25b2c9c26f3e84ef/d5a58ea57b8e431d25b2c9c26f3e84ef.2.jpg\" data-idcdn=\"2\" data-videoid=\"29205885\" id=\"pic_29205885\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video29205885/porn-vi/0/_some_ko_dc_quay_-_co_quay_deo_dau\" title=\"[some] ko dc quay - co quay deo dau\">[some] ko dc quay - co quay deo dau <span class=\"duration\">90 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">90 sec</span><span><a href=\"/profiles/nhanghi69dotcom\"><span class=\"name\">Nhanghi69Dotcom</span></a><span><span class=\"sprfluous\"> - </span> 216.7k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(29205885);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video30351731/porn-vi/0/em_suong_qua_i_mat\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/c8/d9/19/c8d919f0338e9b46db9061497bc525b9/c8d919f0338e9b46db9061497bc525b9.3.jpg\" data-idcdn=\"2\" data-videoid=\"30351731\" id=\"pic_30351731\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video30351731/porn-vi/0/em_suong_qua_i_mat\" title=\"Em sướng quá đi mất\">Em sướng quá đi mất <span class=\"duration\">4 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">4 min</span><span><a href=\"/profiles/dangkiphimsex\"><span class=\"name\">Dangkiphimsex</span></a><span><span class=\"sprfluous\"> - </span> 893.3k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(30351731);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video14721713/porn-vi/0/dit_gai_xinh_vu_to_hiep_dam_-_vlphimsex.com\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/22/78/70/227870b9933ba8cdc6613ecc7ada7a61-1/227870b9933ba8cdc6613ecc7ada7a61.28.jpg\" data-idcdn=\"3\" data-videoid=\"14721713\" id=\"pic_14721713\"></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video14721713/porn-vi/0/dit_gai_xinh_vu_to_hiep_dam_-_vlphimsex.com\" title=\"dit gai xinh vu to hiep dam - VLPHIMSEX.COM\">dit gai xinh vu to hiep dam - VLPHIMSEX.COM <span class=\"duration\">7 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">7 min</span><span><a href=\"/profiles/vlsexviet\"><span class=\"name\">Vlsexviet</span></a><span><span class=\"sprfluous\"> - </span> 132.7k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(14721713);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video26446641/porn-vi/0/2k3_tuyen_quang\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/86/0b/8e/860b8e7d83c9bb79e82ff2c26d45418b/860b8e7d83c9bb79e82ff2c26d45418b.14.jpg\" data-idcdn=\"3\" data-videoid=\"26446641\" id=\"pic_26446641\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video26446641/porn-vi/0/2k3_tuyen_quang\" title=\"2k3 tuyen quang\">2k3 tuyen quang <span class=\"duration\">2 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">2 min</span><span><a href=\"/profiles/mobiblog-org\"><span class=\"name\">Mobiblog-Org</span></a><span><span class=\"sprfluous\"> - </span> 4.2M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(26446641);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video19179679/porn-vi/0/viet_nam_suc_cu_ban_tinh_1\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://cdn77-pic.xvideos-cdn.com/videos/thumbs169ll/7a/c2/b2/7ac2b2eefad4b96814165422dec6fd05/7ac2b2eefad4b96814165422dec6fd05.15.jpg\" data-idcdn=\"10\" data-videoid=\"19179679\" id=\"pic_19179679\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video19179679/porn-vi/0/viet_nam_suc_cu_ban_tinh_1\" title=\"Việt nam sục cu bắn tinh 1\">Việt nam sục cu bắn tinh 1 <span class=\"duration\">40 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">40 sec</span><span><a href=\"/profiles/boyman25t\"><span class=\"name\">Boyman25T</span></a><span><span class=\"sprfluous\"> - </span> 122.7k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(19179679);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video29719415/porn-vi/0/em_rau_dam_18\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/71/2b/bf/712bbfa843774897dfdbaa5a919ce073-1/712bbfa843774897dfdbaa5a919ce073.25.jpg\" data-idcdn=\"3\" data-videoid=\"29719415\" id=\"pic_29719415\"><span class=\"video-hd-mark\">720p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video29719415/porn-vi/0/em_rau_dam_18\" title=\"Em rau dâm 18\">Em rau dâm 18 <span class=\"duration\">69 sec</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">69 sec</span><span><a href=\"/profiles/nice0602\"><span class=\"name\">Nice0602</span></a><span><span class=\"sprfluous\"> - </span> 64.2k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(29719415);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video8428313/porn-vi/0/cosplay_6\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-l3.xvideos-cdn.com/videos/thumbs169ll/f8/75/94/f87594397a895c379adef9e352abf986/f87594397a895c379adef9e352abf986.6.jpg\" data-idcdn=\"3\" data-videoid=\"8428313\" id=\"pic_8428313\"><span class=\"video-sd-mark\">360p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video8428313/porn-vi/0/cosplay_6\" title=\"Cosplay 6\">Cosplay 6 <span class=\"duration\">18 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">18 min</span><span><a href=\"/profiles/ruari654\"><span class=\"name\">Ruari654</span></a><span><span class=\"sprfluous\"> - </span> 178.5k <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(8428313);</script>, <div class=\"thumb-inside\">\r\n <div class=\"thumb\">\r\n  <a href=\"/video23393852/porn-vi/0/cap_doi_gia_1\"><img src=\"https://static-l3.xvideos-cdn.com/img/lightbox/lightbox-blank.gif\" data-src=\"https://img-hw.xvideos-cdn.com/videos/thumbs169ll/87/8b/a7/878ba7a7b2fcb4e46aefcd7632cd6d1c-1/878ba7a7b2fcb4e46aefcd7632cd6d1c.2.jpg\" data-idcdn=\"2\" data-videoid=\"23393852\" id=\"pic_23393852\"><span class=\"video-hd-mark\">720p</span></a>\r\n </div>\r\n</div>\r\n<div class=\"thumb-under\">\r\n <p class=\"title\"><a href=\"/video23393852/porn-vi/0/cap_doi_gia_1\" title=\"cap doi gia 1\">cap doi gia 1 <span class=\"duration\">6 min</span></a></p>\r\n <p class=\"metadata\"><span class=\"bg\"><span class=\"duration\">6 min</span><span><a href=\"/profiles/chungmobile0285\"><span class=\"name\">Chungmobile0285</span></a><span><span class=\"sprfluous\"> - </span> 2.3M <span class=\"sprfluous\">Views</span></span><span class=\"sprfluous\"> - </span></span></span></p>\r\n</div>\r\n<script>xv.thumbs.prepareVideo(23393852);</script>],[]>', 0, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_films`
--

CREATE TABLE `table_films` (
  `id_film` bigint(20) NOT NULL,
  `title_film` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description_film` text COLLATE utf8_unicode_ci NOT NULL,
  `status_film` tinyint(1) NOT NULL,
  `update_film` date NOT NULL,
  `modify_film` date NOT NULL,
  `total_rating` float NOT NULL,
  `id_categories` bigint(20) NOT NULL,
  `id_actor` bigint(20) NOT NULL,
  `id_storage` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `table_films`
--

INSERT INTO `table_films` (`id_film`, `title_film`, `description_film`, `status_film`, `update_film`, `modify_film`, `total_rating`, `id_categories`, `id_actor`, `id_storage`) VALUES
(1, 'test edit', 'test edit', 0, '2022-05-04', '2022-06-08', 5, 8, 4, 1),
(2, 'test edit tu', 'test edit tu', 1, '2022-06-08', '2022-06-08', 0, 2, 2, 13),
(3, 'jjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjj', 1, '2022-06-09', '2022-06-09', 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_products`
--

CREATE TABLE `table_products` (
  `id_product` bigint(20) NOT NULL,
  `name_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status_product` tinyint(1) NOT NULL,
  `update_product` date NOT NULL,
  `modify_product` date NOT NULL,
  `description_product` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `table_products`
--

INSERT INTO `table_products` (`id_product`, `name_product`, `status_product`, `update_product`, `modify_product`, `description_product`) VALUES
(1, 'chua dang ky', 1, '2022-05-04', '2022-05-11', 'chua dang ky'),
(2, '123123', 1, '2022-05-04', '2022-06-07', 'test edit tooooooo'),
(3, 'test edit ne', 0, '2022-06-07', '2022-06-07', 'test edit ne'),
(4, 'test edit0000000000', 0, '2022-06-07', '2022-06-07', 'test edit too'),
(5, 'chua dang ky edit', 1, '2022-06-07', '2022-06-07', 'bbbbbbb');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_rating`
--

CREATE TABLE `table_rating` (
  `id_rating` bigint(20) NOT NULL,
  `star_rate` int(5) NOT NULL,
  `update_rating` date NOT NULL,
  `modify_rating` date NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `id_film` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `table_rating`
--

INSERT INTO `table_rating` (`id_rating`, `star_rate`, `update_rating`, `modify_rating`, `id_user`, `id_film`) VALUES
(1, 5, '2022-05-03', '2022-05-03', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_storage`
--

CREATE TABLE `table_storage` (
  `id_storage` bigint(20) NOT NULL,
  `image_storage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description_storage` text COLLATE utf8_unicode_ci NOT NULL,
  `video_storage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `update_storage` date NOT NULL,
  `modify_storage` date NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `id_actor` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `table_storage`
--

INSERT INTO `table_storage` (`id_storage`, `image_storage`, `description_storage`, `video_storage`, `update_storage`, `modify_storage`, `id_user`, `id_actor`) VALUES
(1, 'anh-thien-nhien-full-hd-2k-4k.jpg', 'test 1', 'test2', '2022-05-31', '2022-05-31', 1, 0),
(2, 'anh-thien-nhien-full-hd-2k-4k.jpg', 'test 2', 'test2', '2022-05-31', '2022-05-31', 1, 0),
(3, 'testpicture.jpg', 'test 3', 'new', '2022-06-02', '2022-06-02', 1, 0),
(4, 'tki-img.jpg', 'test 4', 'new', '2022-06-02', '2022-06-02', 1, 0),
(5, '1-11374_realistic-broken-screen-wallpaper-hd-zuy53uq-glass-crack.jpg', 'test 5', 'c�ch quay m�n h�nh laptop - T�m tr�n Google - Google Chrome 2021-08-20 18-30-41', '2022-06-06', '2022-06-06', 1, 0),
(6, '279461489_365134628908374_3606162504642580952_n.jpg', 'test 6', 'hihi', '2022-06-06', '2022-06-06', 1, 0),
(7, 'checkdone.jpg', 'test 7', 'checkdone', '2022-06-06', '2022-06-07', 1, 0),
(8, 'checkdone.jpg', 'test 8', 'checkdone', '2022-06-06', '2022-06-07', 1, 0),
(9, 'checkdone.jpg', 'test 9', 'checkdone', '2022-06-07', '2022-06-07', 1, 0),
(10, 'bbb.jpg', 'test 10', 'bbb', '2022-06-07', '2022-06-07', 1, 0),
(11, 'images.jfif', 'test 11', 'checkdone', '2022-06-07', '2022-06-07', 1, 0),
(12, 'testlai.mp4', 'test lai ne', 'testlai', '2022-06-08', '2022-06-08', 1, 0),
(13, 'testlailan2.jpg', 'test lai ne lan 2', 'testlailan2', '2022-06-08', '2022-06-08', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_user`
--

CREATE TABLE `table_user` (
  `id_user` bigint(20) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status_user` tinyint(1) NOT NULL,
  `id_product` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `table_user`
--

INSERT INTO `table_user` (`id_user`, `username`, `password`, `name`, `phone`, `email`, `address`, `gender`, `role`, `status_user`, `id_product`) VALUES
(1, 'vy', '$2y$04$nJ/RqSOJHM45Q9j474vZvOSph3IgeOYB9GZzJLcjF8/kmaI8b1qBa', 'tran dang vy', '0906868797', 'dangvy202@gmail.com', '1134/26 truong sa', 1, 'ROLE_ADMIN', 1, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_user_push`
--

CREATE TABLE `table_user_push` (
  `id_push` bigint(20) NOT NULL,
  `title_push` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description_push` text COLLATE utf8_unicode_ci NOT NULL,
  `id_comment` bigint(20) NOT NULL,
  `id_films` bigint(20) NOT NULL,
  `id_rating` bigint(20) NOT NULL,
  `id_categories` bigint(20) NOT NULL,
  `id_storage` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `table_actor`
--
ALTER TABLE `table_actor`
  ADD PRIMARY KEY (`id_actor`);

--
-- Chỉ mục cho bảng `table_categories`
--
ALTER TABLE `table_categories`
  ADD PRIMARY KEY (`id_categories`);

--
-- Chỉ mục cho bảng `table_comment`
--
ALTER TABLE `table_comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `films-comment` (`id_film`),
  ADD KEY `rating-comment` (`id_ratting`),
  ADD KEY `user-comment` (`id_user`);

--
-- Chỉ mục cho bảng `table_contact`
--
ALTER TABLE `table_contact`
  ADD PRIMARY KEY (`id_contact`);

--
-- Chỉ mục cho bảng `table_crawl_data`
--
ALTER TABLE `table_crawl_data`
  ADD PRIMARY KEY (`id_element_crawl`),
  ADD KEY `categories-crawl` (`id_categories`);

--
-- Chỉ mục cho bảng `table_films`
--
ALTER TABLE `table_films`
  ADD PRIMARY KEY (`id_film`),
  ADD KEY `categories-films` (`id_categories`),
  ADD KEY `film-storage` (`id_storage`),
  ADD KEY `actor-films` (`id_actor`);

--
-- Chỉ mục cho bảng `table_products`
--
ALTER TABLE `table_products`
  ADD PRIMARY KEY (`id_product`);

--
-- Chỉ mục cho bảng `table_rating`
--
ALTER TABLE `table_rating`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `films-rating` (`id_film`),
  ADD KEY `user-rating` (`id_user`);

--
-- Chỉ mục cho bảng `table_storage`
--
ALTER TABLE `table_storage`
  ADD PRIMARY KEY (`id_storage`),
  ADD KEY `user-storage` (`id_user`);

--
-- Chỉ mục cho bảng `table_user`
--
ALTER TABLE `table_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `products-user` (`id_product`);

--
-- Chỉ mục cho bảng `table_user_push`
--
ALTER TABLE `table_user_push`
  ADD PRIMARY KEY (`id_push`),
  ADD KEY `films-push` (`id_films`),
  ADD KEY `categories-push` (`id_categories`),
  ADD KEY `comment-push` (`id_comment`),
  ADD KEY `rating-push` (`id_rating`),
  ADD KEY `storage-push` (`id_storage`),
  ADD KEY `user-push` (`id_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `table_actor`
--
ALTER TABLE `table_actor`
  MODIFY `id_actor` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `table_categories`
--
ALTER TABLE `table_categories`
  MODIFY `id_categories` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `table_comment`
--
ALTER TABLE `table_comment`
  MODIFY `id_comment` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `table_contact`
--
ALTER TABLE `table_contact`
  MODIFY `id_contact` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `table_crawl_data`
--
ALTER TABLE `table_crawl_data`
  MODIFY `id_element_crawl` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `table_films`
--
ALTER TABLE `table_films`
  MODIFY `id_film` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `table_products`
--
ALTER TABLE `table_products`
  MODIFY `id_product` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `table_rating`
--
ALTER TABLE `table_rating`
  MODIFY `id_rating` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `table_storage`
--
ALTER TABLE `table_storage`
  MODIFY `id_storage` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `table_user`
--
ALTER TABLE `table_user`
  MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `table_user_push`
--
ALTER TABLE `table_user_push`
  MODIFY `id_push` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `table_comment`
--
ALTER TABLE `table_comment`
  ADD CONSTRAINT `films-comment` FOREIGN KEY (`id_film`) REFERENCES `table_films` (`id_film`),
  ADD CONSTRAINT `rating-comment` FOREIGN KEY (`id_ratting`) REFERENCES `table_rating` (`id_rating`),
  ADD CONSTRAINT `user-comment` FOREIGN KEY (`id_user`) REFERENCES `table_user` (`id_user`);

--
-- Các ràng buộc cho bảng `table_crawl_data`
--
ALTER TABLE `table_crawl_data`
  ADD CONSTRAINT `categories-crawl` FOREIGN KEY (`id_categories`) REFERENCES `table_categories` (`id_categories`);

--
-- Các ràng buộc cho bảng `table_films`
--
ALTER TABLE `table_films`
  ADD CONSTRAINT `actor-films` FOREIGN KEY (`id_actor`) REFERENCES `table_actor` (`id_actor`),
  ADD CONSTRAINT `categories-films` FOREIGN KEY (`id_categories`) REFERENCES `table_categories` (`id_categories`),
  ADD CONSTRAINT `film-storage` FOREIGN KEY (`id_storage`) REFERENCES `table_storage` (`id_storage`);

--
-- Các ràng buộc cho bảng `table_rating`
--
ALTER TABLE `table_rating`
  ADD CONSTRAINT `films-rating` FOREIGN KEY (`id_film`) REFERENCES `table_films` (`id_film`),
  ADD CONSTRAINT `user-rating` FOREIGN KEY (`id_user`) REFERENCES `table_user` (`id_user`);

--
-- Các ràng buộc cho bảng `table_storage`
--
ALTER TABLE `table_storage`
  ADD CONSTRAINT `user-storage` FOREIGN KEY (`id_user`) REFERENCES `table_user` (`id_user`);

--
-- Các ràng buộc cho bảng `table_user`
--
ALTER TABLE `table_user`
  ADD CONSTRAINT `products-user` FOREIGN KEY (`id_product`) REFERENCES `table_products` (`id_product`);

--
-- Các ràng buộc cho bảng `table_user_push`
--
ALTER TABLE `table_user_push`
  ADD CONSTRAINT `categories-push` FOREIGN KEY (`id_categories`) REFERENCES `table_categories` (`id_categories`),
  ADD CONSTRAINT `comment-push` FOREIGN KEY (`id_comment`) REFERENCES `table_comment` (`id_comment`),
  ADD CONSTRAINT `films-push` FOREIGN KEY (`id_films`) REFERENCES `table_films` (`id_film`),
  ADD CONSTRAINT `rating-push` FOREIGN KEY (`id_rating`) REFERENCES `table_rating` (`id_rating`),
  ADD CONSTRAINT `storage-push` FOREIGN KEY (`id_storage`) REFERENCES `table_storage` (`id_storage`),
  ADD CONSTRAINT `user-push` FOREIGN KEY (`id_user`) REFERENCES `table_user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
