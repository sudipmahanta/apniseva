import 'package:apniseva/utils/buttons.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../../utils/input_field.dart';
import '../../dashboard/widget/dash_strings.dart';
import '../profile_sections/profile_app_bar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width =  MediaQuery.of(context).size.width;
    double height =  MediaQuery.of(context).size.height -(
        MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom
    );

    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Edit Profile',
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: badges.Badge(
                // badgeColor: primaryColor,
                position: badges.BadgePosition.custom(
                    bottom: 2,
                    end: 10
                ),
                badgeContent: InkWell(
                  onTap: () {},
                  child: const Icon(Remix.pencil_fill,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(DashStrings.serviceImg),
                ),
              ),
            ),
            
            Align(
              alignment: Alignment.center,
              child: Text('Upload Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),

            Text('Name',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextInput(
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              hintText: 'Name',
            ),
            SizedBox(
              height: height * 0.02,
            ),

            Text('Email',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextInput(
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              hintText: "xyz@gmail.com",
            ),
            SizedBox(
              height: height * 0.02,
            ),

            Text('Phone No',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextInput(
              controller: TextEditingController(),
              keyboardType: TextInputType.phone,
            ),
            const Spacer(),
            
            PrimaryButton(width: width, height: 47, onPressed: (){},
               child: const Text("Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
