import '../../../model/ride/locations.dart';
import 'location_reposity.dart';
import '../../dummy_data.dart';

class LocationReposityMock implements LocationReposity {
  @override
  List<Location> fetchLocations() {
    return fakeLocations;
  }
}
