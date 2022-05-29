import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/styles/colors.dart';

class LiveScreen extends StatelessWidget {
  LiveScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<String> toggleText = ['Live', 'Paper Trading'];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: HexColor("#FFFFFF"),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 64.55, bottom: 90.45),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/Frame1.png',
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Image(
                            width: 80.11,
                            height: 87.4,
                            image: AssetImage('assets/images/Frame2.png'),
                          ),
                        ),
                        const SizedBox(
                          height: 66.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: secondColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 42,
                          child: Stack(
                            children: [
                              AnimatedAlign(
                                alignment: Alignment(
                                    (cubit.firstToggleValue ? -1 : 1), 0),
                                duration: const Duration(milliseconds: 300),
                                child: Container(
                                  height: 33,
                                  width:
                                      (MediaQuery.of(context).size.width / 2) -
                                          20,
                                  decoration: BoxDecoration(
                                    color: defaultColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              Container(
                                height: 42,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    for (int i = 0; i < toggleText.length; i++)
                                      buildSwitchTab(
                                        i == (cubit.firstToggleValue ? 0 : 1),
                                        toggleText[i],
                                        i == (cubit.firstToggleValue ? 0 : 1)
                                            ? TextStyle(
                                                fontSize: 16,
                                                color: HexColor("#FFFFFF"),
                                              )
                                            : TextStyle(
                                                fontSize: 16,
                                                color: defaultColor,
                                              ),
                                        i,
                                        context,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 26.5,
                        ),
                        AnimatedCrossFade(
                          firstChild: Text(
                            'Ready to start trading with real money?',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: defaultColor,
                              fontSize: 16,
                            ),
                          ),
                          secondChild: const Text(
                            'Practise with paper trading',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          sizeCurve: Curves.easeOut,
                          alignment: Alignment.centerLeft,
                          crossFadeState: cubit.firstToggleValue? CrossFadeState.showFirst : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                        ),
                        const SizedBox(
                          height: 26.5,
                        ),
                        Text(
                          'Log in',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: defaultColor,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Don’t have an account?',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            defaultTextButton(
                              function: () {},
                              text: 'Sign Up.',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 38.55,
                        ),
                        Container(
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor("#000000").withOpacity(0.09),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: const Offset(
                                    -4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: defaultTextFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            label: 'Username or Email',
                          ),
                        ),
                        const SizedBox(
                          height: 23.29,
                        ),
                        Container(
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor("#000000").withOpacity(0.09),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: const Offset(
                                    -4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: defaultTextFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            label: 'Password',
                            isPassword: cubit.isPassword,
                            suffix: cubit.suffix,
                            suffixPressed: () {
                              cubit.changePasswordVisibility();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 24.24,
                        ),
                        AnimatedCrossFade(
                          firstChild: defaultTextButton(
                            function: () {},
                            text: 'Forgot your username/password?',
                          ),
                          secondChild: defaultTextButton(
                            function: () {},
                            text: 'Forgot password?',
                          ),
                          sizeCurve: Curves.easeOut,
                          alignment: Alignment.centerLeft,
                          crossFadeState: cubit.firstToggleValue? CrossFadeState.showFirst : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                        ),
                        const SizedBox(
                          height: 39.9,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 46,
                            width: 133,
                            child: defaultButton(
                              background: defaultColor,
                              textColor: HexColor("#FFFFFF"),
                              textSize: 15,
                              function: () {
                                if((emailController.text.isEmpty && passwordController.text.isEmpty) ||
                                    (!emailController.text.contains('@') && passwordController.text.length < 6)){
                                  ScaffoldMessenger.of(context).showSnackBar(showToast(text: 'Invalid Email and Password', state: ToastStates.ERROR));
                                }else if(!emailController.text.contains('@')){
                                  ScaffoldMessenger.of(context).showSnackBar(showToast(text: 'Invalid Email', state: ToastStates.ERROR));
                                }else if (passwordController.text.length < 6){
                                  ScaffoldMessenger.of(context).showSnackBar(showToast(text: 'Password must be more than 6 number', state: ToastStates.ERROR));
                                }else {
                                  ScaffoldMessenger.of(context).showSnackBar(showToast(text: 'Login Success', state: ToastStates.SUCCESS));
                                }
                              },
                              text: 'Login',
                              context: context,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
