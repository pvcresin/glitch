import java.io.*;
import java.awt.image.*;
import javax.imageio.ImageIO;

void setup() {
  size(480, 480);
  surface.setResizable(true);
}

void draw() {

  PImage g = makeGlitch("bear.jpg");

  if (g != null) {
    background(0);
    image(g, 0, 0, width, height);
  }
  //noLoop();
}

PImage makeGlitch(String filePath) {
  PImage pi = null;

  byte[] b = loadBytes(filePath);

  for (int i = 0; i < b.length; i++) {
    if (random(100) < 0.1) b[i] = 0;  // glitch
  }

  InputStream in = new ByteArrayInputStream(b);
  try {
    BufferedImage image = ImageIO.read(in);
    pi = new PImage(image);
    //saveBytes("glitch" + frameCount + ".jpg", b);  // output into file
  }
  catch (Exception e) {
    println(frameCount);
  }

  return pi;
}