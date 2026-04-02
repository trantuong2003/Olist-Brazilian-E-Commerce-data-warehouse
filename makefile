to_mysql:
	docker exec -it de_mysql mysql -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" ${MYSQL_DATABASE}
	docker exec -it mysql mysql -u"admin" -p"admin" olist 
/*Nó sử dụng các biến môi trường (MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE) để tự động đăng nhập vào đúng Database bạn đã tạo.với quyền thường*/
to_mysql_root:
	docker exec -it de_mysql mysql -u"root" -p"${MYSQL_ROOT_PASSWORD}" ${MYSQL_DATABASE}
	docker exec -it mysql mysql -u"root" -p"admin" olist
/*tự động đăng nhập nhưng với quyền root*/
mysql_create:
	docker exec -it de_mysql mysql --local_infile -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" ${MYSQL_DATABASE} -e"source /tmp/load_data/mysql_datasource.sql"
	docker exec -it mysql mysql --local_infile -u"admin" -p"admin" olist -e"source /tmp/load_dataset/olist.sql"

/*khởi tạo các bảng trong database*/
mysql_load:
	docker exec -it de_mysql mysql --local_infile -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" ${MYSQL_DATABASE} -e"source /tmp/load_data/mysql_load.sql"
	docker exec -it mysql mysql --local_infile -u"admin" -p"admin" olist -e"source /tmp/load_dataset/load_data.sql"
/*nạp dữ liệu vào các bảng đã tạo*

/
/* docker exec: lệnh này yêu cầu docker thực thi lệnh trong container đang chạy

-it: cho phép tương tác trực tiếp với container đang chạy 
de_mysql: tên của container Mysql đặt trong compose*/