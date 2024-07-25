import 'package:travel_app/features/domain/entities/trip.dart';
import 'package:travel_app/features/domain/repositories/trip_repositories.dart';

class AddTrip {
  final TripRepositories repository;

  AddTrip({required this.repository});
  Future<void> addTrip(Trip trip) {
    return repository.addTrip(trip);
  }
}
