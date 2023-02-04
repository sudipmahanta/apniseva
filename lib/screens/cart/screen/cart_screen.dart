import 'package:apniseva/controller/cart_controller/cart_controller.dart';
import 'package:apniseva/screens/cart/cart_sections/cart_order_schedule.dart';
import 'package:apniseva/screens/cart/cart_strings/cart_strings.dart';
import 'package:apniseva/screens/cart/models/cart_details_model.dart';
import 'package:apniseva/screens/cart/screen/select_address_screen.dart';
import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/buttons.dart';
import '../cart_sections/apply_coupon.dart';
import '../cart_sections/cart_appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int? selected = 1;
  final cartController = Get.put(CartController());

  @override
  void initState() {
    Future.delayed(Duration.zero,() {
      cartController.getCartData();
      cartController.applyCoupon();
    });
    super.initState();
  }

  Future<void> refresh() async {
    return  Future.delayed(Duration.zero,() {
      cartController.getCartData();
      cartController.removeItem();
    });
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Obx(() {
      List<AllCart> cartData = cartController.cartDetailsDataModel.value.messages!.status!.allCart!;
        return Scaffold(
          appBar: CartAppBar(
            title: CartStrings.title,
          ),
          body: cartController.isLoading.value == true ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
              strokeWidth: 1.5,
            ),
          ) :
          RefreshIndicator(
            onRefresh: refresh,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: cartController.cartDetailsDataModel.value.messages!.status!.allCart!.isEmpty ? Text('Empty'): Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: List.generate(
                          cartData.length, (index) {
                            return Card(
                                color: Colors.grey.shade200,
                                child: Container(
                                  height: 75,
                                  alignment: Alignment.center,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        width: 60,
                                        height: 75,
                                        padding: const EdgeInsets.all(5.0),
                                        child: Image.network("${ApiEndPoint.imageAPI}/${cartData[index].image}",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    title: Text(cartData[index].servicename!,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                    subtitle: Text('₹ ${cartData[index].price}',
                                      style: Theme.of(context).textTheme.titleLarge,
                                    ),
                                    trailing: InkWell(
                                      onTap: () async{
                                        SharedPreferences preferences = await SharedPreferences.getInstance();
                                        preferences.setString(ApiStrings.cartID, cartData[index].cartId!);
                                        cartController.removeItem();
                                        refresh();
                                      },
                                      child: const Icon(Remix.delete_bin_6_fill,
                                        color: Color(0xFFDC4D42),
                                      ),
                                    ),),
                                )
                            );}
                        ),
                      ),

                      const CartApplyCoupon(),

                      const CartOrderScheduleTotal(),

                      RadioListTile(
                          title: Text(CartStrings.pod,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          toggleable: true,
                          value: 0,
                          groupValue: selected,
                          onChanged: (value) {
                            setState(() {
                              selected = value;
                            });
                            debugPrint(selected.toString());
                            // SharedPreferences preferences = await SharedPreferences.getInstance();
                          }
                      ),

                      // RadioListTile(
                      //     title: Text(CartStrings.payOnline,
                      //       style: Theme.of(context).textTheme.titleLarge,
                      //     ),
                      //     toggleable: true,
                      //     value: 0,
                      //     groupValue: 1,
                      //     onChanged: (value){}
                      // ),
                      //
                      // RadioListTile(
                      //     title: Text(CartStrings.accept,
                      //       style: Theme.of(context).textTheme.titleLarge,
                      //     ),
                      //     toggleable: true,
                      //     value: 1,
                      //     groupValue: 1,
                      //     onChanged: (value){}
                      // ),
                  ]
                ),
              ),
            ),
          ),
            bottomNavigationBar: BottomAppBar(
              child: Container(
                  width: width,
                  height: 65,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: PrimaryButton(
                      width: width * 0.95,
                      height: 47,
                      onPressed: () async{

                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        Future.delayed(Duration.zero,(){
                          // Get.to(()=> const SelectAddressScreen());
                        });
                        },
                      label: CartStrings.confirmBooking)
              ),
            )
        );
      }
    );
  }
}

