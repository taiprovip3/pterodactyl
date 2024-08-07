# Khái niệm & Lý Thuyết
## Khái niệm về mount
- Mount tức là mount 1 file từ ngoài desktop vào container docker.
## Nguyên tắc hoạt động của pretodactyl
. Service panel sẽ hoạt động trước
. Service panel sẽ là toàn bộ tài nguyên CPU của PC
. Panel là giao diện web mà người dùng tương tác trực tiếp để quản lý các server game. Panel cung cấp các chức năng như tạo, sửa, xóa server, quản lý tài khoản người dùng, và theo dõi hoạt động của các server game. Nó là thành phần chính của Pterodactyl, nơi bạn thực hiện các cấu hình và quản lý mọi thứ liên quan đến các server game.
. Wings là daemon (chương trình chạy nền) của Pterodactyl, hoạt động như một dịch vụ trên các máy chủ vật lý hoặc máy ảo nơi server game thực sự chạy. Wings chịu trách nhiệm triển khai, khởi động, dừng, và quản lý các container Docker chứa các server game. Nó giao tiếp với Panel để thực hiện các tác vụ quản lý server game mà người dùng yêu cầu qua giao diện web.

# Chạy project
Bước 1: Clone project về
```bash
git clone https://github.com/taiprovip3/pterodactyl.git
```
Bước 2: Chạy docker compose
```bash
docker-compose up -d --build
```
Bước 3: Truy cập exec service `pterodactyl_panel` docker
```bash
php artisan p:user:make # Tạo user admin
```
Bước 4: Tạo node và lấy token trong tab `Configuration` của node
```bash
uuid
token_id
token
```
Trong file config.yml.
Copy các tham số trên và gắn chúng vào file `config.yml` trong thư mục project
Đồng thời thay đổi tất cả những dòng `115.77.248.9` thành ipv4 public ứng với machine của bạn
Bước 5: Truy cập vào file trong service `pterodactyl_panel` docker
```bash
/app/var/.env
```
Mở file .env lên và copy base64 key
Bước 6: Truy cập vào file docker-compose.yml mở note environment `APP_KEY`và dán base64 key vừa copy trên vào
Bước 7: Tắt và rebuild lại toàn bộ app
```bash
docker compose down
docker compose up -d --build
```
Bước 8: Khi tất cả service đã start và không stop
Truy cập ipv4 public của machine để tận hưởng pterodactyl