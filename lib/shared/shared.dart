export 'style.dart';

import 'package:flutter/material.dart';
import 'style.dart';

const String baseUrl = 'https://www.generasiterpilih.or.id/mobapps/flutter/';

List<Color> colors = [
  blackColor,
  Colors.orangeAccent,
  Colors.red,
  Colors.purple[200] ?? Colors.purple,
  Colors.cyan,
  Colors.blue[900] ?? Colors.blue,
];

List<String> colorsText = [
  'Black',
  'White',
  'Blue',
];

const List<String> sizes = [
  'XS',
  'S',
  'M',
  'L',
  'XL',
];

const List<String> sortBy = [
  'Popular',
  'Newest',
  'Customer review',
  'Price: lowest to hight',
  'Price: highest to low',
];

const List<String> brands = [
  'addidas',
  'addidas Originals',
  'Blend',
  'Champion',
  'Diesel',
  'Jack & Jones',
  'Naf Naf',
  'Red Valentino',
  's.Olivier',
];

const String dummyDescription =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

List<String> orderStatus = [
  'Delivered',
  'Processing',
  'Cancelled',
];
