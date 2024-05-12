class Category {
  final String id;
  final String? name;
  final String? name_ar;
  final int? parent;
  final String? image;
  final bool? is_leaf;

  // Category(this.id, this.name_ar, this.parent, this.image);

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'],
        name_ar = json['name_ar'],
        parent = json['parent'],
        image = json['image'],
        is_leaf = json['is_leaf'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_ar': name_ar,
        'parent': parent,
        'image': image,
        'is_leaf': is_leaf,
      };
}
