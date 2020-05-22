void main(List<String> arguments) {
  A c = C();
  (c as C).silly();
  c.silly();
  B b = C();
  (b as C).awesome();
  b.awesome();
}

class A {
  void silly() {
    print("A's Silly");
  }
}

class B {
  void awesome() {
    print("B's Awesome");
  }
}

class C implements A, B {
  @override
  void silly() {
    print("C's Silly");
  }

  @override
  void awesome() {
    print("C's Awesome");
  }
}
