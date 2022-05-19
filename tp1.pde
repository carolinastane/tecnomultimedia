PImage volalfut;
float a, f1, r, g, a2, a3, a4, a5, a6;
int estado;
PFont ac;
PFont t, t2;
void setup() {

  size(600, 400);
  volalfut=loadImage("volalfut.jpg.jpg");
  imageMode(CENTER);

  //asignacion de valores
  a=600;
  a2=1000;
  a3=1300;
  a4=1600;
  a5=1900;
  a6=2100;
  estado = 0;
  textAlign(CENTER);
  f1=255;
  r=255;
  g=255;
  ac=loadFont("letracreditos.vlw");
  t=loadFont("letracreditos.vlw");
  t2=loadFont("letracreditos.vlw");
}

void draw() {


  //pantalla 1, desaparece titulo. 
  if (estado==0) {
    background(0);
    r-=2;
    g-=2;
    println(g);
    fill(255, g);
    textSize(20);
    textFont(t2);
    text("a film by:", width/2, height/2);
    textFont(t);
    text("BOB GALE", width/2, (height/2)+40);
    a-= 2;
    a6-=0.7;
  }

  //pantalla 2, imagen.
  if (estado==1) {
    image(volalfut, width/2, a);
    a-= 0.7;
  }
  //pantalla 3, personajes principales.
   {
     if (estado ==2)
    background(0);
    fill(255);
    textFont(ac);
    text("Main Characters \n THOMAS F. WILSON\nCRISPIN GLOVER\n LEA THOMPSON\nCHRISTOPHER LLOYD\nMICHAEL J. FOX", width/2, a2);
    //pantalla 4 y 5, secundarios.
    text("Featuring:\n CLAUDIA WELLS\nMARC McCLURE\nWENDIE JO SPERBER\nGEORGE DICENZO", width/2, a3);
    text("JAMES TOLKAN\nJEFFREY JAY COHEN\nCASEY SIEMASZKO\nBILLI ZANE", width/2, a4);
    //pantalla 6, productores.
    text("Unit Production Manager:\n DENIS E.JONES\n First Assistant Director:\n JACK GROSSEMBERG \n Second Assistant Director: \n DAVID Mc.GIFFERT", width/2, a5);
    //pantalla 7, musica. 
     text("Music Supervisor\n BONES HOWE \n Supervising Sound Editors: \n CHARLES L. CAMPBELL\n ROBERT RUTLEDGE", width/2, a6);
    a2-=0.8;
    a3-=0.8;
    a4-=0.8;
    a5-=0.8;
    a6-=0.7;
  }
  println(estado);
  if (g<=-10 && estado ==0 ) {
    estado=1 ;
  }
  if (a<=0 && estado ==1 ) {
    estado = 2;
  }
}


void mousePressed() { //cuando se presiona el click de mouse, se vuelven a iniciar los creditos.
  background(0);

  g= 300;
  estado = 0 ;
  a=600;
  a2=1000;
  a3=1300;
  a4=1600;
  a5=1900;
  a6=2100;
}
