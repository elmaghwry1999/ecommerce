import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

String fixture(String name) => File(p.join('./test/api/$name'))
    .readAsStringSync()
    .replaceAll('\n', '')
    .replaceAll(' ', '')
    .replaceAll('\r', '');
