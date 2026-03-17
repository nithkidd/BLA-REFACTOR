import 'package:flutter/material.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/animations_util.dart' show AnimationUtils;
import '../../../theme/theme.dart';
import '../widgets/ride_preference_modal.dart';
import '../widgets/rides_selection_header.dart';
import '../widgets/rides_selection_tile.dart';
import '../viewmodel/ride_selection_view_model.dart';

class RideSelectionContent extends StatelessWidget {
  final RideSelectionViewModel rideSelectionViewModel;
  const RideSelectionContent({super.key, required this.rideSelectionViewModel});

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRideSelected(Ride ride) {
    // Later
  }

  void onPreferencePressed(BuildContext context) async {
    // 1 - Navigate to the rides preference picker
    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(initialPreference: rideSelectionViewModel.selectedRidePreference),
          ),
        );
    if (newPreference != null) {
      // now we use view model to update ui and data
      rideSelectionViewModel.selectRidePreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedRidePreference = rideSelectionViewModel.selectedRidePreference!; // not null at this state
    final matchingRides = rideSelectionViewModel.matchingRides;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: selectedRidePreference,
              onBackPressed:() => onBackTap(context),
              onFilterPressed: onFilterPressed,
              onPreferencePressed:() => onPreferencePressed(context),
            ),

            SizedBox(height: 100),

            Expanded(
              child: ListView.builder(
                itemCount: matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: matchingRides[index],
                  onPressed: () => onRideSelected(matchingRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
