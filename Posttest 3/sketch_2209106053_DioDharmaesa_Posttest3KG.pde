float bladeRotation = 0;  // sudut rotasi baling-baling
float birdX1 = -50, birdY1 = 50;  // posisi burung pertama
float birdX2 = -100, birdY2 = 80;  // posisi burung kedua

void setup() {
  size(600, 600);  // ukuran layar
  background(135, 206, 235);  // warna langit
}

void draw() {
  background(135, 206, 235);  // ulang warna latar setiap frame
  
  // gambar siluet gunung
  drawMountains();

  // gambar matahari di pojok kanan atas
  drawSun();

  // gambar dasar tiang
  fill(#646464);
  rect(width/2 - 15, height/2, 30, height/2);  // tiang kincir

  // gambar lingkaran pusat baling-baling
  fill(#BCBCBC);
  ellipse(width/2, height/2, 50, 50);  // pusat baling-baling
  
  // rotasi baling-baling dengan batas kecepatan maksimum
  if (bladeRotation < TWO_PI) {  // operator relasi
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
  fill(255, 223, 0);  // warna kuning untuk matahari
  noStroke();  // hilangkan garis tepi
  ellipse(width - 100, 100, 80, 80);  // posisi matahari di pojok kanan atas
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
  if (birdY1 < 100) {  // operator relasi
    beginShape();
    vertex(birdX1, birdY1);
    vertex(birdX1 + 20, birdY1 - 10);
    vertex(birdX1 + 40, birdY1);
    endShape();
  }
  
  // burung kedua hanya bergerak jika ketinggian lebih dari 50
  if (birdY2 > 50) {  // operator relasi
    beginShape();
    vertex(birdX2, birdY2);
    vertex(birdX2 + 20, birdY2 - 10);
    vertex(birdX2 + 40, birdY2);
    endShape();
  }

  // update posisi burung
  birdX1 += 2;
  birdX2 += 2;
  
  // jika burung keluar layar, reset posisi
  if (birdX1 > width || birdY1 < 0) {  // operator logika
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

  // Menggunakan perulangan untuk menggambar keempat bilah baling-baling
  for (int i = 0; i < 4; i++) {
    pushMatrix();  
    rotate(HALF_PI * i);  
    rect(-bladeWidth / 2, -bladeLength - 25, bladeWidth, bladeLength);  // gambar bilah baling-baling
    popMatrix();  // kembalikan kondisi matriks
  }
}

// gambar gunung
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
