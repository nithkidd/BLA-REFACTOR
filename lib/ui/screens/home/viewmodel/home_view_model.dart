import 'package:flutter/material.dart';
import '../../../stats/ride_preference_state.dart';
import '../../../../model/ride_pref/ride_pref.dart';
// import '../../rides_selection/rides_selection_screen.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;

  HomeViewModel({required this.ridePreferenceState}){
    ridePreferenceState.addListener(_vmListener);
  }

  RidePreference? get selectedPreference => ridePreferenceState.selectedPreference;
  List<RidePreference> get preferenceHistory => ridePreferenceState.preferenceHistory.reversed.toList();
  // Handle Select Ride Preference
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
