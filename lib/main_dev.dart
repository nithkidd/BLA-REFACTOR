import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import 'main_common.dart';
import './data/repositories/location/location_reposity_mock.dart';
import './data/repositories/location/location_reposity.dart';
import './data/repositories/ride/ride_repository_mock.dart';
import './data/repositories/ride/ride_repository.dart';
import './data/repositories/ride_preference/ride_preference_repository_mock.dart';
import './data/repositories/ride_preference/ride_preference_repository.dart';

List<SingleChildWidget> get devProviders {
  return [
    // inject location repo
      Provider<LocationReposity>(create: (ctx) => LocationReposityMock()),
    // inject ride repo
    Provider<RideRepository>(create: (ctx) => RideRepositoryMock()),
    // inject ride preference repo
    Provider<RidePreferenceRepository>(create: (ctx) => RidePreferenceRepositoryMock()),
  ];
}

void main() {
  mainCommon(devProviders);
}
