import '/resources/app_spacing.dart';
import '/resources/app_strings.dart';
import '/resources/app_styles.dart';
import '/views/components/form/checkbox_input_component.dart';
import '/views/components/ui/button_component.dart';
import 'package:flutter/material.dart';
import '../../resources/app_colours.dart';
import '../components/form/text_input_component.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColours.bgColour,
        appBar: AppBar(
          backgroundColor: AppColours.bgColour,
          title: Text(
            AppStrings.signUp,
            style: AppStyles.appTitle(),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              TextInputComponent(
                isEnabled: !isLoading,
                textInputType: TextInputType.name,
                focusNode: nameFocus,
                isRequired: true,
                label: AppStrings.name,
                textEditingController: nameEditingController,
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(emailFocus),
                textInputAction: TextInputAction.next,
              ),
              AppSpacing.vertical(),
              TextInputComponent(
                isEnabled: !isLoading,
                focusNode: emailFocus,
                isRequired: true,
                textInputType: TextInputType.emailAddress,
                label: AppStrings.emailAddress,
                textEditingController: emailEditingController,
                textInputAction: TextInputAction.next,
              ),
              AppSpacing.vertical(),
              TextInputComponent(
                isEnabled: !isLoading,
                focusNode: passwordFocus,
                isRequired: true,
                label: AppStrings.password,
                isPassword: true,
                textInputAction: TextInputAction.done,
                textEditingController: passwordEditingController,
              ),
              AppSpacing.vertical(),
              CheckboxInputComponent(
                isEnable: !isLoading,
                label: Text.rich(
                  style: AppStyles.medium(size: 14),
                  TextSpan(
                    text: AppStrings.agreeText,
                    children: [
                      WidgetSpan(child: AppSpacing.horizontal(size: 4)),
                      TextSpan(
                        text: AppStrings.termsAndPrivacy,
                        style: AppStyles.medium(
                            size: 14, color: AppColours.primaryColour),
                      ),
                    ],
                  ),
                ),
                value: false,
                onChanged: (value) {
                  print(value);
                },
              ),
              AppSpacing.vertical(),
              ButtonComponent(
                isLoading: isLoading,
                label: AppStrings.signUp,
                onPressed: signup,
              ),
              AppSpacing.vertical(size: 16),
              Text(
                AppStrings.orWith,
                style: AppStyles.bold(size: 14, color: AppColours.light20),
                textAlign: TextAlign.center,
              ),
              AppSpacing.vertical(size: 16),
              ButtonComponent(
                label: AppStrings.signUpWithGoogle,
                type: ButtonType.light,
                icon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset('assets/images/google.png'),
                ),
                onPressed: () {
                  print('Google');
                },
              ),
              AppSpacing.vertical(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    textAlign: TextAlign.center,
                    style: AppStyles.medium(size: 16),
                    TextSpan(
                      text: AppStrings.alreadyHaveAnAccount,
                      children: [
                        WidgetSpan(child: AppSpacing.horizontal(size: 4)),
                        TextSpan(
                          text: AppStrings.login,
                          style: AppStyles.medium(
                            size: 16,
                            color: AppColours.primaryColour,
                          ).copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColours.primaryColour,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signup() {
    FocusScope.of(context).unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      print('Name: ${nameEditingController.text}');
      setState(() {
        isLoading = false;
      });
    });
  }
}
