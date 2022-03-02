import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/pages/branches/branches_create_page.dart';
import 'package:rmb_admin/pages/branches/widgets/branch_list_item.dart';
import 'package:rmb_admin/providers/branches_provider.dart';
import 'package:rmb_admin/routing/navigator.dart';
import 'package:rmb_admin/theme/color_helper.dart';
import 'package:rmb_admin/widgets/text_form_fields/app_form_field.dart';


class BranchesListPage extends StatelessWidget{

  const BranchesListPage({Key? key}) : super(key: key);

  static const String route = '/branches_list';

  @override
  Widget build(BuildContext context) {
    final BranchesProvider provider = context.watch<BranchesProvider>();
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor.color,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<BranchesProvider>().onBranchCreate();
          locator.get<NavigationRepo>().navigateTo(BranchesInsertPage.route, arguments: context.read<BranchesProvider>());
        },
        backgroundColor: ColorHelper.rmbYellow.color,
        child: const Icon(Icons.add, color: Colors.black87,),
      ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                 Flexible(
                   child: AppTextFormField(
                     controller: provider.filterController,
                     onChanged: (String? value) => provider.filterBranches(value),
                     filled: true,
                     hintText: '',
                     suffixIcon: Icon(Icons.search, color: ColorHelper.rmbYellow.color),
                   ),
                 )
                ],
              ),
            ),
            if(provider.loadingBranches) Expanded(child: Center(child: CircularProgressIndicator(color: ColorHelper.rmbYellow.color,))) else
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 60),
                shrinkWrap: true,
                itemCount: provider.filteredBranches.length,
                itemBuilder: (_, index) => BranchListItem(branch: provider.filteredBranches[index],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
