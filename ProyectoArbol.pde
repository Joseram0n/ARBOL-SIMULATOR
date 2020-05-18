/*
  Esta pagina del Sketch es la principal
  
  Author: Jose Ramon Lopez Garrido
 */
 
//Importacion de librerias
import processing.sound.*;   //Libreria de Sonido
import g4p_controls.*;       //Libreria de Interfaz (GUI)
import peasy.*;              //Libreria de Camara 3D
  
//Variables Globales
int anchoInicial, altoInicial;
SplashScreen splash;
Menu menu;
enum EstadosMenu {PRINCIPAL,ARBOL,AJUSTES};
EstadosMenu estadoMenu;
GView vista2D, vista3D;
String tituloVentana = "Arbol Simulator 2020";
boolean musicaSilenciada;

//Settings se ejecuta antes que la api de processing
//Establece que la ventana se abre al 80% de la resolucion del monitor
void settings(){
  //Crea la pantalla de carga
  splash = new SplashScreen(sketchPath());
  //Cargar recursos
  menu = new Menu(this);
  PJOGL.setIcon("recursos/sakuraIcoWin.png");
  //Propiedades de la ventana principal
  anchoInicial = int((displayWidth/1.2f)); // 80% ANCHO
  altoInicial =  int((displayHeight/1.2f)); // 80% ALTO
  size(anchoInicial,altoInicial,P3D);
}

//Inicializa
void setup(){
  //Estado inicial del menu
  estadoMenu = EstadosMenu.PRINCIPAL;
  musicaSilenciada = false;
  //Configuracion ventana Principal
  surface.setTitle(tituloVentana);
  surface.setResizable(true);
  smooth();
  frameRate(60);
  menu.iniGUI();
  menu.setMusicaMenu(true);
  //Vista de Arboles 2D y 3D
  Arbol2D a2d = new Arbol2D();
  vista2D.addListener(a2d);
  Arbol3D a3d = new Arbol3D();
  vista3D.addListener(a3d);
  //Cerrar pantalla carga
  splash.cerrar();
}

//Bucle para dibujar
void draw(){
  //Dibuja dependiendo del estado
  background(0);
  //delay(800);
  switch(estadoMenu){
    case PRINCIPAL:
      menu.menuPrincipal();
    break;
    case AJUSTES:
      menu.menuAjustes();
    break;
    case ARBOL:
      menu.menuArbol();

    break;
    default:
      exit();
  }
  surface.setTitle(tituloVentana + " - FPS: " + frameRate);
  println("ESTADO MENU: " + estadoMenu);
}

//Eventos de teclas presionadas

void keyPressed(){
  //Teclas "especiales"
   if (key == CODED){
     //El codigo para teclas tipo ENTER va aqui
     
   }else{
  
     //Teclas "normales"
     if(key == 'p' || key == 'P'){
       estadoMenu = EstadosMenu.PRINCIPAL;
     }
     
     if(key == 'm' || key == 'M'){
       if(estadoMenu == EstadosMenu.PRINCIPAL || estadoMenu == EstadosMenu.AJUSTES)
         menu.setMusicaMenu(!menu.getEstadoMusicaMenu());
     }
     
   }
   
  println("Tecla Presionada: " + key);
}
