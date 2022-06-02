import 'package:progress_dialog/progress_dialog.dart';
import '../controller/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CupertinoSliderWithArrayValues extends StatefulWidget{
 @override
 _CupertinoSliderWithArrayValues createState() => _CupertinoSliderWithArrayValues();
}

 class _CupertinoSliderWithArrayValues extends State<CupertinoSliderWithArrayValues> {
   Size _windowSize = Size(0, 0);
   ProgressDialog pr;

   List<double> lstValoresSlider = [10000.0, 30000.0, 50000.0, 70000.0, 90000.0, 100000.0, 120000.0, 140000.0, 160000.0, 180000.0, 200000.0];
   int indexLstValoresSlider = 5;

   @override
   Widget build(BuildContext context) {
     _windowSize = MediaQuery.of(context).size;
     pr = ProgressDialog(context, isDismissible: false, customBody: Controller.getCarregamento());

     return WillPopScope(
       onWillPop: () => Future.value(false),
       child: Scaffold(

         appBar: AppBar(

           title: Image.asset(
             "assets/images/cresol_logoseguro.png",
             width: _windowSize.width * 0.6,
           ),
           backgroundColor: Controller.corVerde,
           centerTitle: true,
           leading: IconButton(
             icon: Icon(
                 Icons.arrow_back
             ),
             onPressed: () => Navigator.of(context).pop(),
           ),
           automaticallyImplyLeading: false,
           actions: <Widget>[
           ],
         ),

         body: Container(
           width: _windowSize.width,
           height: _windowSize.height,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [

               Text(
                 lstValoresSlider[indexLstValoresSlider].toString(),
               ),

               SizedBox(
                 width: _windowSize.width - 40,
                 child: CupertinoSlider(
                   divisions: lstValoresSlider.length,
                   max: (lstValoresSlider.length - 1).toDouble(),
                   min: 0,
                   value: indexLstValoresSlider.toDouble(),
                   onChanged: (double value) {
                     setState(() {
                       indexLstValoresSlider = value.toInt();
                     });
                   },
                   onChangeEnd: (double value) {
                     print(indexLstValoresSlider.toString() + '\n');
                   },
                 ),
               ),

             ],
           ),
         ),
       ),
     );
   }
 }
