import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class SkillsBody extends StatefulWidget {
  SkillsBody({super.key,required this.selectedValue,required this.skills});

  List selectedValue = [];
  List skills = [];

  @override
  State<SkillsBody> createState() => _SkillsBodyState();
}

class _SkillsBodyState extends State<SkillsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.skillsTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        GestureDetector(
          onTap: () {
            _showMultiSelect(context);
          },
          child: Container(
            constraints: const BoxConstraints(minHeight: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kFieldColor,
            ),
            child: MultiSelectChipDisplay(
              items: widget.selectedValue
                  .map((e) => MultiSelectItem(e, e))
                  .toList(),
              onTap: (value) {
                setState(() {
                  widget.selectedValue.remove(value);
                });
              },
              chipColor: kBodyColor,
              textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: kPrimaryColor,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
  void _showMultiSelect(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return MultiSelectDialog(
          items: widget.skills.map((e) => MultiSelectItem(e, e)).toList(),
          initialValue: widget.selectedValue,
          onConfirm: (values) {
            setState(() {
              widget.selectedValue = values;
            });
          },
          selectedColor: kPrimaryColor,
          backgroundColor: kWhiteColor,
          width: MediaQuery.of(context).size.width,
          searchable: true,
        );
      },
    );
  }

}