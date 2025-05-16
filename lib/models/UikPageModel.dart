class UikPageModel {
  final List<Map<String, dynamic>> widgets;

  UikPageModel({required this.widgets});

  factory UikPageModel.fromJson(Map<String, dynamic> json) {
    final widgets =
        (json['widgets'] as List)
            .map((e) => Map<String, dynamic>.from(e))
            .toList();

    return UikPageModel(widgets: widgets);
  }
}
