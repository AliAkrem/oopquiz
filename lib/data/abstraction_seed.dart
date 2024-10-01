final abstraction = [
  {
    "quiz_id": 25,
    "quiz_tag": "3.1",
    "question_content":
        '''**Does the following code compile? If not, indicate the errors (classes are supposed to be written in separate files).**\n```java\nabstract class Machin{\nint i = 1;\nstatic int j = 3;\nvoid bidule();\n\nMachin(){\ni = 4;\nthis.j = 5;\n}\n}\nclass Bidule extends Machin{\nvoid bidule(Machin m){\nSystem.out.println("Chose");\n}\n}\n```''',
    "answers": [
      "The program compiles successfully but throws a runtime error.",
      "Compilation error: bidule() method is not concretized.", // correct answer
      "Compilation error: Cannot modify static variable j in constructor.",
      "The program compiles and displays: Chose."
    ],
    "details":
        "in class Machin, line 4, the method must be declared abstract. In the Bidule class, the bidule() method is not concretized (and the class is not abstract).",
    "correct_answer": 1,
  },
  {
    "quiz_id": 26,
    "quiz_tag": "3.2",
    "question_content":
        '''**Does the following code compile, and if not, why not?**\n```java\nclass Machin {\nint i = 1;\nstatic int j = 3;\nstatic { j = 2; }\nMachin() {\ni = 4;\nj = 5;\n}\n}\n```''',
    "answers": [
      "The code compiles without a hitch.", // correct answer
      "Compilation error due to invalid static initializer.",
      "The code compiles but throws a runtime error.",
      "The code compiles and displays: 1, 5."
    ],
    "details": "the code compiles without a hitch.",
    "correct_answer": 0
  },
  {
    "quiz_id": 27,
    "quiz_tag": "3.3",
    "question_content":
        '''**Does the following code compile? If not, what are the errors?**\n```java\nclass C{\ninterface I{\nint i;\npublic void m();\n}\nclass D implements I{\npublic int m(){\nSystem.out.println("Je suis un D");\n}\n}\nabstract class E implements I{\npublic void m(){\nSystem.out.println("Je suis un E");\n}\n}\n}\n```''',
    "answers": [
      "The code compiles successfully and prints: Je suis un D.",
      "Compilation error: Line 7, the method must not return a value.",
      "The code compiles but does not print anything.",
      "Compilation error: Line 3, 'i' must be initialized. Line 7, the method must not return a value.", // correct answer
    ],
    "details":
        "3rd line, initialize i, which is a constant (cannot be modified). 7th line, the method must return nothing",
    "correct_answer": 3
  },
  {
    "quiz_id": 28,
    "quiz_tag": "3.4",
    "question_content":
        '''***Does the following code compile? If not, indicate the errors. The CaRentrePasException class is assumed to exist.**\n```java\nclass MorceauDeGruyere{\nprivate int poids;\npublic MorceauDeGruyere(int p){this.poids = p;}\nprivate interface Trou{\n// this method fills the hole with Gruyère cheese\npublic void remplir(MorceauDeGruyere o) throws CaRentrePasException;\n}\npublic class TrouCarre implements Trou{\nprivate int largeur, hauteur, profondeur;\nprivate TrancheDeGruyere mg;\npublic TrouCarre(int l, int h, int p){\nthis.largeur = l; this.hauteur = h; this.profondeur = p;\n}\npublic void remplir(MorceauDeGruyere o) throws CaRentrePasException{\nif(o instanceof TrancheDeGruyere){\nTrancheDeGruyere tg = (TrancheDeGruyere) o;\nif(tg.getL() <= this.largeur && tg.getH() <= this.hauteur && tg.getP() <= this.profondeur)\nthis.mg = tg;\nelse throw new CaRentrePasException();\n}\nelse throw new CaRentrePasException();\n}\n}\nclass TrancheDeGruyere extends MorceauDeGruyere{\nprivate int largeur, hauteur, profondeur;\npublic int getL(){return this.largeur;}\npublic int getH(){return this.hauteur;}\npublic int getP(){return this.profondeur;}\npublic TrancheDeGruyere(int p, int l, int h, int pr){\nsuper(p);this.largeur = l; this.hauteur = h;\nthis.profondeur = pr;\n}\n}\n}\n```''',
    "answers": [
      "Compilation error due to the missing exception declaration in the MorceauDeGruyere class.",
      "The code compiles without a hitch.", // correct answer
      "Compilation error because the Trou interface cannot have a method with a non-void return type.",
      "The code compiles but throws a runtime error when filling the hole."
    ],
    "details": "the code compiles without a hitch.",
    "correct_answer": 1
  },
  {
    "quiz_id": 29,
    "quiz_tag": "3.5",
    "question_content":
        '''**Does the following code compile? If not, indicate the errors. If necessary, suggest corrections and indicate what the display will look like at runtime once these corrections have been made.**\n```java\ninterface Titi{\nint m1();\n}\ninterface Tutu extends Titi{\nint m1();\nint m2();\n}\nabstract class Toto extends Object implements Tutu{\nprivate int i;\npublic Toto(int j){\nsuper();\nthis.i = j;\n}\npublic static void main(String[] toto){\nTete t = new Toto();\nSystem.out.println(t.m1());\nSystem.out.println(t.m2());\n}\n}\nclass Tete extends Toto{\nprivate int i;\npublic Tete(){\nsuper();\nthis.i = 2;\n}\npublic int m1(){return this.i;}\npublic int m2(){return super.i;}\n}\n```''',
    "answers": [
      "The code compiles and displays 2, 1.",
      "Line 23 has a compilation error due to the absence of a default constructor in Titi.",
      "compiles error", // correct answer
      "The code compiles, but at runtime, it throws a NullPointerException."
    ],
    "details":
        "line 15, Toto is an abstract class and therefore not instantiable. Line 23, there is no super constructor without parameters in Toto. Line 27, Toto's i is private, so invisible here Once corrected, the display is 2, 1.",
    "correct_answer": 2
  }
];
