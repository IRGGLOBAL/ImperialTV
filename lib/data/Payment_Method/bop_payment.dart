import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/data/Payment_Method/payment_controller.dart';

import '../../utils/utils.dart';


class BopPayment extends StatelessWidget {

  final BankOfPunjabController controller = Get.put(BankOfPunjabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      extendBody: true,
      body: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Obx(() => controller.isLoading.isTrue//||controller.isPaymentLoading.isTrue
            ? Container(
            color: Colors.transparent,
            height: Get.height * 0.15,
            child:
            Center(child: MyUtils.customLoadingAnimation()))
            : ElevatedButton(
          onPressed: () {
         {
           Get.bottomSheet((Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Text(
                        "Choose Payment Method",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            //controller.checkWalletAmount();
                          },
                          child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 16),
                              child: Row(
                                children: [
                                  Icon(Icons.wallet),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Wallet",
                                    style:
                                    TextStyle(fontSize: 16),
                                  ),
                                ],
                              ))),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () async {
                            // var isSuccess = await controller
                            //     .createBOPSessionId();
                            //
                            // if (isSuccess) {
                            //   controller.addCarPost();
                            // }
                          },
                          child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 16),
                              child: Row(
                                children: [
                                  Icon(Icons.credit_card),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Bank Transfer",
                                    style:
                                    TextStyle(fontSize: 16),
                                  ),
                                ],
                              ))),
                    ],
                  ),
                )));
              }

          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Color(0xffF0AC1E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(
                vertical: 12, horizontal: 20),
          ),
          child: Text(
            // widget.sellerAd != null
            //     ? "update".tr
            //     :
            "proceed".tr,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff4C4C4C),
              fontWeight: FontWeight.w500,
              fontFamily: 'digital_font',
            ),
          ),
        )),
      ),
    );
  }
}

