import 'package:flutter/cupertino.dart';
import 'package:space_apps_project/DataObjects/City.dart';

class ProviderWidget extends StatelessWidget {
  City data;

  ProviderWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(data.provider),
    );
  }
}
