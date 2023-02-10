import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kompas_app_clone/src/common_widgets/primary_button.dart';
import 'package:flutter_kompas_app_clone/src/constants/app_sizes.dart';
import 'package:flutter_kompas_app_clone/src/constants/theme.dart';
import 'package:flutter_kompas_app_clone/src/features/authentication/presentation/onboarding/onboarding_slider.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int? currentIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_bg_kompas_logo.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          CarouselSlider(
            items: [
              // item 1
              const OnboardingSliderFirst(),
              // item 2
              const OnboardingSliderSecond(),
              Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/img_slider_two.png',
                  height: 331,
                ),
              ),
              Opacity(
                opacity: 1,
                child: Image.asset(
                  'assets/img_slider_three.png',
                  height: 331,
                ),
              ),
            ],
            carouselController: carouselController,
            options: CarouselOptions(
              viewportFraction: 4,
              height: double.infinity,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) => {
                setState(() {
                  currentIndex = index;
                })
              },
            ),
          ),
          currentIndex == 0
              ?
              // Item 1
              SizedBox()
              : currentIndex == 1
                  ?
                  // item 2
                  SizedBox()
                  : currentIndex == 2
                      ?
                      // item 3
                      Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Simpan dan',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              gapH16,
                              Text(
                                'Baca Nanti',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: semiBold,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ],
                          ),
                        )
                      :
                      // item 4
                      Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 94,
                              ),
                              const Text(
                                'Untuk mendapatkan berita\nyang kamu suka',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              gapH16,
                              RichText(
                                text: TextSpan(
                                  text: 'Notifikasi ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.deepOrange,
                                    fontWeight: semiBold,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Berita',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(),
                const Spacer(),
                PrimaryButton(
                  text: currentIndex == 0 ? 'Ayo Mulai' : 'Lanjutkan',
                  onPressed: () {
                    currentIndex == 3
                        ? GoRouter.of(context).go('/sign-in')
                        : carouselController.nextPage();
                  },
                ),
                gapH32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: currentIndex == 0 ? 13 : 9,
                      width: currentIndex == 0 ? 13 : 9,
                      decoration: BoxDecoration(
                        color:
                            currentIndex == 0 ? Colors.deepOrange : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: currentIndex == 1 ? 13 : 9,
                      width: currentIndex == 1 ? 13 : 9,
                      decoration: BoxDecoration(
                        color:
                            currentIndex == 1 ? Colors.deepOrange : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: currentIndex == 2 ? 13 : 9,
                      width: currentIndex == 2 ? 13 : 9,
                      decoration: BoxDecoration(
                        color:
                            currentIndex == 2 ? Colors.deepOrange : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: currentIndex == 3 ? 13 : 9,
                      width: currentIndex == 3 ? 13 : 9,
                      decoration: BoxDecoration(
                        color:
                            currentIndex == 3 ? Colors.deepOrange : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                gapH32,
              ],
            ),
          ),
        ],
      ),
    );
  }
}