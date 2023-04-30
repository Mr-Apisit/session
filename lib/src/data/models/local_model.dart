class LocalModel {
  final int id;
  final Map<String, dynamic> value;
  LocalModel({
    required this.id,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return {"$id": value};
  }
}
