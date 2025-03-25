CREATE DATABASE FlowerShop;
USE FlowerShop;

-- Bảng Users
CREATE TABLE Users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    username NVARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(20) NOT NULL CHECK (role IN ('Owner', 'Staff', 'Customer'))
);

-- Bảng Categories
CREATE TABLE Categories (
    categoryId INT IDENTITY(1,1) PRIMARY KEY,
    categoryName NVARCHAR(100) UNIQUE NOT NULL
);

-- Bảng Products
CREATE TABLE Products (
    productId INT IDENTITY(1,1) PRIMARY KEY,
    productName NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX), 
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    categoryId INT NULL, 
    image VARCHAR(255),
    FOREIGN KEY (categoryId) REFERENCES Categories(categoryId) ON DELETE SET NULL
);

-- Bảng Orders
CREATE TABLE Orders (
    orderId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NULL,  
    totalPrice DECIMAL(10,2) NOT NULL,
    orderStatus VARCHAR(20) DEFAULT 'New' CHECK (orderStatus IN ('New', 'Processing', 'Completed', 'Canceled')),
    phone VARCHAR(20),
    address NVARCHAR(MAX) NOT NULL,
    createdAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (userId) REFERENCES Users(id) ON DELETE SET NULL
);

-- Bảng OrderItems
CREATE TABLE OrderItems (
    orderItemId INT IDENTITY(1,1) PRIMARY KEY,
    orderId INT NOT NULL,
    productId INT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (orderId) REFERENCES Orders(orderId) ON DELETE CASCADE,
    FOREIGN KEY (productId) REFERENCES Products(productId) ON DELETE SET NULL
);

-- Bảng Reviews
CREATE TABLE Reviews (
    reviewId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NULL,  
    productId INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment NVARCHAR(MAX), 
    createdAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (userId) REFERENCES Users(id) ON DELETE SET NULL,
    FOREIGN KEY (productId) REFERENCES Products(productId) ON DELETE CASCADE 
);


INSERT INTO Categories (categoryName) VALUES 
(N'Hoa chúc mừng'),
(N'Hoa cưới'),
(N'Hoa dịp lễ tình yêu'),
(N'Hoa sự kiện, sinh nhật'),
(N'Hoa tang lễ'),
(N'Hoa tết'),
(N'Hoa trang trí');

Select*from Categories

INSERT INTO Products (productName, description, price, quantity, categoryId, image)  
VALUES  
(N'Chậu Lan Hồ Điệp Vàng Sang Trọng',  
 N'Lan hồ điệp vàng mang ý nghĩa của sự sung túc, thịnh vượng và may mắn. Chậu hoa này không chỉ giúp không gian trở nên sang trọng mà còn là món quà ý nghĩa dành tặng đối tác, người thân trong các dịp quan trọng.'  
 + CHAR(13) + CHAR(10) +  
 N'• 3 cành lan hồ điệp vàng rực rỡ' + CHAR(13) + CHAR(10) +  
 N'• Chậu sứ cao cấp, thiết kế tinh tế' + CHAR(13) + CHAR(10) +  
 N'• Phù hợp trang trí phòng khách, sảnh lễ tân hoặc làm quà tặng',  
 950000, 70, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa trang trí'), N'chau_lan_ho_diep_vang.jpg'),  

(N'Chậu Lan Hồ Điệp Tím Quý Phái',  
 N'Lan hồ điệp tím là biểu tượng của sự sang trọng, quý phái và vững bền trong tình cảm. Chậu hoa này mang đến không gian thanh lịch và tinh tế, rất phù hợp cho văn phòng hoặc không gian sống.'  
 + CHAR(13) + CHAR(10) +  
 N'• 5 cành lan hồ điệp tím kiêu sa' + CHAR(13) + CHAR(10) +  
 N'• Chậu sứ trắng hiện đại, sang trọng' + CHAR(13) + CHAR(10) +  
 N'• Thích hợp trang trí nội thất hoặc làm quà tặng cao cấp',  
 1250000, 71, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa trang trí'), N'chau_lan_ho_diep_tim.jpg'),  

(N'Chậu Hoa Thiên Điểu Rực Rỡ',  
 N'Hoa thiên điểu mang dáng vẻ độc đáo, tượng trưng cho sự tự do, mạnh mẽ và khát vọng vươn lên. Chậu hoa này tạo điểm nhấn ấn tượng, phù hợp với không gian hiện đại và sáng tạo.'  
 + CHAR(13) + CHAR(10) +  
 N'• 6 cành hoa thiên điểu với sắc cam nổi bật' + CHAR(13) + CHAR(10) +  
 N'• Chậu gốm men trắng đơn giản, tinh tế' + CHAR(13) + CHAR(10) +  
 N'• Thích hợp trang trí quán café, sảnh khách sạn, văn phòng',  
 880000, 72, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa trang trí'), N'chau_thien_dieu.jpg'),  

(N'Chậu Hoa Lan Hồ Điệp Trắng Thanh Khiết',  
 N'Lan hồ điệp trắng mang vẻ đẹp thuần khiết, thanh lịch và tinh tế. Đây là lựa chọn tuyệt vời để trang trí không gian hoặc làm quà tặng trang nhã, thể hiện sự tôn trọng và chân thành.'  
 + CHAR(13) + CHAR(10) +  
 N'• 7 cành lan hồ điệp trắng tinh khôi' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói lụa trắng mềm mại, cao cấp' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng trắng nhã nhặn, phù hợp với mọi không gian',  
 680000, 73, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa trang trí'), N'chau_lan_ho_diep_trang.jpg');  

 INSERT INTO Products (productName, description, price, quantity, categoryId, image)  
VALUES  
(N'Cành Đào Tết May Mắn',  
 N'Hoa đào là biểu tượng đặc trưng của mùa xuân, mang đến may mắn, tài lộc và sự bình an trong năm mới. Những cánh hoa hồng thắm rực rỡ, nhẹ nhàng bung nở báo hiệu một khởi đầu thuận lợi và hạnh phúc.'  
 + CHAR(13) + CHAR(10) +  
 N'• 1 cành đào lớn với nhiều nụ và hoa' + CHAR(13) + CHAR(10) +  
 N'• Sắc hồng rực rỡ mang không khí xuân' + CHAR(13) + CHAR(10) +  
 N'• Thích hợp trưng bày trong nhà hoặc văn phòng',  
 250000, 60, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa tết'), N'canh_dao_tet.jpg'),  

(N'Chậu Hoa Cát Tường Phú Quý',  
 N'Hoa cát tường mang ý nghĩa về sự may mắn, phú quý và thịnh vượng. Với những cánh hoa mềm mại, rực rỡ, chậu hoa này là lựa chọn hoàn hảo để trang trí ngày Tết, mang đến cảm giác ấm áp và sung túc.'  
 + CHAR(13) + CHAR(10) +  
 N'• Chậu hoa cát tường đủ màu sắc' + CHAR(13) + CHAR(10) +  
 N'• Mang ý nghĩa của tài lộc và an lành' + CHAR(13) + CHAR(10) +  
 N'• Thích hợp đặt trên bàn khách hoặc bàn thờ ngày Tết',  
 320000, 61, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa tết'), N'chau_hoa_cat_tuong.jpg'),  

(N'Bó Hoa Lay Ơn Đỏ Thắm',  
 N'Hoa lay ơn là biểu tượng của sự trường thọ, may mắn và tài lộc. Những bông hoa lay ơn đỏ rực thể hiện sự sung túc, giàu sang, rất phù hợp để trưng bày trong gia đình dịp đầu năm.'  
 + CHAR(13) + CHAR(10) +  
 N'• 10 cành hoa lay ơn đỏ rực rỡ' + CHAR(13) + CHAR(10) +  
 N'• Thể hiện sự mạnh mẽ và phát tài' + CHAR(13) + CHAR(10) +  
 N'• Phù hợp trang trí phòng khách hoặc bàn thờ ngày Tết',  
 180000, 62, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa tết'), N'bo_hoa_lay_on.jpg'),  

(N'Cành Thanh Liễu Xuân Như Ý',  
 N'Thanh liễu mang vẻ đẹp nhẹ nhàng, thanh thoát nhưng lại tượng trưng cho sự trường thọ, bình an và vượng khí. Cành thanh liễu với sắc hồng tím tươi tắn sẽ giúp không gian ngày Tết thêm phần ấm áp.'  
 + CHAR(13) + CHAR(10) +  
 N'• 5 cành thanh liễu rực rỡ' + CHAR(13) + CHAR(10) +  
 N'• Biểu tượng của sự trường thọ và vững bền' + CHAR(13) + CHAR(10) +  
 N'• Dùng để cắm bình lớn, trang trí không gian rộng',  
 270000, 63, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa tết'), N'canh_thanh_lieu.jpg'),  

(N'Cành Tuyết Mai Trắng Tinh Khôi',  
 N'Tuyết mai với những bông hoa trắng nhỏ li ti tạo cảm giác thanh khiết, tinh tế. Đây là loài hoa tượng trưng cho sự khởi đầu mới, sự may mắn và an lành trong năm mới.'  
 + CHAR(13) + CHAR(10) +  
 N'• 3 cành tuyết mai trắng thuần khiết' + CHAR(13) + CHAR(10) +  
 N'• Thích hợp cắm bình cao, tạo điểm nhấn tinh tế' + CHAR(13) + CHAR(10) +  
 N'• Tượng trưng cho sự bình an, tài lộc',  
 290000, 64, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa tết'), N'canh_tuyet_mai.jpg');  

INSERT INTO Products (productName, description, price, quantity, categoryId, image)  
VALUES  
(N'Bó Hoa Cúc Trắng Tưởng Niệm',  
 N'Hoa cúc trắng là biểu tượng của lòng thành kính, sự chia buồn và tưởng nhớ đến người đã khuất. Bó hoa này mang một nỗi buồn nhẹ nhàng nhưng sâu sắc, thể hiện sự tiếc thương và tôn kính đối với người đã ra đi mãi mãi. Màu trắng của hoa cúc như một lời cầu nguyện thanh khiết dành cho linh hồn được an nghỉ.'  
 + CHAR(13) + CHAR(10) +  
 N'• 20 bông hoa cúc trắng thuần khiết' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói trắng trang nhã, tối giản' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng đen trang trọng',  
 100000, 45, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa tang lễ'), N'hoa_cuc_trang_tuong_niem.jpg'),  

(N'Vòng Hoa Ly Trắng Tiễn Biệt',  
 N'Hoa ly trắng mang đến sự thanh cao và lòng thành kính, như một lời tiễn biệt nhẹ nhàng gửi đến người đã khuất. Mùi hương thoảng nhẹ của hoa ly như đưa linh hồn về cõi vĩnh hằng. Bó hoa với giấy gói nâu pastel và lá xanh nhấn mạnh sự trang nghiêm, trầm mặc.'  
 + CHAR(13) + CHAR(10) +  
 N'• 10 bông hoa ly trắng thanh khiết' + CHAR(13) + CHAR(10) +  
 N'• Lá xanh điểm xuyết tạo sự hài hòa' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói nâu pastel đơn giản, trang trọng' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng nâu trầm lặng',  
 180000, 47, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa tang lễ'), N'vong_hoa_ly_trang_tien_biet.jpg'),  

(N'Bó Hoa Lan Trắng Kính Viếng',  
 N'Lan trắng thể hiện sự tôn kính, lòng thành và niềm thương tiếc với người đã khuất. Sắc trắng tinh khôi như một biểu tượng của sự thanh thản và tiễn đưa nhẹ nhàng. Bó hoa được gói giấy trắng sữa kết hợp dây trắng, tạo sự trang trọng và thanh lịch.'  
 + CHAR(13) + CHAR(10) +  
 N'• 12 cành lan trắng thanh thoát' + CHAR(13) + CHAR(10) +  
 N'• Lá xanh nhẹ nhàng điểm xuyết' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói trắng sữa thanh thoát' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng trắng giản dị',  
 190000, 48, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa tang lễ'), N'hoa_lan_trang_kinh_vieng.jpg');

INSERT INTO Products (productName, description, price, quantity, categoryId, image)  
VALUES  
(N'Bó Hoa Calimero Hồng Trắng Nhẹ Nhàng',  
 N'Calimero với sự kết hợp của sắc hồng và trắng mang đến vẻ đẹp tinh tế, tươi sáng, phù hợp với các buổi tiệc sinh nhật, sự kiện quan trọng. Giấy gói kính trắng giúp làm nổi bật màu sắc tự nhiên của hoa, kết hợp dây xanh nhẹ nhàng tạo điểm nhấn.'  
 + CHAR(13) + CHAR(10) +  
 N'• Calimero hồng và trắng nhỏ nhắn, đáng yêu' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói kính trắng trong suốt, thanh lịch' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng xanh tạo điểm nhấn nhẹ nhàng',  
 290000, 63, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa sự kiện, sinh nhật'), N'hoa_sinh_nhat_calimero_hong_trang.jpg'),  

(N'Bó Hoa Chuông Rực Rỡ Mừng Ngày Vui',  
 N'Hoa chuông với đủ sắc màu rực rỡ mang đến nguồn năng lượng vui tươi, tỏa sáng cho bất kỳ sự kiện hay bữa tiệc sinh nhật nào. Giấy gói hồng và dây hồng giúp bó hoa trở nên ngọt ngào, ấm áp và đầy sự yêu thương.'  
 + CHAR(13) + CHAR(10) +  
 N'• Hoa chuông nhiều màu sắc tươi sáng' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói hồng mềm mại, nữ tính' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng hồng trang nhã',  
 270000, 64, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa sự kiện, sinh nhật'), N'hoa_sinh_nhat_hoa_chuong.jpg'),  

(N'Bó Hoa Sen Đá & Tana Trắng Cá Tính',  
 N'Bó hoa là sự kết hợp giữa sen đá đủ màu mang vẻ đẹp bền bỉ và cúc tana trắng tinh khôi, tạo nên một món quà sinh nhật độc đáo. Giấy gói trắng kết hợp lưới nhẹ nhàng, cùng dây xanh lá giúp bó hoa trông tự nhiên, gần gũi hơn.'  
 + CHAR(13) + CHAR(10) +  
 N'• Sen đá nhiều màu sắc tượng trưng cho sức sống mạnh mẽ' + CHAR(13) + CHAR(10) +  
 N'• Cúc tana trắng nhỏ nhắn, dịu dàng' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói trắng kết hợp lưới tinh tế' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng xanh lá mềm mại',  
 300000, 65, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa sự kiện, sinh nhật'), N'hoa_sinh_nhat_sen_da_tana.jpg'),  

(N'Bó Hoa Hồng Rực Rỡ & Tươi Vui',  
 N'Hồng nhiều màu sắc mang lại ý nghĩa của niềm vui, sự đa dạng và tình cảm chân thành. Bó hoa được thiết kế trang nhã với giấy gói tím nhạt và dây trắng, phù hợp cho những buổi tiệc sinh nhật hay sự kiện quan trọng.'  
 + CHAR(13) + CHAR(10) +  
 N'• Hoa hồng nhiều màu sắc tươi sáng' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói tím nhạt nhẹ nhàng, sang trọng' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng trắng đơn giản, tinh tế',  
 310000, 66, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa sự kiện, sinh nhật'), N'hoa_sinh_nhat_hong_mix.jpg'),  

(N'Bó Hoa Tulip Hồng Dịu Dàng',  
 N'Hoa tulip hồng mang vẻ đẹp tinh tế, dịu dàng, là biểu tượng của sự may mắn và tình yêu ngọt ngào. Kết hợp với giấy gói trắng đơn giản nhưng thanh lịch và dây hồng mềm mại, bó hoa này là lựa chọn hoàn hảo cho các buổi sinh nhật và sự kiện đặc biệt.'  
 + CHAR(13) + CHAR(10) +  
 N'• 7 bông tulip hồng dịu dàng, thanh thoát' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói trắng tối giản, thanh lịch' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng hồng mềm mại, ngọt ngào',  
 320000, 67, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa sự kiện, sinh nhật'), N'hoa_sinh_nhat_tulip_hong.jpg')

INSERT INTO Products (productName, description, price, quantity, categoryId, image)  
VALUES 
(N'Bó Hoa Lily & Mao Lương Hồng Ngọt Ngào',  
 N'Hoa lily tượng trưng cho sự thuần khiết và cao quý, trong khi hoa mao lương hồng lại mang vẻ đẹp nhẹ nhàng, lãng mạn. Sự kết hợp của hai loại hoa này tạo nên một bó hoa tinh tế, nổi bật với giấy gói lưới hồng mềm mại và dây ruy băng hồng đầy nữ tính.'  
 + CHAR(13) + CHAR(10) +  
 N'• 5 bông hoa lily trắng thanh cao' + CHAR(13) + CHAR(10) +  
 N'• 6 bông hoa mao lương hồng dịu dàng' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói lưới hồng tạo sự nhẹ nhàng, uyển chuyển' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng hồng mềm mại, lãng mạn',  
 280000, 
 55, 
 (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), 
 N'hoa_tinh_yeu_lily_mao_luong.jpg'
),

(N'Bó Hoa Tình Yêu Cẩm Chướng Dịu Dàng',  
 N'Hoa cẩm chướng tượng trưng cho tình yêu sâu sắc và lòng biết ơn. Bó hoa này là sự kết hợp hài hòa giữa cẩm chướng trắng, hồng và giấy gói vàng sang trọng, tạo nên một tổng thể vừa dịu dàng vừa nổi bật. Ruy băng hồng giúp tăng thêm sự lãng mạn, phù hợp để dành tặng nửa kia trong những dịp đặc biệt.'  
 + CHAR(13) + CHAR(10) +  
 'N• Hoa cẩm chướng trắng và hồng nhẹ nhàng' + CHAR(13) + CHAR(10) +  
 'N• Giấy gói vàng rực rỡ, sang trọng' + CHAR(13) + CHAR(10) +  
 'N• Dây ruy băng hồng nữ tính, lãng mạn',  
 250000, 40, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_cam_chuong.jpg'),  


('NBó Hoa Tình Yêu Cẩm Tú Cầu Thanh Khiết',  
 'NHoa cẩm tú cầu mang ý nghĩa của sự chân thành và gắn kết, kết hợp cùng những bông cúc trắng thuần khiết tạo nên một bó hoa tinh tế và nhẹ nhàng. Giấy gói kính xanh tôn lên nét trong trẻo, kết hợp cùng dây ruy băng xanh tạo nên một tổng thể hài hòa, đầy quyến rũ.'  
 + CHAR(13) + CHAR(10) +  
 'N• Hoa cẩm tú cầu xanh dịu mát, nhẹ nhàng' + CHAR(13) + CHAR(10) +  
 'N• Hoa cúc trắng điểm xuyết tinh tế' + CHAR(13) + CHAR(10) +  
 'N• Giấy gói kính xanh tạo hiệu ứng trong trẻo' + CHAR(13) + CHAR(10) +  
 'N• Dây ruy băng xanh nhẹ nhàng, thanh thoát',  
 280000, 45, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_cam_tu_cau_trang.jpg'),  


(N'Bó Hoa Tình Yêu Bluestar Mỹ Tím Lãng Mạn',  
 N'Hoa Bluestar tím mang vẻ đẹp huyền bí, tượng trưng cho tình yêu thủy chung và sự lãng mạn dịu dàng. Bó hoa kết hợp giữa giấy báo trắng cổ điển và giấy kính trong suốt, tạo nên phong cách nhẹ nhàng, tinh tế, nhưng vẫn mang nét cuốn hút riêng biệt.'  
 + CHAR(13) + CHAR(10) +  
 'N• 10 cành hoa Bluestar Mỹ tím nhẹ nhàng' + CHAR(13) + CHAR(10) +  
 'N• Giấy báo trắng kết hợp giấy kính độc đáo' + CHAR(13) + CHAR(10) +  
 'N• Phù hợp cho những ai yêu thích phong cách thanh lịch nhưng phá cách',  
 260000, 42, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_bluestar.jpg'),


(N'Bó Hoa Tình Yêu Cẩm Tú Cầu Xanh Bơ Nhẹ Nhàng',  
 N'Hoa cẩm tú cầu xanh bơ tượng trưng cho sự dịu dàng, chân thành, kết hợp với hoa cúc Tana nhỏ nhắn tạo nên một bó hoa mang vẻ đẹp nhẹ nhàng và tự nhiên. Giấy gói nâu pastel giúp bó hoa thêm phần thanh lịch, trong khi dây ruy băng hồng tạo điểm nhấn ngọt ngào và lãng mạn.'  
 + CHAR(13) + CHAR(10) +  
 'N• 1 bông cẩm tú cầu xanh bơ nhẹ nhàng' + CHAR(13) + CHAR(10) +  
 'N• Hoa cúc Tana nhỏ xinh điểm xuyết' + CHAR(13) + CHAR(10) +  
 'N• Giấy gói nâu pastel phong cách mộc mạc' + CHAR(13) + CHAR(10) +  
 'N• Dây ruy băng hồng nữ tính, tinh tế',  
 270000, 50, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_cam_tu_cau_xanh_bo.jpg'),  


(N'Bó Hoa Hồng Đỏ Tình Yêu Nồng Cháy',  
 N'Hoa hồng đỏ từ lâu đã là biểu tượng của tình yêu mãnh liệt, đam mê và sự chân thành. Bó hoa này mang vẻ đẹp cổ điển nhưng không bao giờ lỗi thời, với giấy gói trắng tinh khôi tạo điểm nhấn sang trọng và dây ruy băng trắng giúp tôn lên nét tinh tế, trang nhã.'  
 + CHAR(13) + CHAR(10) +  
 N'• 12 bông hoa hồng đỏ rực rỡ, quyến rũ' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói trắng tinh tế, sang trọng' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng trắng thanh nhã, thuần khiết',  
 290000, 60, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_hong_do.jpg'),  


(N'Bó Hoa Hồng & Đồng Tiền Rực Rỡ',  
 N'Sự kết hợp giữa hoa hồng dịu dàng và hoa đồng tiền nhiều màu sắc tượng trưng cho sự vui tươi, hạnh phúc và năng lượng tích cực trong tình yêu. Bó hoa mang đến vẻ đẹp ngọt ngào, tràn đầy sức sống với giấy gói hồng nhẹ nhàng và dây ruy băng hồng lãng mạn.'  
 + CHAR(13) + CHAR(10) +  
 'N• Hoa hồng mix các màu tươi tắn' + CHAR(13) + CHAR(10) +  
 'N• Hoa đồng tiền nhiều màu rực rỡ, mang ý nghĩa may mắn' + CHAR(13) + CHAR(10) +  
 'N• Giấy gói hồng dịu dàng, đầy nữ tính' + CHAR(13) + CHAR(10) +  
 'N• Dây ruy băng hồng mềm mại, lãng mạn',  
 270000, 50, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_hong_dong_tien.jpg'),  


(N'Bó Hoa Hồng Trắng Thanh Khiết',  
 N'Hoa hồng trắng mang ý nghĩa của tình yêu trong sáng, thuần khiết và sự chân thành. Bó hoa được thiết kế với giấy gói kính xám đen tạo vẻ đẹp huyền bí, sang trọng, đồng thời dây ruy băng trắng giúp tổng thể trở nên thanh lịch và tinh tế hơn.'  
 + CHAR(13) + CHAR(10) +  
 N'• 10 bông hoa hồng trắng tinh khôi' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói kính xám đen tạo sự bí ẩn, cuốn hút' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng trắng nhẹ nhàng, trang nhã',  
 260000, 48, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_hong_trang.jpg'),  


(N'Bó Hoa Ly Trắng Thanh Cao',  
 N'Hoa ly trắng mang vẻ đẹp thanh khiết, sang trọng và thể hiện sự cao quý trong tình yêu. Bó hoa này được kết hợp cùng lá xanh tươi mát, giấy gói nâu pastel nhẹ nhàng và dây ruy băng nâu mộc mạc, tạo nên một tổng thể vừa tinh tế vừa ấm áp.'  
 + CHAR(13) + CHAR(10) +  
 N'• 5 bông hoa ly trắng thanh tao' + CHAR(13) + CHAR(10) +  
 N'• Một ít lá xanh điểm xuyết tạo sự hài hòa' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói nâu pastel nhẹ nhàng, sang trọng' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng nâu tự nhiên, mộc mạc',  
 300000, 58, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_ly_trang.jpg'),  


(N'Bó Hoa Hồng Ecuador & Cúc Tana Sang Trọng',  
 N'Hoa hồng Ecuador với sắc đỏ rực rỡ tượng trưng cho tình yêu mãnh liệt và vĩnh cửu, trong khi cúc tana nhỏ xinh mang đến nét nhẹ nhàng, tinh khôi. Giấy gói kính đen bí ẩn kết hợp cùng dây ruy băng đỏ tạo điểm nhấn sang trọng và cuốn hút.'  
 + CHAR(13) + CHAR(10) +  
 N'• 7 bông hồng Ecuador đỏ quyến rũ' + CHAR(13) + CHAR(10) +  
 N'• Hoa cúc tana nhỏ xinh, tinh tế' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói kính đen huyền bí, sang trọng' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng đỏ nổi bật, mạnh mẽ',  
 320000, 60, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_hong_ecuador_cuc_tana.jpg'),  


(N'Bó Hoa Hồng Pastel Ngọt Ngào',  
 N'Hoa hồng pastel mang ý nghĩa của sự dịu dàng, tinh tế và tình yêu nhẹ nhàng, bền chặt. Bó hoa này kết hợp giữa sắc hồng nhẹ nhàng của hoa hồng pastel, giấy gói kính hồng mềm mại và dây ruy băng hồng duyên dáng, tạo nên một món quà hoàn hảo cho người thương.'  
 + CHAR(13) + CHAR(10) +  
 N'• 10 bông hoa hồng pastel nhẹ nhàng' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói kính hồng dịu dàng, nữ tính' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng hồng mềm mại, trang nhã',  
 270000, 50, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_hong_pastel.jpg'), 


(N'Bó Hoa Mao Lương Hồng Mộng Mơ',  
 N'Hoa mao lương hồng nổi bật với vẻ đẹp kiêu sa và mềm mại, mang ý nghĩa của sự ngọt ngào và viên mãn trong tình yêu. Được kết hợp với lá xanh tạo điểm nhấn hài hòa, giấy gói kính hồng trong suốt đầy lãng mạn và dây ruy băng hồng nữ tính, bó hoa này chính là biểu tượng của sự tinh tế và dịu dàng.'  
 + CHAR(13) + CHAR(10) +  
 N'• 8 bông hoa mao lương hồng quyến rũ' + CHAR(13) + CHAR(10) +  
 N'• Một ít lá xanh tươi mát tạo sự cân bằng' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói kính hồng mềm mại, sang trọng' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng hồng đầy lãng mạn',  
 280000, 55, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_mao_luong_hong.jpg'), 


(N'Bó Hoa Mao Lương & Blue Star Rực Rỡ',  
 N'Hoa mao lương với những sắc màu rực rỡ tượng trưng cho sự tươi mới, may mắn trong tình yêu. Blue Star mang lại nét đẹp nhẹ nhàng, tinh khôi. Giấy gói nâu pastel và dây ruy băng hồng tạo nên tổng thể lãng mạn và tinh tế.'  
 + CHAR(13) + CHAR(10) +  
 N'• 6 bông hoa mao lương đủ màu sắc nổi bật' + CHAR(13) + CHAR(10) +  
 N'• Blue Star xanh dịu nhẹ, tạo điểm nhấn' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói nâu pastel ấm áp, sang trọng' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng hồng nhẹ nhàng, nữ tính',  
 290000, 57, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_mao_luong_blue_star.jpg'), 


(N'Bó Hoa Mẫu Đơn Trắng Thanh Khiết',  
 N'Hoa mẫu đơn trắng đại diện cho tình yêu thuần khiết, sự tinh khôi và chân thành. Được gói trong giấy trắng hồng nhẹ nhàng và dây ruy băng hồng nữ tính, bó hoa này là món quà hoàn hảo để thể hiện tình cảm chân thành nhất.'  
 + CHAR(13) + CHAR(10) +  
 N'• 5 bông hoa mẫu đơn trắng thanh cao' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói trắng hồng dịu dàng, trang nhã' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng hồng mềm mại, đầy yêu thương',  
 310000, 59, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_mau_don_trang.jpg'), 


(N'Bó Hoa Phi Yến & Tiểu Tú Cầu Nhẹ Nhàng',  
 N'Phi yến tượng trưng cho sự lãng mạn và thủy chung, kết hợp với tiểu tú cầu trắng vàng mang vẻ đẹp tinh tế và thanh nhã. Giấy gói trắng sữa và dây ruy băng trắng làm nổi bật sự thuần khiết và nhẹ nhàng của bó hoa này.'  
 + CHAR(13) + CHAR(10) +  
 N'• 7 cành hoa phi yến cao sang' + CHAR(13) + CHAR(10) +  
 N'• Tiểu tú cầu trắng vàng tinh tế' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói trắng sữa nhẹ nhàng, thanh thoát' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng trắng thanh lịch',  
 270000, 52, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_phi_yen_tieu_tu_cau.jpg'),  


(N'Bó Hoa Cúc Tana Trăm Bông Ngọt Ngào',  
 N'Cúc Tana với những bông hoa nhỏ xinh mang ý nghĩa về sự bền bỉ, vững chắc trong tình yêu. Giấy gói hồng kính trong suốt cùng dây ruy băng hồng làm tôn lên vẻ đẹp nhẹ nhàng và tinh tế của bó hoa này.'  
 + CHAR(13) + CHAR(10) +  
 N'• 100 bông cúc Tana nhỏ xinh' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói hồng kính trong suốt, mềm mại' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng hồng nhẹ nhàng, duyên dáng',  
 260000, 50, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_cuc_tana_tram_bong.jpg'),  


(N'Bó Hoa Tulip & Cala Vàng Quý Phái',  
 N'Sự kết hợp đầy sang trọng giữa hoa tulip tinh tế và cala vàng kiêu sa mang lại vẻ đẹp quý phái, mạnh mẽ và rực rỡ cho bó hoa. Giấy gói đen tạo sự tương phản nổi bật, kết hợp cùng dây trắng tinh khôi làm tăng thêm sự trang nhã.'  
 + CHAR(13) + CHAR(10) +  
 N'• 5 bông tulip sắc nét, tươi sáng' + CHAR(13) + CHAR(10) +  
 N'• 3 bông cala vàng kiêu sa, nổi bật' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói đen sang trọng, bí ẩn' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng trắng nhẹ nhàng, tinh tế',  
 320000, 58, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_tulip_cala_vang.jpg'),


(N'Bó Hoa Tulip, Hồng Ecuador & Hồng Môn Độc Đáo',  
 N'Bó hoa là sự kết hợp tinh tế giữa tulip thanh lịch, hồng Ecuador mềm mại và hồng môn trắng đỏ nổi bật, tạo nên tổng thể độc đáo, mạnh mẽ nhưng vẫn đầy lãng mạn. Giấy gói đen và dây trắng càng làm tôn lên vẻ đẹp cá tính và cuốn hút.'  
 + CHAR(13) + CHAR(10) +  
 N'• 4 bông tulip mềm mại, thanh tao' + CHAR(13) + CHAR(10) +  
 N'• 3 bông hồng Ecuador sang trọng' + CHAR(13) + CHAR(10) +  
 N'• 2 bông hồng môn trắng đỏ ấn tượng' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói đen huyền bí, quyến rũ' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng trắng thanh lịch',  
 350000, 60, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_tulip_hong_ecuador_hong_mon.jpg'),


(N'Bó Hoa Tulip, Mao Lương & Blue Star Ngọt Ngào',  
 N'Sự kết hợp của tulip, mao lương trắng vàng và blue star tạo nên bó hoa mang vẻ đẹp hài hòa giữa sự dịu dàng, tinh tế và một chút mạnh mẽ. Giấy gói hồng pastel và dây nâu mang đến cảm giác nhẹ nhàng, lãng mạn và đầy chất thơ.'  
 + CHAR(13) + CHAR(10) +  
 N'• 5 bông tulip trắng tinh khiết' + CHAR(13) + CHAR(10) +  
 N'• 3 bông mao lương vàng ấm áp' + CHAR(13) + CHAR(10) +  
 N'• Blue Star xanh mát, thanh thoát' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói hồng pastel ngọt ngào' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng nâu nhẹ nhàng, vintage',  
 310000, 61, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_tulip_mao_luong_blue_star.jpg'),  


(N'Bó Hoa Tulip Xanh Độc Đáo & Sang Trọng',  
 N'Hoa tulip xanh hiếm có mang ý nghĩa của sự bình yên, hi vọng và vĩnh cửu. Với giấy gói đen sang trọng và dây ruy băng trắng thanh lịch, bó hoa này là lựa chọn hoàn hảo cho những ai yêu thích sự độc đáo và đẳng cấp.'  
 + CHAR(13) + CHAR(10) +  
 N'• 7 bông tulip xanh hiếm có, ấn tượng' + CHAR(13) + CHAR(10) +  
 N'• Giấy gói đen mạnh mẽ, sang trọng' + CHAR(13) + CHAR(10) +  
 N'• Dây ruy băng trắng thanh thoát',  
 330000, 62, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa dịp lễ tình yêu'), N'hoa_tinh_yeu_tulip_xanh.jpg') 

INSERT INTO Products (productName, description, price, quantity, categoryId, image)  
VALUES  

(N'Bó Hoa Cưới Hồng Thanh Lịch',  
N'Bó hoa cưới tinh tế với hoa hồng – loài hoa tượng trưng cho tình yêu vĩnh cửu và hạnh phúc. Kết hợp với lá bạch đàn mang đến vẻ đẹp tự nhiên, thanh thoát và nhẹ nhàng, tạo nên một tổng thể hài hòa, sang trọng nhưng vẫn đầy cảm xúc. Đây là lựa chọn hoàn hảo cho những cô dâu yêu thích sự lãng mạn và tinh tế trong ngày trọng đại của mình.'  
+ CHAR(13) + CHAR(10) +  
N'• 12 bông hoa hồng pastel ngọt ngào, tinh tế' + CHAR(13) + CHAR(10) +  
N'• Lá bạch đàn xanh tươi, thanh thoát' + CHAR(13) + CHAR(10) +  
N'• Bó bằng giấy trắng nhẹ nhàng, tinh khôi' + CHAR(13) + CHAR(10) +  
N'• Dây ruy băng trắng mềm mại, tượng trưng cho sự thuần khiết và tình yêu bền chặt',  
250000, 50, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa cưới'), N'hoa_cuoi_hong_eucalyptus.jpg'),  

(N'Bó Hoa Cưới Mao Lương Hồng Lãng Mạn',  
N'Hoa mao lương hồng mang vẻ đẹp kiêu sa, mềm mại nhưng đầy sức hút, tượng trưng cho tình yêu thuần khiết và sự gắn kết bền lâu. Bó hoa kết hợp cùng ruy băng ren trắng tạo nên vẻ ngoài thanh lịch, nhẹ nhàng nhưng vẫn vô cùng tinh tế, giúp cô dâu thêm phần rạng rỡ trong ngày cưới.'  
+ CHAR(13) + CHAR(10) +  
N'• 8 bông hoa mao lương hồng quyến rũ, tròn đầy' + CHAR(13) + CHAR(10) +  
N'• Một ít lá xanh điểm xuyết tạo sự cân đối' + CHAR(13) + CHAR(10) +  
N'• Dây ruy băng ren trắng cổ điển, sang trọng',  
280000, 55, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa cưới'), N'hoa_cuoi_mao_luong_hong.jpg'),  

(N'Bó Hoa Cưới Phi Yến Thanh Thoát',  
N'Hoa phi yến mang vẻ đẹp nhẹ nhàng, thanh thoát, tượng trưng cho sự chân thành và may mắn trong tình yêu. Với những cánh hoa mỏng manh nhưng đầy quyến rũ, bó hoa cưới phi yến tạo cảm giác bay bổng, nhẹ nhàng như một giấc mơ, giúp cô dâu tỏa sáng trong ngày trọng đại.'  
+ CHAR(13) + CHAR(10) +  
N'• 10 cành hoa phi yến xanh tím dịu dàng' + CHAR(13) + CHAR(10) +  
N'• Một ít hoa baby trắng tạo điểm nhấn tinh tế' + CHAR(13) + CHAR(10) +  
N'• Dây ruy băng trắng mềm mại, thuần khiết',  
260000, 50, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa cưới'), N'hoa_cuoi_phi_yen.jpg'),  

(N'Bó Hoa Cưới Hoa Rum Thanh Lịch',  
N'Hoa rum mang vẻ đẹp kiêu sa và tinh tế, là biểu tượng của sự thanh cao, tinh khiết và tình yêu chân thành. Với những cánh hoa mềm mại, uyển chuyển, bó hoa cưới hoa rum toát lên sự sang trọng và quý phái, giúp cô dâu thêm phần lộng lẫy trong ngày trọng đại.'  
+ CHAR(13) + CHAR(10) +  
N'• 7 bông hoa rum trắng thanh thoát, trang nhã' + CHAR(13) + CHAR(10) +  
N'• Một ít lá xanh điểm xuyết tạo sự cân đối' + CHAR(13) + CHAR(10) +  
N'• Dây ruy băng trắng mềm mại, thể hiện sự thuần khiết và tinh tế',  
270000, 55, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa cưới'), N'hoa_cuoi_hoa_rum.jpg'),  

(N'Bó Hoa Cưới Sen Thanh Khiết',  
N'Hoa sen tượng trưng cho sự thuần khiết, thanh cao và tình yêu chân thành. Kết hợp cùng những bông cúc tana trắng nhỏ xinh, bó hoa này mang đến vẻ đẹp nhẹ nhàng, tinh tế nhưng đầy ý nghĩa. Dây nâu tự nhiên giúp tăng thêm nét mộc mạc, giản dị nhưng vẫn sang trọng, phù hợp cho những cô dâu yêu thích phong cách truyền thống pha lẫn hiện đại.'  
+ CHAR(13) + CHAR(10) +  
N'• 5 bông hoa sen trắng thanh tao, tinh khiết' + CHAR(13) + CHAR(10) +  
N'• 6 nhánh cúc tana trắng nhỏ nhắn, tự nhiên' + CHAR(13) + CHAR(10) +  
N'• Dây nâu mộc mạc, mang hơi hướng truyền thống' + CHAR(13) + CHAR(10) +  
N'• Bó theo phong cách tự nhiên, không cầu kỳ nhưng đầy ý nghĩa',  
300000, 60, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa cưới'), N'hoa_cuoi_sen_tana.jpg'),  

(N'Bó Hoa Cưới Tulip Trắng Thanh Nhã',  
N'Hoa tulip trắng là biểu tượng của sự thuần khiết, tinh tế và tình yêu chân thành. Với những cánh hoa mềm mại, thanh thoát, bó hoa cưới tulip trắng mang đến vẻ đẹp nhẹ nhàng nhưng không kém phần sang trọng. Dây ruy băng trắng giúp tăng thêm sự tinh khôi và trang nhã, phù hợp cho những cô dâu yêu thích phong cách tối giản mà vẫn đầy cuốn hút.'  
+ CHAR(13) + CHAR(10) +  
N'• 10 bông hoa tulip trắng tinh khôi, thanh thoát' + CHAR(13) + CHAR(10) +  
N'• Lá xanh điểm xuyết nhẹ nhàng, tạo sự hài hòa' + CHAR(13) + CHAR(10) +  
N'• Dây ruy băng trắng mềm mại, tượng trưng cho sự tinh tế và thuần khiết',  
320000, 58, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa cưới'), N'hoa_cuoi_tulip_trang.jpg')

INSERT INTO Products (productName, description, price, quantity, categoryId, image) 
VALUES 
(N'Hoa Hồng Vàng Chúc Mừng', 
 N'Hoa hồng vàng là biểu tượng của niềm vui, hạnh phúc và thành công, thường được sử dụng trong các dịp mừng khai trương, thăng chức hay các sự kiện quan trọng. Kết hợp cùng sắc hồng dịu dàng của thược dược, bó hoa mang đến sự rực rỡ, may mắn và gửi gắm những lời chúc tốt đẹp nhất đến người nhận. 
• 15 bông hoa hồng vàng rực rỡ, tượng trưng cho sự phú quý 
• 5 bông thược dược hồng nhẹ nhàng, tươi sáng 
• Giấy gói màu be thanh lịch, sang trọng 
• Dây ruy băng trắng tạo điểm nhấn tinh tế', 
 150000, 30, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa chúc mừng'), N'hoa_hong_vang_chuc_mung.jpg'),

(N'Hướng Dương Rực Rỡ Chúc Mừng', 
 N'Hoa hướng dương là biểu tượng của sự mạnh mẽ, niềm tin và thành công, luôn hướng về ánh sáng như một lời chúc tốt đẹp gửi đến người nhận. Kết hợp với những bông cúc mini nhỏ nhắn nhưng đầy sức sống, bó hoa mang đến cảm giác tươi mới, tích cực và tràn đầy năng lượng. 
• 7 bông hoa hướng dương lớn rực rỡ 
• 10 bông cúc mini vàng điểm xuyết nhẹ nhàng 
• Giấy gói màu pastel dịu dàng, tinh tế 
• Dây ruy băng đen tạo điểm nhấn sang trọng', 
 180000, 35, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa chúc mừng'), N'huong_duong_chuc_mung.jpg'),



(N'Craspedia Rạng Rỡ Mix Hoa Hồng Vàng',  
 N'Craspedia với sắc vàng tươi sáng kết hợp cùng hoa hồng vàng mang đến cảm giác tràn đầy sức sống, may mắn và thành công. Bó hoa này là món quà ý nghĩa cho các dịp chúc mừng quan trọng.  
• 5 cành craspedia tròn vàng rực rỡ  
• 7 bông hoa hồng vàng nổi bật  
• Giấy gói vàng nhạt nhẹ nhàng  
• Dây ruy băng trắng tinh tế',  
 190000, 36, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa chúc mừng'), N'craspedia_hong_vang.jpg'),  

  
(N'Hoa Hồng Trắng Tím Nhẹ Nhàng',  
 N'Sự kết hợp giữa hoa hồng trắng tinh khôi và hoa hồng tím nhẹ nhàng tạo nên một bó hoa thanh lịch, sang trọng. Đây là món quà hoàn hảo để gửi gắm sự trân trọng và lời chúc tốt đẹp đến người nhận.  
• 6 bông hoa hồng trắng dịu dàng  
• 6 bông hoa hồng tím thanh nhã  
• Giấy gói trắng tinh tế  
• Dây ruy băng trắng nhẹ nhàng',  
 185000, 37, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa chúc mừng'), N'hong_trang_tim.jpg'),  


(N'Hoa Hướng Dương Rạng Rỡ Mix Hồng Trắng',  
 N'Hoa hướng dương tượng trưng cho sức mạnh và ánh sáng, kết hợp với hoa hồng trắng tạo nên bó hoa vừa rực rỡ vừa thanh lịch. Đây là lựa chọn tuyệt vời để gửi lời chúc tốt đẹp đến những người thân yêu.  
• 6 bông hướng dương vàng tươi  
• 5 bông hoa hồng trắng tinh khôi  
• Giấy gói tím nhẹ nhàng  
• Dây ruy băng trắng sang trọng',  
 175000, 38, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa chúc mừng'), N'huong_duong_hong_trang.jpg'),  

  
(N'Mao Lương Hồng Nhẹ Nhàng',  
 N'Mao lương với những cánh hoa mỏng manh nhưng đầy cuốn hút kết hợp với hoa hồng tạo nên một bó hoa đầy cảm xúc. Món quà tuyệt vời dành tặng người thân, bạn bè trong những dịp đặc biệt.  
• 8 bông mao lương hồng dịu dàng  
• 6 bông hoa hồng nhạt thanh thoát  
• Giấy gói trắng tinh tế  
• Dây ruy băng trắng nhẹ nhàng',  
 200000, 39, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa chúc mừng'), N'mao_luong_hong.jpg'),


(N'Juliet Ngọt Ngào Chúc Mừng', 
 N'Hoa hồng Juliet với sắc cam đào tinh tế, tượng trưng cho tình cảm chân thành và sự trân trọng. Kết hợp với những bông cúc Tana nhỏ xinh mang đến vẻ đẹp thuần khiết, tự nhiên, bó hoa này là món quà hoàn hảo để gửi gắm những lời chúc tốt đẹp, sự yêu thương và niềm hạnh phúc đến người nhận. 
• 10 bông hoa hồng Juliet sang trọng, nhẹ nhàng 
• 8 nhánh cúc Tana nhỏ xinh, tươi sáng 
• Giấy gói trắng tinh khôi, trang nhã 
• Dây ruy băng hồng mềm mại, tạo điểm nhấn lãng mạn', 
 200000, 40, (SELECT categoryId FROM Categories WHERE categoryName = N'Hoa chúc mừng'), N'juliet_cuc_tana.jpg');

 Select*from Products
Select*From Users


INSERT INTO Users (email, username, password, phone, role)  
VALUES  
('admin@example.com', 'admin', 'password1', '0123456789', 'Owner'),  
('user1@example.com', 'user1', 'password2', '0987654321', 'Customer'),  
('user2@example.com', 'user2', 'password3', '0975314682', 'Customer');  
