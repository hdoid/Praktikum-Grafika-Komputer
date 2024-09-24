float bladeRotation = 0;  // sudut rotasi baling-baling
float birdX1 = -50, birdY1 = 50;  // posisi burung pertama
float birdX2 = -100, birdY2 = 80;  // posisi burung kedua

void setup() {
  size(600, 600);  // ukuran layar
  background(135, 206, 235);  // warna langit
}

void draw() {
  background(135, 206, 235);  // ulang warna latar setiap frame
  
  // gambar matahari di pojok kanan atas
  drawSun();

  // gambar dasar tiang
  fill(#646464);
  rect(width/2 - 15, height/2, 30, height/2);  // tiang kincir

  // gambar lingkaran pusat baling-baling
  fill(#BCBCBC);
  ellipse(width/2, height/2, 50, 50);  // pusat baling-baling
  
  // pindahkan titik asal ke pusat kincir angin
  translate(width/2, height/2);
  
  // gambar baling-baling dengan rotasi
  rotate(bladeRotation);  // rotasi berdasarkan variabel bladeRotation
  drawBlades();
  
  // kembalikan titik asal ke posisi semula
  resetMatrix();
  
  // update rotasi baling-baling setiap frame
  bladeRotation += 0.03;  // kecepatan putaran
  
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
  
  // burung pertama
  beginShape();
  vertex(birdX1, birdY1);
  vertex(birdX1 + 20, birdY1 - 10);
  vertex(birdX1 + 40, birdY1);
  endShape();
  
  // burung kedua
  beginShape();
  vertex(birdX2, birdY2);
  vertex(birdX2 + 20, birdY2 - 10);
  vertex(birdX2 + 40, birdY2);
  endShape();
  
  // update posisi burung
  birdX1 += 2;  // burung pertama bergerak ke kanan
  birdX2 += 2;  // burung kedua bergerak ke kanan
  
  // jika burung keluar layar, kembalikan ke kiri
  if (birdX1 > width) {
    birdX1 = -50;
  }
  if (birdX2 > width) {
    birdX2 = -100;
  }
}

void drawBlades() {
  fill(#F2F0F0);  // warna putih baling-baling
  
  // Bilah baling-baling atas (persegi panjang)
  rect(-15, -150, 30, 125);

  // Bilah baling-baling kanan (persegi panjang)
  rect(25, -15, 125, 30);

  // Bilah baling-baling bawah (persegi panjang)
  rect(-15, 25, 30, 125);

  // Bilah baling-baling kiri (persegi panjang)
  rect(-150, -15, 125, 30);
}
