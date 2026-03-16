import 'package:flutter/cupertino.dart';

import '../../data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository ridePreferenceRepository;

  RidePreferenceState({required this.ridePreferenceRepository}) {
    _loadAllHistory(); // fetch ride pref history
}

  RidePreference? _selectedPreference;
  final List<RidePreference> _preferenceHistory = [];

  final int maxAllowedSeats = 8;

  RidePreference? get selectedPreference => _selectedPreference;
  List<RidePreference> get preferenceHistory => _preferenceHistory;

  void selectPreference(RidePreference preference) {
    if (preference != _selectedPreference) {
      // Set the selected preference
      _selectedPreference = preference;

      // Push to history
      _addPreferenceToHistory(preference);
      notifyListeners();

    }
  }

  void _addPreferenceToHistory(RidePreference preference) {
    _preferenceHistory.add(preference);
  }

  void _loadAllHistory() {
    _preferenceHistory.addAll(ridePreferenceRepository.fetchRidePreference());
  }
}
