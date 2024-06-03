# What is Factory Constructor ?
## First of all what is Constructor :

- Constructor is a block of code which is automatically invoked when class is instanciated. 
- Constructor is automatically called when an object(instance of class) is created. It is a special member function of the class.
- It mainly used to assign data in attributes.

## Rules to Create Constructor :
- The name constructor must be same as class name.
- Constructor cannot have any return datatype like void, int, double, etc...
- It cannot return anything(Value).

### Example
bash
class DartProgram {
  DartProgram() {
    print("Hello Dart Language..!");
  }
}

void main() {
  DartProgram dartProgram = DartProgram();
}


## Factory Constructor 
- Factory constructor to convert raw data into objects.
- Factory constructor return the current class's object.
- Factory constructor can be created using 'factory' keyword.
- A factory constructor is convert  raw data into objects and returns an object of the current class. 
- A constructor that takes a map in its parameters and returns an object is called a factory constructor.

### Example
bash
class Student
{
  late int age,salary;
  late String name;

  Student({required String this.name,required int this.age,required int this.salary});

  factory Student.fromStudent({required data})
  {
    return Student(
      name : data['name'],
      age : data['age'],
      salary : data['salary'],
    );
  }
}

List list = [
  {'name' : "Ankit", 'age' : 18, 'salary' :15000},
  {'name' : "Praful", 'age' : 17, 'salary' :19000},
  {'name' : "Om", 'age' : 19, 'salary' : 10000},
];

List store = [];

void main()
{
  for(int i=0; i<list.length; i++)
  {
    Student s1 = Student.fromStudent(data: list[i]);
    store.add(s1);
  }

  for(int i=0; i<store.length; i++)
  {
    print("Name :${store[i].name}");
    print("Age :${store[i].age}");
    print("Salary :${store[i].salary}\n");
  }
}


# What is Model Class ?

- The "model class" in Dart generally used to a class that represents a data structure within an application.

## Example
bash
import 'package:flutter/material.dart';

GlobalKey<FormState> formkey = GlobalKey();
TextEditingController txtName = TextEditingController();
TextEditingController txtCategory = TextEditingController();
TextEditingController txtPrice = TextEditingController();

var c1 = txtName.clear();
var c2 = txtCategory.clear();
var c3 = txtPrice.clear();

class InvoiceGenerator extends StatefulWidget {
  const InvoiceGenerator({super.key});

  @override
  State<InvoiceGenerator> createState() => _InvoiceGeneratorState();
}

class _InvoiceGeneratorState extends State<InvoiceGenerator> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(
                invoiceList.length,
                (index) => GestureDetector(
                      onTap: () {
                        SelectedIndex = index;
                        Navigator.of(context).pushNamed('/DetailsPage');
                      },
                      child: ListTile(
                        title: Text(
                          '${invoiceList[index].name}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        subtitle: Text('${invoiceList[index].category}',
                            style: const TextStyle(fontSize: 18)),
                        trailing: Text('${invoiceList[index].prise}',
                            style: const TextStyle(fontSize: 18)),
                      ),
                    )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        title: const Text('Add Details'),
                        titlePadding: const EdgeInsets.only(left: 18, top: 12),
                        content: Form(
                          key: formkey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: txtName,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field Must Be Required';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      label: const Text('Name')),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 20, top: 20),
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: txtCategory,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Field Must Be Required';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      label: const Text('Category'),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: txtPrice,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field Must Be Required';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      label: const Text('Price')),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                if (formkey.currentState!.validate()) {
                                  invoiceList.add(
                                    InvoiceModel(
                                      name: txtName.text,
                                      category: txtCategory.text,
                                      prise: txtPrice.text,
                                    ),
                                  );
                                  Navigator.of(context).pop();
                                  txtName.clear();
                                  txtCategory.clear();
                                  txtPrice.clear();
                                }
                              });
                            },
                            child: const Text(
                              'OK',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ),
                        ],
                      );
                    });
              });
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}

int? SelectedIndex;

List<InvoiceModel> invoiceList = [];

class InvoiceModel {
  String? name, category, prise;

  InvoiceModel({this.name, this.category, this.prise});
}
