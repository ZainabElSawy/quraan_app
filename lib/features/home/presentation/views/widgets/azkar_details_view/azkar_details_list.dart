import 'package:flutter/material.dart';

import '../../../../data/models/azkar_model/azkar_details_model.dart';
import 'custom_azkar_details_container.dart';

class ListOfAzkarDetails extends StatelessWidget {
  final List<AzkarDetailsModel> azkarDetailsList;
  const ListOfAzkarDetails({
    Key? key,
    required this.azkarDetailsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: azkarDetailsList.length,
      itemBuilder: (context, index) {
        return CustomAzkarDetailsContainer(
          azkarDetailsModel: azkarDetailsList[index],
        );
      },
    );
  }
}
