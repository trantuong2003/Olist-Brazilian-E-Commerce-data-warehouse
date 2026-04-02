# Build-data-warehouse-with-Airflow-Python-for-E-commerce and analysis

1. Giới thiệu
Dự án này phân tích bộ dữ liệu thương mại điện tử của Olist, bao gồm gần 100.000 đơn hàng tại Brazil trong giai đoạn 2016–2018. Dữ liệu bao phủ toàn bộ quy trình mua hàng từ khách hàng, sản phẩm, thanh toán đến vận chuyển.
Mục tiêu của dự án là xây dựng hệ thống dữ liệu (data pipeline) và dashboard phân tích nhằm hỗ trợ việc ra quyết định kinh doanh dựa trên dữ liệu.


2. Bài toán kinh doanh
Trong bối cảnh thương mại điện tử, hiệu suất vận hành (đặc biệt là giao hàng) và hành vi khách hàng có ảnh hưởng trực tiếp đến doanh thu.
Dự án tập trung trả lời câu hỏi chính:
Làm thế nào để tối ưu hiệu suất giao hàng và hành vi mua hàng nhằm tăng trưởng doanh thu và cải thiện khả năng giữ chân khách hàng?

3. Các ngôn ngữ lập trình và nền tảng dữ liệu chính của dự án:
Python và các tập lệnh tùy chỉnh được sử dụng để trích xuất và tải dữ liệu thương mại điện tử một cách hiệu quả từ các tệp CSV và cơ sở dữ liệu MySQL. PostgreSQL đóng vai trò là khu vực lưu trữ tạm thời và kho dữ liệu cuối cùng, xử lý dữ liệu bán hàng có cấu trúc. Apache Airflow điều phối toàn bộ quy trình làm việc, đảm bảo hoạt động trơn tru từ trích xuất đến chuyển đổi. Dự án được đóng gói bằng Docker để quản lý môi trường liền mạch và triển khai nhất quán. Power BI cung cấp lớp trực quan hóa cuối cùng, cung cấp phân tích bán hàng và thông tin kinh doanh chuyên sâu.


4. Cấu trúc dự án

<img width="855" height="462" alt="Screenshot 2026-04-02 205545" src="https://github.com/user-attachments/assets/063d19cf-0467-454d-b0b3-eac8a107ff14" />


5. Dashbroad

<img width="1418" height="795" alt="Screenshot 2026-04-02 154946" src="https://github.com/user-attachments/assets/b6b1ea08-29b4-421e-9273-1f658b960e0f" />
<img width="1414" height="792" alt="Screenshot 2026-04-02 155002" src="https://github.com/user-attachments/assets/fe1c6539-6c9d-46e6-879c-fc36e93e2e2b" />
<img width="1417" height="795" alt="Screenshot 2026-04-02 155012" src="https://github.com/user-attachments/assets/f62918a4-d0f4-445b-a18b-233d9fd8fbc3" />
<img width="1415" height="790" alt="Screenshot 2026-04-02 155022" src="https://github.com/user-attachments/assets/16f7b731-0772-4c35-a29d-fca6a79b3940" />

6. insight
   
Insight: Doanh thu cao chủ yếu đến từ số lượng đơn hàng lớn trong khi giá trị đơn hàng trung bình không cao.
Nguyên nhân: Khách hàng có xu hướng mua các sản phẩm giá thấp hoặc mua lẻ từng đơn.
Giải pháp: Áp dụng bundle sản phẩm, free shipping theo ngưỡng giá trị đơn để khuyến khích khách tăng giá trị giỏ hàng.

Insight: Doanh thu tăng đầu năm nhưng giảm mạnh vào tháng 9–10.
Nguyên nhân: Có thể do yếu tố mùa vụ hoặc gián đoạn vận hành (delivery, supply).
Giải pháp: Phân tích sâu theo category & delivery theo tháng, kết hợp campaign marketing hoặc tối ưu vận hành vào giai đoạn thấp điểm.

Insight: Phần lớn khách hàng thuộc nhóm Low, tỷ lệ khách trung thành rất thấp.
Nguyên nhân: Khách hàng mua ít lần và không có động lực quay lại.
Giải pháp: Triển khai chương trình loyalty, voucher cho lần mua tiếp theo để tăng repeat rate.

Insight: Tỷ lệ giao trễ ~8% và có nhiều đơn hàng giao rất lâu (30–50 ngày).
Nguyên nhân: Hệ thống logistics không đồng đều và một số seller xử lý đơn chậm.
Giải pháp: Thiết lập SLA giao hàng, cảnh báo đơn trễ và tối ưu quy trình vận hành.

Insight: Một số bang có thời gian giao hàng cao bất thường.
Nguyên nhân: Kho xa khách hàng hoặc hạ tầng vận chuyển chưa tối ưu.
Giải pháp: Xây thêm warehouse gần khu vực nhu cầu cao hoặc tối ưu tuyến giao hàng.

Insight: Có seller doanh thu cao nhưng tỷ lệ giao trễ cũng cao.
Nguyên nhân: Seller quá tải hoặc năng lực vận hành kém.
Giải pháp: Xếp hạng seller theo hiệu suất, áp dụng thưởng/phạt và ưu tiên seller chất lượng.

Insight: Doanh thu tập trung ở một số bang nhất định.
Nguyên nhân: Nhu cầu thị trường không đồng đều hoặc độ phủ seller chưa rộng.
Giải pháp: Mở rộng thị trường tiềm năng và tăng số lượng seller tại khu vực chưa khai thác.
