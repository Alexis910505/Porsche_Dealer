// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../domain/entities/porsche_model.dart';

class ModelCarousel extends StatelessWidget {
  final List<PorscheModelEntity> models;

  const ModelCarousel({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
      ),
      items:
          models.map((model) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  //width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 16,
                        ),
                        child: Column(
                          children: [
                            Text(
                              model.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ).animate().fadeIn().slideY(begin: -0.3, end: 0),
                            Text(
                              model.description,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black.withOpacity(0.9),
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ).animate().fadeIn().slideY(begin: -0.3, end: 0),
                          ],
                        ),
                      ),
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(model.imageUrl),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
    );
  }
}
