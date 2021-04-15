class Models {
  final String name;
  final String id;
  Models({
    required this.name,
    required this.id,
  });

  Models copyWith({
    String? name,
    String? id,
  }) {
    return Models(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Models.init() : name = "", id = "";

  @override
  String toString() => 'Models(name: $name, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Models &&
      other.name == name &&
      other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}

