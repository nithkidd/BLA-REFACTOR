import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import 'main_common.dart';
import './data/repositories/location/location_reposity_mock.dart';
import './data/repositories/location/location_reposity.dart';
import './data/repositories/ride/ride_repository_mock.dart';
import './data/repositories/ride/ride_repository.dart';
import './data/repositories/ride_preference/ride_preference_repository_mock.dart';
import './data/repositories/ride_preference/ride_preference_repository.dart';

import './ui/stats/ride_preference_state.dart';

List<SingleChildWidget> get devProviders {
  final ridePreferenceState = RidePreferenceRepositoryMock();
  return [
    // Inject location, ride & ride preference repo
    Provider<LocationReposity>(create: (ctx) => LocationReposityMock()),

    Provider<RideRepository>(create: (ctx) => RideRepositoryMock()),

    Provider<RidePreferenceRepository>(
      create: (ctx) => RidePreferenceRepositoryMock(),
    ),

    //Inject RidePrefs State
    ChangeNotifierProvider<RidePreferenceState>(
      create: (ctx) =>
          RidePreferenceState(ridePreferenceRepository: ridePreferenceState),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
