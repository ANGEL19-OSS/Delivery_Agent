import 'package:deliveryagent/app/modules/map_view/views/reached_customer_screen.dart';
import 'package:deliveryagent/app/utils/constants/app_colors.dart';
import 'package:deliveryagent/app/utils/constants/app_strings.dart';
import 'package:deliveryagent/app/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: AppColors.mapBg,
              child: CustomPaint(painter: MockMapBackgroundPainter()),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.35,
            top: MediaQuery.of(context).size.height * 0.52,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.routeBlue.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppColors.routeBlue,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.background, width: 2.5),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shadowBlack26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.67,
            top: MediaQuery.of(context).size.height * 0.22,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on, color: AppColors.errorRedAccent, size: 38),
              ],
            ),
          ),
          Positioned(
            top: 48,
            left: 16,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.background,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowBlack12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.textBlack87),
                onPressed: () => Get.back(),
              ),
            ),
          ),
          Positioned(
            top: 104,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowBlack12,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.arrow_upward, size: 32, color: AppColors.textBlack87),
                      SizedBox(height: 2),
                      Text(
                        '650 m',
                        style: AppTextStyles.captionBold,
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Head north on\n2nd Main Rd',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBlack87,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 270,
            child: Column(
              children: [
                FloatingActionButton.small(
                  heroTag: 'compass_map',
                  backgroundColor: AppColors.background,
                  elevation: 3,
                  onPressed: () => controller.recenterMap(),
                  child: const Icon(
                    Icons.explore_outlined,
                    color: AppColors.textBlack87,
                  ),
                ),
                const SizedBox(height: 8),
                FloatingActionButton.small(
                  heroTag: 'target_map',
                  backgroundColor: AppColors.background,
                  elevation: 3,
                  onPressed: () => controller.recenterMap(),
                  child: const Icon(Icons.my_location, color: AppColors.textBlack87),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowBlack12,
                    blurRadius: 12,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Obx(() {
                final currentOrder = controller.order.value;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Icon(
                            Icons.circle_outlined,
                            size: 18,
                            color: AppColors.successGreen,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                AppStrings.pickup,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: AppColors.textGrey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                currentOrder?.pickupLocation ??
                                    'Fresh Mart, T. Nagar',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.bodyBold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 4,
                        bottom: 4,
                      ),
                      child: Container(
                        width: 2,
                        height: 20,
                        color: AppColors.dividerLight,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Icon(
                            Icons.location_on,
                            size: 20,
                            color: AppColors.errorRedAccent,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                AppStrings.drop,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: AppColors.textGrey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                currentOrder?.deliveryLocation ??
                                    '12, Lake View Rd, Nungambakkam',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.bodyBold,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              '4.2 km',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textBlack54,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '15 min',
                              style: AppTextStyles.bodyBold,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.framecolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () => Get.to(
                          ReachedCustomerScreen(orderdata: currentOrder!),
                        ),
                        child: const Text(
                          AppStrings.reachedCustomer,
                          style: AppTextStyles.buttonText,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class MockMapBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()..color = AppColors.mapCanvasBg;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);
    final parkPaint = Paint()..color = AppColors.mapParkBg;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(20, size.height * 0.15, size.width * 0.45, 120),
        const Radius.circular(12),
      ),
      parkPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.55,
          size.height * 0.35,
          size.width * 0.38,
          160,
        ),
        const Radius.circular(12),
      ),
      parkPaint,
    );
    final roadPaint = Paint()
      ..color = AppColors.background
      ..strokeWidth = 14
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(0, size.height * 0.25),
      Offset(size.width, size.height * 0.25),
      roadPaint,
    );
    canvas.drawLine(
      Offset(0, size.height * 0.42),
      Offset(size.width, size.height * 0.42),
      roadPaint,
    );
    canvas.drawLine(
      Offset(0, size.height * 0.60),
      Offset(size.width, size.height * 0.60),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.28, 0),
      Offset(size.width * 0.28, size.height),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.52, 0),
      Offset(size.width * 0.52, size.height),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.76, 0),
      Offset(size.width * 0.76, size.height),
      roadPaint,
    );
    final routePaint = Paint()
      ..color = AppColors.routeBlue
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    final startX = size.width * 0.37;
    final startY = size.height * 0.53;
    final endX = size.width * 0.71;
    final endY = size.height * 0.25;

    path.moveTo(startX, startY);
    path.cubicTo(startX + 40, startY - 60, endX - 60, startY - 120, endX, endY);

    canvas.drawPath(path, routePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
