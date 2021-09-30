import 'package:flutter/material.dart';
import 'package:pmerealestate/src/app.dart';

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');
final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

void main() => runApp(MyApp());
