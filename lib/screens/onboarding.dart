import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KConstantColors {
  static const Color bgColor = Colors.black;
  static const Color bgColorFaint = Colors.grey;
  static const Color faintBgColor = Colors.grey;
}

class KCustomTextStyle {
  static TextStyle kBold(
      BuildContext context, double size, Color color, String font) {
    return TextStyle(
        fontSize: size,
        color: color,
        fontFamily: font,
        fontWeight: FontWeight.bold);
  }

  static TextStyle kMedium(
      BuildContext context, double size, Color color, String font) {
    return TextStyle(
        fontSize: size,
        color: color,
        fontFamily: font,
        fontWeight: FontWeight.w500);
  }
}

class FontSize {
  static const double header = 24.0;
  static const double kMedium = 16.0;
}

class KConstantFonts {
  static const String haskoyBold = 'PoppinsBold';
  static const String haskoyMedium = 'PoppinsMedium';
}

class TodoistLoginScreen extends StatelessWidget {
  const TodoistLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/bg.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          KConstantColors.bgColor.withAlpha(25),
                          KConstantColors.bgColorFaint.withAlpha(25),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "Organize Your Expenses & Life, Finally!",
                textAlign: TextAlign.center,
                style: KCustomTextStyle.kBold(
                  context,
                  FontSize.header,
                  KConstantColors.bgColor,
                  KConstantFonts.haskoyBold,
                ),
              ),
              const SizedBox(height: 32),
              _buildLoginButton(
                context,
                'Continue with Google',
                FontAwesomeIcons.google,
                Colors.white,
                () => _handleLogin(context, 'Apple'),
              ),
              const SizedBox(height: 12),
              _buildLoginButton(
                context,
                'Continue with Email',
                Icons.email,
                KConstantColors.bgColor,
                () => _handleLogin(context, 'Email'),
                backgroundColor: Colors.white,
                borderColor: Colors.grey[300]!,
                textColor: Colors.black,
              ),
              const SizedBox(height: 16),
              _buildLoginButton(
                context,
                'Continue with Phone',
                FontAwesomeIcons.squarePhone,
                KConstantColors.bgColor,
                () => _handleLogin(context, 'Email'),
                backgroundColor: Colors.white,
                borderColor: Colors.grey[300]!,
                textColor: Colors.black,
              ),
              SizedBox(height: 24),
              Text.rich(
                TextSpan(
                  text: 'By continuing you agree to Todoist\'s ',
                  style: KCustomTextStyle.kBold(
                    context,
                    FontSize.kMedium,
                    KConstantColors.faintBgColor,
                    KConstantFonts.haskoyBold,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms of Service',
                      style: KCustomTextStyle.kBold(
                        context,
                        FontSize.kMedium,
                        KConstantColors.bgColor,
                        KConstantFonts.haskoyBold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Open Terms of Service
                        },
                    ),
                    TextSpan(
                      text: ' and ',
                      style: KCustomTextStyle.kBold(
                        context,
                        FontSize.kMedium,
                        KConstantColors.faintBgColor,
                        KConstantFonts.haskoyBold,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: KCustomTextStyle.kBold(
                        context,
                        FontSize.kMedium,
                        KConstantColors.bgColor,
                        KConstantFonts.haskoyBold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Open Privacy Policy
                        },
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(
    BuildContext context,
    String text,
    IconData icon,
    Color iconColor,
    VoidCallback onPressed, {
    Color backgroundColor = const Color(0xFF0052CC),
    Color? borderColor,
    Color textColor = Colors.white,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: borderColor != null
                ? BorderSide(color: borderColor)
                : BorderSide.none,
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: backgroundColor == Colors.white
                    ? Colors.black
                    : Colors.white),
            const SizedBox(width: 8),
            Text(
              text,
              style: KCustomTextStyle.kBold(
                context,
                FontSize.kMedium,
                iconColor,
                KConstantFonts.haskoyBold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context, String method) {
    // Implement login logic here
    print('Logging in with $method');
    // Navigate to the next screen after successful login
  }
}
