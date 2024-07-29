import '../entitites/trip.dart';
import '../repositories/trip_repository.dart';

class UpdateTrip {
  final TripRepository repository;

  UpdateTrip(this.repository);

  Future<void> call(Trip trip) {
    return repository.addTrip(trip);
  }
}
