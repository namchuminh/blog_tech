-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2024 at 02:36 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_tech`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `article_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `privacy` enum('public','private') DEFAULT 'private',
  `is_draft` tinyint(1) DEFAULT 0,
  `slug` text NOT NULL,
  `image_url` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`article_id`, `user_id`, `title`, `content`, `tags`, `privacy`, `is_draft`, `slug`, `image_url`, `createdAt`, `updatedAt`) VALUES
(7, 1, 'Bài viết mới 1', '<p>abcde</p>', 'pizza, bánh pizza giao diện, pizza mới', 'public', 0, 'nguyen-van-a-1', 'uploads/articles/image_url-1726769334905-890045202.webp', '2024-09-19 18:08:54', '2024-11-09 11:13:03'),
(29, 1, 'Nguyễn văn a', '<p>Nguyễn văn a</p>', 'pizza, bánh pizza giao diện, pizza mới', 'public', 0, 'nguyen-van-a', 'uploads/articles/image_url-1728634559859-87833461.png', '2024-09-20 15:23:42', '2024-10-11 08:15:59'),
(30, 1, 'Bài Viết 1', '<p>Nội dung bài viết 1</p>', 'bài viết, bài viết 1', 'private', 1, 'bai-viet-abcde1111', 'uploads/articles/image_url-1728634467419-171400886.png', '2024-09-20 16:02:02', '2024-10-18 09:17:21'),
(31, 2, 'Bài Viết Văn B', '<p>Nội dung bài viết</p>', 'bài viết, bài viết', 'public', 0, 'bai-viet-vanb', 'uploads/articles/image_url-1728705040593-382251430.png', '2024-10-03 09:03:09', '2024-10-12 03:50:40'),
(32, 2, 'Bài Viết Văn B', '<p>Tolerably much and ouch the in began alas more ouch some then accommodating flimsy wholeheartedly after hello slightly the that cow pouted much a goodness bound rebuilt poetically jaguar groundhog</p><h2><strong>Design is future</strong></h2><p>Uninhibited carnally hired played in whimpered dear gorilla koala depending and much yikes off far quetzal goodness and from for grimaced goodness unaccountably and meadowlark near unblushingly crucial scallop tightly neurotic hungrily some and dear furiously this apart.</p><p>Spluttered narrowly yikes left moth in yikes bowed this that grizzly much hello on spoon-fed that alas rethought much decently richly and wow against the frequent fluidly at formidable acceptably flapped besides and much circa far over the bucolically hey precarious goldfinch mastodon goodness gnashed a jellyfish and one however because.</p><ul><li><a href=\"#\"><img src=\"assets/imgs/thumbnail-1.jpg\" alt=\"\"></a></li><li><a href=\"#\"><img src=\"assets/imgs/thumbnail-2.jpg\" alt=\"\"></a></li><li><a href=\"#\"><img src=\"assets/imgs/thumbnail-10.jpg\" alt=\"\"></a></li></ul><p>Laconic overheard dear woodchuck wow this outrageously taut beaver hey hello far meadowlark imitatively egregiously hugged that yikes minimally unanimous pouted flirtatiously as beaver beheld above forward energetic across this jeepers beneficently cockily less a the raucously that magic upheld far so the this where crud then below after jeez enchanting drunkenly more much wow callously irrespective limpet.</p><p>Scallop or far crud plain remarkably far by thus far iguana lewd precociously and and less rattlesnake contrary caustic wow this near alas and next and pled the yikes articulate about as less cackled dalmatian in much less well jeering for the thanks blindly sentimental whimpered less across objectively fanciful grimaced wildly some wow and rose jeepers outgrew lugubrious luridly irrationally attractively dachshund.</p><blockquote><p>The advance of technology is based on making it fit in so that you don\'t really even notice it, so it\'s part of everyday life.</p><p>B. Johnso</p></blockquote>', 'bài viết, bài viết', 'public', 0, 'bai-viet-vanb111', 'uploads/articles/image_url-1728702683695-115631590.webp', '2024-10-03 09:03:45', '2024-10-12 03:11:23'),
(33, 2, 'ABCDE11111', '<p>AB</p>', 'pizza, bánh pizza giao diện, pizza mới', 'public', 0, 'abcde11111', 'uploads/articles/image_url-1728705020994-926473985.png', '2024-10-03 10:28:21', '2024-10-12 03:50:21'),
(34, 4, 'Hướng dẫn code hoàn chỉnh 1 website blog sử dụng wordpress', '<figure class=\"image\"><img style=\"aspect-ratio:1100/733;\" src=\"http://127.0.0.1:3001/uploads/articles/upload-1728983275109-682683986.webp\" width=\"1100\" height=\"733\"></figure><p>Bài viết mẫu</p>', 'tin tức, wordpress, code', 'public', 0, 'huong-dan-code-hoan-chinh-1-website-blog-su-dung-wordpress', 'uploads/articles/image_url-1729095269675-511151023.png', '2024-10-14 11:59:28', '2024-10-16 16:14:29'),
(35, 4, 'Bài viết nháp chỉnh sửa', '<p>Đường ven biển ở khu kinh tế Vân Phong dài 23 km, tổng đầu tư 5.400 tỷ đồng, đang được Sở Giao thông Vận tải đề xuất UBND Khánh Hòa.</p><p>Dự án có điểm đầu giao tỉnh lộ 651, xã Vạn Thọ và điểm cuối ở xã Vạn Lương, đều thuộc huyện Vạn Ninh; triển khai thủ tục đầu tư giai đoạn 2024-2025, xây dựng năm 2026-2030.</p><figure class=\"image\"><picture><source srcset=\"https://i1-vnexpress.vnecdn.net/2024/10/15/venbien-1728980066-5565-1728980173.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=OR_0SVzpqm3xhx0Even-jA 1x, https://i1-vnexpress.vnecdn.net/2024/10/15/venbien-1728980066-5565-1728980173.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=vBBBL7Eu_HKvMgzhUxgD6w 1.5x, https://i1-vnexpress.vnecdn.net/2024/10/15/venbien-1728980066-5565-1728980173.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=YJFxY7NjWZm9XDCmI3UcNA 2x\"><img src=\"https://i1-vnexpress.vnecdn.net/2024/10/15/venbien-1728980066-5565-1728980173.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=OR_0SVzpqm3xhx0Even-jA\" alt=\"Một đoạn đường ven biển tại khu kinh tế Vân Phong. Ảnh: Vĩnh Thái\" width=\"680\" height=\"383\"></picture></figure><p>Đoạn đường ven biển chạy qua khu kinh tế Vân Phong. Ảnh: <i>Vĩnh Thái</i></p><p>Công trình tiếp nối đường ven biển từ xã Vạn Lương, huyện Vạn Ninh, đi thị xã Ninh Hòa, dài 20 km, tổng đầu tư hơn 2.030 tỷ đồng được HĐND tỉnh thông qua <a href=\"https://vnexpress.net/hon-2-000-ty-dong-lam-duong-ven-bien-khu-kinh-te-van-phong-4690866.html\">chủ trương đầu tư</a> hồi cuối năm ngoái. Toàn tuyến sẽ hoàn thiện đường ven biển phía bắc tỉnh, giúp phát triển kinh tế - xã hội, đảm bảo quốc phòng và an ninh.</p><p>Hiện, UBND tỉnh Khánh Hòa giao Sở Kế hoạch và Đầu tư phối hợp các ngành liên quan xem xét đề nghị của Sở Giao thông Vận tải, báo cáo trước 20/10.</p><p>Trước đó, tháng 3/2023, đường nối từ quốc lộ 1 đến Đầm Môn (thuộc Khu kinh tế Vân Phong), vốn đầu tư gần 1.000 tỷ đồng thông xe giúp thu hút đầu tư phát triển kinh tế. HĐND tỉnh đã thông qua phương án<a href=\"https://vnexpress.net/740-ty-dong-nang-cap-duong-noi-cao-toc-vao-khu-kinh-te-van-phong-4666667.html\"> nâng cấp quốc lộ 26B</a>, nối cao tốc Buôn Ma Thuột - Khánh Hoà vào Vân Phong.</p><p>Khu kinh tế Vân Phong rộng 150.000 ha, trong đó hơn một nửa là diện tích mặt nước, còn lại là đất liền và đảo. Đây là một trong ba vùng kinh tế trọng điểm của Khánh Hòa, có 19 phân khu gồm cảng biển, dịch vụ hậu cần, đô thị, dịch vụ nghỉ dưỡng...</p><p>1111</p>', 'nháp', 'public', 0, 'bai-viet-nhap-chinh-su', 'uploads/articles/image_url-1728979930097-537069034.webp', '2024-10-15 07:46:13', '2024-10-29 12:55:29'),
(36, 4, 'aaaa', '<p>abcdeaa</p>', 'pizza, bánh pizza giao diện, pizza mới', 'public', 0, 'aaaa', 'uploads/articles/image_url-1728984961658-223102395.webp', '2024-10-15 09:36:01', '2024-10-29 12:37:53'),
(37, 4, '[Bị từ chối vì Bài viết vi phạm] Bài viết mới ngày 18/10 2024', '<p>bài viết mới 2024</p><figure class=\"image\"><img style=\"aspect-ratio:1100/733;\" src=\"http://127.0.0.1:3001/uploads/articles/upload-1729242775753-947469615.webp\" width=\"1100\" height=\"733\"></figure>', 'bài viết, mới, news', 'private', 1, '[rejected]', 'uploads/articles/image_url-1729242783337-999166576.webp', '2024-10-18 09:13:03', '2024-10-29 12:05:16');

-- --------------------------------------------------------

--
-- Table structure for table `article_categories`
--

CREATE TABLE `article_categories` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `article_categories`
--

INSERT INTO `article_categories` (`article_id`, `category_id`) VALUES
(7, 18),
(7, 20),
(29, 18),
(29, 20),
(30, 18),
(30, 20),
(31, 18),
(31, 20),
(32, 18),
(32, 20),
(33, 19),
(33, 22),
(34, 16),
(34, 20),
(35, 13),
(35, 20),
(35, 23),
(36, 20),
(36, 22),
(37, 16);

-- --------------------------------------------------------

--
-- Table structure for table `article_images`
--

CREATE TABLE `article_images` (
  `image_id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_likes`
--

CREATE TABLE `article_likes` (
  `like_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `article_likes`
--

INSERT INTO `article_likes` (`like_id`, `user_id`, `article_id`, `createdAt`, `updatedAt`) VALUES
(27, 4, 33, '2024-11-02 11:29:50', '2024-11-02 11:29:50');

-- --------------------------------------------------------

--
-- Table structure for table `article_views`
--

CREATE TABLE `article_views` (
  `view_id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `view_count` int(11) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `article_views`
--

INSERT INTO `article_views` (`view_id`, `article_id`, `view_count`, `createdAt`, `updatedAt`) VALUES
(5, 29, 5, '2024-09-20 15:30:54', '2024-09-20 15:30:54'),
(6, 32, 64, '2024-10-11 08:42:11', '2024-10-11 08:42:11'),
(7, 30, 11, '2024-10-11 08:42:11', '2024-10-11 08:42:11'),
(8, 35, 766, '2024-10-15 08:38:51', '2024-10-15 08:38:51'),
(9, 34, 162, '2024-10-15 09:01:25', '2024-10-15 09:01:25'),
(10, 33, 183, '2024-10-15 10:17:40', '2024-10-15 10:17:40'),
(11, 31, 16, '2024-10-16 11:47:50', '2024-10-16 11:47:50'),
(12, 36, 48, '2024-10-16 12:13:10', '2024-10-16 12:13:10'),
(13, 37, 2, '2024-10-18 09:13:56', '2024-10-18 09:13:56'),
(14, 7, 2, '2024-11-09 11:13:20', '2024-11-09 11:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `slug`, `image_url`, `createdAt`, `updatedAt`) VALUES
(13, 'Category 3111', 'category-322', 'uploads/categories/image_url-1726584514166-443202936.jpg', '2024-09-17 14:48:34', '2024-09-17 15:14:10'),
(14, 'Category 3', 'category-31', 'uploads/categories/image_url-1726663277714-142931264.jpg', '2024-09-17 14:49:36', '2024-09-18 12:41:17'),
(16, 'Chuyên mục mới', 'category-3', 'uploads/categories/image_url-1726584635310-317665045.jpg', '2024-09-17 14:50:35', '2024-09-17 15:08:10'),
(18, 'Category 5', 'category-5', 'uploads/categories/image_url-1728645180968-481209232.png', '2024-09-17 16:17:03', '2024-10-11 11:13:00'),
(19, 'Category 369', '369', 'uploads/categories/image_url-1726663285337-307150047.jpg', '2024-09-18 08:25:03', '2024-09-18 12:41:25'),
(20, 'Tin học văn phòng', 'tin-hoc-van-phong', 'uploads/categories/image_url-1728645149775-53447749.webp', '2024-09-20 09:21:17', '2024-10-11 11:12:29'),
(22, 'Chuyên mục mới', 'chuyen-muc-moi', 'uploads/categories/image_url-1728645144451-598440725.webp', '2024-10-03 10:21:01', '2024-10-11 11:12:24'),
(23, 'Nguyễn Văn Z', 'nguyen-van-z', 'uploads/categories/image_url-1728033165197-263476746.jpg', '2024-10-04 09:12:45', '2024-10-04 09:12:45');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `article_id`, `user_id`, `content`, `createdAt`, `updatedAt`) VALUES
(14, 30, 1, 'ABCDE', '2024-10-11 08:26:11', '2024-10-11 08:26:11'),
(15, 7, 1, 'AAA', '2024-10-11 08:26:11', '2024-10-11 08:26:11'),
(16, 7, 1, 'KKK', '2024-10-11 08:48:34', '2024-10-11 08:48:34'),
(17, 33, 4, 'ok', '2024-10-16 09:41:11', '2024-10-16 09:41:11'),
(18, 33, 4, 'Bình luận test', '2024-10-16 09:52:27', '2024-10-16 09:52:27'),
(19, 33, 4, 'bình luận mới nhâtts', '2024-10-16 09:54:16', '2024-10-16 09:54:16'),
(21, 35, 4, 'hay', '2024-10-16 12:00:50', '2024-10-16 12:00:50'),
(22, 31, 4, 'hay hay hay', '2024-10-16 12:02:29', '2024-10-16 12:02:29'),
(23, 35, 4, 'very good\nhay', '2024-10-16 15:32:37', '2024-10-16 15:32:37'),
(24, 35, 4, 'hay quá ', '2024-10-16 16:12:25', '2024-10-16 16:12:25'),
(25, 35, 4, 'hay quá ', '2024-10-16 16:12:55', '2024-10-16 16:12:55'),
(26, 35, 4, 'hay quá ', '2024-10-16 16:13:14', '2024-10-16 16:13:14'),
(27, 35, 4, 'ok', '2024-10-16 16:13:40', '2024-10-16 16:13:40'),
(28, 33, 4, 'tuyệt', '2024-10-18 09:22:01', '2024-10-18 09:22:01'),
(29, 36, 4, 'up', '2024-10-29 11:03:17', '2024-10-29 11:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `follower_id` int(11) NOT NULL,
  `follower_user_id` int(11) DEFAULT NULL,
  `followed_user_id` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`follower_id`, `follower_user_id`, `followed_user_id`, `createdAt`, `updatedAt`) VALUES
(10, 2, 1, '2024-10-13 17:42:05', '2024-10-13 17:42:05'),
(30, 4, 1, '2024-10-16 15:37:05', '2024-10-16 15:37:05'),
(33, 4, 2, '2024-10-18 09:23:04', '2024-10-18 09:23:04');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` enum('comment','like','follow') DEFAULT NULL,
  `related_user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `type`, `related_user_id`, `article_id`, `comment_id`, `createdAt`, `updatedAt`) VALUES
(2, 2, 'follow', 1, NULL, NULL, '2024-09-14 08:18:16', '2024-09-14 08:18:16'),
(3, 2, 'follow', 1, NULL, NULL, '2024-09-14 08:34:09', '2024-09-14 08:34:09'),
(4, 2, 'follow', 1, NULL, NULL, '2024-09-14 08:34:18', '2024-09-14 08:34:18'),
(10, 1, 'follow', 4, NULL, NULL, '2024-10-13 17:33:24', '2024-10-13 17:33:24'),
(11, 1, 'follow', 4, NULL, NULL, '2024-10-13 17:33:28', '2024-10-13 17:33:28'),
(12, 1, 'follow', 4, NULL, NULL, '2024-10-13 17:34:38', '2024-10-13 17:34:38'),
(13, 1, 'follow', 4, NULL, NULL, '2024-10-13 17:34:48', '2024-10-13 17:34:48'),
(14, 2, 'follow', 4, NULL, NULL, '2024-10-13 17:39:39', '2024-10-13 17:39:39'),
(15, 2, 'follow', 4, NULL, NULL, '2024-10-13 17:40:26', '2024-10-13 17:40:26'),
(16, 1, 'follow', 2, NULL, NULL, '2024-10-13 17:42:05', '2024-10-13 17:42:05'),
(17, 4, 'follow', 2, NULL, NULL, '2024-10-13 17:42:13', '2024-10-13 17:42:13'),
(18, 2, 'follow', 4, NULL, NULL, '2024-10-13 18:39:52', '2024-10-13 18:39:52'),
(19, 2, 'follow', 4, NULL, NULL, '2024-10-15 10:30:43', '2024-10-15 10:30:43'),
(20, 2, 'follow', 4, NULL, NULL, '2024-10-15 10:30:46', '2024-10-15 10:30:46'),
(21, 2, 'follow', 4, NULL, NULL, '2024-10-15 10:30:53', '2024-10-15 10:30:53'),
(22, 2, 'follow', 4, NULL, NULL, '2024-10-15 10:30:57', '2024-10-15 10:30:57'),
(23, 2, 'follow', 4, NULL, NULL, '2024-10-15 10:31:06', '2024-10-15 10:31:06'),
(24, 2, 'follow', 4, NULL, NULL, '2024-10-15 10:33:46', '2024-10-15 10:33:46'),
(25, 2, 'follow', 4, NULL, NULL, '2024-10-15 10:33:53', '2024-10-15 10:33:53'),
(26, 2, 'follow', 4, NULL, NULL, '2024-10-15 10:34:01', '2024-10-15 10:34:01'),
(27, 2, 'follow', 4, NULL, NULL, '2024-10-15 10:36:23', '2024-10-15 10:36:23'),
(28, 2, 'follow', 4, NULL, NULL, '2024-10-15 10:36:37', '2024-10-15 10:36:37'),
(29, 2, 'follow', 4, NULL, NULL, '2024-10-15 10:43:54', '2024-10-15 10:43:54'),
(30, 2, 'follow', 4, NULL, NULL, '2024-10-16 09:13:56', '2024-10-16 09:13:56'),
(31, 2, 'follow', 4, NULL, NULL, '2024-10-16 09:14:14', '2024-10-16 09:14:14'),
(32, 2, 'comment', 4, 33, 17, '2024-10-16 09:41:11', '2024-10-16 09:41:11'),
(33, 4, 'follow', 4, NULL, NULL, '2024-10-16 09:47:45', '2024-10-16 09:47:45'),
(34, 4, 'follow', 4, NULL, NULL, '2024-10-16 09:47:47', '2024-10-16 09:47:47'),
(35, 2, 'comment', 4, 33, 18, '2024-10-16 09:52:27', '2024-10-16 09:52:27'),
(36, 2, 'comment', 4, 33, 19, '2024-10-16 09:54:16', '2024-10-16 09:54:16'),
(37, 2, 'follow', 4, NULL, NULL, '2024-10-16 11:59:53', '2024-10-16 11:59:53'),
(38, 2, 'comment', 4, 31, 22, '2024-10-16 12:02:29', '2024-10-16 12:02:29'),
(39, 1, 'follow', 4, NULL, NULL, '2024-10-16 15:35:16', '2024-10-16 15:35:16'),
(40, 1, 'follow', 4, NULL, NULL, '2024-10-16 15:37:05', '2024-10-16 15:37:05'),
(41, 2, 'follow', 4, NULL, NULL, '2024-10-16 16:15:46', '2024-10-16 16:15:46'),
(42, 2, 'comment', 4, 33, 28, '2024-10-18 09:22:01', '2024-10-18 09:22:01'),
(43, 2, 'follow', 4, NULL, NULL, '2024-10-18 09:22:44', '2024-10-18 09:22:44'),
(44, 2, 'follow', 4, NULL, NULL, '2024-10-18 09:23:04', '2024-10-18 09:23:04'),
(68, 2, 'like', 4, 33, NULL, '2024-11-02 11:29:50', '2024-11-02 11:29:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `reset_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reading_lists`
--

CREATE TABLE `reading_lists` (
  `list_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_history`
--

CREATE TABLE `search_history` (
  `search_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `searched_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `role` enum('admin','user','blocked') NOT NULL DEFAULT 'user',
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(64) DEFAULT NULL,
  `password_reset_expires` datetime DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `social_login_provider` varchar(50) DEFAULT NULL,
  `social_login_id` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `username`, `role`, `password_hash`, `password_reset_token`, `password_reset_expires`, `fullname`, `avatar_url`, `bio`, `social_login_provider`, `social_login_id`, `createdAt`, `updatedAt`) VALUES
(1, 'nguyenvana@gmail.com', 'nguyenvana', 'admin', '$2a$10$.gDaf7D7JY1508PzmiPdUuu/NgZ4MlGE0FLm3Tww8wYTiHHQMhaji', NULL, NULL, 'Nguyễn Văn An', 'uploads/users/avatar_url-1726664402978-641471375.webp', 'Nguyễn văn a đẹp trai', NULL, NULL, '2024-09-12 09:07:33', '2024-11-09 11:26:15'),
(2, 'nguyenvanb@gmail.com', 'nguyenvanb', 'user', '$2a$10$Wil1Fe.Sc1.NNcD9VHDHveWjrNnEqTDtbZi0fTqoaAJ9.LAw2IoGO', NULL, NULL, 'Nguyen Van Nam', 'uploads/users/avatar_url-1728733649650-835868734.png', 'Thích ca nhạc <3', NULL, NULL, '2024-09-12 09:19:56', '2024-11-09 11:26:17'),
(3, 'nguyenvanc@gmail.com', 'nguyenvanc', 'user', '$2a$10$JO8pAkx6znT70kzkATz1WO3Q2WFMFyDFOVwokfgLNVT1QSvcX6Eym', NULL, NULL, 'Nguyen Van C', 'uploads/users/avatar.jpg', NULL, NULL, NULL, '2024-09-12 10:31:49', '2024-11-09 11:26:20'),
(4, 'chuminhnamma@gmail.com', 'chuminhnam', 'user', '$2a$10$21JNLNzyihho7ni0yGt89Ok647KQtCKmgSAK7.glkr2343awyRqUC', NULL, NULL, 'Chu Minh Nam', 'uploads/users/avatar_url-1729242591490-713347917.webp', 'Thích nghe đọc sách', NULL, NULL, '2024-10-11 13:00:04', '2024-11-09 12:25:16'),
(5, 'nguyenvanegiang@gmail.com', 'nguyenvanegiang', 'user', '$2a$10$jyD9L/Wn52R6JYXSDom4ROi0/sxTDqSXT48k9GBUAfIbzv3C2xZXC', NULL, NULL, 'Nguyễn Văn An', 'uploads/users/avatar.jpg', NULL, NULL, NULL, '2024-11-09 13:06:53', '2024-11-09 13:06:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `article_categories`
--
ALTER TABLE `article_categories`
  ADD PRIMARY KEY (`article_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `article_images`
--
ALTER TABLE `article_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `article_likes`
--
ALTER TABLE `article_likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `article_views`
--
ALTER TABLE `article_views`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`follower_id`),
  ADD KEY `follower_user_id` (`follower_user_id`),
  ADD KEY `followed_user_id` (`followed_user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `related_user_id` (`related_user_id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`reset_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reading_lists`
--
ALTER TABLE `reading_lists`
  ADD PRIMARY KEY (`list_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `search_history`
--
ALTER TABLE `search_history`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `article_images`
--
ALTER TABLE `article_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `article_likes`
--
ALTER TABLE `article_likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `article_views`
--
ALTER TABLE `article_views`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `follower_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `reset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reading_lists`
--
ALTER TABLE `reading_lists`
  MODIFY `list_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_history`
--
ALTER TABLE `search_history`
  MODIFY `search_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `article_categories`
--
ALTER TABLE `article_categories`
  ADD CONSTRAINT `article_categories_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `article_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `article_images`
--
ALTER TABLE `article_images`
  ADD CONSTRAINT `article_images_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`);

--
-- Constraints for table `article_likes`
--
ALTER TABLE `article_likes`
  ADD CONSTRAINT `article_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `article_likes_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`);

--
-- Constraints for table `article_views`
--
ALTER TABLE `article_views`
  ADD CONSTRAINT `article_views_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_ibfk_1` FOREIGN KEY (`follower_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `followers_ibfk_2` FOREIGN KEY (`followed_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`related_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`),
  ADD CONSTRAINT `notifications_ibfk_4` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`comment_id`);

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `reading_lists`
--
ALTER TABLE `reading_lists`
  ADD CONSTRAINT `reading_lists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `reading_lists_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `search_history`
--
ALTER TABLE `search_history`
  ADD CONSTRAINT `search_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
