class ObjectEditor {

  ObjectController objectController;

  BeautifulObject targetObj = null;
  BeautifulObject phantomObj = null;

  BeautifulObject[] uiObjs;
  UIButton[] changeColorButtons;
  UIButton sizeUpButton;
  UIButton sizeDownButton;
  
  color[] defaultColors;
  HashMap<String, Integer> shapeDefaultColors;

  ObjectEditor(ObjectController objectController) {
    this.objectController = objectController;
    init();
  }
  
  void init() {
    uiObjs = new BeautifulObject[]{
      new BeautifulObject(30, 220, "o", 40, color(150)),
      new BeautifulObject(30, 320, "d", 40, color(150)),
      new BeautifulObject(30, 420, "s", 40, color(150)),
      new BeautifulObject(30, 520, "h", 40, color(150)),
    };
    defaultColors = new color[]{
      color(255, 0, 0),
      color(0, 255, 0),
      color(0, 0, 255),
      color(255, 255, 0),
    };
    shapeDefaultColors = new HashMap<String, Integer>() {
      {
        put("o", defaultColors[0]);
        put("d", defaultColors[1]);
        put("s", defaultColors[2]);
        put("h", defaultColors[3]);
      }
    };

    changeColorButtons = new UIButton[]{
      new UIButton(width - 50, 350, 45, 45, defaultColors[0]),
      new UIButton(width - 50, 420, 45, 45, defaultColors[1]),
      new UIButton(width - 50, 490, 45, 45, defaultColors[2]),
      new UIButton(width - 50, 560, 45, 45, defaultColors[3]),
    };
    sizeUpButton = new UIButton(width - 50, 100, 60, 60);
    sizeDownButton = new UIButton(width - 50, 200, 60, 60);
  }

  void display() {
    if (targetObj != null) {
      pushStyle();
      noFill();
      stroke(50, 100);
      rectMode(CENTER);
      rect(targetObj.x, targetObj.y, targetObj.size, targetObj.size);
      popStyle();
    }
    
    if (targetObj != null) {
      for (UIButton button:changeColorButtons) {
        button.display();
      }
      sizeUpButton.display();
      sizeDownButton.display();
    }

    for (BeautifulObject obj:uiObjs) {
      shape(obj.shape, obj.x, obj.y);
    }
    if (phantomObj != null) {
      shape(phantomObj.shape, phantomObj.x, phantomObj.y);
    }
  }

  void selectTargetObject() {
    targetObj = objectController.getMouseoverObj();
  }

  void moveTargetObject() {
     if (targetObj != null) {
      targetObj.setPos(mouseX, mouseY);
    }
  }

  void removeTargetObject() {
    if (targetObj != null) {
      objectController.removeObject(targetObj);
      targetObj = null;
    }
  }
  
  boolean changeObjectColor() {
    if (targetObj != null) {
      for (UIButton button:changeColorButtons) {
        if (button.isMouseOver()) {
          targetObj.setColor(button.c);
          return true;
        }
      }
    }
    return false;
  }
  
  boolean changeObjectSize() {
    int rate = 20;
    if (targetObj != null) {
      if (sizeUpButton.isMouseOver()) {
        targetObj.setSize(targetObj.size + rate);
        return true;
      }
      if (sizeDownButton.isMouseOver()) {
        targetObj.setSize(targetObj.size - rate);
        return true;
      }
    }
    return false;
  }

  void selectPhantomObject() {
    for (BeautifulObject obj:uiObjs) {
      if (obj.isMouseOver()) {
        phantomObj = new BeautifulObject(obj.x, obj.y, obj.type, 60, shapeDefaultColors.get(obj.type));
        targetObj = null;  // 重複選択を避けるため
      }
    }
  }

  void movePhantomObject() {
    if (phantomObj != null) {
      phantomObj.setPos(mouseX, mouseY);
    }
  }

  void embodyPhantomObject() {
    if (phantomObj != null) {
      objectController.addObject(phantomObj);
      phantomObj = null;
    }
  }

}

class UIButton{
  int x;
  int y;
  int w;
  int h;
  //String tag;
  color c;
  String text = "";

  UIButton(int x, int y, int w, int h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    //this.tag = tag;
  }

  UIButton(int x, int y, int w, int h) {
    this(x, y, w, h, color(255));
  }

  void setText(String text) {
    this.text = text;
  }
  
  void display() {
    pushStyle();
    rectMode(CENTER);
    stroke(0);
    fill(c);
    rect(x, y, w, h);
    //text(text, x, y);
    popStyle();
  }

  boolean isMouseOver() {
    if (mouseX > x - w / 2 && mouseX < x + w / 2 &&
        mouseY > y - h / 2 && mouseY < y + h / 2) {
      return true;
    }
    return false;
  }

}
