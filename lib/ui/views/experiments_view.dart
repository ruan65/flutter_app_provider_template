import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:provider_start/core/view_models/experiments_view_model.dart';
import 'package:provider_start/ui/views/experiments/show_image_view.dart';

import '../../core/localization/localization.dart';

class ExperimentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return ViewModelProvider<ExperimentsViewModel>.withConsumer(
        viewModel: ExperimentsViewModel(),
        onModelReady: (model) {},
        builder: (context, model, child) => PlatformScaffold(
              appBar: PlatformAppBar(
                title: Text(local.experimentsViewTitle),
                ios: (_) => CupertinoNavigationBarData(
                  transitionBetweenRoutes: false,
                ),
              ),
              body: _ExperimentsList(),
            ));
  }
}

class _ExperimentsList extends ProviderWidget<ExperimentsViewModel> {


  @override
  Widget build(BuildContext context, ExperimentsViewModel model) {
    return Container(
      child: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('Image Loader'),
            onPressed: () {
              print('tapped....');
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ShowImageView()));
            },
          )
        ],
      ),
    );
  }
}
