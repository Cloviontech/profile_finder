import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodTasteRadioWidget extends StatefulWidget {
  const FoodTasteRadioWidget({super.key});

  @override
  State<FoodTasteRadioWidget> createState() => _FoodTasteRadioWidgetState();
}




class _FoodTasteRadioWidgetState extends State<FoodTasteRadioWidget> {
   String _valueFoodtasteVegNonVeg = "Veg";

    saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID, valueToSave);
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Radio(
                  // toggleable: true,
                  value: "Veg",
                  groupValue: _valueFoodtasteVegNonVeg,
                  onChanged: (valueVegOrNon) {
                    setState(() {
                      _valueFoodtasteVegNonVeg = valueVegOrNon.toString();
                      saveToSharedPrefferences(
                          "foodTasteVegOrNon", _valueFoodtasteVegNonVeg
                          // _valueFoodtasteVegNonVeg == 1
                          //     ? "Veg"
                          //     : "Non-Veg"

                          );
                    });
                  }),
              const SizedBox(
                width: 2,
              ),
              const Text("Veg")
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Radio(
                  value: "Non Veg",
                  groupValue: _valueFoodtasteVegNonVeg,
                  onChanged: (value) {
                    setState(() {
                      _valueFoodtasteVegNonVeg = value.toString();
                      saveToSharedPrefferences(
                          "foodTasteVegOrNon", _valueFoodtasteVegNonVeg);
                    });
                    saveToSharedPrefferences("foodTasteVegOrNon",
                        _valueFoodtasteVegNonVeg == 2 ? "Non-Veg" : "Both");
                  }),
              const SizedBox(
                width: 2,
              ),
              const Text("Non Veg")
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Radio(
                  value: "Both",
                  groupValue: _valueFoodtasteVegNonVeg,
                  onChanged: (value) {
                    setState(() {
                      _valueFoodtasteVegNonVeg = value.toString();
                      saveToSharedPrefferences(
                          "foodTasteVegOrNon", _valueFoodtasteVegNonVeg);
                    });
                    saveToSharedPrefferences("foodTasteVegOrNon",
                        _valueFoodtasteVegNonVeg == 3 ? "Both" : "3");
                  }),
              const SizedBox(
                width: 2,
              ),
              const Text("Both")
            ],
          ),
        ),
      ],
    );
  }
}
