import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/Bloc/sign_in_bloc.dart';
import 'package:login_bloc/Bloc/sign_in_event.dart';
import 'package:login_bloc/Bloc/sign_in_state.dart';
import 'package:login_bloc/Constants/colors_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottomOpacity: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.back,
            color: AppColors.secondColor,
          ),
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                    child: Image(
                  image: const AssetImage('assets/images/otp.png'),
                  height: size.height * 0.25,
                )),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              BlocBuilder<SignInBloc,SignInState>(
                builder: (context,state){

                  if(state is SignInErrorState){
                   return  Padding(
                      padding:const  EdgeInsets.symmetric(horizontal: 25),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            state.errorMsg,
                            style:const TextStyle(color: Colors.red, fontSize: 16),
                          )),
                    );
                  }
                  else{
                     return Container();
                  }

                }
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged:(val){
                    BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(email.text, pass.text));
                  },
                  showCursor: false,
                  controller: email,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: AppColors.firstColor,
                      ),
                      hintText: ' Enter Your Email Address',
                      hintStyle:
                          TextStyle(fontSize: 12, color: AppColors.firstColor),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: AppColors.firstColor, width: 2)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: AppColors.firstColor, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: AppColors.firstColor, width: 2)),
                      focusColor: AppColors.firstColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: AppColors.firstColor, width: 2))),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged:(val){
                    BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(email.text, pass.text));
                  },
                  showCursor: false,
                  controller: pass,
                  decoration: InputDecoration(
                      hintText: ' Enter Your Password',
                      hintStyle:
                          TextStyle(fontSize: 12, color: AppColors.firstColor),
                      prefixIcon: Icon(
                        Icons.lock_outline_sharp,
                        color: AppColors.firstColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: AppColors.firstColor, width: 2)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: AppColors.firstColor, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: AppColors.firstColor, width: 2)),
                      focusColor: AppColors.firstColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: AppColors.firstColor, width: 2))),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              BlocBuilder<SignInBloc,SignInState>(
                builder: (context,state) {
                  if (state is SignInLoadingState){
                     return Center(child: CircularProgressIndicator(color: AppColors.secondColor,));
                  }
                  return SizedBox(
                    height: size.height * 0.07,
                    width: size.width * 0.70,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: (state is SignInValidState)? AppColors.firstColor: AppColors.greyColor),
                        onPressed: () {
                           if(state is SignInValidState){
                             BlocProvider.of<SignInBloc>(context).add(SignInSubmittedEvent(email.text, pass.text));
                           }
                            email.clear();
                            pass.clear();
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const LoginPage()));
                        },
                        child: Text('Sign In',
                            style: TextStyle(
                              fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:  (state is SignInValidState)? AppColors.secondColor: AppColors.whiteColor)))
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
