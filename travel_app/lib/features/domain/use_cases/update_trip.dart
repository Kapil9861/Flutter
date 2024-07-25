import 'package:travel_app/features/domain/repositories/trip_repositories.dart';

class UpdateTrip {
  final TripRepositories repository;

  UpdateTrip({
    required this.repository,
  });
  Future<void> updateTrip(int tripId) {
    return repository.updateTrip(tripId);
  }
}
