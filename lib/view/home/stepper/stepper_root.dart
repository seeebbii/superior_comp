import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:superior_comp/app/constant/controllers.dart';
import 'package:superior_comp/app/router/router_generator.dart';
import 'package:timeline_tile/timeline_tile.dart';


class StepperRoot extends StatefulWidget {
  const StepperRoot({Key? key, this.animation}) : super(key: key);
  final VoidCallback? animation;

  @override
  State<StepperRoot> createState() => _StepperRootState();
}

class _StepperRootState extends State<StepperRoot> with AutomaticKeepAliveClientMixin {
  int activeStep = 0;

  final List<Widget> widgetList = <Widget>[

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          widget.animation!();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              widget.animation!();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_active),
              color: Colors.black,
              onPressed: () {
              },
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                children: widgetList,
                // controller: stepperController.pageViewController,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            Container(
              height: 0.06.sh,
              padding: EdgeInsets.symmetric(vertical: 0.01.sh),
              child: SizedBox.shrink()
            ),
      ],),));
  }

  Widget _buildStepperWidget() {
    return Row(
      children: [
        Container(
          height: 0.07.sh,
          width: 0.07.sw,
          decoration:
              const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 15.sp,
          ),
        ),
        SizedBox(
          width: 15.sp,
          child: const Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildLastStepper() {
    return Container(
      height: 0.07.sh,
      width: 0.07.sw,
      decoration:
          const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: 15.sp,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive =>true;
}
