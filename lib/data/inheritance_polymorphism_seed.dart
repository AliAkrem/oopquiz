final inheritanceAndPolymorphism = [
  {
    "quiz_id": 11,
    "quiz_tag": "2.1",
    "question_content":
        '''**indicate whether this code compiles and, if it doesn't, what error(s) the compiler.**\n```java\ninterface I {\npublic int getI();\n}   \nabstract class C implements I {\nint i;\nC(int i) {\nthis.i = i;\n}\n}\nclass D extends C implements I {\nD(int x) {\nsuper(x);\n}\npublic int getI() {\nreturn this.i;\n}\n}\n```''',
    "answers": [
      "Compilation error: class D must implement getI() from interface I.",
      "Compilation error: I cannot be implemented by abstract class C.",
      "Compilation error: m2 is not a method of class A.", // correct answer
      "No compilation errors, the program runs successfully."
    ],
    "details":
        "the first two instructions result in a compilation error (m2 is not a not a method of class A) and the third causes no error.",
    "correct_answer": 2,
  },
  {
    "quiz_id": 12,
    "quiz_tag": "2.2",
    "question_content":
        '''**indicate which display will be produced by running the Test class.**\n```java\npublic class Toto {\nint x;\nToto(int k) {\nx = k;\n}\nint ajoute(int a) {\nreturn x+a;\n}\npublic void moi() {\nSystem.out.println(" x = "+ x);\n}\n}\npublic class Titi extends Toto {\nint y;\nTiti(int k, int l) {\nsuper(k);\ny = l;\n}\nint ajoute(int a) {\nreturn x+2*a;\n}\n}\npublic class Tutu extends Titi {\nint z;\nTutu(int k, int l, int m) {\nsuper(k, l);\nz = m;\n}\nint ajoute(int a) {\nreturn x+3*a;\n}\npublic void moi() {\nsuper.moi();\nSystem.out.println(" z = "+ z);\n}\n}\npublic class Essai {\npublic static void main (String coucou[]) {\nint a = 2;\nToto p = new Toto(3);\np.moi();\nSystem.out.println(" ajoute("+ a +") = "+ p.ajoute(a));\nTiti e1 = new Titi(3, 4);\ne1.moi();\nSystem.out.println(" ajoute("+ a +") = "+ e1.ajoute(a));\ne1 = new Tutu(3, 4, 5);\ne1.moi();\nSystem.out.println(" ajoute("+ a +") = "+ e1.ajoute(a));\n}\n}\n```''',
    "answers": [
      "x=3 ajoute(2) = 5 x=3 ajoute(2) = 8 x=3 z=5 ajoute(2) = 10",
      "x=3 ajoute(2) = 5 x=3 ajoute(2) = 7 x=3 z=5 ajoute(2) = 9", // correct answer
      "x=3 ajoute(2) = 6 x=3 ajoute(2) = 7 x=3 z=5 ajoute(2) = 9",
      "x=3 ajoute(2) = 5 x=3 ajoute(2) = 6 x=3 z=5 ajoute(2) = 10"
    ],
    "details": " x=3 ajoute(2) = 5 x=3 ajoute(2) = 7 x=3 z=5 ajoute(2) = 9",
    "correct_answer": 1
  },
  {
    "quiz_id": 13,
    "quiz_tag": "2.3",
    "question_content":
        '''**indicate whether the program compiles and, if so, which display it leads to.**\n```java\nclass Toto {\nint i,j;\nToto(int i) {\nthis.i = i;\nthis.j = i;\n}\n}\nclass Titi extends Toto {\nint k;\nTiti(int i) {\nsuper(i);\nthis.i = i+super.i;\nthis.k = this.j+2;\n}\npublic static void main(String[] truc){\nToto t = new Titi(1);\nSystem.out.println(t.i);\nSystem.out.println(t.j);\nSystem.out.println(t.k);\n}\n}\n```''',
    "answers": [
      "Program does not compile (t.k unknown)", // correct answer
      "Program runs successfully and prints: 2 1 3",
      "Compilation error: this.i cannot be assigned.",
      "Program runs successfully and prints: 1 1 3"
    ],
    "details": "Program does not compile (t.k unknown)",
    "correct_answer": 0
  },
  {
    "quiz_id": 14,
    "quiz_tag": "2.4",
    "question_content":
        '''**indicate whether the program compiles and, if so, which display it leads to.**\n```java\nclass Toto {\nint i,j;\nToto(int i) {\nthis.i = i;\nthis.j = i;\n}\n}\nclass Titi extends Toto {\nint k;\nTiti(int i) {\nsuper(i);\nthis.i = i+super.i;\nthis.k = this.j+2;\n}\npublic static void main(String[] truc){\nTiti t = new Titi(1);\nSystem.out.println(t.i);\nSystem.out.println(t.j);\nSystem.out.println(t.k);\n}\n}\n```''',
    "answers": [
      "The program compiles and displays: 1, 1, 3",
      "Compilation error: super(i) cannot be called from subclass.",
      "The program compiles and displays: 2, 1, 3", // correct answer
      "The program compiles and displays: 2, 1, 2"
    ],
    "details": "the program compiles and displays 2,1,3 ",
    "correct_answer": 2
  },
  {
    "quiz_id": 15,
    "quiz_tag": "2.5",
    "question_content":
        '''**indicate whether the program compiles and, if so, which display it leads to.**\n```java\nclass Toto {\nint i,j;\nToto(int i) {\nthis.i = i;\nthis.j = i;\n}\n}\nclass Titi extends Toto {\nint k;\nTiti(int i) {\nsuper(i);\nthis.i = i+super.i;\nthis.k = this.j+2;\n}\npublic static void main(String[] truc){\nTiti t = (Toto) new Titi(1);\nSystem.out.println(t.i);\nSystem.out.println(t.j);\nSystem.out.println(t.k);\n}\n}\n```''',
    "answers": [
      "The program compiles and displays: 2, 1, 3",
      "Compilation error: Incompatible types: Toto cannot be cast to Titi.",
      "The program compiles and displays: 1, 1, 3",
      "Compilation error: Toto is not a kind of Tweety, assignment impossible", // correct answer
    ],
    "details":
        "the program doesn't compile (Toto is not a kind of Tweety, assignment impossible) ",
    "correct_answer": 3
  },
  {
    "quiz_id": 16,
    "quiz_tag": "2.6",
    "question_content":
        '''**indicate whether the program compiles and, if so, which display it leads to.**\n```java\nclass Toto {\nint i,j;\nToto(int i) {\nthis.i = i;\nthis.j = i;\n}\n}\nclass Titi extends Toto {\nint k;\nTiti(int i) {\nsuper(i);\nthis.i = i+super.i;\nthis.k = this.j+2;\n}\npublic static void main(String[] truc){\nTiti t = new Titi(1);\nSystem.out.println(t.i);\nSystem.out.println(t.j);\nSystem.out.println(t.k);\n}\n}\n```''',
    "answers": [
      "The program compiles and displays: 2, 1, 3", // correct answer
      "The program compiles and displays: 1, 1, 3",
      "The program doesn't compile due to an invalid constructor call.",
      "The program compiles and displays: 3, 1, 2"
    ],
    "details": "the program compiles and displays 2,1,3",
    "correct_answer": 0
  },
  {
    "quiz_id": 17,
    "quiz_tag": "2.7",
    "question_content":
        '''**indicate whether the program compiles and, if so, which display it leads to.**\n```java \nclass A{\nB b;\nvoid addB(B b){\nthis.b = b;\n}\nint m(){\nif(this.b != null) return -1 + this.b.m(); else return 0;\n}\n}\nclass B extends A{\nint i = 1;\nint m(){\ni = this.i+1;\nreturn this.i;\n}\n}\npublic static void main(String[] truc){\nA a = new A();\nB b = new B();\na.addB(b);\nSystem.out.println(a.m());\nSystem.out.println(b.m());\n}\n```''',
    "answers": [
      "The program compiles and displays: 0, 2",
      "Compilation error due to incompatible types in method addB.",
      "The program compiles and displays: 1, 3", // correct answer
      "The program compiles and displays: 1, 2"
    ],
    "details": "compiles and displays 1.3 ;",
    "correct_answer": 2
  },
  {
    "quiz_tag": "2.8",
    "quiz_id": 18,
    "question_content":
        '''**indicate whether the program compiles and, if so, which display it leads to.**\n```java \nclass A{\nB b;\nvoid addB(B b){\nthis.b = b;\n}\nint m(){\nif(this.b != null) return -1 + this.b.m(); else return 0;\n}\n}\nclass B extends A{\nint i = 1;\nint m(){\ni = this.i+1;\nreturn this.i;\n}\n}\npublic static void main(String[] truc){\nA a = new A();\na.addB(new B());\nSystem.out.println(a.b.m());\nSystem.out.println(((A) a.b).m());\n}\n```''',
    "answers": [
      "The program compiles and displays: 2, 3", // correct answer
      "The program compiles and displays: 1, 3",
      "Compilation error due to incompatible types in method addB.",
      "The program compiles and displays: 1, 2"
    ],
    "details": "compiles and displays 2,3 ; ",
    "correct_answer": 0
  },
  {
    "quiz_tag": "2.9",
    "quiz_id": 19,
    "question_content":
        '''**indicate whether the program compiles and, if so, which display it leads to.**\n```java \nclass A{\nB b;\nvoid addB(B b){\nthis.b = b;\n}\nint m(){\nif(this.b != null) return -1 + this.b.m(); else return 0;\n}\n}\nclass B extends A{\nint i = 1;\nint m(){\ni = this.i+1;\nreturn this.i;\n}\n}\npublic static void main(String[] truc){\nA x = new B();\nA y = new A();\nB z = new B();\nx.addB(z);\nSystem.out.println(x.m());\nSystem.out.println(y.m());\n}\n```''',
    "answers": [
      "The program compiles and displays: 1, 0",
      "The program compiles and displays: 2, 0", // correct answer
      "Compilation error due to incompatible types in method addB.",
      "The program compiles and displays: 1, 1"
    ],
    "details": "compiles and displays 2,0",
    "correct_answer": 1
  },
  {
    "quiz_tag": "2.10",
    "quiz_id": 20,
    "question_content":
        '''**Does the following code compile? If not, indicate the errors displayed by the compiler and suggest corrections. What display does running the program (possibly corrected) lead to?**\n```java\nclass B{\nint i = 5;\nB(){ this.i = this.i-1; }\nB(int i){ this(); this.i = i; }\n}\nclass C extends B{\nC(int i){ this.i = i; }\npublic static void main(String[] argggghhhh){\nB b = new B(2);\nC c = new C(1);\nSystem.out.println(b.i + " " + c.i);\n}\n}\n```''',
    "answers": [
      "The code compiles and displays: 2, 1", // correct answer
      "The code compiles and displays: 1, 1",
      "Compilation error due to incorrect constructor chaining.",
      "The code compiles and displays: 5, 1"
    ],
    "details": 'the code compiles and displays 2.1',
    "correct_answer": 0
  },
  {
    "quiz_tag": "2.11",
    "quiz_id": 21,
    "question_content":
        '''**What display does running the following program produce?**\n```java\nclass A{\nA a;\nA(){ this.a = this; }\nA(A a){ this.a = a; }\nvoid m(){\nif(this == this.a) System.out.println("Ahah!");\nelse System.out.println("Héhé!");\n}\n}\nclass B extends A{\nB o;\nB(){ super(); this.a = this; this.o = (B) this; }\nvoid m(){ System.out.println("Ohoh!"); }\npublic static void main(String[] toto){\nA u = new A();\nA i = new A(u);\nA b = new B();\nu.m();\ni.m();\nb.m();\n((B) b).o.m();\n}\n}\n```''',
    "answers": [
      "Displays: Héhé!, Ahah!, Ohoh!, Ahah!",
      "Displays: Ahah!, Héhé!, Ahah!, Ohoh!",
      "Displays: Ahah!, Héhé!, Ohoh!, Ohoh!", // correct answer
      "Displays: Ohoh!, Ohoh!, Héhé!, Ahah!"
    ],
    "details": 'displays : Ahah, Héhé, Ohoh, Ohoh.',
    "correct_answer": 2
  },
  {
    "quiz_tag": "2.12",
    "quiz_id": 22,
    "question_content":
        '''**le code suivant compile t-il? Si non, indiquez les erreurs, si oui, indiquez à quel affichage conduit l'exécution du programme (les classes sont supposées être écrites dans des fichiers séparés).**\n```java\nclass A {\nString f(B obj) { return ("A et B"); }\nString f(A obj) { return ("A et A"); }\n}\nclass B extends A {\nString f(B obj) { return ("B et B"); }\nString f(A obj) { return ("B et A"); }\n}\nclass Test {\npublic static void main (String [] args) {\nA a1 = new A();\nA a2 = new B();\nB b = new B();\nSystem.out.println(a1.f(a1));\nSystem.out.println(a1.f(a2));\nSystem.out.println(a2.f(a1));\nSystem.out.println(a2.f(a2));\nSystem.out.println(a2.f(b));\nSystem.out.println(b.f(a2));\n}\n}\n```''',
    "answers": [
      "The code compiles and displays: \"A et A\", \"A et A\", \"B et B\", \"B et A\", \"B et B\", \"A et A\"",
      "The code compiles and displays: \"A et A\", \"B et A\", \"B et A\", \"B et B\", \"B et B\", \"B et A\"",
      "The code does not compile due to method overloading issues."
          "The code compiles and displays: \"A et A\", \"A et A\", \"B et A\", \"B et A\", \"B et B\", \"B et A\"", // correct answer
    ],
    "details":
        'the code compiles, it displays "A and A", "A and A", "B and A", "B and A", "B and B" and "B and A".',
    "correct_answer": 3
  },
  {
    "quiz_tag": "2.13",
    "quiz_id": 23,
    "question_content":
        '''**Does the following code compile? If not, indicate the errors displayed by the compiler and suggest corrections. What display does execution of the (possibly corrected) program lead to?**\n```java\nclass A extends Object{\nint i;\nA(int i){ this.i = i; }\n}\nclass B extends A{\nA bidule;\nint i = 2;\nB(){ this.bidule = this; }\nB(A a){\nsuper(3);\nthis.bidule = a;\n}\npublic static void main(String[] toto){\nA a2 = new A(5);\nB b1 = new B(a2);\nB b2 = new B();\nSystem.out.println(b1.i);\nSystem.out.println(((A) b1).i);\nSystem.out.println(b1.bidule.i);\nSystem.out.println(b2.i);\nSystem.out.println(((A) b2).i);\nSystem.out.println(b2.bidule.i);\n}\n}\n```
''',
    "answers": [
      "The code compiles and displays: 0, 0, 0, 2, 0, 2",
      "The code compiles and displays: 2, 3, 5, 2, 1, 1",
      "The code compiles and displays: 2, 5, 2, 2, 0, 2"
          "Compilation error",
    ],
    "details":
        '''the code won't compile because it needs a parameter-free constructor in A (so that the
B's parameter-free constructor to automatically call the parameter-free super-constructor.
super-constructor). We can add the following constructor to A: A(){ this.i=1;} . In this case, program execution
program produces the display: 2, 3, 5, 2, 1, 1''',
    "correct_answer": 1
  },
  {
    "quiz_tag": "2.14",
    "quiz_id": 24,
    "question_content":
        '''**Does the following code compile? If not, indicate the errors displayed by the compiler and suggest corrections. What display does execution of the (possibly corrected) program lead to?**\n```java\nclass Question{\nString enonce;\nint difficulte=50; // difficulty ranges from 0 to 100\nQuestion(String e){\nthis.enonce = e;\n}\nvoid setDifficulte(int d){\nthis.difficulte = d;\n}\nint getDifficulte(){\nreturn this.difficulte;\n}\nString getEnonce(){\nreturn this.enonce;\n}\n}\n```''',
    "answers": [
      "The program compiles and displays: 0, 0, 0, A, B",
      "The program compiles and displays: 50, 0, 0, A, B",
      "The program compiles and displays: 2, 0, 0, B, A", // correct answer
      "Compilation error due to missing constructors."
    ],
    "details": 'the code compiles and displays 2,0,0,B,A ',
    "correct_answer": 2
  },
];
