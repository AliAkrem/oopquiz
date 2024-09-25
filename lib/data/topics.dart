import 'package:oopquiz/Models/quiz_model.dart';
import 'package:oopquiz/Models/topic_model.dart';
import 'package:oopquiz/data/modularity_seed.dart';

List<Topic> topics = [
  {
    "topic_id": 1,
    "name": 'Modularity(Object and Class)',
    "description":
        'Modularity is the practice of dividing a program into separate, independent modules that can be developed and tested individually.',
    "image_path": 'cube.png',
    "quizzes": modularity.map((e) => Quiz.fromJson(e)).toList(),
    
  },
  {
    "topic_id": 2,
    "name": 'Inheritance and Polymorphism',
    "description":
        'Inheritance allows one class to inherit properties and behaviors (methods) from another class, Where Polymorphism allows objects of different classes to be treated as objects of a common parent class. A method can behave differently based on the object it is acting on.',
    "image_path": 'h_and_p.png',
    // "quizzes": List<Quiz>.
  },
  {
    "topic_id": 3,
    "name": 'Abstraction',
    "description":
        'Abstraction is the concept of hiding the complex implementation details and showing only the necessary features of an object.',
    "image_path": 'layers.png',
    // "quizzes": List<Quiz>.empty
  },
  {
    "topic_id": 4,
    "name": 'Encapsulation',
    "description":
        'Encapsulation is the bundling of data (attributes) and methods (functions) that operate on the data into a single unit or class, with controlled access.',
    "image_path": 'capsule.png',
    // "quizzes": List<Quiz>.empty
  },
  {
    "topic_id": 5,
    "name": 'More Projects',
    "description":
        'Advanced exercises combining several OOP concepts into larger, more complex scenarios like graphs, chemistry labs, and fantasy-based themes like "The Lord of the Rings" and "Star Wars."',
    "image_path": 'app.png',
    // "quizzes": List<Quiz>.empty
  }
]
    .map(
      (e) => Topic.fromJson(e),
    )
    .toList();
