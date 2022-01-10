import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:foodu/components/newtext.dart';
import 'package:foodu/constant/color.dart';
import 'package:foodu/pages/dashboard/upload/upload_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadView extends StatelessWidget {
  const UploadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = getSize(context);
    return GetBuilder<UploadController>(
        init: UploadController(),
        builder: (controller) {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: NewColor.cream,
                    actions: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: NewColor.original,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 80,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => controller.onSubmit(),
                          child: const Center(
                            child: NewText(
                              'Save',
                              fontSize: 17,
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
                              ? NewColor.background
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
                                  NewText(
                                    'Add a picture of your dish',
                                    fontSize: 20,
                                    color: Colors.white,
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
                        cursorHeight: 25,
                        style: GoogleFonts.lato(
                          fontSize: 18,
                        ),
                        controller: controller.title,
                        decoration: const InputDecoration(
                          hintText: 'Title',
                          labelText: 'Title',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          floatingLabelStyle: TextStyle(
                            color: NewColor.original,
                            fontSize: 22.5,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: NewColor.cream, width: 3),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: NewColor.original, width: 3),
                          ),
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: NewColor.light, width: 3),
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
                        cursorHeight: 25,
                        style: GoogleFonts.lato(
                          fontSize: 18,
                        ),
                        controller: controller.descriptions,
                        textAlignVertical: TextAlignVertical.bottom,
                        minLines:
                            1, // any number you need (It works as the rows for the textarea)
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        decoration: const InputDecoration(
                          hintText: 'Description',
                          labelText: 'Description',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          floatingLabelStyle: TextStyle(
                            color: NewColor.original,
                            fontSize: 22.5,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: NewColor.cream, width: 3),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: NewColor.original, width: 3),
                          ),
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: NewColor.light, width: 3),
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
                        cursorHeight: 25,
                        style: GoogleFonts.lato(
                          fontSize: 18,
                        ),
                        controller: controller.cookingTime,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'in minute',
                          labelText: 'Cooking Time',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          floatingLabelStyle: TextStyle(
                            color: NewColor.original,
                            fontSize: 22.5,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: NewColor.cream, width: 3),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: NewColor.original, width: 3),
                          ),
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: NewColor.light, width: 3),
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
                        cursorHeight: 25,
                        style: GoogleFonts.lato(
                          fontSize: 18,
                        ),
                        keyboardType: TextInputType.number,
                        controller: controller.servings,
                        decoration: const InputDecoration(
                          hintText: 'Servings',
                          labelText: 'Servings',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          floatingLabelStyle: TextStyle(
                            color: NewColor.original,
                            fontSize: 22.5,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: NewColor.cream, width: 3),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: NewColor.original, width: 3),
                          ),
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: NewColor.light, width: 3),
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
                          color: NewColor.original,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 40),
                          child: const NewText(
                            'Ingredients',
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
                                  textFieldConfiguration:
                                      TextFieldConfiguration(
                                    controller: controller.choosenIngredients,
                                    enabled: !controller.confirmIngredients,
                                    decoration: const InputDecoration(
                                      hintText: 'Name',
                                      labelText: 'Name',
                                      floatingLabelStyle: TextStyle(
                                        color: NewColor.original,
                                        fontSize: 20,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: NewColor.cream, width: 3),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: NewColor.original, width: 3),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: NewColor.light, width: 3),
                                      ),
                                    ),
                                  ),
                                  suggestionsCallback: (pattern) {
                                    return controller.getSugestions(pattern);
                                  },
                                  itemBuilder: (context, String itemData) {
                                    return ListTile(
                                      title: NewText(
                                        itemData,
                                        fontSize: 18,
                                      ),
                                    );
                                  },
                                  onSuggestionSelected: (suggestion) =>
                                      controller
                                          .onSugestionIngredients(suggestion),
                                )),
                                Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: NewColor.original),
                                  child: InkWell(
                                    onTap: () => controller.updateIngredient(),
                                    child: Center(
                                      child: NewText(
                                        (!controller.confirmIngredients)
                                            ? 'Confirm'
                                            : 'Cancel',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          width: size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: (controller.confirmIngredients)
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.6,
                                      child: TextField(
                                        controller:
                                            controller.quantityIngredients,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          hintText: 'Qty',
                                          labelText: 'Qty',
                                          floatingLabelStyle: TextStyle(
                                            color: NewColor.original,
                                            fontSize: 17,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: NewColor.cream,
                                                width: 3),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: NewColor.original,
                                                width: 3),
                                          ),
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: NewColor.light,
                                                width: 3),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.2,
                                      child: DropdownButton<String>(
                                          // dropdownColor: Colors.red,
                                          isExpanded: true,
                                          value: controller.unit,
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: NewColor.original,
                                          ),
                                          iconSize: 30,
                                          items: controller.unitList
                                              .map<DropdownMenuItem<String>>(
                                                  (String e) {
                                            return DropdownMenuItem(
                                              child: NewText(
                                                e,
                                                fontSize: 18,
                                              ),
                                              value: e,
                                            );
                                          }).toList(),
                                          onChanged: (e) {
                                            controller.getUnit(e);
                                          }),
                                    )
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
                            color: NewColor.original,
                          ),
                          NewText(
                            'Ingredients',
                            fontSize: 20,
                            color: NewColor.original,
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
                            title: NewText(
                              current.name,
                              fontSize: 17.5,
                              fontWeight: FontWeight.w500,
                            ),
                            subtitle: NewText(
                              '${current.quantity} ${current.unit}',
                              fontSize: 15,
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
                          color: NewColor.original,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 40),
                          child: const NewText(
                            'Directions',
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
                        itemCount: controller.numOfCategories,
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
                                    child: NewText(
                                      '${(index + 1)}',
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: NewColor.original,
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                SizedBox(
                                  width: 275,
                                  child: TextField(
                                    controller: controller.tutorial[index],
                                    decoration: InputDecoration(
                                      hintText: 'Title',
                                      labelText: 'Title',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                      floatingLabelStyle: const TextStyle(
                                        color: NewColor.original,
                                        fontSize: 22.5,
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: NewColor.cream, width: 3),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: NewColor.original, width: 3),
                                      ),
                                      border: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: NewColor.light, width: 3),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: NewColor.original,
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
                            color: NewColor.original,
                          ),
                          NewText(
                            'Steps',
                            fontSize: 20,
                            color: NewColor.original,
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
                          color: NewColor.original,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 40),
                          child: const NewText(
                            'Categories',
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
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
                            var condition =
                                controller.categories[index]['choosen'];
                            return InkWell(
                              onTap: () => controller.chooseCategories(index),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: condition
                                        ? NewColor.original
                                        : NewColor.light,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: FittedBox(
                                    child: NewText(
                                      current,
                                      color: condition
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
              (!controller.notUploading)
                  ? BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 1.5,
                        sigmaY: 1.5,
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: NewColor.original,
                        ),
                      ),
                    )
                  : BackdropFilter(filter: ImageFilter.blur())
            ],
          );
        });
  }
}
