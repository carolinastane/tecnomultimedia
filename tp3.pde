//Variables
boolean ganar = false;
boolean gameOver = true;
boolean inicio= true;
int score1;
float posY;
float posX;
int speedX;
float speedY;
String estado;
String []textos ={ "APRIETA CUALQUIER TECLA PARA VOLVER A JUGAR","PERDISTE :("};
String []textos2 ={"Tecnologia multimedial\n Milagros Martinez & Carolina Stanekovich " ,"Comision 2 :D","presione espacio para continuar"};
String []textos3={"Bolita saltadora :D/","Muevete de izquierda a derecha y consigue un puntaje de 7 \n ¡No dejes que la bolita se caiga! :o "};
String []textos4={ "FELICIADES ¡GANASTE :D!", "Muchas gracias por jugar"};
void setup () {
size(600, 600);
//Asignacion de valores de variables
posX = width/2;
posY = height/2;
speedX = 1;
speedY= -5;
score1= 0;
 textSize( 24 );
  textAlign( CENTER, CENTER );
  
  estado = "inicio";
}

void draw () {
  background(0);
  noStroke();
  //Fondo de juego
  for(int y= 0; y < 700; y+=20){
    for( int x = 0; x< 700; x+=20){
      fill((x+y)* 0.11);
      rect(x,y,20,20);
    }
  }
  //Condicion de perder (Pantalla)
  if (gameOver == true) {
textAlign(CENTER);
textSize(14);
text (textos[0], width/2, height/2+20);
textSize(20);
text (textos[1], width/2, height/2);
}
else {
//Desarrollo del juego
fill(255);
rect( mouseX, height*0.9, 60, 10);
fill(255);

ellipse(posX, posY, 10, 10);

if (posY< 0) {
speedY= - speedY;
posY= 0;
}

if (posX> width) {
speedX= - speedX;
posX= width;
}

if (posX< 0) {
speedX= - speedX;
posX= 0;
}
if (posY >height)
{
posX = width/2;
posY = height/2;
gameOver = true;

}
//Aumento de puntaje
if (posX > mouseX-30 && posX < mouseX + 60 && posY > 0.9*height-5 && posY < 0.9*height+5) {
speedY = -1*speedY;
score1= score1+1;
}

else{
text(score1, 320,30);

}

println(posY);
posX= posX + speedX;
posY= posY + speedY;

}
if( inicio== true) {
    pantallainicio();
    if ( score1 >= 10){
      ganar = true;
    }
    if( ganar == true){
      background(#02987B);
      fill(0);
      text( textos4[0], 300,300);
      text(textos4 [1], 300, 500);
  }
}
}
//Reinicio y pantalla de creditos de espacio
void keyPressed() {
if (gameOver == true) {
gameOver = false;
score1=0;
  if( estado.equals("inicio") && key == ' ' ){
    estado = "instrucciones";
  }
}
}
 //Pantalla 1 y 2 
void pantallainicio() {
if( estado.equals("inicio") ){
    background( 0 );
    fill(255);
    text(textos2[0], 300, 100);
    fill(255,0,0);
    text(textos2[1],300, 300);
    text( textos2[2], 300, 500); 
  }else if( estado.equals("instrucciones") ){
    background( 255 );
    fill(0);
    text( textos3[0], 300, 100);
    text( textos3[1], width/2, height/2 );  
    //boton con mouse over
    pushStyle();
    if( dist( mouseX, mouseY, width/2, height/2+100) <= 25 ){
      fill( 200, 0, 0 );
    }else{
      fill( 0 );
    }
    ellipse( width/2, height/2+100, 50, 50 );
    popStyle();
  }
}
void mousePressed(){
  if( estado.equals("instrucciones") && dist( mouseX, mouseY, width/2, height/2+100) <= 25 ){
    estado = "jugando";
  }
}
