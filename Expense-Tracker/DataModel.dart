import 'package:uuid/uuid.dart';

var uuid = Uuid();
enum Categories{food,travel,shopping,movie}

class DataModel{
  DataModel({required this.title,required this.amount,required this.date,required this.category}):id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Categories category;
}