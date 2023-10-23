import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../features/user/data/models/user.dart';
import '../../generated/l10n.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Function() onTap;
  final UserModel? user;
  const CustomAppbarWidget({super.key, required this.onTap, this.user});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final S lang = S.of(context);

    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: Text(lang.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: onTap,
          ),
        ],
        leading: user != null
            ? IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  _showUserMenu(
                      context,
                      lang,
                      FirebaseAuth.instance.currentUser!.email!,
                      user!.cityName);
                })
            : null,
      ),
    );
  }

  void _showUserMenu(
      BuildContext context, S lang, String email, String country) {
    showMenu(
      context: context,
      position: RelativeRect.fill,
      items: <PopupMenuEntry<int>>[
        PopupMenuItem<int>(
          value: 0,
          child: Text('${lang.emailSelectedTitle} $email'),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: Text('${lang.citySelectedTitle} $country'),
        ),
      ],
    );
  }
}
