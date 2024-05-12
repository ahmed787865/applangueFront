
import 'category.dart';
import 'provider.dart';
import 'order_type.dart';

class Order {
  String id;
  Provider? provider;
  Category? category;
  OrderType? type;
  String? status;
  String? date;
  String? time;
  String? note;
  String? image;
  String? audio;
  String? price;
  String? distance;
  String? lat;
  String? lon;
  bool? isPaid;
  bool? isRequested;

  Order.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        provider = (json['provider'] is Map<String, dynamic>)
            ? Provider.fromJson(json['provider'])
            : null,
        category = (json['category'] is Map<String, dynamic>)
            ? Category.fromJson(json['category'])
            : null,
        type = (json['type'] is Map<String, dynamic>)
            ? OrderType.fromJson(json['type'])
            : null,
        date = json['date'] as String?,
        time = json['time'] as String?,
        status = json['status'] as String?,
        note = json['note'] as String?,
        image = json['image'] as String?,
        audio = json['audio'] as String?,
        price = (json['price'] is double)
            ? json['price'].toString()
            : json['price'] as String?,
        distance = json['distance'] as String?,
        lat = json['lat'] as String?,
        lon = json['lon'] as String?,
        isPaid = json['is_paid'] as bool?,
        isRequested = json['is_requested'] as bool?;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'provider': provider?.toJson(),
      'category': category?.toJson(),
      'type': type?.toJson(),
      'status': status,
      'date': date,
      'time': time,
      'note': note,
      'image': image,
      'audio': audio,
      'price': price,
      'distance': distance,
      'lat': lat,
      'lon': lon,
      'is_paid': isPaid,
      'is_requested': isRequested,
    };
  }

  Order.withDefaults()
      : id = "0",
        provider = null,
        category = null,
        status = null,
        date = null,
        time = null,
        note = null,
        image = null,
        audio = null,
        price = null,
        distance = null,
        lat = null,
        lon = null,
        type = null,
        isPaid = false,
        isRequested = false;
}
