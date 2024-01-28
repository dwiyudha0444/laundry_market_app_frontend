class AppConstants {
  static const appName = "Di Laundry";

  static const _host = "https://192.168.1.10:8080";

  static const baseURL = '$_host/api';

  static const baseImageURL = '$_host/storege';

  static const laundryStatusCategory = [
    'All',
    'Pickup',
    'Queue',
    'Process',
    'Washing',
    'Dried',
    'Ironed',
    'Done',
    'Delivery'
  ];
}
