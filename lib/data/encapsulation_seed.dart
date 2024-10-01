final encapsulation = [
  {
    "quiz_id": 30,
    "quiz_tag": "4.1",
    "question_content":
        '''**indicate whether this code compiles and, if not, which error(s) the compiler will display.**\n```java\npackage p;\ninterface I {\npublic int getI();\n}\npackage q;\nabstract class C implements I {\nprivate int i;\nC(int i) {\nthis.i = i;\n}\n}\npackage q;\nabstract class D extends C {\nD(int x) {\nsuper(x);\nthis.i = 0;\n}\n}\n```''',
    "answers": [
      "I interface is invisible outside its package, and i is inaccessible in D.", // correct answer
      "The code compiles and runs without errors.",
      "The i attribute should be public for proper access in class D.",
      "The I interface must be marked as private to prevent implementation in C."
    ],
    "details":
        " the I interface is invisible outside its package and therefore cannot be implemented by the C class. The i attribute is invisible outside its class and cannot be accessed in class D. ",
    "correct_answer": 0,
  },
  {
    "quiz_id": 31,
    "quiz_tag": "4.2",
    "question_content":
        '''**do these classes compile and, if not, what error(s) will the compiler indicate?**\n```java\npublic class A {\npublic int i;\nprivate int a;\nprotected int b;\npublic void afficher() {\nSystem.out.println(i+a+b);\n}\n}\npublic class B extends A {\npublic void afficher() {\nSystem.out.println(i+a+b);\n}\n}class D {\npublic A a = new A();\npublic void afficher() {\nSystem.out.println(a.i+a.a+a.b);\n}\n}\npublic class E {\npublic B b = new B();\npublic void afficher() {\nb.afficher();\n}\n}\npublic class F {\npublic B b = new B();\npublic void afficher() {\nSystem.out.println(b.i+b.a+b.b);\n}\n}\n```''',
    "answers": [
      "The code compiles and runs without any issues.",
      "There is an access modifier issue with the attribute i in class A.",
      "In classes B, D, and F, the attribute a is not accessible because it is private in class A.", // correct answer
      "The afficher method in class D compiles without issues, but the private attribute causes a runtime error."
    ],
    "details":
        "in class B, attribute a is not accessible because it is private in A. In class D, 4th line, attribute a is private in A, and therefore not accessible. In class F, 4th line, the attribute a is private in A, and therefore not accessible.",
    "correct_answer": 2
  },
  {
    "quiz_id": 32,
    "quiz_tag": "4.3",
    "question_content":
        '''**Indicate which lines of the main method are incorrect.**\n```java\npackage toto;\npublic class C {\npublic C tutu;\nprivate int i = 0;\nint j = 1;\nstatic protected int k = 2;\n}\npackage toto.titi;\npublic class Test extends toto.C {\npublic static void main(String[] t) {\ntoto.C m = new toto.C();\nm.tutu = m;\nm.tutu.i = 4;\nm.j = 5;\nm.tutu.k = 6;\n}\n}\n```''',
    "answers": [
      "The code compiles and runs correctly.",
      "Line 15 causes an error because `k` is static and cannot be modified.",
      "`i` is private and `j` is package-private and not accessible outside the `toto` package.", // correct answer
      "The issue is with line 12 where `tutu` is assigned incorrectly."
    ],
    "details":
        " the 13th and 14th lines are incorrect (i is not visible outside C and j is not visible outside the C package).",
    "correct_answer": 2
  },
  {
    "quiz_id": 33,
    "quiz_tag": "4.4",
    "question_content":
        '''**indicate which lines of the following program are incorrect.**\n```java\npackage plante;\ninterface Plante{\ndouble getDureeVie();\nint getTaille();\n}\npackage plante;\npublic class Paquerette implements Plante{\nstatic int petales=20;\ndouble getDureeVie(){return Double.POSITIVE_INFINITY;}\npublic int getTaille(){return 15;}\n}\npackage toto;\npublic class Test{\npublic static void main(String[] t){\nSystem.out.println(plante.Paquerette.petales);\n}\n}\n```''',
    "answers": [
      "The code compiles and runs, but the output is incorrect.",
      "Line 17 causes an error due to an incorrect access modifier for the `petales` attribute.",
      "Line 10 causes a compilation error because the method `getDureeVie` is not abstract."
          "Line 10: The method `getDureeVie` must be public, and line 17: the `petales` attribute cannot be accessed outside its package.", // correct answer
    ],
    "details":
        " 10th line the method must be public, 17th line the petales attribute cannot be accessed.",
    "correct_answer": 3
  },
  {
    "quiz_id": 34,
    "quiz_tag": "4.5",
    "question_content":
        '''**Do the following three classes compile? If not, indicate the errors. We assume that the classes are defined in correctly stored files (A and B are in files A.java and B.java in directory p1 and C in file C.java in directory p2).**\n```java\npackage p1;\nclass A{\nprotected int i;\nprivate int j;\npublic void m(){System.out.println("Somme : "+(i+j));}\n}\npackage p1;\nclass B extends A{\npublic void m(){System.out.println("Produit : "+(i*j));}\n}\npackage p2;\nimport p1.B;\nclass C extends B {\nprotected void m(){System.out.println("Carré : "+(i*i));}\n}\n```''',
    "answers": [
      "The code compiles and displays the results for the methods.",
      "Line 8: `j` is not visible in class `B`. Lines 11-13: `B` is not visible in package `p2`, so neither is `i`.", // correct answer
      "Compilation fails because `j` is not accessible in `C`.",
      "The code compiles but throws a runtime exception."
    ],
    "details":
        " compilation errors. 8th line, j is not visible in B. Lines 11, 12 and 13, B is not visible in package p2, so neither is i.",
    "correct_answer": 1
  },
  {
    "quiz_id": 35,
    "quiz_tag": "4.6",
    "question_content":
        '''**the following classes are placed in different directories: B and C are in a p1 directory, A is in a p3 directory which is a sub-directory of p1 and D is in a p2 directory. Do the classes compile, and if not, what are the errors?**\n```java\npackage p1.p3;\npublic class A{\nprotected int i;\nint j;\nvoid m(){System.out.println("Je suis un A");}\n}\npackage p1;\nclass B extends p2.D{\nprivate int i=3;\nvoid m(){System.out.println("Je suis un B");}\n}\npackage p1;\nclass C extends p1.p3.A{\nstatic protected int i = 1;\n}\npackage p2;\npublic class D extends A{\nprotected void m(){System.out.println("Je suis un D");}\n}\n```''',
    "answers": [
      "The code compiles successfully without any issues.",
      "Compilation fails because `A` is not accessible in package `p2`.",
      "B's `m()` method must have visibility greater than or equal to that of `D`. In class `D`, add `import p1.p3.A;` or use the full name for `A`.", // correct answer
      "The code compiles but throws a runtime exception."
    ],
    "details":
        "compilation errors. B's m() method must have visibility greater than or equal to that of D. equal to that of D. In class D, add import p1.p3.A; to the file header, or name A with its full name.",
    "correct_answer": 2
  },
  {
    "quiz_id": 36,
    "quiz_tag": "4.7",
    "question_content":
        '''**the following classes are placed in different directories: a class D in a directory p2, three classes B, C and D in a directory p1 Do the classes compile? If not, indicate the errors displayed by the compiler and suggest corrections. What is the result of running the (possibly corrected) program?**\n```java\npackage p2;\npublic class D{\nprivate int i=2;\nprotected void m(){System.out.println("Je suis un D de p2");}\n}\npackage p1;\npublic class D{\nint i=3;\nprotected void m(){System.out.println("Je suis un D de p1");}\n}\npackage p1;\nimport p2.*;\nclass C extends D{\nstatic protected int i=1;\npublic void m(){super.m(); System.out.println("Je suis un C");}\npublic static void main(String[] toto){\nC c = new C(); B b = new B(); c.m(); b.m();\n}\n}\npackage p1;\nclass B extends p2.D{\nprivate int i=3;\npublic void m(){super.m(); System.out.println("Je suis un B");}\n}\n```''',
    "answers": [
      "Compilation fails due to name conflicts between classes in different packages.",
      "The code compiles but throws a runtime exception.",
      "The code compiles, but methods cannot be overridden across packages."
          "Classes compile successfully. The display is: \"Je suis un D de p1\", \"Je suis un C\", \"Je suis un D de p2\", \"Je suis un B\".", // correct answer
    ],
    "details":
        "classes compile. The display is: I am a D from p1 / I am a C / I am a D from am a D from p2 / I am a B",
    "correct_answer": 3
  },
  {
    "quiz_id": 37,
    "quiz_tag": "4.8",
    "question_content":
        '''**Does the following code compile? If not, indicate the errors. If necessary, suggest corrections and indicate what the display will look like at runtime once these corrections have been made.**\n```java\npublic class A{\nprotected int a = 1;\npublic A(){\nSystem.out.println("A");\n}\npublic void a(){\nSystem.out.println(a);\n}\n}\npublic interface C{\npublic final int a = 3;\npublic void a();}\npublic class B extends A implements C{\nprivate int a = 2;\npublic B(){\nSystem.out.println("B");\n}\npublic void a(){\nSystem.out.println(a);\n}\npublic static void main(String[] t){\nA o1 = new A();\nA o2 = new B();\nB o3 = new B();\nSystem.out.println(o1.a);\nSystem.out.println(o2.a);\nSystem.out.println(o3.a);\no1.a();\no2.a();\no3.a();\n}\n}\n```''',
    "answers": [
      "The code compiles and displays: \"A\", \"A\", \"B\", \"A\", \"B\", 1, 1, 2, 1, 2, 2.", // correct answer
      "The code fails to compile due to conflicting method names.",
      "The code compiles but throws a runtime exception.",
      "The variable 'a' in class B cannot access the variable 'a' in interface C."
    ],
    "details":
        "the code compiles and displays A, A, B, A, B, 1, 1, 2, 1, 2, 2.",
    "correct_answer": 0
  }
];
