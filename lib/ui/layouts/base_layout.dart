import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:cicly/ui/components/navbar/anon_bottom_navigation_bar.dart';
import 'package:cicly/ui/components/navbar/user_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final List<Widget> children;
  final String pageTitle;
  bool hasData;

  BaseLayout({
    super.key,
    required this.children,
    required this.pageTitle,
    this.hasData = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorScheme().surface,
      bottomNavigationBar: hasData
          ? UserBottomNavigationBar(
              onTap: (index) => {
                //TODO: Replace print statements with actual navigation logic
                switch (index) {
                  0 => print('Navigate to Home page'),
                  1 => print('Navigate to Symptoms page'),
                  2 => print('Navigate to Reports and Stats page'),
                  3 => print('Navigate to Feedback page'),
                  4 => print('Navigate to Articles page'),
                  5 => print('Navigate to Profile page'),
                  6 => print('Navigate to Settings page'),
                  _ => null,
                },
              },
            )
          : AnonBottomNavigationBar(
              onTap: (index) => {
                //TODO: Replace print statements with actual navigation logic
                switch (index) {
                  0 => print('Navigate to Home page'),
                  1 => print('Navigate to About page'),
                  2 => print('Navigate to Terms of Use page'),
                  3 => print('Navigate to Website page'),
                  4 => print('Navigate to Settings page'),
                  5 => print('Navigate to Report a Bug page'),
                  _ => null,
                },
              },
            ),
      body: SafeArea(
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 16.0,
              children: [
                Image(
                  image: AssetImage('lib/assets/images/logo_transparent.png'),
                  height: 50,
                ),
                Text(
                  pageTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
