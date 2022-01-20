import 'package:apple_shop_ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({Key? key}) : super(key: key);

  static const String id = "logo_page";

  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade900,
      body: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            /// header text
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  const Text(
                    "Your Logo",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
            ),

            /// center text context
            PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                _buildColumn(context),
                _buildColumn(context),
                _buildColumn(context),
              ],
            ),

            /// page indicator
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 20,
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: ScrollingDotsEffect(
                      fixedCenter: true,
                      activeStrokeWidth: 2.6,
                      activeDotScale: 1.5,
                      maxVisibleDots: 5,
                      radius: 6,
                      spacing: 10,
                      dotHeight: 8,
                      dotWidth: 8,
                      dotColor: Colors.white.withOpacity(0.5),
                      activeDotColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            /// bottom buttons
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {},
                          height: 50,
                          minWidth: MediaQuery.of(context).size.width,
                          color: Colors.green,
                          child: const Text(
                            "Get started",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, HomePage.id);
                          },
                          height: 50,
                          minWidth: MediaQuery.of(context).size.width,
                          color: Colors.black,
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column _buildColumn(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
        ),
        const Text(
          "All Your Favourite Dishes",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Order from your town",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        const Text(
          "You can easy order from anytime",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
}
