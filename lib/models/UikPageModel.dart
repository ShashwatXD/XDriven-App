class UikPageModel {
  final String? backgroundImage;
  final List<Map<String, dynamic>> widgets;

  UikPageModel({this.backgroundImage, required this.widgets});

  factory UikPageModel.fromJson(Map<String, dynamic> json) {
    final widgets = List<Map<String, dynamic>>.from(json['widgets']);
    final bg = json['backgroundImage']?.toString();

    return UikPageModel(backgroundImage: bg, widgets: widgets);
  }
}
