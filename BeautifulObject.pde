class BeautifulObject {
  int x;
  int y;
  String shape;
  int size;

  BeautifulObject(int x, int y, String shape, int size) {
    this.x = x;
    this.y = y; 
    this.shape = shape;
    this.size = size;
  }

  void draw() {
    ellipse(x, y, size, size);
  }

}
