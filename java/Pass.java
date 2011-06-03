//: c03:PassObject.java
// Passing objects to methods may not be what
// you're used to.
//import com.bruceeckel.simpletest.*;

class Letter 
{
  char c;
}

class Pass 
{
  static void f(Letter y) 
  {
    y.c = 'z';
  }
  public static void main(String[] args) 
  {
    Letter x= new Letter();
    x.c = 'a';
    System.out.println("1: x.c: " + x.c);
    f(x);
    System.out.println("2: x.c: " + x.c)  ;
  }
}

