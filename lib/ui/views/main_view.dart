import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:provider_start/core/localization/localization.dart';
import 'package:provider_start/core/view_models/main_view_model.dart';
import 'package:provider_start/ui/views/experiments_view.dart';
import 'package:provider_start/ui/views/home_view.dart';
import 'package:provider_start/ui/views/settings_view.dart';

/// Main view container that handles rendering pages according to which bottom
/// navigation bar item is tapped
///   - can be replaced with a [TabView]
class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return ViewModelProvider<MainViewModel>.withConsumer(
      viewModel: MainViewModel(),
      builder: (context, model, child) => PlatformScaffold(
        body: IndexedStack(
          index: model.index,
          children: <Widget>[
            HomeView(),
            SettingsView(),
            ExperimentsView(),
          ],
        ),
        bottomNavBar: PlatformNavBar(
          currentIndex: model.index,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: PlatformWidget(
                android: (_) => Icon(Icons.home),
                ios: (_) => Icon(CupertinoIcons.home),
              ),
              title: Text(local.homeViewTitle),
            ),
            BottomNavigationBarItem(
              icon: PlatformWidget(
                android: (_) => Icon(Icons.settings),
                ios: (_) => Icon(CupertinoIcons.settings),
              ),
              title: Text(local.settingsViewTitle),
            ),
            BottomNavigationBarItem(
              icon: PlatformWidget(
                android: (_) => Icon(Icons.list),
                ios: (_) => Icon(Icons.list),
              ),
              title: Text(local.experimentsViewTitle),
            ),
          ],
          itemChanged: model.changeTab,
        ),
      ),
    );
  }
}
