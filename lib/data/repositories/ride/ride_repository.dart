import '../../../model/ride_pref/ride_pref.dart';

import '../../../model/ride/ride.dart';

abstract class RideRepository {
  List<Ride> fetchRide();

  List<Ride> getRidesFor(RidePreference preferences);
}
