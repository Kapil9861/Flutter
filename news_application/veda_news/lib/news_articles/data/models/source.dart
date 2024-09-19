/// A class representing a source with an optional `id` and `name`.
///
/// The `Source` class provides methods to convert between a JSON representation
/// and Dart objects. It includes fields for `id` and `name`, both of which are
/// optional and can be `null`.
class Source {
  /// The unique identifier for the source.
  String? id;

  /// The name of the source.
  String? name;

  /// Creates a [Source] instance with the given [id] and [name].
  ///
  /// Both [id] and [name] are optional and can be `null`.
  Source({
    this.id,
    required this.name,
  });

  /// Creates a [Source] instance from a JSON map.
  ///
  /// The [json] map should contain the `id` and `name` fields.
  /// If any of these fields are missing, they will be set to `null`.
  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
  }

  /// Converts the [Source] instance to a JSON map.
  ///
  /// The resulting map contains the `id` and `name` fields.
  /// If any of these fields are `null`, they will still be included in the map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
