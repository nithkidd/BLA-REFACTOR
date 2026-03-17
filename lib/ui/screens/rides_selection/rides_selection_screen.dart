import 'package:flutter/material.dart';

import '../../stats/ride_preference_state.dart';
import 'package:provider/provider.dart';
import './viewmodel/ride_selection_view_model.dart';
import './widgets/ride_selection_content.dart';
import '../../../data/repositories/ride/ride_repository.dart';
///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RideSelectionViewModel>(
      create: (ctx) => RideSelectionViewModel(
        ridePreferenceState: ctx.read<RidePreferenceState>(), rideRepository: ctx.read<RideRepository>(),
      ),
      child: Consumer<RideSelectionViewModel>(
        builder: (ctx, rideSelectionViewModel, child) => RideSelectionContent(
          rideSelectionViewModel: rideSelectionViewModel,
        ),
      ),
    );
  }
}
