import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class termsCondition extends StatelessWidget {
  const termsCondition({super.key});

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
            'Terms and Conditions',
            style: GoogleFonts.poppins(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[300],
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Welcome to LUKKI WHEEL! These terms and conditions outline the rules and regulations for the use of our mobile application:',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.0),
              Text(
                '1. By accessing this application, we assume you accept these terms and conditions. Do not continue to use LUKKI WHEEL if you do not agree to all of the terms and conditions stated on this page.',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.0),
              Text(
                '2. The following terminology applies to these Terms and Conditions, Privacy Statement, and Disclaimer Notice and all agreements: "Client", "You", and "Your" refers to you, the person log on this application and compliant to the Company’s terms and conditions.',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.0),
              Text(
                '3. "The Company", "Ourselves", "We", "Our", and "Us", refers to our Company.',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.0),
              Text(
                '4. "Party", "Parties", or "Us", refers to both the Client and ourselves.',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.0),
              Text(
                '5. All terms refer to the offer, acceptance, and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands.',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.0),
              Text(
                '6. Any use of the above terminology or other words in the singular, plural, capitalization, and/or he/she or they, are taken as interchangeable and therefore as referring to the same.',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20.0),
              Text(
                'Cookies',
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.0),
              Text(
                'We employ the use of cookies. By accessing LUKKI WHEEL, you agreed to use cookies in agreement with the Company Name\'s Privacy Policy.',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20.0),
              Text(
                'Most interactive websites use cookies to let us retrieve the user’s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20.0),
              Text(
                'License',
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.0),
              Text(
                'Unless otherwise stated, Company Name and/or its licensors own the intellectual property rights for all material on LUKKI WHEEL. All intellectual property rights are reserved. You may access this from LUKKI WHEEL for your own personal use subjected to restrictions set in these terms and conditions.',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.0),
              Text(
                'You must not:',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 5.0),
              Text(
                '- Republish material from LUKKI WHEEL',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 5.0),
              Text(
                '- Sell, rent, or sub-license material from LUKKI WHEEL',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 5.0),
              Text(
                '- Reproduce, duplicate or copy material from LUKKI WHEEL',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 5.0),
              Text(
                '- Redistribute content from LUKKI WHEEL',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20.0),
              Text(
                'Hyperlinking to our Content',
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.0),
              Text(
                'The following organizations may link to our Website without prior written approval:',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.0),
              Text(
                '- Government agencies',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 5.0),
              Text(
                '- Search engines',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 5.0),
              Text(
                '- News organizations',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 5.0),
              Text(
                '- Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 10.0),
              Text(
                'These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party’s site.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Content Liability',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that are rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third-party rights.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Reservation of Rights',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amend these terms and conditions and it’s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Removal of links from our website',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'If you find any link on our Website that is offensive for any reason, you are free to contact and inform us at any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Changes to Our Terms and Conditions',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Contact Us',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'If you have any questions about these Terms and Conditions, please contact us:',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 5.0),
              Text(
                '- Via email: contact@example.com',
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
