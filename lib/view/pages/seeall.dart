import 'package:flutter/material.dart';
import 'package:foodu/component/newscaffold.dart';
import 'package:foodu/component/text.dart';
import 'package:foodu/constants/color.dart';
import 'package:foodu/constants/helpers.dart';
import 'package:foodu/controller/content/seeall.controller.dart';
import 'package:foodu/service/routes.dart';
import 'package:get/get.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> argument = Get.arguments;
    List data = argument[0];
    var mapping = argument[2];
    var all = argument[3];
    print(all);
    return NewScaffold(
      color: ColorConst.original,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            title: CustomText(
              text: argument[1],
              fontSize: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 100.0,
                    child: InkWell(
                      onTap: () {
                        print(mapping[data[index]]);
                        Get.toNamed(Routes.decont, arguments: [
                          mapping[data[index]],
                          data[index],
                        ]);
                        // Get.toNamed(Routes.decont, arguments: [
                        //   controller.newCateg[current],
                        //   current
                        // ]);
                      },
                      child: Card(
                        child: Center(
                          child: CustomText(
                            text: data[index],
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        color: ColorConst.white,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: ColorConst.profile, width: 0.5)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: getSize(context).width,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.toNamed(
                      Routes.details,
                      arguments: all[index],
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(all[index].imglink),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: ColorConst.light,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                )),
                            height: 30,
                            child: Center(
                              child: Text(
                                all[index].title,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: all.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
