import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techandlearn/Routes/Routes.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Spacer(),
                    Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                      height: height / 6,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.login);
                      },
                      child: Icon(
                        Icons.login,
                        color: Colors.red,
                        size: width / 15,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    )
                  ],
                ),
                Text(
                  'About Us',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Our History Established in 1993, Student Academy aims to provide quality education at a relatively low cost. The school was formed and is being managed by Mrs. Khadija Mohib, who has a vast academic experience of over 35 years. Our students have always had a 100% success rate in the Board examinations, majority with A+ and A grades. Besides results, our biggest achievement is the well rounded individuals our students become, hence making their Alma Mater proud. A lot of our graduates have attained tremendous success both academically and professionally. We also take pride in ourselves as a quality employer as we offer a very friendly yet professional working environment. We provide in-house training to new entrants into our system, helping them become effective and hardworking teachers. External training and workshops are regularly encouraged to improve the quality of our faculty. Our Mission Our mission is to empower students with knowledge and education to elevate them academically, socially and morally so that they become confident individuals. Areas of Focus \n Ensuring Holistic Development of students at all levels to build a strong foundation.Conceptual learning is practiced in all subjects at every level. However, when in doubt students are encouraged to ask questions in class, as it opens their mind and thinking process. Special emphasis on reading and spoken English. As there is no replacement for hard work, we encourage our students to put in their best efforts.What and how you speak defines your character. Be polite and honest. Respect everyone, always.Discipline and Punctuality to be observed.',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w200,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
