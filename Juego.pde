class Juego {
  //atributos

  Boton botonComenzar, botonReiniciar;
  Pantalla pantallaComenzar, pantallaGanar, pantallaPerder,pantallaCreditos, pantallaJugar;

  Blancanieves blancanieves;
  int cantObstaculo =20;
  Obstaculo [] obstaculo = new Obstaculo [cantObstaculo];
  Fondo fondoJuego;
  int pantalla, contador;

  boolean  perder;


  //constructores
  Juego() {

    this.blancanieves = new Blancanieves();

    for (int i=0; i<this.cantObstaculo; i++) {
      int posXObstaculo= 350 * (i+1);
        if(i == 3 | i == 7 | i == 11 | i == 16) {
           this.obstaculo[i] = new Obstaculo(posXObstaculo-250, 270);
        }else
      this.obstaculo[i] = new Obstaculo(posXObstaculo, 270);
    }  

    this.pantallaComenzar= new Pantalla("menu.jpg");
    this.pantallaPerder= new Pantalla("perder.jpg");
    this.pantallaGanar= new Pantalla("ganar.jpg");
    this.pantallaCreditos = new Pantalla("creditos.jpg");


    this.botonComenzar= new Boton("Comenzar", 280);
    this.botonReiniciar= new Boton("Reiniciar", 280);
    this.fondoJuego = new Fondo();
    
    
    this.contador=0;
    this.perder= false;
    this.pantalla=0;
  }



  //acciones
  void dibujar(){
    //dibujo las pantallas y lo que corresponde en cada una de ellas
    if (this.pantalla==0) {
     
      this.pantallaComenzar.mostrar();
      this.botonComenzar.dibujar();
      if(mousePressed & mouseX >400)
       pantalla=-1;
       
      
    } else   if (pantalla==-1){
        this.pantallaCreditos.mostrar();
         if(mousePressed & mouseX < 100)
           this.pantalla=0;
         }else if (this.pantalla==1) {
      background(200);
      this.fondoJuego.dibujar();
      this.blancanieves.dibujar();
      textSize(20);
      fill(#FFFFFF);
      text("Puntos:" + this.contador, 150, 30);
      for (int i=0; i<this.cantObstaculo; i++) {
        this.obstaculo[i].dibujar();
         
        //colision
        if (this.obstaculo[i].chocarConBlancanieves(this.blancanieves.posXPj, this.blancanieves.posYPj, this.blancanieves.anchoPj, this.blancanieves.altoPj)) {
          this.blancanieves.perder();
        }
       //sumar puntos
        if (saltarObstaculo(this.obstaculo[i])) {
          this.contador++;
        }
      }
      player.play();
    }
    if (this.contador>=1500) {
      this.pantalla=3;
    } else if (this.perder == this.blancanieves.viva) {
      this.pantalla = 2;
    } 

    if (this.pantalla==2) {   
      this.pantallaPerder.mostrar();
      this.botonReiniciar.dibujar();
       player.pause();
    } else if (this.pantalla==3) {
      this.pantallaGanar.mostrar();
      this.botonReiniciar.dibujar();
       player.pause();
    }
  }





  void mouseClikeado() {

    if (this.pantalla==0 && this.botonComenzar.estoySobreBoton()) {
      this.pantallaSieguiente();
    } else if (this.pantalla==2 && this.botonReiniciar.estoySobreBoton()) {
      this.perder=false;
      this.contador =0;
      this.pantalla=0;
      this.blancanieves = new Blancanieves();
      for (int i=0; i<this.cantObstaculo; i++) {
        int posXObstaculo= 290 * (i+1);
        this.obstaculo[i] = new Obstaculo(posXObstaculo, 270);
        this.pantallaSieguiente();
      }
    } else if (this.pantalla==3 && this.botonReiniciar.estoySobreBoton()) {
      this.perder=false;
      this.contador =0;
      this.pantalla=0; 
      this.blancanieves = new Blancanieves();
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
