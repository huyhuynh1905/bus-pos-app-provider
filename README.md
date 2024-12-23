# Pos App
- Ứng dụng bán vé xe bus chạy trên thiết bị sunmi p2 pro.

## Getting Started:
Dùng thư viện change_app_package_name để đổi tên package (thêm ở dev_dependencies):
- Sau đó gọi lệnh: flutter pub run change_app_package_name:main com.new.package.name


## Thông tin:
- Flutter version: 3.16.8 (stable).
- build runner: flutter pub run build_runner build --delete-conflicting-outputs


## Edit Configurations:
- Thêm main 3 môi trường: 
  - main_prod.dart
  - main_staging.dart
  - main_dev.dart
  - Thêm flavor ( để change package) Additionals run args:
    - Môi trường prod: --flavor prod
    - Môi trường staging: --flavor staging
    - Môi trường dev: --flavor dev
  - Build flavor:
    - Môi trường prod: prod
    - Môi trường staging: staging
    - Môi trường dev: dev


  
