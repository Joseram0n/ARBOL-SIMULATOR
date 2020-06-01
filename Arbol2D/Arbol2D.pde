float tamMaximo; //Tamaño de la rama principal(Número de píxeles)
float tamMinimo; //Tamaño mínimo que debe tener una rama
int numRamasMax; // Número difurcaciones de una rama máximo
int numRamasMin; // Número difurcaciones de una rama mínimo
float anguloMax; // Ángulo de rotación máximo
float anguloMin; // Ángulo de rotación mínimo
float propTamMax; // Proporción de tamaño máxima
float propTamMin; // Proporción de tamaño mínima
float propDespMax; // Proporción de desplazamiento máxima
float propDespMin; // Proporción de desplazamiento mínima

float tipoBalance; // 0 = Automático - 1 = Manual
float indiceBalance; // LEER DESCRIPCIÓN - Valor entre 0 y 1 que especifica la probabilidad de dirección (tipoBalance DEBE ESTAR EN MODO MANUAL)
float tipoGrosor; // 0 = Progresivo - 1 = Manual
float grosorInicial; // Anchura de la rama principal
float indiceGrosor; // Valor entre 0 y 1 que indica la reducción del grosor sobre la rama anterior
float tipoColor; // 0 = Escala Grises - 1 = RGB
float umbralRamaHoja; // Porcentaje umbral para cambiar de un color a otro

// -- COLORES --
// ESCALA DE GRISES
float colorMaxHojaI; // Color de intensidad máximo de una hoja en escala de grises
float colorMinHojaI; // Color de intensidad mínimo de una hoja en escala de grises
float colorMaxRamaI; // Color de intensidad máximo de una rama en escala de grises
float colorMinRamaI; // Color de intensidad máximo de una rama en escala de grises
// RGB
int colorMaxHojaR; // Color de intensidad máximo de una hoja en R
int colorMinHojaR; // Color de intensidad mínimo de una hoja en R
int colorMaxHojaG; // Color de intensidad máximo de una hoja en G
int colorMinHojaG; // Color de intensidad mínimo de una hoja en G
int colorMaxHojaB; // Color de intensidad máximo de una hoja en B
int colorMinHojaB; // Color de intensidad mínimo de una hoja en B

int colorMaxRamaR; // Color de intensidad máximo de una rama en R
int colorMinRamaR; // Color de intensidad mínimo de una rama en R
int colorMaxRamaG; // Color de intensidad máximo de una rama en G
int colorMinRamaG; // Color de intensidad mínimo de una rama en G
int colorMaxRamaB; // Color de intensidad máximo de una rama en B
int colorMinRamaB; // Color de intensidad mínimo de una rama en B




// DESCRIPCIÓN SOBRE EL INDICE DE BALANCE
// Este índice representa las probabilidades que tiene una nueva rama de aparecer a la izquierda o derecha de la rama actual. Este valor debe estar entre 0 y 1.
// Ejemplo: si el índice tiene valor 1, como resultado se obtendrá plantas con todas las ramas hacia la derecha. Por otro lado, si se fija en 0.5, se obtendrá un
// árbol más o menos balanceado ya que la probabilidad para que aparezca una rama a izquierda o derecha es igual para ambas

float preset[][]; // Variable donde cargaremos configuraciones ya creadas
int presetColor[][];  // Variables donde guardaremos los colores de cada preset

PImage fondo; // Imagen de fondo

//CONSTANTES

int TAMANO = 0;
int DESPLAZAMIENTO = 1;
int ANGULO = 2;
int DIRECCION = 3;

void setup(){
   size(800,700); 
   
   
   
  background(50);
  frameRate(10);
  strokeWeight(1);
  stroke(255);

  preset = cargarPresets();
  presetColor = cargarPresetsColores();
  
  int selec = 2;
  selecPreset(selec);
  
  //fondo = loadImage("Fondo.jpg");
  //fondo.resize(width,height);

}

void selecPreset(int selec){
  
  tamMaximo = preset[selec][0]; 
  tamMinimo = preset[selec][1];
  numRamasMax = int(preset[selec][2]);
  numRamasMin = int(preset[selec][3]);
  anguloMax = preset[selec][4]; // Ángulo de rotación máximo
  anguloMin = preset[selec][5]; // Ángulo de rotación mínimo
  propTamMax = preset[selec][6]; // El tamaño máximo de una rama generada por otra ser de un 80% el tamaño de la anterior
  propTamMin = preset[selec][7]; // El tamaño máximo de una rama generada por otra ser de un 40% el tamaño de la anterior
  propDespMax = preset[selec][8]; // El cantidad de desplazamiento máximo en una rama. 1 te posiciona en la punta de la rama, 0 en la base
  propDespMin = preset[selec][9]; // El cantidad de desplazamiento máximo en una rama. 1 te posiciona en la punta de la rama, 0 en la base
  
  tipoBalance = preset[selec][10]; // 0 = Automático - 1 = Manual
  indiceBalance = preset[selec][11]; // Especifica la probabilidad de dirección
  tipoGrosor = preset[selec][12]; // 0 = Progresivo - 1 = Manual
  grosorInicial = preset[selec][13]; // Anchura de la rama principal
  indiceGrosor = preset[selec][14];
  tipoColor = preset[selec][15]; // 0 = Escala Grises - 1 = RGB
  umbralRamaHoja = preset[selec][16]; // Porcentaje umbral para cambiar de un color a otro
  // -- COLORES --
  // ESCALA DE GRISES
  colorMaxHojaI = preset[selec][17]; // Color de intensidad máximo
  colorMinHojaI = preset[selec][18]; // Color de intensidad mínimo
  colorMaxRamaI = preset[selec][19]; // Color de intensidad máximo de una rama en escala de grises
  colorMinRamaI = preset[selec][20]; // Color de intensidad máximo de una rama en escala de grises
  // RGB
  colorMaxHojaR = presetColor[selec][0];
  colorMinHojaR = presetColor[selec][1];
  colorMaxHojaG = presetColor[selec][2];
  colorMinHojaG = presetColor[selec][3];
  colorMaxHojaB = presetColor[selec][4];
  colorMinHojaB = presetColor[selec][5];
  
  colorMaxRamaR = presetColor[selec][6];
  colorMinRamaR = presetColor[selec][7];
  colorMaxRamaG = presetColor[selec][8];
  colorMinRamaG = presetColor[selec][9];
  colorMaxRamaB = presetColor[selec][10];
  colorMinRamaB = presetColor[selec][11];
}

void draw(){
    
    if(tipoColor == 1) 
      background(100);
    else
      background(40,123,137);
    
    //int[] colorRect = new int[3];
    //colorRect[0] = 123;
    //colorRect[1] = 230;
    //colorRect[2] = 252;
   // stroke(colorRect[0],colorRect[1],colorRect[2]);
   // fill(colorRect[0],colorRect[1],colorRect[2]);
   // rect(width/4,height/2.2,width/2,height/2,10);
    //background(50,100,255);
    //background(fondo);
    
    //----Solo arbol----
    translate(width/2,height-50);
    rama(tamMaximo,0,grosorInicial);
    
    //----Arbol raiz
    //translate(width/2,height-180);
    //selecPreset(4);
    //rama(tamMaximo,0,grosorPrincipal);
    //selecPreset(5);
    //rotate(radians(180));
    //rama(tamMaximo,0,grosorPrincipal);
    
    delay(2000);
}    

void rama(float tam, int bal, float gro){
  
  if(tam > tamMinimo){
    
    // 0.- CREAMOS VARIABLES
    int balance = bal; // Guarda el balance de la rama
    int[] datosDir; // Variable que almacenará la dirección de la rama y el balance de la rama (BALANCE MODO AUTOMÁTICO)
    int dir; // Variable que almacenará la dirección de la rama (BALANCE MODO MANUAL)
    int nuevoGrosor = -1;
    boolean puntaCheck = false; // Comprueba si alguna de las nuevas ramas está en el punto de desplazamiento máximo
    
    // 1.- CALCULAMOS LAS CARACTERÍSTICAS DE LA RAMA
    
    // 1.1- GROSOR DEL ÁRBOL
    strokeWeight(gro);
    
    // 1.2.- CALCULAMOS EL GROSOR QUE TENDRÁ LAS SIGUIENTES RAMAS
    nuevoGrosor = int(indiceGrosor*gro);
    if(nuevoGrosor <= 0)
       nuevoGrosor = 1;

    
    // 1.3.- CALCULAMOS EL COLOR DE LA RAMA O HOJA
    if(tipoColor == 0){ // Vemos que tipo de color tiene el árbol
       if(tam<=tamMaximo*umbralRamaHoja)  // Comprobamos si tamaño el tamaño de la rama coincide con el de una hoja
         stroke(random(colorMinHojaI,colorMaxHojaI)); // Seleccionamos el color de la hoja
       else
         stroke(random(colorMinRamaI,colorMaxRamaI)); // Seleccionamos el color de la rama
    }else{
      if(tam<=tamMaximo*umbralRamaHoja)  // Comprobamos si tamaño el tamaño de la rama coincide con el de una hoja
        stroke(random(colorMinHojaR,colorMaxHojaR),random(colorMinHojaG,colorMaxHojaG),random(colorMinHojaB,colorMaxHojaB));
      else
        stroke(random(colorMinRamaR,colorMaxRamaR),random(colorMinRamaG,colorMaxRamaG),random(colorMinRamaB,colorMaxRamaB));
    }
    
    // 1.4.- PINTAMOS LA RAMA
    line(0,0,0,-1*tam); //Dibuja una línea del tamaño de t
    

    
    // 2.- CALCULAMOS EL NÚMERO DE RAMIFICACIONES
    int numR = int(random(numRamasMin,numRamasMax));
    
    // 3.- CALCULAMOS EL TAMAÑO DE CADA RAMA ASÍ COMO SU POSICIÓN, ÁNGULO Y ORIENTACIÓN
    float[][] stats = new float[numR][4];
    
    for(int i=0;i<numR;i++){
       // Generamos el tamaño
       stats[i][TAMANO] = tam*random(propTamMin,propTamMax);
       
       // Generamos el desplazamiento
       stats[i][DESPLAZAMIENTO] = tam*random(propDespMin,propDespMax);
         
         // Guardamos si se ha creado una rama en el punto de desplazamiento máximo
         if(stats[i][DESPLAZAMIENTO] == propDespMax)
           puntaCheck = true;
         
         // Comprobamos que al menos una rama nueva esté localizada en la punta de la rama actual
         if(i == numR-1 && puntaCheck == false)
           stats[i][DESPLAZAMIENTO] = tam*propDespMax;
       
       // Generamos el ángulo 
       stats[i][ANGULO] = radians(random(anguloMin,anguloMax));
       
       // Generamos la dirección
       if(tipoBalance == 0){ // Comprobamos en que modo de balanceo estamos
         datosDir = calculaDireccionAutomatico(balance);
         balance = datosDir[1]; // Guardamos como se encuentra el balance en la rama
         stats[i][DIRECCION] = float(datosDir[0]); // Guardamos la dirección
       }else{
         dir = calculaDireccionManual(indiceBalance);
         stats[i][DIRECCION] = float(dir); // Guardamos la dirección
       }
       
       // 4.- LLAMADA RECURSIVA
       pushMatrix(); // Guarda el estado actual de la transformación(donde estamos ahora)
       
       translate(0,-stats[i][DESPLAZAMIENTO]); // Nos posicionamos en la rama para generar una nueva
       rotate(stats[i][DIRECCION]*stats[i][ANGULO]); // Rotamos en función del ángulo pasado por parámetro y la dirección
       rama(stats[i][TAMANO],0,nuevoGrosor);
       
       popMatrix();
    }
  }
}
