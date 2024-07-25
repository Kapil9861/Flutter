import 'package:hive/hive.dart';
import 'package:travel_app/features/domain/entities/trip.dart';

part 'dart_modell.g.dart';

// The TripModel extends Trip would also work but sometime that does not work hence followed this approach
@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> photos;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final String location;

  TripModel({
    required this.title,
    required this.photos,
    required this.description,
    required this.date,
    required this.location,
  });

  // Factory that converts the entity to model
  factory TripModel.fromEntity(Trip trip) => TripModel(
        date: trip.date,
        title: trip.title,
        photos: trip.photos,
        description: trip.description,
        location: trip.location,
      );

  // Conversion that converts model to entity
  Trip toEntity() => Trip(
        title: title,
        photos: photos,
        description: description,
        date: date,
        location: location,
      );
}
