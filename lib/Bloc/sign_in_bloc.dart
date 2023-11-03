import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/Bloc/sign_in_event.dart';
import 'package:login_bloc/Bloc/sign_in_state.dart';

class SignInBloc extends Bloc <SignInEvent,SignInState>{

       SignInBloc():super(SignInInitialState()){
            
         on<SignInTextChangedEvent>((event, emit) {
           if(event.emailValue == ""){
             emit(SignInErrorState('Enter Your Email First'));

           }

         });
         on<SignInSubmittedEvent>((event, emit) {
           
         });
       }
}