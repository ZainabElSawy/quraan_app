import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/features/auth/presentation/view_models/auth_view_cubit/auth_cubit.dart';

class SpacingInTop extends StatelessWidget {
  const SpacingInTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is LoginState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
          );
        } else if (state is SignupState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
