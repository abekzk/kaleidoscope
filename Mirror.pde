class Mirror {
  PShape s;
  void display() {
    shape(s);
  }
}

class TriangleMirror extends Mirror {

  TriangleMirror(int x, int y, int r, int rad, PGraphics texture) {
    textureMode(NORMAL);
    s = createShape();
    s.beginShape();
    s.texture(texture);
    s.stroke(50);
    for (int i = 0; i < 3; i++) {
      float theta = radians(rad - 90 + 120 * i);
      float thetaTexture = radians(0 - 90 + 120 * i);
      s.vertex(x + r * cos(theta), y + r * sin(theta), (cos(thetaTexture) + 1) * 0.5, (sin(thetaTexture) + 1) * 0.5);
    }
    s.endShape(CLOSE);
  }

}
