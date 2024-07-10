import 'package:ecommerce_route/ui/utils/app_assets.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.6),
          ),
          color: AppColors.white),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 50,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                        image: AssetImage(AppAssets.test), fit: BoxFit.fill),
                  ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Nike Air Jordon",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            color: AppColors.primary, fontSize: 16),
                      ),
                      Text(
                        "Nike Air Jordon for will go to scool kos a",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            color: AppColors.primary, fontSize: 16),
                      ),
                      Row(
                        children: [
                          Text(
                            "EGP 1,200",
                            style: GoogleFonts.poppins(
                                color: AppColors.primary, fontSize: 14),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "2000 EGP",
                            style: GoogleFonts.poppins(
                              color: AppColors.primary.withOpacity(0.6),
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Review",
                            style: GoogleFonts.poppins(
                                color: AppColors.primary, fontSize: 14),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "(4.6)",
                            style: GoogleFonts.poppins(
                                color: AppColors.primary, fontSize: 14),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(AppAssets.star),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {},
              icon: Container(
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6000)),
                child: const Icon(
                  Icons.add_rounded,
                  color: AppColors.white,
                  size: 25.0,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5000),
              ),
              child: Image.asset(
                AppAssets.favourite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
