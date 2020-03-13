// 万華鏡プログラム

ObjectController objectController;
Mirror[] mirrors = new Mirror[6];
boolean isEdit = true;

void setup() {
  size(600, 600, P2D);
  objectController = new ObjectController();
  initMirror();  
}

void draw() {

  if (isEdit) {
    background(255);
    objectController.drawTexture(false);
    image(objectController.texture, 0, 0);
    objectController.drawEditor();
  }else {
    background(0);
    objectController.drawTexture(true);
    // ミラーを表示
    for (Mirror mirror:mirrors) {
      mirror.display();
    }
  }
}

void mouseDragged() {
  objectController.moveSelectObject();
}

void mousePressed() {
  objectController.selectObject();
}

void mouseReleased() {
  objectController.setObject();
}

void keyPressed() {
  if (key == ' ') {
    isEdit = !isEdit;
  }
  if (key == 'a') {
    if (isEdit) {
      objectController.addObject(new BeautifulObject());
    }
  }
}

void initMirror() {
  int r = 150;
  for (int i = 0; i < 6; i++) {
    int rad = 90 + 60 * i;
    int x = int(width / 2 + r * cos(radians(rad)));
    int y = int(height / 2 + r * sin(radians(rad)));
    mirrors[i] = new TriangleMirror(x, y, r, 60 * i, objectController.texture);
  }
}
