import 'package:flutter/cupertino.dart';
import 'package:propartum/widgets/socials_icons_card.dart';

import '../utils/images.dart';

class AllSocialsIconsWidget extends StatelessWidget {
  const AllSocialsIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: (){
              // signinAuth(snapshot);
            } ,
            child: const SocialIconsCard(imagePath: MyIcons.ic_google,)
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () {
              // TwitterServices().signInWithTwitter(),
            },
            child: const SocialIconsCard(imagePath: MyIcons.ic_twitter,)
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () {
              // await FbServices().signInWithFacebook(),
            },

            child: const SocialIconsCard(imagePath: MyIcons.ic_facebook,)),
      ],
    );
  }
}
