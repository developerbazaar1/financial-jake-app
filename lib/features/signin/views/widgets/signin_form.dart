import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/validator/validator.dart';
import '../../../sign_up/views/widgets/textfeild.dart';
import '../../controllers/signin_controller.dart';

class SignForm extends StatelessWidget {
  const SignForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final controller = Get.put(SignInController());
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          CustomeTextFeild(
            controller: controller.emailController,
            label: 'Email',
            hintText: 'Enter your Email Address',
            onChanged: (value) => () {},
            validator: (value) => Validator.isEmailValid(value: value),
          ),
          SizedBox(height: height * 0.025),





          Obx(()=>  CustomeTextFeild(
            maxLines: 1,

            controller: controller.passwordController,

            label: 'Password', hintText: 'Enter Password',

            suffixIcon: IconButton(
              padding: EdgeInsets.only(right: width* 0.05),
              onPressed: () {

                controller.isPasswordIconVisible.value =
                !controller.isPasswordIconVisible.value;
              },
              icon: Icon(
                controller.isPasswordIconVisible.value
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.white,





          )),
            obscureText: !controller
                .isPasswordIconVisible.value, // Toggle password visibility
            onChanged: (value) {},

            validator: (value) => Validator.isPasswordValid(value: value),

          )),
          SizedBox(height: height * 0.015),
        ],
      ),
    );
  }
}
