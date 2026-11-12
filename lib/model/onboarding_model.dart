class OnboardingModel {
  final String img;
  final String title;
  final String pragragh;

  OnboardingModel({
    required this.img,
    required this.title,
    required this.pragragh,
  });
}

List<OnboardingModel> OnboardingData = [
  OnboardingModel(
    img: "assets/img/onboarding 1.png",
    title: "Subscriptions",
    pragragh: "Get all your subscriptions at a single place.\n Renew, Cancel or upgrade all done on a single\n platform",
  ),

  OnboardingModel(
    img: "assets/img/onboarding 2.png",
    title: "Reminders",
    pragragh: "Get all your subscriptions at a single place.\n Renew, Cancel or upgrade all done on a single\n platform",
  ),

  OnboardingModel(
    img: "assets/img/onboarding 3.png",
    title: "Payouts",
    pragragh: "Get all your subscriptions at a single place.\n Renew, Cancel or upgrade all done on a single\n platform",
  ),
];
