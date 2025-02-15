# Pos App
- Ứng dụng bán vé xe bus chạy trên thiết bị Sunmi P2 Pro.

## Getting Started:
Dùng thư viện change_app_package_name để đổi tên package (thêm ở dev_dependencies):
- Sau đó gọi lệnh: flutter pub run change_app_package_name:main com.new.package.name


## Thông tin:
- Flutter version: 3.27.1 (stable).
- build runner: flutter pub run build_runner build --delete-conflicting-outputs


## Edit Configurations:
- Thêm main 3 môi trường: 
  - main_prod.dart
  - main_uat.dart
  - main_dev.dart
  - Thêm flavor ( để change package) Additionals run args:
    - Môi trường prod: --flavor prod
    - Môi trường uat: --flavor uat
    - Môi trường develop: --flavor develop
  - Build flavor:
    - Môi trường prod: prod
    - Môi trường uat: uat
    - Môi trường develop: develop


  
