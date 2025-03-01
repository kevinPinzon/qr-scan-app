import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scan_app/core/common/resource_images.dart';
import 'package:qr_scan_app/features/authentication/presentation/screens/bloc/auth_bloc.dart';
import 'package:qr_scan_app/core/widgets/custom_button.dart';
import 'package:qr_scan_app/core/widgets/custom_loading_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Successful login")),
          );
          context.go('/scan');
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.message}')),
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            _buildBody(context),
            if (state is AuthLoading) const CustomLoadingWidget(),
          ],
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(),
          Column(
            children: [
              Center(child: SvgPicture.asset(loginImage, height: 70)),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          CustomButton(
            text: "Log in",
            onPressed: () {
              context.read<AuthBloc>().add(SignIn());
            },
          ),
        ],
      ),
    );
  }
}
