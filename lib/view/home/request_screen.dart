import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:superior_comp/app/constant/controllers.dart';
import 'package:superior_comp/app/constant/image_paths.dart';
import 'package:superior_comp/app/router/router_generator.dart';
import 'package:superior_comp/app/utils/colors.dart';
import 'package:superior_comp/view/components/auth_textfield.dart';
import 'package:superior_comp/view/components/build_bottom_buttons.dart';
import 'package:superior_comp/view/components/upload_photo_bottomsheet.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> with AutomaticKeepAliveClientMixin {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final yearMakeController = TextEditingController();
  final modelController = TextEditingController();
  final polishedController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final manufacturerController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 2.sp),
                      child: Text(
                        'REQUEST',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 2.sp),
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                  child: Column(
                children: [
                  _buildNameField(),
                  _buildEmailField(),
                  _buildNumberField(),
                  _buildYearField(),
                  _buildModelField(),
                  _buildPolishedField(),
                  _buildCityField(),
                  _buildCountryField(),
                  _buildManufacturerField(),
                  _buildAddressField(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.sp),
                          child: Text(
                            "Must Upload Videos/Photos of damaged car",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: 0.01.sp),
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(const UploadPhotoBottomSheet());
                          },
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                height: 0.18.sh,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image:
                                            AssetImage(ImagePaths.uploadImage),
                                        scale: 0.6),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black45)),
                                child: Container(
                                    margin: EdgeInsets.all(20.sp),
                                    child: Text(
                                      "Add Photo or Video",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: Colors.grey.shade500),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 0.05.sh),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      child: Row(
                        children: [
                          Expanded(
                              child: BuildBottomButton(
                            buttonText: "Previous",
                            onPressed: () => {},
                            pageNumber: 3,
                            btnColor: Colors.black,
                          )),
                          Expanded(
                              child: BuildBottomButton(
                            buttonText: "Send",
                            onPressed: () => navigationController
                                .navigateToNamed(paymentMethodScreen),
                            pageNumber: 3,
                            btnColor: Colors.grey,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.05.sh),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text(
              "Name",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          AuthTextField(
              controller: nameController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "John Doe",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.name,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Email",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: emailController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "JohnDoe@mail.com",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.emailAddress,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildNumberField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Contact Number",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: contactController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "3655825154",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.number,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildYearField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Year Make",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: yearMakeController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "2021",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.number,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildModelField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Model",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: modelController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "2007",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.number,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildPolishedField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("How many time your car is Polished?",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: polishedController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "2",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.number,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildCityField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("City",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: cityController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "..",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.name,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildCountryField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Country",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: countryController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "...",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.name,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildManufacturerField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Manufacturer",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: manufacturerController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "...",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.name,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildAddressField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Address",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: addressController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "...",
              validator: (str) {},
              action: TextInputAction.done,
              keyType: TextInputType.name,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
