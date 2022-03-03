import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/models/locations_filter/branch/branch.dart';
import 'package:rmb_admin/pages/branches/pages/branches_create_page.dart';
import 'package:rmb_admin/providers/branches_provider.dart';
import 'package:rmb_admin/routing/navigator.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class BranchListItem extends StatefulWidget {
  const BranchListItem({Key? key, required this.branch}) : super(key: key);

  final Branch branch;

  @override
  State<BranchListItem> createState() => _BranchListItemState();
}

class _BranchListItemState extends State<BranchListItem> {

  bool expanded = false;

  void tapOnBranch() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                child: Text(
                  widget.branch.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: tapOnBranch,
              splashRadius: 16,
              icon: Icon( !expanded ? Icons.expand_more : Icons.expand_less, color: ColorHelper.dashboardIcon.color,),
            ),
            IconButton(
              onPressed: () {
                context.read<BranchesProvider>().selectBranch(branch: widget.branch);
                locator.get<NavigationRepo>().navigateTo(BranchesInsertPage.route, arguments: context.read<BranchesProvider>());
              },
              splashRadius: 20,
              icon: Icon(Icons.edit, color: ColorHelper.rmbYellow.color,),
            ),
            IconButton(
              onPressed: () => onDelete(context, widget.branch),
              splashRadius: 20,
              icon: Icon(Icons.delete, color: ColorHelper.dangerRed.color,),
            ),

          ],
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 100),
          child: !expanded ? const Center(child: SizedBox(),) :
          Column(
            children: [
              _BranchField(
                fieldName: "branches_list.address".tr(),
                fieldValue: widget.branch.location.address,
              ),
              _BranchField(
                fieldName: "branches_list.city".tr(),
                fieldValue: widget.branch.city.name,
              ),
              _BranchField(
                fieldName: "branches_list.contact".tr(),
                fieldValue: widget.branch.contact,
              )
            ],
          ),
        )
      ],
    );
  }
}


class _BranchField extends StatelessWidget {
  const _BranchField({
    Key? key,
    required this.fieldName,
    required this.fieldValue
  }) : super(key: key);

  final String fieldName;
  final String fieldValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        children: [
          SizedBox(
            width: 85,
            child: Text(
              fieldName,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 17,
              ),
            ),
          ),
          Expanded(
            child: Text(
              fieldValue,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 17
              ),
            ),
          )
        ],
      ),
    );
  }
}


Future<void> onDelete(BuildContext context, Branch branch) async{
  await Future.delayed(const Duration(milliseconds: 100));
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text('branches_list.dialog_title'.tr()),
        content: Text('branches_list.dialog_text'.tr(namedArgs: {'branch' : branch.name}),),
        actions: [
          TextButton(
            onPressed: () async {
              await context.read<BranchesProvider>().deleteBranch(branch: branch);
              Navigator.of(context).pop();
            },
            child: Text('branches_list.dialog_yes'.tr()),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('branches_list.dialog_no'.tr()),
          )
        ],
      );
    }
  );
}


