import 'package:flutter/material.dart';
import 'package:kafiil_task/client/cubits/dependencies_cubit/dependencies_cubit.dart';
import 'package:kafiil_task/client/models/dependencies_model.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class SkillsBody extends StatefulWidget {
  const SkillsBody({super.key,required this.selectedValue});
  final List selectedValue;
  @override
  State<SkillsBody> createState() => _SkillsBodyState();
}
class _SkillsBodyState extends State<SkillsBody> {
  List selectedValue = [];
  @override
  void didUpdateWidget(covariant SkillsBody oldWidget) {
    setState(() {
      selectedValue = widget.selectedValue;
    });
    print(selectedValue);

    super.didUpdateWidget(oldWidget);
  }
  @override
  void didChangeDependencies() {
    setState(() {
      selectedValue = widget.selectedValue;
    });
    print(selectedValue);

    super.didChangeDependencies();
  }
  @override
  void initState() {
    selectedValue = widget.selectedValue;
    print(selectedValue);

    super.initState();
  }
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
              items: selectedValue.map((e) => MultiSelectItem(e, e.label.toString())).toList(),
              onTap: (value) {
                setState(() {
                  selectedValue.remove(value);
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
    DependenciesModel dependenciesModel =
        DependenciesCubit.get(context).dependenciesModel;
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return MultiSelectDialog(
          items: dependenciesModel.data!.tags!.map((e) => MultiSelectItem(e, e.label.toString())).toList(),
          initialValue: selectedValue,
          onConfirm: (values) {
            setState(() {
              selectedValue = values;
            });
            //print(values);
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
