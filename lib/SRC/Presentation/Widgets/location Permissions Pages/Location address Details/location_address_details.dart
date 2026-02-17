import 'package:flutter/material.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/location%20Permissions%20Pages/Location%20address%20Details/components/location_bottom_sheet.dart';

import '../components/location_map.dart';

class LocationAddressDetails extends StatefulWidget {
  const LocationAddressDetails({super.key});

  @override
  State<LocationAddressDetails> createState() => _LocationAddressDetailsState();
}

class _LocationAddressDetailsState extends State<LocationAddressDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: SizedBox.shrink(),
          bottomSheet: SizedBox(
            child: Stack(children: [LocationMap(), LocationBottomSheet()]),
          ),
        ),
      ),
    );
  }
}
