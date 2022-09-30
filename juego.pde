 class Juego {
  //atributos

  Boton botonComenzar, botonReiniciar;
  Pantalla pantallaComenzar, pantallaGanar, pantallaPerder, pantallaJugar;

  Submarino Submarino;
  int cantObstaculo =10;
  Obstaculo [] obstaculo = new Obstaculo [cantObstaculo];
  Fondomar fondoJuego;
  int pantalla, contador;

  boolean  perder;


  //constructores
  Juego() {

    this.Submarino = new Submarino();

    for (int i=0; i<this.cantObstaculo; i++) {
      int posXObstaculo= 400 * (i+1);
      this.obstaculo[i] = new Obstaculo(posXObstaculo, 270);
    }  

    this.pantallaComenzar= new Pantalla("¡HEY!\n\nJunta 2000 puntos y evita tocar a los blob", #FFFFFF, 0);
    this.pantallaPerder= new Pantalla("Tocaste a blob \n\n Perdiste :(", #FFFFFF, 0);
    this.pantallaGanar= new Pantalla("¡No tocaste a blob! :D\n\n Felicidades :)", #FFFFFF, 0);

    this.botonComenzar= new Boton("Comenzar", 280);
    this.botonReiniciar= new Boton("Reiniciar", 280);
    this.fondoJuego = new Fondomar();
    
    
    this.contador=0;
    this.perder= false;
    this.pantalla=0;
  }



  //acciones
  void dibujar(){
    //dibujo las pantallas y lo que corresponde en cada una de ellas
    if (this.pantalla==0) {
      this.pantallaComenzar.dibujar();
      this.botonComenzar.dibujar();
    } else if (this.pantalla==1) {
      background(200);
      this.fondoJuego.dibujar();
      this.Submarino.dibujar();
      textSize(20);
      fill(#FFFFFF);
      text("Puntos:" + this.contador, 400, 30);
      for (int i=0; i<this.cantObstaculo; i++) {
        this.obstaculo[i].dibujar();
         
        //colision
        if (this.obstaculo[i].chocarConSubmarino(this.Submarino.posXSub, this.Submarino.posYSub, this.Submarino.anchoSub, this.Submarino.altoSub)) {
          this.Submarino.perder();
        }
       //sumar puntos
        if (saltarObstaculo(this.obstaculo[i])) {
          this.contador++;
        }
      }
    }
    if (this.contador>=1500) {
      this.pantalla=3;
    } else if (this.perder == this.Submarino.vivo) {
      this.pantalla = 2;
    } 

    if (this.pantalla==2) {   
      this.pantallaPerder.dibujar();
      this.botonReiniciar.dibujar();
    } else if (this.pantalla==3) {
      this.pantallaGanar.dibujar();
      this.botonReiniciar.dibujar();
    }
  }





  void mouseClikeado() {

    if (this.pantalla==0 && this.botonComenzar.estoySobreBoton()) {
      this.pantallaSieguiente();
    } else if (this.pantalla==2 && this.botonReiniciar.estoySobreBoton()) {
      this.perder=false;
      this.contador =0;
      this.pantalla=0;
      this.Submarino = new Submarino();
      for (int i=0; i<this.cantObstaculo; i++) {
        int posXObstaculo= 400 * (i+1);
        this.obstaculo[i] = new Obstaculo(posXObstaculo, 270);
        this.pantallaSieguiente();
      }
    } else if (this.pantalla==3 && this.botonReiniciar.estoySobreBoton()) {
      this.perder=false;
      this.contador =0;
      this.pantalla=0; 
      this.Submarino = new Submarino();
      for (int i=0; i<this.cantObstaculo; i++) {
        int posXObstaculo= 400 * (i+1);
        this.obstaculo[i] = new Obstaculo(posXObstaculo, 270);
        this.pantallaSieguiente();
      }
    }
  }

  void pantallaSieguiente() {
    if (pantalla==0) {
      this.pantalla=1;
    } else if (pantalla==2) {
      this.pantalla=0;
      this.contador=0;
    } else if (pantalla==3 ) { 

      this.pantalla=0;
      this.contador=0;
    }
  }


  //para sumar puntos
  boolean saltarObstaculo(Obstaculo obstaculo) {
    if (obstaculo.posXObstaculo<=0) {
      return true;
    } else {
      return false;
    }
  }
}
