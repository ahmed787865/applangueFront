class Alert {
  final String? title;
  final String? date;
  final String? description;

  Alert.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        date = json['date'] as String?,
        description = json['description'] as String?;
}
