class Category {
  final String title;

  Category({required this.title});

  factory Category.createCategory(String title) {
    return Category(title: title);
  }
}