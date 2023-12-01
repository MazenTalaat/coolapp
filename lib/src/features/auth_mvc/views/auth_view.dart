import 'package:coolapp/src/core/app_router.dart';
import 'package:coolapp/src/features/auth_mvc/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:email_validator/email_validator.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenDimensions = MediaQuery.of(context).size;
    ref.listen(authControllerProvider, (previous, next) {
      if (next.isLoggedIn) {
        print('Logged In');
        context.goNamed(AppRoute.posts.name);
      }
    });
    ref.read(authControllerProvider.notifier).isLogged();
    var status = ref.watch(authControllerProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                ),
                const Text('Login Screen'),
                Form(
                  key: ref.watch(authControllerProvider.notifier).mailFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 0),
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
                            style: const TextStyle(color: Colors.black),
                            cursorColor: Colors.black,
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
                                      ? Colors.black
                                      : Colors.red,
                                  // color: Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: status.isValidEmail
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              hintText: "User@neomi.com",
                              labelText: "Email",
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
                                : "Please enter a valid email",
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
                            style: const TextStyle(color: Colors.black),
                            cursorColor: Colors.black,
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
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: status.isValidPassword
                                      ? Colors.black
                                      : Colors.red,
                                  // color: Colors.red,
                                ),
                              ),
                              hintText: "Enter your password",
                              labelText: "Password",
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
                                : "Password can't be empty",
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
                            ref.read(authControllerProvider.notifier).loginUser();
                          },
                    child: status.isLoading
                        ? JumpingDots(
                            color: Colors.black,
                            radius: 7,
                            numberOfDots: 3,
                            animationDuration: const Duration(milliseconds: 200),
                            verticalOffset: -10,
                          )
                        : const Text('Login'),
                  ),
                ),
                SizedBox(
                  width: screenDimensions.width / 2.8,
                  height: screenDimensions.height / 18,
                  child: ElevatedButton(
                    onPressed: status.isLoading
                        ? null
                        : () {
                      ref.read(authControllerProvider.notifier).signInWithGoogle();
                    },
                    child: status.isLoading
                        ? JumpingDots(
                      color: Colors.black,
                      radius: 7,
                      numberOfDots: 3,
                      animationDuration: const Duration(milliseconds: 200),
                      verticalOffset: -10,
                    )
                        : const Text('Sign In with Google'),
                  ),
                ),
                SizedBox(
                  width: screenDimensions.width / 2.8,
                  height: screenDimensions.height / 18,
                  child: ElevatedButton(
                    onPressed: status.isLoading
                        ? null
                        : () {
                      ref.read(authControllerProvider.notifier).signOut();
                    },
                    child: status.isLoading
                        ? JumpingDots(
                      color: Colors.black,
                      radius: 7,
                      numberOfDots: 3,
                      animationDuration: const Duration(milliseconds: 200),
                      verticalOffset: -10,
                    )
                        : const Text('Sign Out'),
                  ),
                ),
                Text(status.error),
              ],
            ),
          ),
        ),
    );
  }
}
