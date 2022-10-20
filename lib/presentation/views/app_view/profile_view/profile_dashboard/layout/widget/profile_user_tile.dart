import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/start_this_habit_image.png'),
      ),
      title: CustomText(
        title: 'Marilyn Aminoff',
        fontsize: 14,
        fontWeight: FontWeight.bold,
        textColor: FrontEndCngig.kTextColor,
      ),
      subtitle: CustomText(
        title: 'Name',
        fontsize: 12,
        fontWeight: FontWeight.bold,
        textColor: FrontEndCngig.kGreyColor,
      ),
      trailing: Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black.withOpacity(0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
                title: 'This week',
                fontsize: 12,
                textColor: FrontEndCngig.kTextColor),
            Icon(
              Icons.arrow_drop_down_sharp,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
