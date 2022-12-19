import 'package:e_commerce/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            SizedBox(
              height: screenheight * 0.08,
            ),
            Text('You Welcome in',
                style: AppTextStyle.lightTextTheme.headlineLarge),
            Text('DUMDES', style: AppTextStyle.lightTextTheme.headlineLarge),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Please enter the data to log in',
              style: AppTextStyle.lightTextTheme.labelLarge,
            ),
            const SizedBox(
              height: 75,
            ),
            Text(
              'Email/ Phone',
              style: AppTextStyle.lightTextTheme.labelLarge,
            ),
            Container(
              color: Color(0xffFAFAFA),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: ('Enter your email address / phone number'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xffFAFAFA)),
                    //<-- SEE HERE
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Password',
              style: AppTextStyle.lightTextTheme.labelLarge,
            ),
            Container(
              color: Color(0xffFAFAFA),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: ('Enter the account password'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xffFAFAFA)),
                    //<-- SEE HERE
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60,),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffC4C5C4)

              ),
              child: Center(
                child: Text(
                  'sign in ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                  ),

                ),
              ),
            ),
            SizedBox(height: screenheight*0.19,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(child: Text('Password',
                  style: AppTextStyle.lightTextTheme.labelLarge,), onPressed: () {},
                ),
                TextButton(child: Text('Sign Up',
                  style: AppTextStyle.lightTextTheme.labelLarge,), onPressed: () {},
                ),
                ],
            )

          ],
        ),
      ),
    );
  }
}
