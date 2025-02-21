import 'package:flutter/material.dart';
import 'package:ny_times_task/utils/theming/styles.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/text_strings.dart';


AppBar buildCustomAppBar() {
  return AppBar(
    backgroundColor: TColors.info,
    leading: IconButton(
      icon: const Icon(Icons.menu,color: TColors.white,),
      onPressed: () {
      },
    ),
    title: Text(TTexts.appTitle, style: TextStyles.font18WhiteMedium  ,),
    centerTitle: true,
    actions: [
      IconButton(
        icon: const Icon(Icons.search,color: TColors.white,),
        onPressed: () {
          // Handle search action
        },
      ),
      PopupMenuButton<String>(
        onSelected: (value) {
          // Handle menu selection
        },
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              value: 'Newsletter',
              child: Text('Newsletter'),
            ),
            const PopupMenuItem(
              value: 'Sports',
              child: Text('Sports'),
            ),
          ];
        },
        icon: const Icon(Icons.more_vert,color: TColors.white,),
      ),
    ],
  );
}
