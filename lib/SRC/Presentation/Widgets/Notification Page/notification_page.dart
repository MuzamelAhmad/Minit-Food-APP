import 'package:flutter/material.dart';
import 'package:mini_food_app/SRC/Presentation/Common/custom_app_bar.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Notification%20Page/components/notification_design.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(
                navigationOnTap: () => Navigator.pop(context),
                isNavigationIcon: true,
                widgetTitle: Text(
                  'Notification',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Today',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            NotificationDesign(count: 1),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Yesterday',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            NotificationDesign(count: 2),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  '15 Dec 2025',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            NotificationDesign(count: 3),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  '1 Dec 2025',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            NotificationDesign(count: 1),
          ],
        ),
      ),
    );
  }
}
