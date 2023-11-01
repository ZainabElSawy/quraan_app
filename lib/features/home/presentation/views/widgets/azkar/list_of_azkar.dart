import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_router.dart';
import '../../../../data/models/azkar_model/azkar_model.dart';
import 'custom_azkar_container.dart';

class ListOfAzkar extends StatelessWidget {
  final List<AzkarModel> azkarList;
  const ListOfAzkar({
    Key? key,
    required this.azkarList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: azkarList.length,
      itemBuilder: (context, index) {
        return CustomAzkarContainer(
          zekr: azkarList[index].name ?? "",
          onTap: () async {
            GoRouter.of(context)
                .push(AppRouter.kAzkarDetailsView, extra: azkarList[index].id);
          },
        );
      },
    );
  }
}
