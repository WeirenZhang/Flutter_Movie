import 'package:dio/dio.dart';

String trimAllLF(String s) {
  return s.replaceAll('\n', " ").trim().replaceAll(' ', "").trim();
}

String trimAllLF1(String s) {
  return s.replaceAll(' ', "").trim().replaceAll('\n\n\n\n\n', " ").trim();
}

String trimAllLF2(String s) {
  return s.replaceAll(' ', "").trim().replaceAll('<br>', "\n").trim();
}
