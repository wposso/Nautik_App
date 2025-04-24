import 'package:flutter/material.dart';

List<Map<String, dynamic>> menuList = [
  {
    'image': Image.asset('assets/dishes/001.jpg', fit: BoxFit.cover),
    'name': 'Pizza Margherita',
    'country': 'Italia',
    'rating': '4.8/5',
    'price': 10.30,
  },
  {
    'image': Image.asset('assets/dishes/002.jpg', fit: BoxFit.cover),
    'name': 'Tacos al Pastor',
    'country': 'México',
    'rating': '4.7/5',
    'price': 9.01,
  },
  {
    'image': Image.asset('assets/dishes/003.jpg', fit: BoxFit.cover),
    'name': 'Sushi',
    'country': 'Japón',
    'rating': '4.9/5',
    'price': 34.01,
  },
  {
    'image': Image.asset('assets/dishes/004.png', fit: BoxFit.cover),
    'name': 'Paella',
    'country': 'España',
    'rating': '4.6/5',
    'price': 53.03,
  },
  {
    'image': Image.asset('assets/dishes/005.jpg', fit: BoxFit.cover),
    'name': 'Croissant',
    'country': 'Francia',
    'rating': '4.5/5',
    'price': 3.90,
  },
  {
    'image': Image.asset('assets/dishes/006.jpg', fit: BoxFit.cover),
    'name': 'Pad Thai',
    'country': 'Tailandia',
    'rating': '4.7/5',
    'price': 36.10,
  },
];

List<Map<String, dynamic>> categoriesList = [
  {
    'image': Image.asset('assets/dishes/001.jpg', fit: BoxFit.cover),
    'name': 'Pizza Margherita',
    'products': menuList,
  },
  {
    'image': Image.asset('assets/dishes/002.jpg', fit: BoxFit.cover),
    'name': 'Tacos al Pastor',
    'products': menuList,
  },
  {
    'image': Image.asset('assets/dishes/003.jpg', fit: BoxFit.cover),
    'name': 'Sushi',
    'products': menuList,
  },
  {
    'image': Image.asset('assets/dishes/004.png', fit: BoxFit.cover),
    'name': 'Paella',
    'products': menuList,
  },
  {
    'image': Image.asset('assets/dishes/005.jpg', fit: BoxFit.cover),
    'name': 'Croissant',
    'products': menuList,
  },
  {
    'image': Image.asset('assets/dishes/006.jpg', fit: BoxFit.cover),
    'name': 'Pad Thai',
    'products': menuList,
  },
];