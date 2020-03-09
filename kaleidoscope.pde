// 万華鏡プログラム

ArrayList<BeautifulObject> beautifulObjects;
PGraphics mirrorTexture;
Mirror[] mirrors = new Mirror[6];
boolean isEdit = false;

void setup() {
  size(600, 600, P2D);
  beautifulObjects = new ArrayList<BeautifulObject>();
  mirrorTexture = createGraphics(width, height);
  for (int i = 0; i < 5; i++) {
    beautifulObjects.add(new BeautifulObject());
  }
  int r = 150;
  for (int i = 0; i < 6; i++) {
    int rad = 90 + 60 * i;
    int x = int(width / 2 + r * cos(radians(rad)));
    int y = int(height / 2 + r * sin(radians(rad)));
    mirrors[i] = new TriangleMirror(x, y, r, 60 * i, mirrorTexture);
  }

}

void draw() {
  background(255);
  textureDraw();
  if (isEdit) {
    image(mirrorTexture, 0, 0);
  }else {
    // ミラーを表示
    for (Mirror mirror:mirrors) {
      mirror.display();
    }
  }
}

void mousePressed() {
  if (isEdit) {
    beautifulObjects.add(new BeautifulObject(mouseX, mouseY, "d", 50, color(255, 0, 0)));
  }
}

void keyPressed() {
  if (key == ' ') {
    isEdit = !isEdit;
  }
}

void textureDraw() {
  mirrorTexture.beginDraw();
  mirrorTexture.background(255);
  mirrorTexture.translate(mirrorTexture.width / 2, mirrorTexture.height / 2);
  if (!isEdit) {
    mirrorTexture.rotate(radians(millis() / 10 % 360));
  }
  for (BeautifulObject obj:beautifulObjects) {
    obj.display(mirrorTexture);
  }
  mirrorTexture.endDraw();
}
