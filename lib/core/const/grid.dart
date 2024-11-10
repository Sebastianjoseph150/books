// import 'package:flutter/material.dart';

// class Boxes {
//   static const bbox = SizedBox(
//     height: 9,
//   );
//   static const sbox = SizedBox(
//     height: 4,
//   );
//   static const ssbox = SizedBox(
//     height: 3,
//   );
// }
import 'package:flutter/material.dart';

class Grid {
  static SizedBox grid1(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.01 *
          9, // 9% of the base height
    );
  }

  static SizedBox grid2(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.01 *
          4, // 4% of the base height
    );
  }

  static SizedBox grid3(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.01 *
          3, // 3% of the base height
    );
  }
}
