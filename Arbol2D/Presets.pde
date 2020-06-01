int numPreset = 20;
int numVariables = 21;

float[][] cargarPresets(){

  float[][] preset = new float[numPreset][numVariables];
  int selec = 0;
  
  // PRESET 1 - Árbol en crecimiento
  selec++;
  preset[selec][0] = 180; // tamMaximo
  preset[selec][1] = 5;   // tamMinimo
  preset[selec][2] = 6;   // numRamasMax
  preset[selec][3] = 4;   // numRamasMin
  preset[selec][4] = 35;  // anguloMax
  preset[selec][5] = 15;   // anguloMin
  preset[selec][6] = 0.6; // propTamMax
  preset[selec][7] = 0.3; // propTamMin
  preset[selec][8] = 1;   // propDespMax
  preset[selec][9] = 0.5; // propDespMin

  preset[selec][10] = 0; // tipo de Balance: 0 - Automático | 1 - Manual
  preset[selec][11] = 0; // indiceBalance
  preset[selec][12] = 0; // tipo grosor: 0 - Progresivo | 1 - Manual
  preset[selec][13] = 10; // grosorPrincipal
  preset[selec][14] = 0.7; // indiceGrosor
  preset[selec][15] = 0; // 0 = Escala Grises - 1 = RGB
  preset[selec][16] = 0.07; // Porcentaje umbral para cambiar de un color a otro
  preset[selec][17] = 255;// intensidadMaxHojaG
  preset[selec][18] = 160;// intensidadMinHojaG
  preset[selec][19] = 140;// intensidadMaxRamaG
  preset[selec][20] = 120;// intensidadMinRamaG
  
  // PRESET 2 - Árbol
   selec++;
  preset[selec][0] = 180; // tamMaximo
  preset[selec][1] = 5;   // tamMinimo
  preset[selec][2] = 5;   // numRamasMax
  preset[selec][3] = 3;   // numRamasMin
  preset[selec][4] = 20;  // anguloMax
  preset[selec][5] = 5;   // anguloMin
  preset[selec][6] = 0.8; // propTamMax
  preset[selec][7] = 0.4; // propTamMin
  preset[selec][8] = 1;   // propDespMax
  preset[selec][9] = 0.5; // propDespMin
  preset[selec][10] = 0; // tipo de Balance: 0 - Automático | 1 - Manual
  preset[selec][11] = 0; // indiceBalance
  preset[selec][12] = 0; // tipo grosor: 0 - Progresivo | 1 - Manual
  preset[selec][13] = 10; // grosorPrincipal
  preset[selec][14] = 0.7; // indiceGrosor
  preset[selec][15] = 0; // 0 = Escala Grises - 1 = RGB
  preset[selec][16] = 0.1; // Porcentaje umbral para cambiar de un color a otro
  preset[selec][17] = 255;// intensidadMaxHojaG
  preset[selec][18] = 160;// intensidadMinHojaG
  preset[selec][19] = 140;// intensidadMaxRamaG
  preset[selec][20] = 120;// intensidadMinRamaG
  
  // PRESET 3 - Árbol con ramas más abiertas
  selec++;
  preset[selec][0] = 180; // tamMaximo
  preset[selec][1] = 5;   // tamMinimo
  preset[selec][2] = 6;   // numRamasMax
  preset[selec][3] = 4;   // numRamasMin
  preset[selec][4] = 35;  // anguloMax
  preset[selec][5] = 15;   // anguloMin
  preset[selec][6] = 0.8; // propTamMax
  preset[selec][7] = 0.4; // propTamMin
  preset[selec][8] = 1;   // propDespMax
  preset[selec][9] = 0.55; // propDespMin
  preset[selec][10] = 0; // tipo de Balance: 0 - Automático | 1 - Manual
  preset[selec][11] = 0; // indiceBalance
  preset[selec][12] = 0; // tipo grosor: 0 - Progresivo | 1 - Manual
  preset[selec][13] = 10; // grosorPrincipal
  preset[selec][14] = 0.75; // indiceGrosor
  preset[selec][15] = 1; // 0 = Escala Grises - 1 = RGB
  preset[selec][16] = 0.125; // Porcentaje umbral para cambiar de un color a otro
  preset[selec][17] = 255;// intensidadMaxHojaG
  preset[selec][18] = 160;// intensidadMinHojaG
  preset[selec][19] = 140;// intensidadMaxRamaG
  preset[selec][20] = 120;// intensidadMinRamaG
  
  // PRESET 4 - Cerezo
  selec++;
  preset[selec][0] = 180; // tamMaximo
  preset[selec][1] = 5;   // tamMinimo
  preset[selec][2] = 6;   // numRamasMax
  preset[selec][3] = 4;   // numRamasMin
  preset[selec][4] = 35;  // anguloMax
  preset[selec][5] = 15;   // anguloMin
  preset[selec][6] = 0.8; // propTamMax
  preset[selec][7] = 0.4; // propTamMin
  preset[selec][8] = 1;   // propDespMax
  preset[selec][9] = 0.55; // propDespMin
  preset[selec][10] = 0; // tipo de Balance: 0 - Automático | 1 - Manual
  preset[selec][11] = 0; // indiceBalance
  preset[selec][12] = 0; // tipo grosor: 0 - Progresivo | 1 - Manual
  preset[selec][13] = 10; // grosorPrincipal
  preset[selec][14] = 0.75; // indiceGrosor
  preset[selec][15] = 1; // 0 = Escala Grises - 1 = RGB
  preset[selec][16] = 0.125; // Porcentaje umbral para cambiar de un color a otro
  preset[selec][17] = 255;// intensidadMaxHojaG
  preset[selec][18] = 160;// intensidadMinHojaG
  preset[selec][19] = 140;// intensidadMaxRamaG
  preset[selec][20] = 120;// intensidadMinRamaG
  
  // PRESET 4.5 - Raiz Cerezo
  selec++;
  preset[selec][0] = 60; // tamMaximo
  preset[selec][1] = 18;   // tamMinimo
  preset[selec][2] = 4;   // numRamasMax
  preset[selec][3] = 3;   // numRamasMin
  preset[selec][4] = 30;  // anguloMax
  preset[selec][5] = 15;   // anguloMin
  preset[selec][6] = 0.9; // propTamMax
  preset[selec][7] = 0.8; // propTamMin
  preset[selec][8] = 0.9;   // propDespMax
  preset[selec][9] = 0.5; // propDespMin
  preset[selec][10] = 0; // tipo de Balance: 0 - Automático | 1 - Manual
  preset[selec][11] = 0.5; // indiceBalance
  preset[selec][12] = 0; // tipo grosor: 0 - Progresivo | 1 - Manual
  preset[selec][13] = 10; // grosorPrincipal
  preset[selec][14] = 0.8; // indiceGrosor
  preset[selec][15] = 1; // 0 = Escala Grises - 1 = RGB
  preset[selec][16] = 0; // Porcentaje umbral para cambiar de un color a otro
  preset[selec][17] = 255;// intensidadMaxHojaG
  preset[selec][18] = 160;// intensidadMinHojaG
  preset[selec][19] = 140;// intensidadMaxRamaG
  preset[selec][20] = 120;// intensidadMinRamaG
  
  // PRESET 5 - Trigo
  selec++;
  preset[selec][0] = 180; // tamMaximo
  preset[selec][1] = 5;   // tamMinimo
  preset[selec][2] = 6;   // numRamasMax
  preset[selec][3] = 4;   // numRamasMin
  preset[selec][4] = 20;  // anguloMax
  preset[selec][5] = 5;   // anguloMin
  preset[selec][6] = 0.8; // propTamMax
  preset[selec][7] = 0.4; // propTamMin
  preset[selec][8] = 1;   // propDespMax
  preset[selec][9] = 0.55; // propDespMin
  preset[selec][10] = 1; // tipo de Balance: 0 - Automático | 1 - Manual
  preset[selec][11] = 1; // indiceBalance
  preset[selec][12] = 0; // tipo grosor: 0 - Progresivo | 1 - Manual
  preset[selec][13] = 6; // grosorPrincipal
  preset[selec][14] = 0.8; // indiceGrosor
  preset[selec][15] = 0; // 0 = Escala Grises - 1 = RGB
  preset[selec][16] = 0.125; // Porcentaje umbral para cambiar de un color a otro
  preset[selec][17] = 255;// intensidadMaxHojaG
  preset[selec][18] = 160;// intensidadMinHojaG
  preset[selec][19] = 140;// intensidadMaxRamaG
  preset[selec][20] = 120;// intensidadMinRamaG

  // PRESET 6 - Árbol Fiestero
  selec++;
  preset[selec][0] = 180; // tamMaximo
  preset[selec][1] = 5;   // tamMinimo
  preset[selec][2] = 6;   // numRamasMax
  preset[selec][3] = 4;   // numRamasMin
  preset[selec][4] = 50;  // anguloMax
  preset[selec][5] = 20;   // anguloMin
  preset[selec][6] = 0.75; // propTamMax
  preset[selec][7] = 0.5; // propTamMin
  preset[selec][8] = 1;   // propDespMax
  preset[selec][9] = 0.45; // propDespMin
  preset[selec][10] = 0; // tipo de Balance: 0 - Automático | 1 - Manual
  preset[selec][11] = 0.5; // indiceBalance
  preset[selec][12] = 0; // tipo grosor: 0 - Progresivo | 1 - Manual
  preset[selec][13] = 10; // grosorPrincipal
  preset[selec][14] = 0.75; // indiceGrosor
  preset[selec][15] = 1; // 0 = Escala Grises - 1 = RGB
  preset[selec][16] = 0.1; // Porcentaje umbral para cambiar de un color a otro
  preset[selec][17] = 255;// intensidadMaxHojaG
  preset[selec][18] = 160;// intensidadMinHojaG
  preset[selec][19] = 140;// intensidadMaxRamaG
  preset[selec][20] = 120;// intensidadMinRamaG
  
  // PRESET 7 - Pino
  selec++;
  preset[selec][0] = 400; // tamMaximo
  preset[selec][1] = 10;   // tamMinimo
  preset[selec][2] = 25;   // numRamasMax
  preset[selec][3] = 20;   // numRamasMin
  preset[selec][4] = 15;  // anguloMax
  preset[selec][5] = 5;   // anguloMin
  preset[selec][6] = 0.45; // propTamMax
  preset[selec][7] = 0.3; // propTamMin
  preset[selec][8] = 1;   // propDespMax
  preset[selec][9] = 0.4; // propDespMin
  preset[selec][10] = 0; // tipo de Balance: 0 - Automático | 1 - Manual
  preset[selec][11] = 0.5; // indiceBalance
  preset[selec][12] = 0; // tipo grosor: 0 - Progresivo | 1 - Manual
  preset[selec][13] = 10; // grosorPrincipal
  preset[selec][14] = 0.5; // indiceGrosor
  preset[selec][15] = 1; // 0 = Escala Grises - 1 = RGB
  preset[selec][16] = 0.125; // Porcentaje umbral para cambiar de un color a otro
  preset[selec][17] = 255;// intensidadMaxHojaG
  preset[selec][18] = 160;// intensidadMinHojaG
  preset[selec][19] = 140;// intensidadMaxRamaG
  preset[selec][20] = 120;// intensidadMinRamaG
  
  // PRESET 3 - Tronco
  selec++;
  preset[selec][0] = 500;   // tamMaximo
  preset[selec][1] = 200;   // tamMinimo
  preset[selec][2] = 15;   // numRamasMax
  preset[selec][3] = 12;   // numRamasMin
  preset[selec][4] = 85;  // anguloMax
  preset[selec][5] = 60;   // anguloMin
  preset[selec][6] = 0.6; // propTamMax
  preset[selec][7] = 0.4; // propTamMin
  preset[selec][8] = 0.8;   // propDespMax
  preset[selec][9] = 0.4; // propDespMin
  preset[selec][10] = 255;// intensidadMax
  preset[selec][11] = 255;// intensidadMin
  preset[selec][12] = 0; // Tipo de Balance: 0 - Automático | 1 - Manual
  preset[selec][13] = 0; // IndiceBalance
  
  
  // PRESET 4 - Fractal 1
  selec++;
  preset[selec][0] = 200; // tamMaximo
  preset[selec][1] = 2;   // tamMinimo
  preset[selec][2] = 2;   // numRamasMax
  preset[selec][3] = 2;   // numRamasMin
  preset[selec][4] = 65;  // anguloMax
  preset[selec][5] = 65;   // anguloMin
  preset[selec][6] = 0.7; // propTamMax
  preset[selec][7] = 0.7; // propTamMin
  preset[selec][8] = 1;   // propDespMax
  preset[selec][9] = 1; // propDespMin
  preset[selec][10] = 255;// intensidadMax
  preset[selec][11] = 255;// intensidadMin
  preset[selec][12] = 0; // Tipo de Balance: 0 - Automático | 1 - Manual
  preset[selec][13] = 0;  // IndiceBalance

  
  // PRESET 5 - Fractal 2
  selec++;
  preset[selec][0] = 400; // tamMaximo
  preset[selec][1] = 3;   // tamMinimo
  preset[selec][2] = 2;   // numRamasMax
  preset[selec][3] = 2;   // numRamasMin
  preset[selec][4] = 135;  // anguloMax
  preset[selec][5] = 135;   // anguloMin
  preset[selec][6] = 0.7; // propTamMax
  preset[selec][7] = 0.7; // propTamMin
  preset[selec][8] = 1;   // propDespMax
  preset[selec][9] = 1; // propDespMin
  preset[selec][10] = 255;// intensidadMax
  preset[selec][11] = 255;// intensidadMin
  preset[selec][12] = 0; // Tipo de Balance: 0 - Automático | 1 - Manual
  preset[selec][13] = 0;  // IndiceBalance
 
  
  return preset;
}

int[][] cargarPresetsColores(){
  int[][] presetColor = new int[numPreset][12];
  int selec = 0;
  
  // PRESET 0
  
  // PRESET 1
  selec++;
  presetColor[selec][0] = 70; // Hoja máximo R
  presetColor[selec][1] = 5; // Hoja mínimo R
  presetColor[selec][2] = 200; // Hoja máximo G
  presetColor[selec][3] = 97; // Hoja mínimo G
  presetColor[selec][4] = 79; // Hoja máximo B
  presetColor[selec][5] = 12; // Hoja mínimo B
  presetColor[selec][6] = 191; // Rama máximo R
  presetColor[selec][7] = 142; // Rama mínimo R
  presetColor[selec][8] = 110; // Rama máximo G
  presetColor[selec][9] = 82; // Rama mínimo G
  presetColor[selec][10] = 24; // Rama máximo B 
  presetColor[selec][11] = 18; // Rama mínimo B
  
  // PRESET 2
  selec++;
  presetColor[selec][0] = 70; // Hoja máximo R
  presetColor[selec][1] = 5; // Hoja mínimo R
  presetColor[selec][2] = 200; // Hoja máximo G
  presetColor[selec][3] = 97; // Hoja mínimo G
  presetColor[selec][4] = 79; // Hoja máximo B
  presetColor[selec][5] = 12; // Hoja mínimo B
  presetColor[selec][6] = 125; // Rama máximo R
  presetColor[selec][7] = 100; // Rama mínimo R
  presetColor[selec][8] = 79; // Rama máximo G
  presetColor[selec][9] = 64; // Rama mínimo G
  presetColor[selec][10] = 0; // Rama máximo B 
  presetColor[selec][11] = 0; // Rama mínimo B
  
  // PRESET 3
  selec++;
  presetColor[selec][0] = 70; // Hoja máximo R
  presetColor[selec][1] = 5; // Hoja mínimo R
  presetColor[selec][2] = 200; // Hoja máximo G
  presetColor[selec][3] = 97; // Hoja mínimo G
  presetColor[selec][4] = 79; // Hoja máximo B
  presetColor[selec][5] = 12; // Hoja mínimo B
  presetColor[selec][6] = 125; // Rama máximo R
  presetColor[selec][7] = 100; // Rama mínimo R
  presetColor[selec][8] = 79; // Rama máximo G
  presetColor[selec][9] = 64; // Rama mínimo G
  presetColor[selec][10] = 0; // Rama máximo B 
  presetColor[selec][11] = 0; // Rama mínimo B
  
  // PRESET 4
  selec++;
  presetColor[selec][0] = 255; // Hoja máximo R
  presetColor[selec][1] = 237; // Hoja mínimo R
  presetColor[selec][2] = 214; // Hoja máximo G
  presetColor[selec][3] = 156; // Hoja mínimo G
  presetColor[selec][4] = 245; // Hoja máximo B
  presetColor[selec][5] = 217; // Hoja mínimo B
  presetColor[selec][6] = 80; // Rama máximo R
  presetColor[selec][7] = 65; // Rama mínimo R
  presetColor[selec][8] = 56; // Rama máximo G
  presetColor[selec][9] = 56; // Rama mínimo G
  presetColor[selec][10] = 60; // Rama máximo B 
  presetColor[selec][11] = 29; // Rama mínimo B
  
  // PRESET 4.5
  selec++;
  presetColor[selec][0] = 255; // Hoja máximo R
  presetColor[selec][1] = 237; // Hoja mínimo R
  presetColor[selec][2] = 214; // Hoja máximo G
  presetColor[selec][3] = 156; // Hoja mínimo G
  presetColor[selec][4] = 245; // Hoja máximo B
  presetColor[selec][5] = 217; // Hoja mínimo B
  presetColor[selec][6] = 80; // Rama máximo R
  presetColor[selec][7] = 65; // Rama mínimo R
  presetColor[selec][8] = 56; // Rama máximo G
  presetColor[selec][9] = 56; // Rama mínimo G
  presetColor[selec][10] = 60; // Rama máximo B 
  presetColor[selec][11] = 29; // Rama mínimo B
  
  // PRESET 5
  selec++;
  presetColor[selec][0] = 255; // Hoja máximo R
  presetColor[selec][1] = 255; // Hoja mínimo R
  presetColor[selec][2] = 240; // Hoja máximo G
  presetColor[selec][3] = 222; // Hoja mínimo G
  presetColor[selec][4] = 159; // Hoja máximo B
  presetColor[selec][5] = 36; // Hoja mínimo B
  presetColor[selec][6] = 255; // Rama máximo R
  presetColor[selec][7] = 240; // Rama mínimo R
  presetColor[selec][8] = 222; // Rama máximo G
  presetColor[selec][9] = 200; // Rama mínimo G
  presetColor[selec][10] = 50; // Rama máximo B 
  presetColor[selec][11] = 36; // Rama mínimo B
  
  // PRESET 6
  selec++;
  presetColor[selec][0] = 255; // Hoja máximo R
  presetColor[selec][1] = 0; // Hoja mínimo R
  presetColor[selec][2] = 255; // Hoja máximo G
  presetColor[selec][3] = 0; // Hoja mínimo G
  presetColor[selec][4] = 255; // Hoja máximo B
  presetColor[selec][5] = 0; // Hoja mínimo B
  presetColor[selec][6] = 80; // Rama máximo R
  presetColor[selec][7] = 65; // Rama mínimo R
  presetColor[selec][8] = 56; // Rama máximo G
  presetColor[selec][9] = 56; // Rama mínimo G
  presetColor[selec][10] = 60; // Rama máximo B 
  presetColor[selec][11] = 29; // Rama mínimo B
  
  // PRESET 7
  selec++;
  presetColor[selec][0] = 100; // Hoja máximo R
  presetColor[selec][1] = 96; // Hoja mínimo R
  presetColor[selec][2] = 255; // Hoja máximo G
  presetColor[selec][3] = 170; // Hoja mínimo G
  presetColor[selec][4] = 40; // Hoja máximo B
  presetColor[selec][5] = 20; // Hoja mínimo B
  presetColor[selec][6] = 80; // Rama máximo R
  presetColor[selec][7] = 65; // Rama mínimo R
  presetColor[selec][8] = 56; // Rama máximo G
  presetColor[selec][9] = 56; // Rama mínimo G
  presetColor[selec][10] = 40; // Rama máximo B 
  presetColor[selec][11] = 29; // Rama mínimo B
  
  return presetColor;
}
