import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/Bloc/sign_in_event.dart';
import 'package:login_bloc/Bloc/sign_in_state.dart';

class SignInBloc extends Bloc <SignInEvent,SignInState>{

       SignInBloc():super(SignInInitialState()){
            
         on<SignInTextChangedEvent>((event, emit) {
           if(event.emailValue == "" && EmailValidator.validate(event.emailValue) == false){
             emit(SignInErrorState('Enter Your Email First!'));

           }
           else if(event.passwordValue.length<8)
             {
               emit(SignInErrorState('Enter Correct Password!'));
             }
           else{
             emit(SignInValidState());
           }

         });
         on<SignInSubmittedEvent>((event, emit) {
            emit (SignInLoadingState());
         });
       }
}