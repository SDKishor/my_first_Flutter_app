import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_first_app/models/catagory_model.dart';
import 'package:my_first_app/models/diet_model.dart';
import 'package:my_first_app/models/popular_model.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<CatagoryModel> catagories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> populardiets = [];

  void _getInitialInfo() {
    catagories = CatagoryModel.getCatagoryModel();
    diets = DietModel.getDiets();
    populardiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(),
      body: Container(
        margin: const EdgeInsets.only(left: 12, right: 12),
        child: ListView(
          children: [
            _searchBar(),
            const SizedBox(height: 40),
            _catagorySection(),
            const SizedBox(height: 40),
            _dietSection(),
            const SizedBox(height: 40),
            _popularSection()
          ],
        ),
      ),
    );
  }

  SizedBox _popularSection() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Popular",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15),
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(height: 25),
            itemCount: populardiets.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                decoration: BoxDecoration(
                    color: populardiets[index].boxIsSelected
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: populardiets[index].boxIsSelected
                        ? [
                            BoxShadow(
                                color:
                                    const Color(0xff1D1617).withOpacity(0.07),
                                offset: const Offset(0, 10),
                                blurRadius: 40,
                                spreadRadius: 0)
                          ]
                        : []),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        populardiets[index].iconPath,
                        width: 65,
                        height: 65,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            populardiets[index].name,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          Text(
                              '${populardiets[index].level} | ${populardiets[index].duration} | ${populardiets[index].calorie}',
                              style: const TextStyle(
                                  color: Color(0xff7B6F72),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/images/button.svg',
                            width: 30,
                            height: 30,
                          ))
                    ]),
              );
            },
          ),
        ],
      ),
    );
  }

  SizedBox _dietSection() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recommendation \n for diet",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 240,
            child: ListView.separated(
                itemCount: diets.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                      width: 25,
                    ),
                itemBuilder: (context, index) {
                  return Container(
                    width: 210,
                    decoration: BoxDecoration(
                        color: diets[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadiusDirectional.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 80,
                            child: SvgPicture.asset(diets[index].iconPath)),
                        Column(
                          children: [
                            Text(
                              diets[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                            Text(
                              "${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff786f72),
                                  fontSize: 13),
                            ),
                          ],
                        ),
                        Container(
                            width: 130,
                            height: 45,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  diets[index].viewIsSelected
                                      ? const Color(0xff9DCEFF)
                                      : Colors.transparent,
                                  diets[index].viewIsSelected
                                      ? const Color(0xff92A3FD)
                                      : Colors.transparent
                                ]),
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text("View",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: diets[index].viewIsSelected
                                        ? Colors.white
                                        : const Color(0xffC58BF2),
                                  )),
                            ))
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  SizedBox _catagorySection() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Catagory",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 120,
            child: ListView.separated(
                itemCount: catagories.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                      width: 25,
                    ),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: catagories[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadiusDirectional.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(catagories[index].iconPath),
                          ),
                        ),
                        Text(catagories[index].name)
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Container _searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 40, spreadRadius: 0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search Pancake",
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset("assets/images/search.svg"),
            ),
            suffixIcon: SizedBox(
              width: 75,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 0.3,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset("assets/images/filter.svg"),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: const Text(
        "Breakfast",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.black12,
          ),
          child: SvgPicture.asset(
            "assets/images/arrow-left.svg",
            height: 18,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 32,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.black12,
            ),
            child: SvgPicture.asset(
              "assets/images/dots-2.svg",
              height: 26,
            ),
          ),
        ),
      ],
    );
  }
}
