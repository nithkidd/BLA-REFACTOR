import 'package:blabla/ui/screens/home/widgets/home_content.dart';
import 'package:blabla/ui/stats/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './viewmodel/home_view_model.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (ctx) => HomeViewModel(
        ridePreferenceState: ctx.read<RidePreferenceState>(),
      ),
      child: Consumer<HomeViewModel>(
        builder: (ctx, homeViewModel, child) => HomeContent(homeViewModel: homeViewModel),
      ),
    );
  }
}
