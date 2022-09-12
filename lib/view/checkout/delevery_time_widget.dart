import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../helper/enum.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 40,),
          RadioListTile<Delivery>(
              value: Delivery.StandardDelivery,
              groupValue: delivery,
              onChanged: (Delivery value){
                setState(() {
                  delivery = value;
                });
              },
          title: CustomText(text: 'Standard Delivery',color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
            subtitle: CustomText(text: 'Order will be delivered between 3 - 5 business days',color: Colors.black,fontSize: 14,),
            activeColor: primaryColor,
          ),
          SizedBox(height: 50,),
          RadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue: delivery,
            onChanged: (Delivery value){
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(text: 'Next Day Delivery',color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
            subtitle: CustomText(text: 'Place your order before 6pm and your items will be delivered the next day',color: Colors.black,fontSize: 14,),
            activeColor: primaryColor,
          ),
          SizedBox(height: 50,),
          RadioListTile<Delivery>(
            value: Delivery.NominatedDelivery,
            groupValue: delivery,
            onChanged: (Delivery value){
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(text: 'Nominated Delivery',color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
            subtitle: CustomText(text: 'Pick a particular date from the calendar and order will be delivered on selected date',color: Colors.black,fontSize: 14,),
            activeColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
