-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: bookstore_nmcnpm
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `is_default` int(11) DEFAULT '0',
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,6,0,'Lê Văn Hoàng','0388372328','B9 - KTX ĐH BKHN'),(2,6,0,'Lê Văn Hoàng','0388327484','Paris'),(3,6,0,'Lê Văn B','01234566677','Mỹ ');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(55) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher_id` int(5) NOT NULL,
  `category_id` int(5) NOT NULL,
  `image` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(3) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `num_purchase` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` int(11) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_book_name` (`name`,`author`),
  KEY `publisher_id` (`publisher_id`),
  KEY `category_id` (`category_id`),
  FULLTEXT KEY `FullText` (`name`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Tuổi trẻ đáng giá bao nhiêu','Andrew Matthews',2,1,'/img/books/tuoitredanggiabaonhieu.jpg',1,38000,2016,'Quyển sách này nói về việc tại sao có những người dường như lúc nào cũng ở đúng nơi và đúng lúc - và làm thế nào bạn cũng được như họ; tại sao hóa đơn tính tiền luôn luôn tới ngay tức khắc; tại sao đèn giao thông cứ ở màu đỏ hoài cả nửa ngày trong khi bạn đang trễ một cuộc hẹn làm ăn; tại sao đi du lịch Tây Ban Nha mà bạn cũng gặp người láng giềng sát bên nhà; tại sao bạn chạy chiếc xe cà tàng suốt 15 năm ròng rã mà chưa bao giờ va quẹt... thế rồi chiếc xe mới mua mới chạy có hai ngày đã đụng móp mui!  Quyển sách này nói về: hiểu được bản thân, biết khôi hài về bản thân, trở nên suôn sẻ thuận lợi, biết tha thứ cho bản thân. Sách cũng bàn về việc nhận thức được các quy luật tự nhiên để chúng ta có thể điều chỉnh bản tính chúng ta tốt hơn. Đây là quyển sách nói về làm thế nào để được hạnh phúc.  Một người đàn ông đang thất vọng cùng cực nói với một học giả: \"Thế là hết! Tôi xong đời rồi! Tất cả tiền đã hết! Tôi đã mất tất cả!\". Nhà học giả hỏi: \"Thế anh vẫn còn nhìn thấy, nghe thấy, đi lại... được đấy chứ?\". Một người đàn ông đáp \"Vâng!?\". Nhà học giả nói: \"Vậy thì tôi cho là cái gì anh cũng còn, chỉ có tiền là mất!\".  Một câu chuyện thật hay, phải không bạn?  Chỉ với một cách nhìn nhận khác hẳn mà cuộc đời một người thay đổi: từ chỗ bi quan, tưởng chừng mọi thứ đã kết thúc, sang chỗ lạc quan, có thể sẵn sàng bắt tay vào làm lại từ đầu...  Sự việc thì vẫn thế, chỉ cách nhìn của chúng ta thay đổi, và thế là cuộc đời cũng thay đổi...  Trong cuốn sách này bạn sẽ học cách để nhìn nhận cuộc đời và chấp nhận cuộc đời!  Kiên nhẫn là chỗ dựa của thành công. Tài năng chỉ là chất xúc tác. Trên đời này có nhiều người có tài nhưng không thành công là chuyện thường tình. Kiên nhẫn và kiên quyết luôn là bài giải của những vấn đề thuộc về con người.  Mục tiêu là cỗ xe chuyên chở chúng ta qua những đoạn đường thử thách mà từ đó ta lớn lên. Chúng ta luôn cần mục tiêu, không phải vì chúng đem lại cho ta mà vì cái chúng làm cho ta.  Mọi cái đều bắt đầu từ những giấc mơ. Hãy đứng bên giấc mơ của mình. Như một bài hát đã nói, \"Nếu bạn chưa bao giờ mơ thì không có giấc mơ nào sẽ thành sự thật\".  Một thái độ biết ơn sẽ đảm bảo cho chúng ta chú ý đến cái mình muốn. Khi chúng ta cho là mình đang sống vui vẻ và đầy đủ thì chúng ta hài lòng với những cái mình đã có và thu hút tất cả những gì tốt đẹp về phía mình.',2,'2018-12-14 08:04:49',2),(2,'Ngôn Ngữ Nhiệt Độ','Andrew Matthews',2,1,'/img/books/ndnn.jpg',98,38000,2016,'Quyển sách này nói về việc tại sao có những người dường như lúc nào cũng ở đúng nơi và đúng lúc - và làm thế nào bạn cũng được như họ; tại sao hóa đơn tính tiền luôn luôn tới ngay tức khắc; tại sao đèn giao thông cứ ở màu đỏ hoài cả nửa ngày trong khi bạn đang trễ một cuộc hẹn làm ăn; tại sao đi du lịch Tây Ban Nha mà bạn cũng gặp người láng giềng sát bên nhà; tại sao bạn chạy chiếc xe cà tàng suốt 15 năm ròng rã mà chưa bao giờ va quẹt... thế rồi chiếc xe mới mua mới chạy có hai ngày đã đụng móp mui!  Quyển sách này nói về: hiểu được bản thân, biết khôi hài về bản thân, trở nên suôn sẻ thuận lợi, biết tha thứ cho bản thân. Sách cũng bàn về việc nhận thức được các quy luật tự nhiên để chúng ta có thể điều chỉnh bản tính chúng ta tốt hơn. Đây là quyển sách nói về làm thế nào để được hạnh phúc.  Một người đàn ông đang thất vọng cùng cực nói với một học giả: \"Thế là hết! Tôi xong đời rồi! Tất cả tiền đã hết! Tôi đã mất tất cả!\". Nhà học giả hỏi: \"Thế anh vẫn còn nhìn thấy, nghe thấy, đi lại... được đấy chứ?\". Một người đàn ông đáp \"Vâng!?\". Nhà học giả nói: \"Vậy thì tôi cho là cái gì anh cũng còn, chỉ có tiền là mất!\".  Một câu chuyện thật hay, phải không bạn?  Chỉ với một cách nhìn nhận khác hẳn mà cuộc đời một người thay đổi: từ chỗ bi quan, tưởng chừng mọi thứ đã kết thúc, sang chỗ lạc quan, có thể sẵn sàng bắt tay vào làm lại từ đầu...  Sự việc thì vẫn thế, chỉ cách nhìn của chúng ta thay đổi, và thế là cuộc đời cũng thay đổi...  Trong cuốn sách này bạn sẽ học cách để nhìn nhận cuộc đời và chấp nhận cuộc đời!  Kiên nhẫn là chỗ dựa của thành công. Tài năng chỉ là chất xúc tác. Trên đời này có nhiều người có tài nhưng không thành công là chuyện thường tình. Kiên nhẫn và kiên quyết luôn là bài giải của những vấn đề thuộc về con người.  Mục tiêu là cỗ xe chuyên chở chúng ta qua những đoạn đường thử thách mà từ đó ta lớn lên. Chúng ta luôn cần mục tiêu, không phải vì chúng đem lại cho ta mà vì cái chúng làm cho ta.  Mọi cái đều bắt đầu từ những giấc mơ. Hãy đứng bên giấc mơ của mình. Như một bài hát đã nói, \"Nếu bạn chưa bao giờ mơ thì không có giấc mơ nào sẽ thành sự thật\".  Một thái độ biết ơn sẽ đảm bảo cho chúng ta chú ý đến cái mình muốn. Khi chúng ta cho là mình đang sống vui vẻ và đầy đủ thì chúng ta hài lòng với những cái mình đã có và thu hút tất cả những gì tốt đẹp về phía mình.',0,'2018-12-14 08:04:49',5),(3,'Đời Thay Đổi Khi Chúng Ta Thay Đổi','Andrew Matthews',2,1,'/img/books/doithaydoikhichungtathaydoi.jpg',95,38000,2016,'Quyển sách này nói về việc tại sao có những người dường như lúc nào cũng ở đúng nơi và đúng lúc - và làm thế nào bạn cũng được như họ; tại sao hóa đơn tính tiền luôn luôn tới ngay tức khắc; tại sao đèn giao thông cứ ở màu đỏ hoài cả nửa ngày trong khi bạn đang trễ một cuộc hẹn làm ăn; tại sao đi du lịch Tây Ban Nha mà bạn cũng gặp người láng giềng sát bên nhà; tại sao bạn chạy chiếc xe cà tàng suốt 15 năm ròng rã mà chưa bao giờ va quẹt... thế rồi chiếc xe mới mua mới chạy có hai ngày đã đụng móp mui!  Quyển sách này nói về: hiểu được bản thân, biết khôi hài về bản thân, trở nên suôn sẻ thuận lợi, biết tha thứ cho bản thân. Sách cũng bàn về việc nhận thức được các quy luật tự nhiên để chúng ta có thể điều chỉnh bản tính chúng ta tốt hơn. Đây là quyển sách nói về làm thế nào để được hạnh phúc.  Một người đàn ông đang thất vọng cùng cực nói với một học giả: \"Thế là hết! Tôi xong đời rồi! Tất cả tiền đã hết! Tôi đã mất tất cả!\". Nhà học giả hỏi: \"Thế anh vẫn còn nhìn thấy, nghe thấy, đi lại... được đấy chứ?\". Một người đàn ông đáp \"Vâng!?\". Nhà học giả nói: \"Vậy thì tôi cho là cái gì anh cũng còn, chỉ có tiền là mất!\".  Một câu chuyện thật hay, phải không bạn?  Chỉ với một cách nhìn nhận khác hẳn mà cuộc đời một người thay đổi: từ chỗ bi quan, tưởng chừng mọi thứ đã kết thúc, sang chỗ lạc quan, có thể sẵn sàng bắt tay vào làm lại từ đầu...  Sự việc thì vẫn thế, chỉ cách nhìn của chúng ta thay đổi, và thế là cuộc đời cũng thay đổi...  Trong cuốn sách này bạn sẽ học cách để nhìn nhận cuộc đời và chấp nhận cuộc đời!  Kiên nhẫn là chỗ dựa của thành công. Tài năng chỉ là chất xúc tác. Trên đời này có nhiều người có tài nhưng không thành công là chuyện thường tình. Kiên nhẫn và kiên quyết luôn là bài giải của những vấn đề thuộc về con người.  Mục tiêu là cỗ xe chuyên chở chúng ta qua những đoạn đường thử thách mà từ đó ta lớn lên. Chúng ta luôn cần mục tiêu, không phải vì chúng đem lại cho ta mà vì cái chúng làm cho ta.  Mọi cái đều bắt đầu từ những giấc mơ. Hãy đứng bên giấc mơ của mình. Như một bài hát đã nói, \"Nếu bạn chưa bao giờ mơ thì không có giấc mơ nào sẽ thành sự thật\".  Một thái độ biết ơn sẽ đảm bảo cho chúng ta chú ý đến cái mình muốn. Khi chúng ta cho là mình đang sống vui vẻ và đầy đủ thì chúng ta hài lòng với những cái mình đã có và thu hút tất cả những gì tốt đẹp về phía mình.',1,'2018-12-14 08:04:49',5),(4,'Nhà Giả Kim','Paulo Coelho',4,2,'/img/books/ngk.jpg',100,41000,2016,'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.  Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.  “Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.”  - Trích Nhà giả kim',0,'2018-12-14 09:03:59',5),(5,'Những Đòn Tâm Lý Trong Thuyết Phục','Robert B. Cialdini',5,3,'/img/books/ndtltp.jpg',9,103000,2016,'Tại sao một số người lại có sức thuyết phục đến mê hoặc và luôn là người làm chủ Trò chơi Thuyết phục? Đâu là những động lực vô hình đằng sau thứ sức mạnh thôi thúc chúng ta đồng thuận với người khác? Những thủ thuật được các bậc thầy thuyết phục sử dụng tài tình là gì, làm thế nào đánh bại các thủ thuật đó - đồng thời biến chúng thành \"vũ khí bí mật\" của chính bạn  Với Những đòn tâm lý trong thuyết phục, bạn sẽ có lời giải đáp cho tất cả những câu hỏi ấy. Trong cuốn sách tuyệt vời này, nhà tâm lý học nổi tiếng Robert B. Cialdini tiết lộ 6 \"vũ khí\" gây ảnh hưởng đầy uy lực: cam kết và  nhất quán, khan hiếm, đáp trả, bằng chứng xã hội, uy quyền và thiện cảm. Mỗi loại lại bị chi phối bởi một nguyên tắc tâm lý cơ bản điều khiển hành vi con người và nhờ đó mà tạo nên sức mạnh cho mỗi thủ thuật. Đặc biệt khi được kết  hợp với nhau, chúng sẽ tạo ra ảnh hưởng vô cùng lớn.  Hãy sở hữu kho vũ khí đó và trở thành người làm chủ Trò chơi Thuyết phục. Bạn sẽ không bao giờ nói \"đồng ý\" nếu thật sự bạn muốn nói \"không\", và bạn sẽ không ngừng ngạc nhiên với khả năng gây ảnh hưởng lớn lên trong bạn từng ngày.',0,'2018-12-14 09:22:29',3),(6,'Mặt Trời Không Lặn Về Tây','Kim Bính',3,2,'/img/books/mtklvt.jpg',100,120000,2018,'Tác phẩm “Mặt trời không lặn về tây” của Kim Bính được lấy ý tưởng từ những kí ức đã xảy ra khi còn nhỏ của tác giả. Không chỉ đơn thuần là chuyện tình giữa cô gái Tử Tốn xinh đẹp và chàng trai Hạ Xuyên, tác phẩm còn đan xen trong đó là một câu chuyện điều tra ly kỳ gay cấn về một vụ án liên quan đến môi trường.Quê hương của Hạ Xuyên đang bị ảnh hưởng bởi môi trường bị ô nhiễm, ban đêm các xí nghiệp lén lút xả khí thải dẫn đến việc nước không thể uống, tình hình ô nhiễm trầm trọng đã bao trùm lên cả một vùng. Những vụ việc được bưng bít không để lộ bất cứ thông tin nào ra ngoài và rồi Hạ Xuyên, Tử Tốn cùng biết bao nhiêu người khác đã làm những gì để đẩy lùi vấn nạn này?Cuốn sách “Mặt trời không lặn về Tây” là một câu chuyện chứa đầy cảm xúc về những con người trẻ luôn sống nhiệt huyết và hết lòng với cuộc sống.',0,'2018-12-20 06:05:54',5),(7,'Bốn Chàng Trai Cùng Nhau Đi Du Lịch','Yuriko Mamiya',6,2,'/img/books/bctcnddl.jpg',50,89000,2018,'Mashima – một anh chàng thật thà và thụ động.\r\n\r\nShigeta – một nhà nghiên cứu thường thường bậc trung, đã có một đời vợ.\r\n\r\nNakasugi – một anh chàng luôn bị cô bạn gái kiểm soát, có ưu điểm là dễ gây thiện cảm cho người đối diện.\r\n\r\nVà Saiki – Một anh chàng cực kì đẹp trai nhưng tính khí lạ đời.\r\n\r\nKhông phải bạn bè cũng chẳng đặc biệt thân thích, vậy mà bốn con người ấy lại đồng hành cùng nhau trên những chuyến đi. Qua mỗi chuyến đi họ trở nên thân thiết hơn nhưng vẫn luôn cố gắng giữ một khoảng cách, không can thiệp quá sâu vào sự riêng tư của những người bạn đồng hành nhưng vẫn luôn sẵn sàng đưa tay giúp đỡ, an ủi lẫn nhau. \r\n\r\nCuốn sách để lại cho người đọc một cảm giác vô cùng dễ chịu.',0,'2018-12-20 06:10:05',5),(8,'Kỹ Năng Giao Tiếp Trong Kinh Doanh','Trịnh Quốc Trung',5,3,'/img/books/kngttkd.jpg',60,88500,2018,'Giao tiếp là một hoạt động và nhu cầu không thể thiếu được ở con người. Để thành công trong cuộc sống nói chung và kinh doanh nói riêng, mọi người điều cần kỹ năng giao tiếp tốt.\r\n\r\n \r\n\r\nĐặc biệt đối với các tổ chức kinh doanh trong lĩnh vực dịch vụ, hoạt động giao tiếp càng cần thiết hơn bao giờ hết nhằm thu hút và duy trì được khách hàng quyết định sự thành công của các tổ chức kinh doanh trong điều kiện hiện đại. Trong thực tế., kỹ năng giao tiếp sẽ đóng vai trò quan trọng trong việc thiết lập, duy trì mối quan hệ hợp tác lâu dài và đem lại sự hài lòng cho khách hàng của các tổ chức.\r\n\r\n \r\n\r\n Với tầm quan trọng đó, giới thiệu đến bạn đọc cuốn sách “ Kỹ năng giao tiếp trong kinh doanh” của Tiến sĩ Trịnh Quốc Trung và các tác giả tham gia biên soạn. Cuốn sách giúp chúng ta có kỹ năng giao tiếp ứng xử khéo léo , hiệu quả và chuyên nghiệp trong kinh doanh. Ngoài ra, sách còn phần trắc nghiệm tâm lý giúp độc giả có thể tìm hiểu năng lực bản thân và những quy tắc ứng xử phù hợp\r\n ',0,'2018-12-20 06:11:59',5),(9,'Khởi Nghiệp Tinh Gọn','Eric Ries',7,3,'/img/books/kntg.jpg',110,94000,2011,'Cuốn sách &quot;Khởi nghiệp Tinh gọn” (The Lean Startup) trình bày một mô hình khởi nghiệp vang danh toàn cầu, giúp thay đổi toàn bộ cách thức xây dựng công ty và tung ra sản phẩm mới trên thị trường.\r\n\r\n“Khởi nghiệp” - hai tiếng đơn giản đó có sức hút mạnh mẽ với bất kỳ ai, không chỉ đối với những người đang ấp ủ một dự án kinh doanh, mà ngay cả những ông chủ đang muốn tìm kiếm một sản phẩm hay một ý tưởng mới để “tái khởi nghiệp”, nói cách khác là tái tạo lại mô hình kinh doanh của mình. Tuy nhiên, từ ý tưởng đến thành công là điều không dễ!\r\n\r\nNhiều dự án khởi nghiệp thất bại không phải vì ý tưởng không tốt, chiến lược kém hay tầm nhìn sai, mà cốt lõi của mọi vấn đề nằm ở chỗ chúng ta không có được một mô hình và phương pháp để khởi nghiệp thành công. Vì khởi nghiệp không giống với thành lập và điều hành một công ty theo dạng truyền thống, nên nó cần một mô hình và phương pháp quản trị riêng.',0,'2018-12-20 06:14:01',5);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `total_price` int(11) DEFAULT '0',
  `enable` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,6,216000,0),(2,6,144000,0),(3,6,36000,0),(4,6,36000,0),(5,6,206000,0),(6,6,412000,0),(7,6,520000,0),(8,6,38000,0),(9,6,38000,0),(10,6,3762000,0),(11,6,38000,0),(12,6,38000,0),(13,7,0,1),(14,8,0,1),(15,9,0,1),(16,6,141000,0),(17,6,38000,0),(18,6,0,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_item` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `cart_id` int(5) NOT NULL,
  `book_id` int(5) NOT NULL,
  `quantity` int(5) NOT NULL,
  `total_price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (5,1,2,2,76000),(6,1,1,1,36000),(7,1,3,2,104000),(8,2,1,4,144000),(9,3,1,1,36000),(10,4,1,1,36000),(12,5,5,2,206000),(13,6,1,4,412000),(14,7,3,10,520000),(15,8,2,1,38000),(16,9,1,1,38000),(17,10,2,99,3762000),(18,11,1,1,38000),(19,12,1,1,38000),(20,16,5,1,103000),(21,16,1,1,38000),(22,17,3,1,38000);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger count_total_price_after_insert_cart_item
after insert on cart_item 
for each row
begin 
	-- Get tiền tổng tiền sách từ cart item ứng với cart_id 
    DECLARE m_total_price_cart int;
    SET m_total_price_cart  = (SELECT sum(total_price)  FROM cart_item WHERE cart_id = NEW.cart_id);
	update `cart` SET total_price = m_total_price_cart WHERE id = NEW.cart_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger count_total_price_after_update_cart_item
after update on cart_item 
for each row
begin 
	-- Get tiền tổng tiền sách từ cart item 
    DECLARE m_total_price_cart int;
    SET m_total_price_cart  = (SELECT sum(total_price)  FROM cart_item WHERE cart_id = NEW.cart_id);
	update `cart` SET total_price = m_total_price_cart WHERE id = NEW.cart_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger count_total_price_after_delete_cart_item
after delete on cart_item 
for each row
begin 
	-- Get tiền tổng tiền sách từ cart item 
    DECLARE m_total_price_cart int;
    SET m_total_price_cart  = (SELECT sum(total_price) FROM cart_item WHERE cart_id = OLD.cart_id);
    if m_total_price_cart IS NULL THEN 
		SET m_total_price_cart = 0;
    end if;
	update `cart` SET total_price = m_total_price_cart WHERE id = OLD.cart_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `FullText` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Sách Kỹ năng - Sống đẹp'),(2,'Sách Văn học'),(3,'Sách Kinh tế');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Lê Văn Hoàng','lehoang279@gmail.com','Dịch page','Page dịch chưa hết','2018-12-15 14:57:20'),(2,'Lê Văn Hoàng ','lehoang279@gmail.com','Test','Chỉ là test ','2018-12-15 14:57:20');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `address_id` int(5) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_price` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `delivered` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_ibfk_2` (`address_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,6,1,'2018-12-14 06:08:16',159000,2,1),(2,6,1,'2018-12-14 06:09:40',51000,3,1),(3,6,1,'2018-12-14 08:12:30',51000,4,1),(4,6,2,'2018-12-15 15:06:52',221000,5,1),(5,6,3,'2018-12-15 15:12:19',427000,6,1),(6,6,2,'2018-12-15 15:13:28',535000,7,0),(7,6,1,'2018-12-15 15:14:24',53000,8,1),(8,6,1,'2018-12-15 15:46:45',53000,9,0),(9,6,1,'2018-12-15 15:52:01',3777000,10,0),(10,6,1,'2018-12-15 16:13:10',53000,11,0),(11,6,1,'2018-12-17 15:03:03',53000,12,0),(12,6,1,'2018-12-18 01:27:18',156000,16,1),(13,6,3,'2018-12-20 04:55:42',53000,17,0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_publisher_name` (`name`),
  FULLTEXT KEY `FullText` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'NXB Thanh Niên','024 6294 3819','Nhà Số 1, Lô A7, Khu Đô Thị Đầm Trấu, Phường Bạch Đằng, Quận Hai Bà Trưng, Thành Phố Hà Nội, Bạch Đằng, Hai Bà Trưng, Hà Nội'),(2,'NXB Trẻ',NULL,NULL),(3,'NXB Hà Nội',NULL,NULL),(4,'NXB Văn Học',NULL,NULL),(5,'NXB Lao động','',''),(6,'NXB Văn Hóa Văn Nghệ','',''),(7,'NXB Tổng hợp TPHCM','','');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `book_id` int(5) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (3,5,1,'hay quá','2018-12-09 02:49:27',1),(4,5,1,'mình sẽ mua ','2018-12-09 03:21:55',1),(5,5,1,'','2018-12-09 03:35:31',1),(6,5,1,'','2018-12-09 03:38:05',1),(7,5,1,'','2018-12-09 03:38:22',1),(8,5,1,'','2018-12-09 03:39:19',1),(9,5,1,'','2018-12-09 03:42:27',1),(10,5,1,'xxx','2018-12-09 03:48:19',1),(11,6,4,'xcass','2018-12-14 16:08:36',1),(12,6,5,'hay qua','2018-12-15 03:06:13',2),(13,6,1,'Tạm duoc','2018-12-15 03:14:05',3),(14,6,5,'hay ghe','2018-12-15 03:45:30',5),(15,6,5,'Hay quá','2018-12-15 03:45:43',1),(16,6,5,'Cuốn sách tuyệt vời ','2018-12-15 07:06:52',4),(17,6,1,'đsddas','2018-12-20 04:54:54',3),(18,6,1,'dd','2018-12-20 04:55:02',5);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger count_rating_after_insert_review
after insert on review
for each row
begin 
	-- Get tiền tổng tiền sách từ cart item 
    DECLARE m_total_review int;
    DECLARE m_total_rating int;
    DECLARE m_rating_book int;
    SET m_total_review  = (SELECT count(*) FROM review WHERE book_id = NEW.book_id);
    SET m_total_rating = (SELECT sum(rating) FROM review WHERE book_id = NEW.book_id);
    SET m_rating_book = (SELECT CEIL(m_total_rating / m_total_review));
    
	update `book` SET rating = m_rating_book WHERE id = NEW.book_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `UNQ_user_mail` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'admin','$2a$10$brXCg.Qsdw6JmVw.enpy.eefYECC1qVJxigyH48hTqe5I/Khc0i3K','Administrator@gmail.com','Administrator','','0999999999',1,NULL),(6,'admin2','$2a$10$dCNMWCZM1mJGhka4FEiAUuCpS2ffRz0P64X56akH/2PQcgJt8cvoe','leeyueshing19@gmail.com','Lê Văn','Hoàng','03883723288',1,NULL),(7,'admin3','$2a$10$brXCg.Qsdw6JmVw.enpy.eefYECC1qVJxigyH48hTqe5I/Khc0i3K','hoang@gmail.com','','','',1,NULL),(8,'leeyueshing','$2a$10$brXCg.Qsdw6JmVw.enpy.eefYECC1qVJxigyH48hTqe5I/Khc0i3K','a@gmail.com','','','',1,NULL),(9,'lehoang123','$2a$10$brXCg.Qsdw6JmVw.enpy.eefYECC1qVJxigyH48hTqe5I/Khc0i3K','lehoang123@gmail.com','','','',1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insert_cart_on_insert_user
AFTER INSERT on user
FOR EACH ROW 
BEGIN 
	INSERT INTO `cart`(`user_id`) values(NEW.id);
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`role`),
  KEY `user_id_2` (`user_id`),
  CONSTRAINT `user_role_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (7,5,'ROLE_ADMIN'),(6,5,'ROLE_MEMBER'),(9,6,'ROLE_ADMIN'),(8,6,'ROLE_MEMBER'),(10,7,'ROLE_MEMBER'),(11,8,'ROLE_MEMBER'),(12,9,'ROLE_MEMBER');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-20 13:55:22
