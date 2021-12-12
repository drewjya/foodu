import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:foodu/component/text.dart';
import 'package:foodu/constants/color.dart';
import 'package:foodu/constants/helpers.dart';
import 'package:foodu/controller/pages/upload.contoller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadView extends StatelessWidget {
  const UploadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return GetBuilder<UploadController>(
        init: UploadController(),
        builder: (controller) {
          return CustomScrollView(
            slivers: [
              //*TODO APPBAR
              SliverAppBar(
                pinned: true,
                backgroundColor: ColorConst.light,
                actions: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorConst.original,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 80,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => controller.onSubmit(),
                      child: const Center(
                        child: CustomText(
                          fontSize: 17,
                          text: 'Save',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 30,
                    width: 30,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //TODO PICTURE
              SliverToBoxAdapter(
                child: InkWell(
                  onTap: () => controller.pickImage(),
                  child: Container(
                    height: 175,
                    width: 175,
                    decoration: BoxDecoration(
                      color: !controller.imageExist
                          ? ColorConst.background
                          : Colors.transparent,
                    ),
                    child: !controller.imageExist
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 50,
                              ),
                              CustomText(
                                text: 'Add a picture of your dish',
                                fontSize: 20,
                                color: ColorConst.white,
                              ),
                            ],
                          )
                        : Image.file(
                            controller.picture,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
              ),
              //TODO TITLE
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    cursorHeight: 30,
                    style: GoogleFonts.lato(
                      fontSize: 18,
                    ),
                    controller: controller.title,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      labelText: 'Title',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      floatingLabelStyle: TextStyle(
                        color: ColorConst.original,
                        fontSize: 22.5,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConst.light, width: 3),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConst.original, width: 3),
                      ),
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConst.cream, width: 3),
                      ),
                    ),
                  ),
                ),
              ),
              //TODO DESCRIPTION
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    cursorHeight: 30,
                    style: GoogleFonts.lato(
                      fontSize: 18,
                    ),
                    controller: controller.description,
                    textAlignVertical: TextAlignVertical.bottom,
                    minLines:
                        1, // any number you need (It works as the rows for the textarea)
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                      labelText: 'Description',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      floatingLabelStyle: TextStyle(
                        color: ColorConst.original,
                        fontSize: 22.5,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConst.light, width: 3),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConst.original, width: 3),
                      ),
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConst.cream, width: 3),
                      ),
                    ),
                  ),
                ),
              ),
              //TODO COOKING
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    cursorHeight: 30,
                    style: GoogleFonts.lato(
                      fontSize: 18,
                    ),
                    controller: controller.cookingtime,
                    decoration: const InputDecoration(
                      hintText: 'in minute',
                      labelText: 'Cooking Time',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      floatingLabelStyle: TextStyle(
                        color: ColorConst.original,
                        fontSize: 22.5,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConst.light, width: 3),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConst.original, width: 3),
                      ),
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConst.cream, width: 3),
                      ),
                    ),
                  ),
                ),
              ),
              //TODO SERVING
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    cursorHeight: 30,
                    style: GoogleFonts.lato(
                      fontSize: 18,
                    ),
                    controller: controller.servings,
                    decoration: const InputDecoration(
                      hintText: 'Servings',
                      labelText: 'Servings',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      floatingLabelStyle: TextStyle(
                        color: ColorConst.original,
                        fontSize: 22.5,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConst.light, width: 3),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConst.original, width: 3),
                      ),
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConst.cream, width: 3),
                      ),
                    ),
                  ),
                ),
              ),
              //TODO ingredients
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: size.width,
                      height: 10,
                      color: ColorConst.original,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const CustomText(
                        text: 'Ingredients',
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                        width: size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                child: TypeAheadField(
                              textFieldConfiguration: TextFieldConfiguration(
                                controller: controller.chooseIngredients,
                                enabled: !controller.confirmIngredient,
                                decoration: const InputDecoration(
                                  hintText: 'Name',
                                  labelText: 'Name',
                                  floatingLabelStyle: TextStyle(
                                    color: ColorConst.original,
                                    fontSize: 20,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConst.light, width: 3),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConst.original, width: 3),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConst.cream, width: 3),
                                  ),
                                ),
                              ),
                              suggestionsCallback: (pattern) {
                                return controller.getSugestions(pattern);
                              },
                              itemBuilder: (context, String itemData) {
                                return ListTile(
                                  title: CustomText(
                                    text: itemData,
                                    fontSize: 18,
                                  ),
                                );
                              },
                              onSuggestionSelected: (suggestion) =>
                                  controller.onSugestionIngredients(suggestion),
                            )),
                            Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ColorConst.original),
                              child: InkWell(
                                onTap: () => controller.updateIngredient(),
                                child: Center(
                                    child: CustomText(
                                        text: (!controller.confirmIngredient)
                                            ? 'Confirm'
                                            : 'Cancel',
                                        fontSize: 15)),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      width: size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: (controller.confirmIngredient)
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: 180,
                                    child: TextField(
                                      controller: controller.qtyitem,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        hintText: 'Qty',
                                        labelText: 'Qty',
                                        floatingLabelStyle: TextStyle(
                                          color: ColorConst.original,
                                          fontSize: 17,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorConst.light,
                                              width: 3),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorConst.original,
                                              width: 3),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorConst.cream,
                                              width: 3),
                                        ),
                                      ),
                                    )),
                                DropdownButton<String>(
                                    value: controller.unit,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: ColorConst.original,
                                    ),
                                    iconSize: 30,
                                    underline: const SizedBox(),
                                    items: controller.listunit
                                        .map<DropdownMenuItem<String>>(
                                            (String e) {
                                      return DropdownMenuItem(
                                        child: CustomText(
                                          text: e,
                                          fontSize: 18,
                                        ),
                                        value: e,
                                      );
                                    }).toList(),
                                    onChanged: (e) {
                                      controller.getunit(e);
                                    })
                              ],
                            )
                          : null,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: TextButton(
                  onPressed: () => controller.addSelectedIngredients(),
                  //TODO add ingredients
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        color: ColorConst.original,
                      ),
                      CustomText(
                        text: 'Ingredients',
                        fontSize: 20,
                        color: ColorConst.original,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                //TODO INGREDIENTS LIST
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.selectedIngredients.length,
                  itemBuilder: (context, index) {
                    var current = controller.selectedIngredients[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        title: CustomText(
                          text: current.name,
                          fontSize: 17.5,
                          fontWeight: FontWeight.w500,
                        ),
                        subtitle: CustomText(
                          fontSize: 15,
                          text: '${current.quantity} ${current.unit}',
                        ),
                      ),
                    );
                  },
                ),
              ),

              //TODO DIRECTIONS
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: size.width,
                      height: 10,
                      color: ColorConst.original,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const CustomText(
                        text: 'Directions',
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.numoftextfield,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              child: Center(
                                child: CustomText(
                                  fontSize: 20,
                                  text: (index + 1).toString(),
                                  color: ColorConst.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: ColorConst.original,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            SizedBox(
                              width: 275,
                              child: TextField(
                                controller: controller.tutorial[index],
                                decoration: InputDecoration(
                                  hintText: 'Title',
                                  labelText: 'Title',
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  floatingLabelStyle: const TextStyle(
                                    color: ColorConst.original,
                                    fontSize: 22.5,
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConst.light, width: 3),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConst.original, width: 3),
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConst.cream, width: 3),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: ColorConst.original,
                                    ),
                                    onPressed: () =>
                                        controller.removeTutorial(index),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              SliverToBoxAdapter(
                child: TextButton(
                  onPressed: () => controller.addTutorial(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        color: ColorConst.original,
                      ),
                      CustomText(
                        text: 'Steps',
                        fontSize: 20,
                        color: ColorConst.original,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: size.width,
                      height: 10,
                      color: ColorConst.original,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const CustomText(
                        text: 'Categories',
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 7,
                        mainAxisSpacing: 7,
                        childAspectRatio: 2.75,
                      ),
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        var current = controller.categories[index]['name'];
                        var condition = controller.categories[index]['choosen'];
                        return InkWell(
                          onTap: () => controller.chooseCategories(index),
                          child: Container(
                            decoration: BoxDecoration(
                                color: condition
                                    ? ColorConst.original
                                    : ColorConst.light,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: CustomText(
                                fontSize: 16,
                                text: current,
                                color: condition
                                    ? ColorConst.white
                                    : ColorConst.black,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          );
        });
  }
}
