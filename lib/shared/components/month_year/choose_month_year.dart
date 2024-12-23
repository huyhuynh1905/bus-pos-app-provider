import 'package:flutter/material.dart';
import 'package:bus_pos_app/shared/utils/common.dart';

import '../single_drop_down/single_drop_down.dart';

class ChooseDate extends StatelessWidget {
  ChooseDate({super.key});

  final List<String> _listYear = [
    "Năm 2020",
    "Năm 2021",
    "Năm 2022",
    "Năm 2023",
    "Năm 2024",
    "Năm 2025",
  ];
  final List<String> _listMouth = [
    "Tháng 1",
    "Tháng 2",
    "Tháng 3",
    "Tháng 4",
    "Tháng 5",
    "Tháng 6",
  ];
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: USingleDropDown(
          hintText: 'Chọn năm',
          itemCallback: (abc) {
            customLog(abc);
          },
          listItem: _listYear,
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: USingleDropDown(
          hintText: 'Chọn tháng',
          itemCallback: (abc) {
            customLog(abc);
          },
          listItem: _listMouth,
        ),
      ),
    ]);
  }
}

// class ChooseMonthYear extends StatelessWidget {
//   const ChooseMonthYear({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Row(
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onTap: () {},
//               child: Container(
//                 height: 50,
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(
//                     color: AppColors.colorBorderInput,
//                     width: 1,
//                   ),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(S.current.select_year,
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w400,
//                             fontSize: Dimens.normalSize)),
//                     const SizedBox(width: 20),
//                     const Icon(Icons.keyboard_arrow_down_rounded, size: 20),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 30),
//           Expanded(
//             child: Container(
//               height: 50,
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(
//                   color: AppColors.colorBorderInput,
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(S.current.select_month,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w400,
//                           fontSize: Dimens.normalSize)),
//                   const SizedBox(width: 20),
//                   const Icon(Icons.keyboard_arrow_down_rounded, size: 20),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
