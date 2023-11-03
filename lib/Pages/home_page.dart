import 'package:flutter/material.dart';
import 'package:login_bloc/Constants/colors_page.dart';
import 'package:login_bloc/Pages/email_bloc.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController email = TextEditingController();
  TextEditingController pass =TextEditingController();
  @override


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Center(
                    child: Image(
                      image: const AssetImage('assets/images/otp.png'),
                      height: size.height * 0.25,
                    )),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
               Text(
                'Login ',
                style: TextStyle(
                    color:AppColors.firstColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
               Text(
                'Enter Your Details Login !',
                style: TextStyle(
                    color:  AppColors.secondColor,
                    fontSize: 15),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),

              SizedBox(
                height: size.height * 0.07,
                width: size.width * 0.70,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.firstColor),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    },
                    child:  Text('Sign in With Email',
                        style: TextStyle(color:AppColors.secondColor,fontSize: 18))),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),

              SizedBox(
                height: size.height * 0.07,
                width: size.width * 0.70,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.firstColor),
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const MyOTP()));
                    },
                    child:  Text('Sign in With Google',
                        style: TextStyle(color:AppColors.secondColor,fontSize: 18))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
