import 'package:flutter/material.dart';
import 'package:onboarding/model/onboarding_model.dart';
import 'package:onboarding/screen/splash.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _currentpage == 0
          ? Color(0xffFFF3EB)
          : _currentpage == 1
          ? Color.fromARGB(255, 255, 181, 181)
          : Color(0xffC3F1E3),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: OnboardingData.length,
              // ماسكه الصفحه الحاليه
              onPageChanged: (index) {
                setState(() {
                  _currentpage = index;
                });
              },

              itemBuilder: (context, index) {
                final item = OnboardingData[index];
                return Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 270,
                      height: 380,
                      child: Image.asset(item.img),
                    ),
                    SizedBox(height: 55),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      item.pragragh,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(OnboardingData.length, (index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          width: _currentpage == index ? 17 : 7,
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: _currentpage == index
                                ? Color(0xff4479FD)
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 50),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_currentpage ==
                                      OnboardingData.length - 1) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (c) => Splash(),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "skip",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: 35,
                                height: 1,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_currentpage == OnboardingData.length - 1) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (c) => Splash()),
                                );
                              } else {
                                _controller.nextPage(
                                  duration: Duration(microseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff4479FD),
                              ),
                              child: Icon(Icons.arrow_right_rounded),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
