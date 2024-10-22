float bladeRotation = 0;  // sudut rotasi baling-baling
float birdX1 = -50, birdY1 = 50;  // posisi burung pertama
float birdX2 = -100, birdY2 = 80;  // posisi burung kedua
float sunPulse = 1;  // faktor skala untuk denyut matahari

void setup() {
  size(600, 600);  // ukuran layar
}

void draw() {
  drawGradientBackground();  // gradasi langit sore

  // gambar siluet gunung
  drawMountains();

  // gambar matahari di pojok kanan atas
  drawSun();

  // gambar dasar tiang kincir
  fill(#646464);
  rect(width/2 - 15, height/2, 30, height/2);  // tiang kincir

  // gambar lingkaran pusat baling-baling
  fill(#BCBCBC);
  ellipse(width/2, height/2, 50, 50);  // pusat baling-baling
  
  // rotasi baling-baling
  if (bladeRotation < TWO_PI) {
    bladeRotation += 0.03;  // percepat rotasi
  } else {
    bladeRotation = 0;  // reset rotasi jika mencapai 360 derajat
  }

  // gambar baling-baling dengan rotasi
  translate(width/2, height/2);
  rotate(bladeRotation);
  drawBlades();
  resetMatrix();
  
  // gambar awan
  drawClouds();
  
  // gambar burung
  drawBirds();
  
  // gambar tiang dan kabel listrik
  drawElectricPolesAndCables();
  
  // teks
  drawText();
}

void drawText() {
  fill(0);  // warna hitam untuk teks
  textSize(15);  // ukuran teks
  text("Nama : Dio Dharmaesa", 10, 15);  // teks dan posisinya
  text("NIM     : 2209106053", 10, 30);  // teks dan posisinya
}

void drawSun() {
  sunPulse = 1 + 0.2 * sin(frameCount * 0.05);  // efek denyut
  
  fill(255, 223, 0);  // warna kuning untuk matahari
  noStroke();  // hilangkan garis tepi
  
  pushMatrix();
  translate(width - 100, 100);  // posisi matahari
  scale(sunPulse);  // tambahkan skala untuk efek denyut
  ellipse(0, 0, 80, 80);  // matahari
  popMatrix();
}

void drawClouds() {
  fill(255);  // warna putih untuk awan
  noStroke();  // hilangkan garis tepi

  // Awan 1
  ellipse(100, 100, 100, 60);
  ellipse(150, 100, 120, 70);
  ellipse(200, 100, 100, 60);

  // Awan 2
  ellipse(400, 130, 130, 80);
  ellipse(450, 130, 150, 90);
  ellipse(500, 130, 130, 80);
}

void drawBirds() {
  stroke(0);  // warna hitam untuk burung
  strokeWeight(2);
  noFill();
  
  // burung pertama hanya bergerak jika ketinggian kurang dari 100
  if (birdY1 < 100) {  
    beginShape();
    vertex(birdX1, birdY1);
    vertex(birdX1 + 20, birdY1 - 10);
    vertex(birdX1 + 40, birdY1);
    endShape();
  }
  
  // burung kedua hanya bergerak jika ketinggian lebih dari 50
  if (birdY2 > 50) {  
    beginShape();
    vertex(birdX2, birdY2);
    vertex(birdX2 + 20, birdY2 - 10);
    vertex(birdX2 + 40, birdY2);
    endShape();
  }

  birdX1 += 2;
  birdX2 += 2;
  
  if (birdX1 > width || birdY1 < 0) {  
    birdX1 = -50;
  }
  if (birdX2 > width || birdY2 < 0) {
    birdX2 = -100;
  }
}

void drawBlades() {
  fill(#F2F0F0);  
  int bladeLength = 125;  
  int bladeWidth = 30;  

  for (int i = 0; i < 4; i++) {
    pushMatrix();  
    rotate(HALF_PI * i);  
    rect(-bladeWidth / 2, -bladeLength - 25, bladeWidth, bladeLength);  
    popMatrix();  
  }
}

// Fungsi untuk menggambar gunung dengan tekstur
void drawMountains() {
  fill(#004605);  
  noStroke();

  // Gunung 1
  beginShape();
  vertex(-100, height); 
  vertex(150, 300);  
  vertex(300, height); 
  endShape(CLOSE);

  // Gunung 2
  beginShape();
  vertex(200, height);
  vertex(400, 350);     
  vertex(600, height);  
  endShape(CLOSE);
}

// Fungsi untuk membuat gradasi langit sore
void drawGradientBackground() {
  for (int y = 0; y < height; y++) {
    float inter = map(y, 0, height, 0, 1);
    color c = lerpColor(color(255, 150, 100), color(#810909), inter);
    stroke(c);
    line(0, y, width, y);
  }
}

// Fungsi untuk menggambar tiang dan kabel listrik
void drawElectricPolesAndCables() {
  stroke(100);  // warna abu-abu untuk tiang listrik
  strokeWeight(5);
  
  // Gambar tiang listrik
  line(100, 550, 100, 600);  // tiang 1
  line(500, 550, 500, 600);  // tiang 2

  // Gambar kabel listrik dengan curveVertex
  stroke(50); 
  strokeWeight(4);
  
  noFill();
  beginShape();
  curveVertex(0, 550); 
  curveVertex(0, 550);  
  curveVertex(100, 550); 
  curveVertex(200, 530);  
  curveVertex(400, 530);  
  curveVertex(500, 550);  
  curveVertex(600, 550);
  curveVertex(600, 550); 
  endShape();
}
