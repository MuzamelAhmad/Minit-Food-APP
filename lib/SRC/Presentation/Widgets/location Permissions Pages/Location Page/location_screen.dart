import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/location%20Permissions%20Pages/Location%20address%20Details/location_address_details.dart';

import '../../../Common/CustomButton.dart' show CustomButton;
import '../../../Common/app_titles.dart';
import '../components/location_map.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  ValueNotifier<bool> checked = ValueNotifier(true);
  final DraggableScrollableController _scrollableController =
      DraggableScrollableController();

  @override
  void dispose() {
    _scrollableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: LocationMap(),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.gps_fixed_outlined),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 180.0.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Titles.locationPageTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 10.0.h),
              Text(
                Titles.locationPageSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 10.0.h),
              ValueListenableBuilder(
                valueListenable: checked,
                builder: (context, value, child) {
                  return Row(
                    children: [
                      Checkbox(
                        value: value,
                        onChanged: (_) {
                          checked.value = !checked.value;
                        },
                      ),
                      SizedBox(
                        width: 240.0.w,
                        child: Text(
                          Titles.locationAddressDetailPageAddress,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          Titles.locationPageTextButtonTitle,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14.0,
                              ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              CustomButton(
                buttonTitle: Titles.locationPageButtonTitle,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationAddressDetails(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
