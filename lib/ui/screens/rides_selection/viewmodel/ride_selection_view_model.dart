import 'package:flutter/material.dart';

import '../../../../data/repositories/ride/ride_repository.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../stats/ride_preference_state.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;
  final RideRepository rideRepository;

  RideSelectionViewModel({
    required this.ridePreferenceState,
    required this.rideRepository,
  }) {
    ridePreferenceState.addListener(_vmListener);
  }

  // Getters
  RidePreference? get selectedRidePreference =>
      ridePreferenceState.selectedPreference;

  List<RidePreference> get preferenceHistory =>
      ridePreferenceState.preferenceHistory.reversed.toList();

  // method to get the rides matching the selected ride preference
  List<Ride> get matchingRides {
    final preference = selectedRidePreference; 
    return preference == null ? [] : rideRepository.getRidesFor(preference);
    //if pref is null, return empty list else get the matching rides from the repo
  }
  
  void selectRidePreference(RidePreference preference) {
    ridePreferenceState.selectPreference(preference);
  }

  void _vmListener() {
    notifyListeners();
  }

  @override
  void dispose() {
    ridePreferenceState.removeListener(_vmListener);
    super.dispose();
  }
  
}
