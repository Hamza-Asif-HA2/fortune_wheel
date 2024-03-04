import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class privacyPolicy extends StatefulWidget {
  const privacyPolicy({super.key});

  @override
  State<privacyPolicy> createState() => _privacyPolicyState();
}

class _privacyPolicyState extends State<privacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            'Privacy & Policy',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy for LUKKI WHEEL',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'At LUKKI WHEEL, we take your privacy seriously. This Privacy Policy outlines the types of personal information we receive and collect when you use our mobile application ("App") and how we use and safeguard that information.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Information We Collect',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We collect and store the following information:',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 10.0),
              Text(
                '1. Email Address: When you log in to our App, we collect your email address for authentication purposes. We do not share this information with third parties and it is solely used for logging you into our service.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 10.0),
              Text(
                '2. Daily Spins and Coins Record: We may store records of your daily spins and coins earned within the App to provide you with personalized experiences and to improve our services.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 20.0),
              Text(
                'How We Use Your Information',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We use the information we collect to:',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 10.0),
              Text(
                '- Provide and personalize our services to you.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              Text(
                '- Improve our App and develop new features.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              Text(
                '- Communicate with you, including responding to your inquiries and providing customer support.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Data Security',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We take appropriate measures to protect the information we collect and store, including implementing technical and organizational security measures to prevent unauthorized access, use, or disclosure.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Third-Party Services',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We may use third-party services to assist us in providing our services, such as hosting providers and analytics services. These third parties may have access to your information only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Children\'s Privacy',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Our services are not intended for individuals under the age of 13. We do not knowingly collect personal information from children under 13. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we can take steps to remove that information from our systems.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Changes to This Privacy Policy',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We reserve the right to update or change our Privacy Policy at any time. Any changes will be effective immediately upon posting the updated Privacy Policy on this page.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
