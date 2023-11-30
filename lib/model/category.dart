class CategoryModel {
  final String imageName;
  final String imagePath;

  CategoryModel({required this.imageName, required this.imagePath});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      imageName: json['imageName'],
      imagePath: json['imagePath'],
    );
  }
}
