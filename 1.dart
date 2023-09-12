
/*
1) When we use (~/) notation that’s mean that we return integer division result. if we 
divided number by zero we will get an exception. Try to handle it.

*/
void main(List<String> args) {
  try {
    print(5~/0);
  } 
  
  catch (e) {
    print("can not divied number by zero");
  }
}


