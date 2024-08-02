import '../../models/slide_model.dart';
import '../../resources/app_routes.dart';
import '../../resources/app_spacing.dart';
import '../components/ui/button_component.dart';
import '/resources/app_colours.dart';
import '/resources/app_strings.dart';
import '/resources/app_styles.dart';
import 'package:flutter/material.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  PageController pageController = PageController();

  List<SlideModel> slides = [
    SlideModel(
      title: AppStrings.walkthroughTitle1,
      description: AppStrings.walkthroughDescription1,
      image: "assets/images/walkthrough1.png",
    ),
    SlideModel(
      title: AppStrings.walkthroughTitle2,
      description: AppStrings.walkthroughDescription2,
      image: "assets/images/walkthrough2.png",
    ),
    SlideModel(
      title: AppStrings.walkthroughTitle3,
      description: AppStrings.walkthroughDescription3,
      image: "assets/images/walkthrough3.png",
    ),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.bgColour,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: pages()),
          // AppSpacing.vertical(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                indicatorWidget(),
                AppSpacing.vertical(),
                buttons(),
                AppSpacing.vertical(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget indicatorWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < slides.length; i++) ...[
          InkWell(
            onTap: () {
              if (i != currentPage) {
                pageController.animateToPage(
                  i,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: currentPage == i ? 24 : 8,
              decoration: BoxDecoration(
                color: currentPage == i
                    ? AppColours.primaryColour
                    : AppColours.primaryColourLight,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          if (i < slides.length - 1) AppSpacing.horizontal(size: 8),
        ],
      ],
    );
  }

  Widget buttons() {
    return Column(
      children: [
        ButtonComponent(
          label: AppStrings.signUp,
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.signUpScreen);
          },
        ),
        AppSpacing.vertical(size: 16),
        ButtonComponent(
          type: ButtonType.secondary,
          label: AppStrings.login,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget pages() {
    return PageView.builder(
      itemCount: slides.length,
      onPageChanged: (index) => setState(
        () => currentPage = index,
      ),
      controller: pageController,
      itemBuilder: (context, index) {
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(24),
          children: [
            AppSpacing.vertical(size: 48),
            Center(
              child: Image.asset(
                slides[index].image,
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ),
            AppSpacing.vertical(),
            Text(
              slides[index].title,
              style: AppStyles.title1(),
              textAlign: TextAlign.center,
            ),
            AppSpacing.vertical(size: 16),
            Text(
              slides[index].description,
              style: AppStyles.regular1(
                color: AppColours.light20,
                weight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
