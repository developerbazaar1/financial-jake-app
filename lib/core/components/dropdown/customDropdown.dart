import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../theme/theme_helper.dart';
import '../../constant/app_colors.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.label,
      required this.options,
      required this.selected});
  final String label;
  final List<String> options;
  final RxString selected;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.008),
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: width * 0.036,
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => DropdownButtonFormField<String>(
            value: selected.value.isEmpty ? null : selected.value,
            onChanged: (value) => selected.value = value ?? '',
            hint: Text('Select'),
            items: options
                .map((option) =>
                    DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
            dropdownColor: AppColor.secondary,
            icon: Icon(Icons.keyboard_arrow_down),
            style:
                theme.textTheme.bodyMedium?.copyWith(fontSize: width * 0.036),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.secondary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color:
                      AppColor.primary, // Change to your desired border color
                  width: 1.5, // Adjust the width of the border
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColor.primary, // Border color when not focused
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColor.borderColor, // Border color when focused
                  width: 2.0, // Thicker border on focus
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
