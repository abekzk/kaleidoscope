class BeautifulObject {
  int x;
  int y;
  String shape;
  int size;
  color c;

  BeautifulObject(int x, int y, String shape, int size, color c) {
    this.x = x;
    this.y = y; 
    this.shape = shape;
    this.size = size;
    this.c = c;
  }

  void draw() {
    fill(c);
    noStroke();
    if (shape == "o") {
      ellipse(x, y, size / 2, size / 2);
    }
    else if (shape == "d") {
      drawDiamond(x, y, size / 2);
    }
  }

  void drawDiamond(int x, int y, int r) {
    quad(x, y - r, x + r, y, x, y + r, x - r, y);
  }

}
