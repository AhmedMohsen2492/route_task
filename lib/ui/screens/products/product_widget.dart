import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_route/data/model/Products.dart';
import 'package:ecommerce_route/ui/utils/app_assets.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductWidget extends StatelessWidget {
  int index;
  Products products;
  ProductWidget(this.products, this.index, {super.key});

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
                child: CachedNetworkImage(
                  imageUrl: products.products![index].images!.first,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                  errorWidget: (context,url,error) => const Icon(Icons.error),
                  fit: BoxFit.contain,
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
                        "${products.products?[index].title}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            color: AppColors.primary, fontSize: 16),
                      ),
                      Text(
                        "${products.products?[index].description}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            color: AppColors.primary, fontSize: 16),
                      ),
                      Row(
                        children: [
                          Text(
                            "EGP ${(products.products![index].price!).toStringAsFixed(0)}",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: AppColors.primary, fontSize: 14),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${(((products.products![index].price)! * (products.products![index].discountPercentage! / 100)) + (products.products![index].price!)).toStringAsFixed(0)} EGP",
                            overflow: TextOverflow.ellipsis,
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
                            "Review (${products.products![index].rating})",
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
