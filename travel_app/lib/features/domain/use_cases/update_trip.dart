import 'package:travel_app/features/domain/entities/trip.dart';
import 'package:travel_app/features/domain/repositories/trip_repositories.dart';

class UpdateTrip {
  final TripRepositories repository;

  UpdateTrip({
    required this.repository,
  });
  Future<void> updateTrip(Trip trip) {
    return repository.updateTrip(trip);
  }
}
