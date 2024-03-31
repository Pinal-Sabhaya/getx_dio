import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/constant/app_fonts.dart';
import 'package:getxdemo/pages/login/login_controller.dart';
import 'package:getxdemo/utils/common_utils.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(32, 32, 32, 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        translation(context).welcome_back,
                        style: FontConstant.lufgaRegular,
                      ),
                       Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                        child: Text(
                          translation(context).welcome_back_content,
                          style: FontConstant.lufgaRegular,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: controller.emailController.value,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: translation(context).lbl_email,
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
                          obscureText: !controller.passwordVisibility.value,
                          decoration: InputDecoration(
                            labelText: translation(context).lbl_password,
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
                              onTap: () {
                                controller.passwordVisibility.value = !controller.passwordVisibility.value;
                              },
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                controller.passwordVisibility.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                color: Colors.black,
                                size: 22,
                              ),
                            ),
                          ),
                          style: FontConstant.lufgaMedium,
                          // validator: _model.textControllerValidator.asValidator(context),
                        ),
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          controller.loginApi();
                        },
                        color: Colors.cyan,
                        child: Text(translation(context).lbl_sign_in),
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
