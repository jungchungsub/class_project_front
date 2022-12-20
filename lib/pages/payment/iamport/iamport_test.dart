import 'package:finalproject_front/pages/payment/iamport/controller/payment_cancle_controller.dart';
import 'package:finalproject_front/pages/payment/iamport/iamport_request/payment_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IamportTest extends ConsumerStatefulWidget {
  const IamportTest({Key? key}) : super(key: key);

  @override
  ConsumerState<IamportTest> createState() => _ImportTestState();
}

class _ImportTestState extends ConsumerState<IamportTest> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // PaymentCancelController paymentCCT = ref.read(paymentCancelController);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff344e81)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 0,
                      top: 20.0,
                      right: 0,
                      bottom: 20.0,
                    ),
                    child: Text(
                      '아임포트 테스트',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        height: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '아임포트 플러터 모듈 테스트 화면입니다.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '아래 버튼을 눌러 결제 또는 본인인증 테스트를 진행해주세요.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  top: 50.0,
                  right: 0,
                  bottom: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                        icon: Icon(
                          Icons.payment,
                          color: Colors.white,
                          size: 25,
                        ),
                        label: Text(
                          '결제 테스트',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentTest()));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                        icon: Icon(
                          Icons.people,
                          color: Colors.white,
                          size: 25,
                        ),
                        label: Text(
                          '환불 테스트',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          // paymentCCT.login();
                        },
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 20)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
