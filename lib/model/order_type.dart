class OrderType {
  String code;
  String name;
  String icon;
  String description;

  OrderType({required this.code, required this.name, required this.icon, required this.description });

  OrderType.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        name = json['name'],
        icon = json['icon'],
        description = json['description'];


  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'icon': icon,
        'description': description,
      };

  @override
  bool operator ==(Object other) =>
      other is OrderType &&
          other.code == code &&
          other.description == description &&
          other.name == name &&
          other.icon == icon;

  @override
  int get hashCode => code.hashCode;


}
