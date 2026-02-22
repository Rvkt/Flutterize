import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterize/widgets/custom_appbar.dart';
import 'package:logger/logger.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerEffectScreen extends StatefulWidget {
  const ShimmerEffectScreen({super.key});

  @override
  State<ShimmerEffectScreen> createState() => _ShimmerEffectScreenState();
}

class _ShimmerEffectScreenState extends State<ShimmerEffectScreen> {
  bool isLoading = true;
  final logger = Logger(
    level: Level.all,
    printer: PrettyPrinter(
      methodCount: 3,
      errorMethodCount: 5,
      lineLength: 180,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logger.t("Trace log");
    logger.d("Debug log");
    logger.i("Info log");
    logger.w("Warning log");
    logger.e("Error log", error: 'Test Error');

    Timer(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Shimmer Effect',
      ),
      body: Center(
        child: isLoading
            ? buildTextShimmerEffect()
            : const Text(
                'Show Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}

// Widget buildShimmerEffect() {
//   return Shimmer.fromColors(
//     baseColor: Colors.grey.shade300,
//     highlightColor: Colors.grey.shade100,
//     child: const Center(
//       child: Text(
//         'Loading',
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//   );
// }

Shimmer buildTextShimmerEffect() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: const Center(
      child: Text(
        'Loading',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

// Widget buildShimmerEffect() {
//   return ListView.builder(
//     itemCount: 10,
//     itemBuilder: (context, index) {
//       return Shimmer.fromColors(
//         baseColor: Colors.grey.shade300,
//         highlightColor: Colors.grey.shade100,
//         child: ListTile(
//           leading: Container(
//             width: 48,
//             height: 48,
//             color: Colors.white,
//           ),
//           title: Container(
//             height: 14,
//             color: Colors.white,
//           ),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 14,
//                 color: Colors.white,
//               ), Container(
//                 height: 14,
//                 color: Colors.white,
//                 margin: const EdgeInsets.only(top: 8),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
