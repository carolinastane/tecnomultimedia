class Submarino {
  //atributos

  PImage Submarino;

  float posXSub, posYSub, anchoSub, altoSub, posActual;
  float velocidad, limiteSalto, alturaSalto, suelo, limiteDeSalto;
  boolean saltando, bajar, subir, vivo;


  //constructores
  Submarino() {


    this.Submarino = loadImage("subbmarino.png");

    this.anchoSub = 90;
    this.altoSub = 80;
    this.posXSub = 10;
    this.posYSub= 250;



    this.velocidad = 5;
    this.alturaSalto = 90;
    this.suelo = this.posYSub;

    this.limiteDeSalto = this.alturaSalto ;
    this.subir = true;

    this.vivo=true;
  }


  //acciones
  void dibujar() {
    if (vivo) {
      image(this.Submarino, this.posXSub, this.posYSub, this.anchoSub, this.altoSub);
      this.actualizar();
    }
  }

  void actualizar() {

    if (keyPressed && keyCode == UP) {

      this.saltando = true;
      if (saltando ==true) {
      }
    } 
    if (keyPressed && keyCode == LEFT) {
      this.posXSub -= this.velocidad ;
    } 
    if (keyPressed && keyCode == RIGHT) {
      this.posXSub += this.velocidad;
    }  
    if (this.saltando == true) {
      this.logicaDeSalto();
    }
  }

  void logicaDeSalto() {
    if (this.subir == true && this.bajar == false) {
      this.posYSub = this.posYSub-6;
      if (this.posYSub < this.limiteDeSalto) {
        this.bajar  = true;
        this.subir = false;
      }
    } else if (this.subir == false && this.bajar == true) {
      this.posYSub=this.posYSub+6;
      if (this.posYSub >= this.suelo) {
        this.bajar  = false;
        this.subir = true;
        this.saltando = false;
      }
    }
  }

  void perder() {
    vivo=false;
  }
}
