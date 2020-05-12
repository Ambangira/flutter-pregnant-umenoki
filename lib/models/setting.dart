class Setting {
  String id;
  String name;

  Setting({this.id, this.name});
  Setting.fromMap(Map snapshot, String id) :
    id = id ?? '',
    name = snapshot['name'] ?? '';
  toJson() {
    return {
      'name': name,
    };
  }
}
