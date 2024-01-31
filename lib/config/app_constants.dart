class AppConstants {
  static const appName = "Di Laundry";

  static const _host = "http://192.168.1.7:8080";

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
