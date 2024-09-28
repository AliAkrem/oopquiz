import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Credits"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Credits",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              _buildCreditSection(
                "Quiz Exercises",
                "The quiz exercises used in this app are taken from a PDF provided by Frédéric Fürst, Picardie Jules Verne university.",
                [
                  {
                    "author": "Frédéric Fürst",
                    "url": "https://home.mis.u-picardie.fr/~furst"
                  },
                  {
                    "author": "PDF file",
                    "url": "https://home.mis.u-picardie.fr/~furst/docs/exercicesPOO.pdf"
                  }
                ],
              ),

              _buildCreditSection(
                "Icons from Flaticon",
                "We used icons from Flaticon. All rights are reserved by their respective authors.",
                [
                  {
                    "author": "Modular icons created by AGE - Flaticon",
                    "url": "https://www.flaticon.com/free-icons/modular",
                  },
                  {
                    "author": "Sitemap icons created by adrianadam - Flaticon",
                    "url": "https://www.flaticon.com/free-icons/sitemap",
                  },
                  {
                    "author": "Capsule icons created by Good Ware - Flaticon",
                    "url": "https://www.flaticon.com/free-icons/capsule",
                  },
                  {
                    "author":
                        "App-drawer icons created by NajmunNahar - Flaticon",
                    "url": "https://www.flaticon.com/free-icons/app-drawer",
                  },
                  {
                    "author": "Java icons created by riajulislam - Flaticon",
                    "url": "https://www.flaticon.com/free-icons/java",
                  },
                ],
              ),

              const SizedBox(height: 24),
              _buildCreditSection(
                "Animations from Lottie",
                "We used animations from LottieFiles. Below are the creators of the animations used:",
                [
                  {
                    "author":
                        "Free Java logo Animation by CevRiemanns - LottieFiles",
                    "url":
                        "https://lottiefiles.com/free-animation/java-logo-TacYLRtbDh",
                  },
                ],
              ),

              const SizedBox(height: 24),
              // Additional Credits (Optional)
              _buildCreditSection(
                "Other Resources",
                "Thanks to the Flutter community and open-source contributors for their amazing work.",
                [],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to build each credit section
  Widget _buildCreditSection(
      String title, String description, List<Map<String, String>> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        if (links.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: links.map((link) {
              return InkWell(
                onTap: () => _launchURL(link['url']!),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    link['author']!,
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  // Helper function to open URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode:LaunchMode.externalApplication );
    } else {
      throw 'Could not launch $url';
    }
  }
}
