import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:laundry_market_app_frontend/pages/dashbord_views/account_view.dart';

class AppConstants {
  static const appName = 'Di Laundry';

  static const _host = 'http://192.168.1.7:8080';

  /// ``` baseURL = 'http://192.168.43.186:8000/api' ```
  static const baseURL = '$_host/api';

  /// ``` baseURL = 'http://192.168.43.186:8000/storage' ```
  static const baseImageURL = '$_host/storage';

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

  static List<Map> navMenuDashboard = [
    {
      'view': DView.empty('Home'),
      'icon': Icons.home_filled,
      'label': 'Home',
    },
    {
      'view': DView.empty('MyLaundry'),
      'icon': Icons.local_laundry_service,
      'label': 'Laundry',
    },
    // {
    //   'view': DView.empty('Account'),
    //   'icon': Icons.account_circle,
    //   'label': 'Account',
    // },
    // {
    //   'view': const HomeView(),
    //   'icon': Icons.home_filled,
    //   'label': 'Home',
    // },
    // {
    //   'view': const MyLaundryView(),
    //   'icon': Icons.local_laundry_service,
    //   'label': 'My Laundry',
    // },
    {
      'view': const AccountView(),
      'icon': Icons.account_circle,
      'label': 'Account',
    },
  ];

  static const homeCategories = [
    'All',
    'Regular',
    'Express',
    'Economical',
    'Exlusive',
  ];
}
