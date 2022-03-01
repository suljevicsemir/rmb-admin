import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/pages/branches/widgets/branch_list_item.dart';
import 'package:rmb_admin/providers/branches_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class BranchesListPage extends StatefulWidget {
  const BranchesListPage({Key? key}) : super(key: key);

  static const String route = '/branches_list';

  @override
  _BranchesListPageState createState() => _BranchesListPageState();
}

class _BranchesListPageState extends State<BranchesListPage> {
  @override
  Widget build(BuildContext context) {
    final BranchesProvider provider = context.watch<BranchesProvider>();
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor.color,
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: ColorHelper.backgroundColor.color,
        elevation: 0.0,
        title: Text(
          'branches_list.title'.tr(),
          style: const TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Ovdje ce bit pretraga"),
                Text("Ovdje ce biti search bar")
              ],
            ),
            if(provider.loadingBranches) Expanded(child: Center(child: CircularProgressIndicator(color: ColorHelper.rmbYellow.color,))) else
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: provider.branches.length,
                itemBuilder: (_, index) => BranchListItem(branch: provider.branches[index],),
              ),
            )
          ],
        ),
      ),
    );
  }
}
