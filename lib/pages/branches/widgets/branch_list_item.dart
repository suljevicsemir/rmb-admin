

import 'package:flutter/material.dart';
import 'package:rmb_admin/models/locations_filter/branch/branch.dart';

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
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      splashColor: Colors.red,
      child: Column(
        children: [
          Text(
            widget.branch.name,
            style: TextStyle(
              color: Colors.white
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: !expanded ? const SizedBox() :
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Adresa"
                    ),
                    Text(
                      widget.branch.location.address
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                        "Grad"
                    ),
                    Text(
                        widget.branch.city.name
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                        "Kontakt"
                    ),
                    Text(
                        widget.branch.contact
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
