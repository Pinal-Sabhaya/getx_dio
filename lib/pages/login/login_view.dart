import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/constant/app_colors.dart';
import 'package:getxdemo/constant/app_fonts.dart';
import 'package:getxdemo/pages/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
      Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(32, 32, 32, 32),
              child: Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  'Welcome Back',
                  style: FontConstant.lufgaRegular,
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                  child: Text(
                    'Let\'s get started by filling out the form below.',
                    style: FontConstant.lufgaRegular,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: TextFormField(
                    controller: controller.emailController.value,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintStyle: FontConstant.lufgaRegular,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: FontConstant.lufgaRegular,
                    // validator: _model.textControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: TextFormField(
                    controller: controller.passwordController.value,
                    // obscureText: !_model.passwordVisibility,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintStyle: FontConstant.lufgaLight,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: InkWell(
                        /* onTap: () => setState(
                              () => _model.passwordVisibility =
                          !_model.passwordVisibility,
                        ),*/
                        focusNode: FocusNode(skipTraversal: true),
                        child: const Icon(
                          // _model.passwordVisibility
                          //     ? Icons.visibility_outlined :
                          Icons.visibility_off_outlined,
                          color: Colors.black,
                          size: 22,
                        ),
                      ),
                    ),
                    style: FontConstant.lufgaMedium,
                    // validator: _model.textControllerValidator.asValidator(context),
                  ),
                ),
                Padding(padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16), child: MaterialButton(onPressed: () {}, color: Colors.cyan, child: const Text("Sign In"))),
                /*Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                      child: Text(
                        'Don\'t have an account?',
                        style: FontConstant.lufgaMedium,
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(4, 4, 0, 4),
                      child: Text(
                        'Sign Up Here',
                        style: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                          fontFamily: 'Readex Pro',
                          color:
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  ],
                ),*/
              ])))
    ])));
  }
}
