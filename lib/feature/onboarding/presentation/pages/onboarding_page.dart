import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/core.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      "title": "Stay Focused on What Matters",
      "description":
          "Track tasks and build productive habits with a distraction-free workflow.",
      "image": AppAssets.onboardingFocus,
    },
    {
      "title": "Plan Your Day with Ease",
      "description":
          "Create tasks, organize priorities, and manage your work effortlessly.",
      "image": AppAssets.onboardingTasks,
    },
    {
      "title": "Understand Your Productivity",
      "description":
          "See insights and dashboards that help you improve your focus every day.",
      "image": AppAssets.onboardingAnalytics,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = pages[index];

                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Illustration
                        SvgPicture.asset(
                          page["image"]!,
                          height: 250,
                        ),

                        const SizedBox(height: AppSpacing.l),

                        FocusFlowText.heading(
                          page["title"]!,
                          align: TextAlign.center,
                        ),

                        const SizedBox(height: AppSpacing.m),

                        FocusFlowText.body(
                          page["description"]!,
                          align: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// Pagination Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => Container(
                  margin: const EdgeInsets.all(4),
                  width: currentPage == index ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? Colors.black
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: FocusFlowButton(
                text: currentPage == 2 ? "Get Started" : "Next",
                onPressed: () {
                  if (currentPage == 2) {
                    context.go(RouteNames.login);
                  } else {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}