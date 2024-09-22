
class Tables {
  static String topicTableName = "topic";
  static String quizTableName = "quiz";


//?NOTE its static table 
  static String topicTable = '''
  CREATE TABLE IF NOT EXISTS $topicTableName (
    topic_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    image_path TEXT NOT NULL
 );
''';


//?NOTE all table is static "solved" column only is dynamic
  static String quizTable = '''
  CREATE TABLE IF NOT EXISTS $quizTableName (
     quiz_id INTEGER PRIMARY KEY AUTOINCREMENT,
     quiz_tag TEXT NOT NULL , 
     question_content TEXT NOT NULL,
     answers TEXT NOT NULL,
     correct_answer INTEGER NOT NULL,
     topic_id INTEGER NOT NULL,
     details TEXT NOT NULL,
     solved INTEGER DEFAULT 0
 );
''';

  //# SEEDS

  static String topicSeed = '''
    INSERT INTO $topicTableName ( name, description, image_path) VALUES
      ( '1', 'Modularity(Object and Class)',   'Modularity is the practice of dividing a program into separate, independent modules that can be developed and tested individually.',  'modularity.png'),
      ( '2', 'Inheritance and Polymorphism', 'Inheritance allows one class to inherit properties and behaviors (methods) from another class, Where Polymorphism allows objects of different classes to be treated as objects of a common parent class. A method can behave differently based on the object it is acting on.',  'h_and_P.png'),
      ( '3', 'Abstraction' , 'Abstraction is the concept of hiding the complex implementation details and showing only the necessary features of an object.' , 'abstraction.png'), 
      ( '4', 'Encapsulation' , 'Encapsulation is the bundling of data (attributes) and methods (functions) that operate on the data into a single unit or class, with controlled access.' , 'encapsulation.png'),
      ( '5', 'More Projects' , 'Advanced exercises combining several OOP concepts into larger, more complex scenarios like graphs, chemistry labs, and fantasy-based themes like "The Lord of the Rings" and "Star Wars."', 'more_projects.png')
  ''';



//   static String quizSeed = '''
//   INSERT INTO $quizTableName (quiz_tag, question_content, answers, correct_answer, topic_id, details) VALUES

//     ('1.1', '${modularity[0]['content']!.replaceAll("'", "''")}', '["11", "10", "4", "3"]', 0, 1, 'The typeof operator is used to determine the type of a variable or expression.'),
//     ('1.2', '${modularity[1]['content'].replaceAll("'", "''")}', '["true", "false", "undefined", "NaN"]', 1, 1, 'Floating-point math can have precision issues. 0.1 + 0.2 is not exactly 0.3.'),
//     ('1.3', '${modularity[2]['content'].replaceAll("'", "''")}', '["1", "2", "0", "undefined"]', 1, 1, 'Object.keys(obj).length counts the number of enumerable properties in the object.'),
//     ('1.4', '${modularity[3]['content'].replaceAll("'", "''")}', '["true, false", "false, true", "false, false", "true, true"]', 0, 1, '== compares values without considering types, but === compares both value and type.'),
//     ('1.5', '${modularity[4]['content'].replaceAll("'", "''")}', '["5", "undefined", "null", "NaN"]', 0, 1, 'The ?? operator returns the right-hand operand when the left-hand operand is null or undefined.'),
//     ('1.6', '${modularity[5]['content'].replaceAll("'", "''")}', '["1, 2", "2, 1", "1, 1", "2, 2"]', 1, 1, 'Variables declared inside a block (using const or let) are limited to that block scope.'),
//     ('1.7', '${modularity[6]['content'].replaceAll("'", "''")}', '["6, 11", "5, 11", "6, 10", "5, 10"]', 2, 1, 'The IIFE has its own scope, so the outer variable is not modified.'),
//     ('1.8', '${modularity[7]['content'].replaceAll("'", "''")}', '["10", "5", "undefined", "ReferenceError"]', 2, 1, 'Variables declared with let are hoisted but not initialized, leading to a temporal dead zone.'),
//     ('1.9', '${modularity[8]['content'].replaceAll("'", "''")}', '["", "[object Object]", "[]", "undefined"]', 0, 1, 'Adding arrays and objects can result in unexpected coercion to strings.'),
//     ('1.9', '${modularity[9]['content'].replaceAll("'", "''")}', '["undefined", "null", "1", "Error"]', 0, 1, 'Setting the length of an array to 0 removes all its elements.');
// ''';
}
