class Provider {
  String id;
  String name;
  String? phoneNumber;
  String? image;
  String? ranking;
  String? price;
  String? distance;
  String? experience;
  String? lat;
  String? lon;

  Provider.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'] ?? '',
        phoneNumber = json['phone_number'] ?? '',
        image = json['image'] ?? '',
        ranking = json['ranking'] ?? '',
        price = json['price'] ?? '',
        distance = json['distance'] ?? '',
        experience = json['experience'] ?? '',
        lat = json['lat'] ?? '',
        lon = json['lon'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'image': image,
      'ranking': ranking,
      'price': price,
      'distance': distance,
      'experience': experience,
      'lat': lat,
      'lon': lon,
    };
  }
}
