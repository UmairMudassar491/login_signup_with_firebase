import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String header;
  final Function? backAction;
  const Header({Key? key, required this.header, this.backAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(
          top: 20, bottom: 20, right: 15, left: backAction == null ? 15 : 0),
      child: Row(
        children: [
          backAction != null
              ? InkWell(
                  onTap: () => backAction!(),
                  child: const Icon(
                    Icons.chevron_left,
                    size: 40,
                  ),
                )
              : const SizedBox(),
          Text(
            header,
            style: const TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
