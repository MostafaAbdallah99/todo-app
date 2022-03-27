# Todo Project

A todo project created in flutter using Firestore and Provider.

## Todo Features:

* Task Screen
* CRUD Operations (Firestore)
* Provider (State Management)

### Libraries & Tools Used

* [Cloud Firestore]
* [UUID]
* [Provider](State Management)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure i have been using in this project

```
lib/
|- components/
|- models/
|- screens/
|- widgets/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- components - All the application level constants are defined in this directory with-in their respective file.
2- models - Contains the CRUD operations and task class.
3- screens - Contains all the ui of the project.
4- widgets — Contains the common widgets for the applications.
5- main.dart - This is the starting point of the application. All the application level configurations are defined in this file.
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file.

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_provider.dart';

import 'screens/task_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TaskScreen(),
      ),
    );
  }
}
```
