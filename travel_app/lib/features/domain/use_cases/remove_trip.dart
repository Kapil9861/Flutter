import 'package:travel_app/features/domain/repositories/trip_repositories.dart';

class RemoveTrip {
  final TripRepositories repository;

  RemoveTrip({required this.repository});

  Future<void> removeTrip(int tripId) {
    return repository.removeTrip(tripId);
  }
}
