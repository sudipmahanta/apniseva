import 'package:apniseva/screens/address/widget/address_strings.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../section/address_appbar.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: AddressAppBar(
        title: AddressStrings.title,
      ),
      body: SafeArea(
          child: Column(
            children: List.generate(
                2, (index) => 
                Card(
                  child: Container(
                      width: width,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: AddressStrings.name,
                                    style: Theme.of(context).textTheme.labelMedium
                                  ),
                                  TextSpan(
                                    text: 'Sudip Mahanta',
                                    style: Theme.of(context).textTheme.titleLarge
                                  )
                                ]
                              )
                          ),

                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: AddressStrings.mobile,
                                        style: Theme.of(context).textTheme.labelMedium
                                    ),
                                    TextSpan(
                                        text: '+91- 7852965860',
                                        style: Theme.of(context).textTheme.titleLarge
                                    )
                                  ]
                              )
                          ),

                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: AddressStrings.mobile,
                                        style: Theme.of(context).textTheme.labelMedium
                                    ),
                                    TextSpan(
                                        text: 'sudipmahanta999@gmail.com',
                                        style: Theme.of(context).textTheme.titleLarge
                                    )
                                  ]
                              )
                          ),

                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: AddressStrings.address1,
                                        style: Theme.of(context).textTheme.labelMedium
                                    ),
                                    TextSpan(
                                        text: 'Bhubaneswar',
                                        style: Theme.of(context).textTheme.titleLarge
                                    )
                                  ]
                              )
                          ),

                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: AddressStrings.address2,
                                        style: Theme.of(context).textTheme.labelMedium
                                    ),
                                    TextSpan(
                                        text: 'Bhubaneswar',
                                        style: Theme.of(context).textTheme.titleLarge
                                    )
                                  ]
                              )
                          ),

                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: AddressStrings.city,
                                        style: Theme.of(context).textTheme.labelMedium
                                    ),
                                    TextSpan(
                                        text: 'Bhubaneswar',
                                        style: Theme.of(context).textTheme.titleLarge
                                    )
                                  ]
                              )
                          ),

                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: AddressStrings.state,
                                        style: Theme.of(context).textTheme.labelMedium
                                    ),
                                    TextSpan(
                                        text: 'Odisha',
                                        style: Theme.of(context).textTheme.titleLarge
                                    )
                                  ]
                              )
                          ),

                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: AddressStrings.pinCode,
                                        style: Theme.of(context).textTheme.labelMedium
                                    ),
                                    TextSpan(
                                        text: '752054',
                                        style: Theme.of(context).textTheme.titleLarge
                                    )
                                  ]
                              )
                          ),
                        ],
                      )
                  ),
                )
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Remix.add_circle_line),
      ),
    );
  }
}