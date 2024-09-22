import 'package:uuid/uuid.dart';

var uuid = const Uuid();

final modularity = [
  {
    "quiz_id": uuid.v1(),
    "quiz_tag": "1.1",
    "question_content":
        '''**Does this code compile, and if not, what error(s) will the compiler indicate?**\n\n```ts\nclass Toto{\nint toto = 0;\nToto() {\ntoto = toto + 1;\n}\npublic static void main(String[] tutu) {\nToto t1 = new Toto();\nToto\nt2 = new Toto();\nSystem.out.println("Toto : " + toto);\n}\n}\n```''',
    "answers": [
      "Compilation error.",
      'Output: "Toto: 2".',
      'Output: "Toto: 0".',
      'Output: "Toto: 1".'
    ],
    "details":
        "The code does not compile because the variable toto is not static and must therefore be accessed via an object (for example, t1.toto )",
    "correct_answer": 0,
  },
  {
    "quiz_tag": "1.2",
    "quiz_id": uuid.v1(),
    "question_content":
        '''**Does the following code compile? If not, indicate the errors displayed by the compiler and propose corrections. What output does the execution of the (potentially corrected) program produce?**\n```ts\nclass Test {\nint i;\nTest(int i) {\nthis.i = 12;\ni = 15;\n}\nvoid i() {\nTest i = new Test(3);\nSystem.out.println(i.i);\ni.i();\n}\npublic static void main(String[] toto) {\nTest i = new Test(34);\ni.i();\n}\n}\n```''',
    "answers": [
      "Output: 3",
      "Output: 12, 12, 12 ...",
      "Output: 15, 15, 15 ...",
      "Compilation error."
    ],
    "details":
        "The code compiles, it displays 12, 12, 12 ... and eventually crashes due to infinite recursion.",
    "correct_answer": 1
  },
  {
    "quiz_id": uuid.v1(),
    "quiz_tag": "1.3",
    "question_content":
        '''**Does the following code compile? If not, indicate the errors displayed by the compiler and propose corrections. What output does the (potentially corrected) program produce?**\n```ts\nclass Exo2 {\nExo2 e;\nExo2(Exo2 e) {\nthis = e;\n}\nExo2() {\nthis.e = this;\n}\npublic String toString() {\nif(this.e == null) return "NULL";\nelse return "LLUN";\n}\nExo2 m1() {\nSystem.out.println("Bonjour le monde");\nreturn this;\n}\nvoid m2(Exo2 e) {\nthis.e = null;\nthis.m1();\ne.e = this;\nSystem.out.println(this);\n}\npublic static void main(String[] truc) {\nnew Exo2();\nExo2 e = new Exo2();\ne.m2(e);\nExo2 f = new Exo2(e);\ne.m2(f);\n}\n}\n''',
    "answers": [
      "Compilation error.",
      "Output: Bonjour le monde, LLUN, Bonjour le monde, NULL.",
      "Output: Bonjour le monde, NULL, Bonjour le monde, LLUN.",
      "Output: Bonjour le monde, NULL, Bonjour le monde, NULL."
    ],
    "details":
        "The code compiles, it displays Bonjour le monde, LLUN, Bonjour le monde, NULL.",
    "correct_answer": 1
  },
  {
    "quiz_id": uuid.v1(),
    "quiz_tag": "1.4",
    "question_content":
        '''**Does the following code compile? If not, indicate the errors displayed by the compiler and propose corrections. What output does the (potentially corrected) program produce?**\n```ts\nclass Test {\nint i;\nTest(Test t) {\nif(t == null) this.i = 12;\nelse{\nt.m();\nthis.i = t.i;\n}\n}\nvoid m() {\nthis.i++;\nSystem.out.println(this.i);\n}\npublic static void main(String[] toto) {\nTest i = new Test(new Test(new Test(null)));\n}\n}''',
    "answers": [
      "Output: 13, 14",
      "Output: 12, 13",
      "Output: 14, 13",
      "Compilation error."
    ],
    "details": "The code compiles, it displays  13,14.",
    "correct_answer": 0
  },
  {
    "quiz_id": uuid.v1(),
    "quiz_tag": "1.5",
    "question_content":
        '''**Does the following code compile? If not, indicate the errors displayed by the compiler and propose corrections. What output does the (potentially corrected) program produce?**\n```ts\nclass C1{\nC2 c;\nint i;\nC1(int i, C2 c){\nif(c == null) this.c = new C2(i+1,this);\nelse this.c = c;\nthis.i = i;\n}\npublic static void main(String[] toto){\nC1 c = new C1(1,null);\nC2 d = new C2(c.i,c);\nC1 e = new C1(d.i,d);\nSystem.out.println(e.i + "," + e.c.i + "," + e.c.c.i + "," + e.c.c.c.i);\n}\n}\nclass C2{\nC1 c;\nint i;\nC2(int i, C1 c){\nif(c == null) this.c = new C1(i+1,this);\nelse this.c = c;\nthis.i = i;\n}\n}\n```''',
    "answers": [
      "Output: 2, 3, 2, 3",
      "Output: 1, 1, 1, 2",
      "Output: 1, 2, 1, 3",
      "Compilation error."
    ],
    "details": "The code compiles, it displays  1, 1, 1, 2.",
    "correct_answer": 1
  },
  {
    "quiz_id": uuid.v1(),
    "quiz_tag": "1.6",
    "question_content":
        '''**Does the following code compile? If not, indicate the errors displayed by the compiler and propose corrections. What output does the (potentially corrected) program produce?**\n```ts\nclass Test{\nint i;\nTest(){\nthis.i = 1;\n}\nTest(int i){\nthis();\nthis.i = i;\n}\nvoid m(){\nthis.i++;\nSystem.out.println(this.i);\n}protected void finalize(){\nSystem.out.println(this.i);\n}\npublic static void main(String[] toto){\nTest i = new Test(2);\ni.m();\ni = new Test();\nSystem.gc();\n}\n}\n```''',
    "answers": [
      "Output: 3, 1",
      "Output: 3, 2",
      "Output: 3, 3",
      "Compilation error."
    ],
    "details": "The code compiles, it displays  3, 3.",
    "correct_answer": 2
  },
  {
    "quiz_id": uuid.v1(),
    "quiz_tag": "1.7",
    "question_content":
        '''**Does the following code compile? If not, indicate the errors displayed by the compiler and propose corrections. What output does the (potentially corrected) program produce?**\n```ts\nclass A{\nint i;\nA a;\nA(int i){\nif(i<=0){\nthis.i = i;\nthis.a = new A(i-1);\n}\nelse this.i = i;\n}\nvoid passeATonVoisin(){\nthis.i++;\nif(this.a!=null) this.a.passeATonVoisin();\nelse System.out.println(this.i);\n}\npublic static void main(String[] t){\nA a = new A(10);\na.passeATonVoisin();\n}\n}\n```''',
    "answers": [
      "Output: 11",
      "Output: 10",
      "Output: 0",
      "Compilation error.",
    ],
    "details": "The code compiles, it displays  11.",
    "correct_answer": 0
  },
  {
    "quiz_tag": "1.8",
    "quiz_id": uuid.v1(),
    "question_content":
        '''**What output does the execution of the following program produce?**\n```ts\nclass Truc{\nString s;\nTruc(){\nthis.s = "Bonjour";\n}\nTruc(String s){\nthis.s = s;\n}\npublic String toString(){\nreturn this.s;\n}\npublic boolean equals(Object o){\nreturn o instanceof Truc && this.s.equals(((Truc) o).s);\n}\n}\nclass Bidule{\nString s;\nTruc t;\nBidule(Truc t){\nthis.t = t;\nif(t!=null) this.s = t.s;\nelse this.s = "Bonjour";\n}\npublic String toString(){\nif(this.t == null) return this.s;\nelse return this.t.s;\n}\npublic static void main(String[] toto){\nTruc t1 = new Truc(), t2 = new Truc("Hello");\nBidule b1 = new Bidule(t1), b2 = new Bidule(null);\nSystem.out.println(t1.toString());\nSystem.out.println(t2.toString());\nSystem.out.println(b1.toString());\nSystem.out.println(b2.toString());\nSystem.out.println(t1.equals(t2));\nSystem.out.println(t1.equals(b1));\n}\n}\n\n```''',
    "answers": [
      "Output: Bonjour, Hello, Bonjour, Bonjour, false, false",
      "Output: Bonjour, Hello, Bonjour, Hello, false, true",
      "Output: Bonjour, Hello, Hello, Bonjour, true, false",
      "Output: Bonjour, Hello, Bonjour, Bonjour, true, true"
    ],
    "details":
        "The code compiles, it displays  Bonjour, Hello, Bonjour, Bonjour, false, false.",
    "correct_answer": 0
  },
  {
    "quiz_tag": "1.9",
    "quiz_id": uuid.v1(),
    "question_content":
        '''**What output does the execution of the following program produce?**\n```ts\nclass A{\nint i = 0;\nA(int j){\nthis.i = j;\n}\nvoid setI(int k){\nthis.i=k;\nvoid setI(A a){\nthis.i = a.i;\n}\n}\nclass B extends A{\nint i = 1;\nB(){\nsuper(2);\n}\nvoid setI(int l){\nthis.i = l;\n}\nvoid setI(A a){\nsuper.i = a.i;\n}\nvoid setI(B b){\nthis.i = b.i;\n}\npublic static void main(String[] truc){\nA a = new A(5);\nB b = new B();\nSystem.out.println("a.i="+a.i+", b.i="+b.i+" ou "+((A) b).i);\nb.setI(3); b.setI(a);\nSystem.out.println("a.i="+a.i+", b.i="+b.i+" ou "+((A) b).i);\n}\n}\n}\n\n```''',
    "answers": [
      "Output: a.i=5, b.i=1 ou 2 a.i=5, b.i=3 ou 5",
      "Output: a.i=5, b.i=3 ou 5",
      "Output: a.i=5, b.i=1 ou 1",
      "Compilation error."
    ],
    "details":
        "The code compiles, it displays  a.i=5, b.i=1 ou 2 \n a.i=5, b.i=3 ou 5.",
    "correct_answer": 0
  },
  {
    "quiz_tag": "1.10",
    "quiz_id": uuid.v1(),
    "question_content":
        '''**Does the following code compile? If not, indicate the errors displayed by the compiler and propose corrections. What output does the (potentially corrected) program produce?**\n```ts\nclass Toto{\nstatic int toto = 0;\nToto() {\ntoto = toto + 1;\n}\npublic static void main(String[] tutu) {\nToto t1 = new Toto();\nToto t2 = new Toto();\nSystem.out.println("Toto : " + toto);\n}\n}\n```''',
    "answers": [
      "Output: Toto : 1",
      "Output: Toto : 2",
      "Output: Toto : 0",
      "Compilation error."
    ],
    "details": 'The code compiles, it displays "Output: Toto : 2"',
    "correct_answer": 1
  },
];
