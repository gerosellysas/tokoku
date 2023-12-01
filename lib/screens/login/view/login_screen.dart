import 'package:auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:tokoku/bloc/login/login.bloc.dart';
import 'package:tokoku/res/resources.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.5;
    return BlocProvider(
      create: (context) {
        return LoginBloc(
          authRepo: RepositoryProvider.of<AuthRepo>(context),
        );
      },
      child: Scaffold(
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
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.username != current.username,
                  builder: (context, state) {
                    return AppTextField(
                      label: "Username",
                      hint: "input your username",
                      onChanged: (username) => context
                          .read<LoginBloc>()
                          .add(LoginUsernameChanged(username)),
                      onFieldSubmitted: (str) {
                        // _loginSubmitted(context);
                      },
                      isError:
                          state.username.displayError != null ? true : false,
                      errorText: state.username.displayError != null
                          ? 'invalid username'
                          : null,
                    );
                  },
                ),
                SizedBox(height: AppSize.responsive(12)),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.password != current.password,
                  builder: (context, state) {
                    return AppTextField(
                      // obscure: state.obscure,
                      keyboard: TextInputType.visiblePassword,
                      inputAction: TextInputAction.done,
                      label: "Password",
                      hint: "password required",
                      onChanged: (password) => context
                          .read<LoginBloc>()
                          .add(LoginPasswordChanged(password)),
                      onFieldSubmitted: (str) {
                        // _loginSubmitted(context);
                      },
                      isError:
                          state.password.displayError != null ? true : false,
                      errorText: state.password.displayError != null
                          ? 'invalid password'
                          : null,
                      onShowPassTap: () {
                        // context.read<LoginBloc>().add(LoginShowPass(!state.obscure));
                      },
                    );
                  },
                ),
                SizedBox(height: AppSize.responsive(48)),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state.status.isInProgress
                        ? const CircularProgressIndicator()
                        : AppButton(
                            text: "Login",
                            onPressed: state.isValid
                                ? () {
                                    timeDilation = 1.0;
                                    context
                                        .read<LoginBloc>()
                                        .add(const LoginSubmitted());
                                  }
                                : null,
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
