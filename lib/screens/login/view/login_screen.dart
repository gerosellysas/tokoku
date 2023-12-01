import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokoku/res/resources.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // static Route<void> route() {
  //   return MaterialPageRoute<void>(builder: (_) => const LoginScreen());
  // }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.5;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'imageLogo',
                child: SvgPicture.asset(
                  AppImages.logo,
                  height: AppSize.responsive(132),
                  width: AppSize.responsive(80),
                ),
              ),
              SizedBox(height: AppSize.responsive(48)),
              AppTextField(
                label: "Username",
                hint: "input your username",
                // onChanged: (username) => context
                //     .read<LoginBloc>()
                //     .add(LoginUsernameChanged(username)),
                onFieldSubmitted: (str) {
                  // _loginSubmitted(context);
                },
                isError: false,
                errorText: 'invalid username',
              ),
              SizedBox(height: AppSize.responsive(12)),
              AppTextField(
                // obscure: state.obscure,
                keyboard: TextInputType.visiblePassword,
                inputAction: TextInputAction.done,
                label: "Password",
                hint: "password required",
                // onChanged: (password) => context
                //     .read<LoginBloc>()
                //     .add(LoginPasswordChanged(password)),
                onFieldSubmitted: (str) {
                  // _loginSubmitted(context);
                },
                isError: false,
                errorText: 'invalid password',
                onShowPassTap: () {
                  // context.read<LoginBloc>().add(LoginShowPass(!state.obscure));
                },
              ),
              SizedBox(height: AppSize.responsive(48)),
              AppButton(
                text: "Login",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
