import 'package:flutter/material.dart';
import 'package:managment/data/model/add_date.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:managment/theme/theme.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final box = Hive.box<Add_data>('data');
  DateTime date = DateTime.now();
  String? selctedItem;
  String? selctedItemi;
  final TextEditingController expalin_C = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amount_c = TextEditingController();
  FocusNode amount_ = FocusNode();
  final List<String> _item = [
    'food',
    "Transfer",
    "Transportation",
    "Education"
  ];
  final List<String> _itemei = ['Income', "Expand"];

  @override
  void initState() {
    super.initState();
    ex.addListener(() => setState(() {}));
    amount_.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(
              top: 120,
              child: main_container(),
            ),
          ],
        ),
      ),
    );
  }

  Container main_container() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.card,
      ),
      height: 550,
      width: 340,
      child: Column(
        children: [
          const SizedBox(height: 50),
          name(),
          const SizedBox(height: 30),
          explain(),
          const SizedBox(height: 30),
          amount(),
          const SizedBox(height: 30),
          How(),
          const SizedBox(height: 30),
          date_time(),
          const Spacer(),
          save(),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector(
      onTap: () {
        var add = Add_data(
            selctedItemi!, amount_c.text, date, expalin_C.text, selctedItem!);
        box.add(add);
        Navigator.of(context).pop();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.accent,
        ),
        width: 120,
        height: 50,
        child: Text(
          'Save',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  Widget date_time() {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: AppColors.secondaryText),
      ),
      width: 300,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2020),
            lastDate: DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: ThemeData.dark().copyWith(
                  colorScheme: ColorScheme.dark(
                    primary: AppColors.accent,
                    onPrimary: Colors.white,
                    surface: AppColors.card,
                    onSurface: AppColors.primaryText,
                  ),
                  dialogBackgroundColor: AppColors.background,
                ),
                child: child!,
              );
            },
          );
          if (newDate == null) return;
          setState(() {
            date = newDate;
          });
        },
        child: Text(
          'Date : ${date.year} / ${date.day} / ${date.month}',
          style: TextStyle(fontSize: 15, color: AppColors.primaryText),
        ),
      ),
    );
  }

  Padding How() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: AppColors.secondaryText),
        ),
        child: DropdownButton<String>(
          value: selctedItemi,
          dropdownColor: AppColors.card,
          onChanged: (value) {
            setState(() {
              selctedItemi = value!;
            });
          },
          items: _itemei
              .map((e) => DropdownMenuItem(
                    value: e,
                    child:
                        Text(e, style: TextStyle(color: AppColors.primaryText)),
                  ))
              .toList(),
          selectedItemBuilder: (context) => _itemei
              .map((e) => Row(
                    children: [
                      Text(e, style: TextStyle(color: AppColors.primaryText))
                    ],
                  ))
              .toList(),
          isExpanded: true,
          underline: Container(),
          hint: Padding(
            padding: const EdgeInsets.only(top: 12),
            child:
                Text('How', style: TextStyle(color: AppColors.secondaryText)),
          ),
        ),
      ),
    );
  }

  Padding amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount_,
        controller: amount_c,
        style: TextStyle(color: AppColors.primaryText),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Amount',
          labelStyle: TextStyle(fontSize: 17, color: AppColors.secondaryText),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: AppColors.secondaryText),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: AppColors.accent),
          ),
        ),
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        focusNode: ex,
        controller: expalin_C,
        style: TextStyle(color: AppColors.primaryText),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Explain',
          labelStyle: TextStyle(fontSize: 17, color: AppColors.secondaryText),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: AppColors.secondaryText),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: AppColors.accent),
          ),
        ),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: AppColors.secondaryText),
        ),
        child: DropdownButton<String>(
          value: selctedItem,
          onChanged: (value) {
            setState(() {
              selctedItem = value!;
            });
          },
          items: _item
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 40, child: Image.asset('images/$e.png')),
                        const SizedBox(width: 10),
                        Text(e,
                            style: TextStyle(
                                fontSize: 18, color: AppColors.primaryText)),
                      ],
                    ),
                  ))
              .toList(),
          selectedItemBuilder: (context) => _item
              .map((e) => Row(
                    children: [
                      SizedBox(width: 42, child: Image.asset('images/$e.png')),
                      const SizedBox(width: 5),
                      Text(e, style: TextStyle(color: AppColors.primaryText)),
                    ],
                  ))
              .toList(),
          dropdownColor: AppColors.card,
          isExpanded: true,
          underline: Container(),
          hint: Padding(
            padding: const EdgeInsets.only(top: 12),
            child:
                Text('Name', style: TextStyle(color: AppColors.secondaryText)),
          ),
        ),
      ),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: AppColors.header,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Text(
                      'Adding',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryText,
                      ),
                    ),
                    const Icon(Icons.attach_file_outlined, color: Colors.white),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
