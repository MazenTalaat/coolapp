import 'package:auto_size_text/auto_size_text.dart';
import 'package:coolapp/core/app_router.dart';
import 'package:coolapp/src/features/auth_mvc/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:email_validator/email_validator.dart';
import 'package:coolapp/generated/l10n.dart';

class AuthView extends ConsumerWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenDimensions = MediaQuery.of(context).size;
    ref.listen(authControllerProvider, (previous, next) {
      if (next.isLoggedIn) {
        print('Logged In');
        context.goNamed(AppRoute.authSuccess.name);
      }
    });
    var status = ref.watch(authControllerProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(S.of(context).login_page),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(S.of(context).login_page),
                ),
                Form(
                  key: ref.watch(authControllerProvider.notifier).mailFormKey,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 26, vertical: 0),
                    child: FocusScope(
                      onFocusChange: (value) {
                        if (!value) {
                          ref
                              .watch(authControllerProvider.notifier)
                              .mailFormKey
                              .currentState!
                              .validate();
                        }
                      },
                      child: Column(
                        children: [
                          TextFormField(
                            // style: const TextStyle(color: Colors.black),
                            // cursorColor: Colors.black,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                RegExp(r'\s'),
                              ),
                            ],
                            autofillHints: const [AutofillHints.email],
                            controller: ref
                                .watch(authControllerProvider.notifier)
                                .emailController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: status.isValidEmail
                                      ? Theme.of(context).colorScheme.onBackground
                                      : Colors.red,
                                  // color: Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: status.isValidEmail
                                      ? Theme.of(context).colorScheme.onBackground
                                      : Colors.red,
                                ),
                              ),
                              hintText: "User@user.com",
                              labelText: S.of(context).email,
                              hintStyle: TextStyle(
                                  color: status.isValidEmail
                                      ? Colors.grey
                                      : Colors.red),
                              labelStyle: TextStyle(
                                  color: status.isValidEmail
                                      ? Colors.grey
                                      : Colors.red),
                            ),
                            onFieldSubmitted: (value) {
                              ref
                                  .watch(authControllerProvider.notifier)
                                  .mailFormKey
                                  .currentState!
                                  .validate();
                            },
                            onChanged: (value) {
                              ref
                                  .watch(authControllerProvider.notifier)
                                  .mailFormKey
                                  .currentState!
                                  .validate();
                            },
                            validator: (value) {
                              if (!EmailValidator.validate(value!)) {
                                ref
                                    .read(authControllerProvider.notifier)
                                    .validEmail(false);
                                return null;
                              }
                              ref
                                  .read(authControllerProvider.notifier)
                                  .validEmail(true);
                              return null;
                            },
                          ),
                          Text(
                            status.isValidEmail
                                ? ""
                                : S.of(context).email_valid,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(status.email),
                Form(
                  key: ref.watch(authControllerProvider.notifier).passFormKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(26, 15, 26, 15),
                    child: FocusScope(
                      onFocusChange: (value) {
                        if (!value) {
                          ref
                              .watch(authControllerProvider.notifier)
                              .passFormKey
                              .currentState!
                              .validate();
                        }
                      },
                      child: Column(
                        children: [
                          TextFormField(
                            // style: const TextStyle(color: Colors.black),
                            // cursorColor: Colors.black,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            autofillHints: const [AutofillHints.password],
                            obscureText: status.obscurePassword,
                            controller: ref
                                .watch(authControllerProvider.notifier)
                                .passwordController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: status.isValidPassword
                                      ? Theme.of(context).colorScheme.onBackground
                                      : Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: status.isValidPassword
                                      ? Theme.of(context).colorScheme.onBackground
                                      : Colors.red,
                                  // color: Colors.red,
                                ),
                              ),
                              hintText: S.of(context).enter_password,
                              labelText: S.of(context).password,
                              hintStyle: TextStyle(
                                  color: status.isValidPassword
                                      ? Colors.grey
                                      : Colors.red),
                              labelStyle: TextStyle(
                                  color: status.isValidPassword
                                      ? Colors.grey
                                      : Colors.red),
                              suffixIcon: GestureDetector(
                                child: Icon(status.obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onTap: () {
                                  ref
                                      .read(authControllerProvider.notifier)
                                      .togglePassword();
                                },
                              ),
                            ),
                            onFieldSubmitted: (value) {
                              ref
                                  .watch(authControllerProvider.notifier)
                                  .passFormKey
                                  .currentState!
                                  .validate();
                            },
                            onChanged: (value) {
                              ref
                                  .watch(authControllerProvider.notifier)
                                  .passFormKey
                                  .currentState!
                                  .validate();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                ref
                                    .read(authControllerProvider.notifier)
                                    .validPassword(false);
                                return null;
                              }
                              ref
                                  .read(authControllerProvider.notifier)
                                  .validPassword(true);
                              return null;
                            },
                          ),
                          Text(
                            status.isValidPassword
                                ? ""
                                : S.of(context).password_valid,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(status.password),
                SizedBox(
                  width: screenDimensions.width / 2.8,
                  height: screenDimensions.height / 18,
                  child: ElevatedButton(
                    onPressed: status.isLoading
                        ? null
                        : () {
                            ref
                                .read(authControllerProvider.notifier)
                                .loginUser();
                          },
                    child: status.isLoading
                        ? JumpingDots(
                            color: Theme.of(context).colorScheme.onBackground,
                            radius: 7,
                            numberOfDots: 3,
                            animationDuration:
                                const Duration(milliseconds: 200),
                            verticalOffset: -10,
                          )
                        : Text(S.of(context).login),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                SizedBox(
                  width: screenDimensions.width / 2.8,
                  height: screenDimensions.height / 18,
                  child: ElevatedButton(
                    onPressed: status.isLoading
                        ? null
                        : () {
                            ref
                                .read(authControllerProvider.notifier)
                                .signInWithGoogle();
                          },
                    child: status.isLoading
                        ? JumpingDots(
                            color: Theme.of(context).colorScheme.onBackground,
                            radius: 7,
                            numberOfDots: 3,
                            animationDuration:
                                const Duration(milliseconds: 200),
                            verticalOffset: -10,
                          )
                        :  AutoSizeText(S.of(context).continue_with_google, minFontSize: 8, maxLines: 1),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).not_a_user),
                    TextButton(
                        onPressed: () {
                          context.goNamed(AppRoute.register.name);
                        },
                        child: Text(S.of(context).register_now)),
                  ],
                ),
                Text(status.error),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
