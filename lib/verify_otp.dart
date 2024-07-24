import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen>with CodeAutoFill {

   
   //alela code hit pass karaycha ahe
   String codeValue = "";





  @override
  void codeUpdated() {
    // TODO: implement codeUpdated
  }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenOtp();
  }
   void listenOtp() async {
    await SmsAutoFill().unregisterListener();
    listenForCode();
    await SmsAutoFill().listenForCode;
    print("OTP listen Called");
  }

   @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    print("unregisterListener");
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: PinFieldAutoFill(
                currentCode: codeValue,
                codeLength: 6,
  
                // this method is call when type the code 
                onCodeChanged: (code) {
                  print("onCodeChanged $code");
                  setState(() {
                    codeValue = code.toString();
                  });
                },


                // this method is call when  user submite the code otp 
                onCodeSubmitted: (val) {
                  print("onCodeSubmitted $val");
                },
                decoration: BoxLooseDecoration(
                textStyle: TextStyle(fontSize: 20, color: Colors.black),
                strokeColorBuilder: FixedColorBuilder(Color.fromARGB(255, 251, 8, 8)),
                bgColorBuilder: FixedColorBuilder(Colors.transparent),
                gapSpace: 5.0,
                radius: Radius.circular(8),
                strokeWidth: 1.0,
               // borderWidth: 1.0,
                obscureStyle: ObscureStyle(
                  isTextObscure: false,
                ),
              ),
              ),
            ),
             const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  print(codeValue);
                },
                child: const Text("Verify OTP")),
            ElevatedButton(onPressed: listenOtp, child: const Text("Resend"))
          ],
        ),
      ),
    );

  }
  
}