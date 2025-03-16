import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/core/utils/common_error_loading_widget.dart';
import 'package:flutter_shopping_app/features/products/domain/entities/product_list_response.dart';
import 'package:flutter_shopping_app/features/products/presentation/screens/home_screen/product_list_bloc/get_product_list_bloc.dart';
import 'package:flutter_shopping_app/features/products/presentation/screens/home_screen/widgets/carousel_slider_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ProductListBloc>().add(const ProductListEvent.fetch());
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, box) {
        return Scaffold(
          body: BlocBuilder<ProductListBloc, ProductListState>(
            builder: (context, state) {
              return state.when(
                  initial: () => CommonErrorLoadingWidget(
                      height: box.maxHeight,
                      error: "Failed to Call API"),
                  loading: () => CommonErrorLoadingWidget(
                    height: box.maxHeight,
                    isLoading: true,
                    error: null,
                  ),
                  failed: (error) => CommonErrorLoadingWidget(
                    error: error,
                    height: box.maxHeight,
                  ),
                  success: (data) {
                    final List<Product> productList = data.products ?? [];
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: SizedBox(
                              height: 100,
                              child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(width: 15,),
                                itemCount: productList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(4), // Border thickness
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black, width: 3), // Custom border
                                    ),
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl: "${productList[index].thumbnail}",
                                          placeholder: (context, url) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              "assets/icons/shopping_icon.png",
                                              height: 60,
                                              width: 60,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) => Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
                                          height: 80, // Specify the height
                                          width: 80, // Specify the width
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                },
                              ),
                            ),
                          ),
                          CarouselSliderWidget(),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Deals",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productList.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return SizedBox(
                                          width: 150,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, bottom: 8.0, left: 3.0, right: 3.0),
                                            child: InkWell(
                                              onTap: () {
                                              },
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                elevation: 0,
                                                color: Colors.white,
                                                child: Center(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(15),
                                                        child: CachedNetworkImage(
                                                          imageUrl: "${productList[index].thumbnail}",
                                                          placeholder: (context, url) => Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Image.asset(
                                                              "assets/icons/shopping_icon.png",
                                                              height: 60,
                                                              width: 60,
                                                            ),
                                                          ),
                                                          errorWidget: (context, url, error) => Icon(
                                                            Icons.error,
                                                            color: Colors.red,
                                                          ),
                                                          height: 80, // Specify the height
                                                          width: 80, // Specify the width
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              "${productList[index].title}",
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                            SizedBox(height: 2),
                                                            Text(
                                                              "${productList[index].brand}",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors.grey[600]),
                                                              maxLines: 3,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Offers",   style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productList.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return SizedBox(
                                          width: 150,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, bottom: 8.0, left: 3.0, right: 3.0),
                                            child: InkWell(
                                              onTap: () {
                                              },
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                elevation: 0,
                                                color: Colors.white,
                                                child: Center(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(15),
                                                        child: CachedNetworkImage(
                                                          imageUrl: "${productList[index].thumbnail}",
                                                          placeholder: (context, url) => Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Image.asset(
                                                              "assets/icons/shopping_icon.png",
                                                              height: 60,
                                                              width: 60,
                                                            ),
                                                          ),
                                                          errorWidget: (context, url, error) => Icon(
                                                            Icons.error,
                                                            color: Colors.red,
                                                          ),
                                                          height: 80, // Specify the height
                                                          width: 80, // Specify the width
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 20,
                                                        width: MediaQuery.of(context).size.width * double.infinity,
                                                        color: Colors.green,
                                                        child: Center(child: Text("${productList[index].discountPercentage}% OFF",
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              productList[index].brand ?? '',
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                            SizedBox(height: 2),
                                                            Text(
                                                              productList[index].category?.name ?? '',
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors.grey[600]),
                                                              maxLines: 3,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(height: 20,),
                                Image.asset(
                                  "assets/icons/new-trends.png",
                                  height: 200,
                                  width: MediaQuery.of(context).size.width * double.infinity,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          )
        );
      }
    );
  }
}
