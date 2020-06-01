int[] calculaDireccionAutomatico(int balance) {
   int dir;
   int direccion = 1;
   float auxRandom = random(0,1);
   int[] datos = new int[2];
   
   if(auxRandom<=0.5)
     dir = 1; 
   else
     dir = -1; 
   
   // Comprobamos el estado del árbol
   if(balance <= -direccion && dir == -1)
     dir = 1;
     
   if(balance >= direccion && dir == 1)
     dir = -1;
     
   // Añadimos el valor al valance del árbol
   balance = balance + dir;
   
   datos[0] = dir;
   datos[1] = balance;
   
   return datos;
}

int calculaDireccionManual(float indice) {
   int dir;
   float auxRandom = random(0,1);
   
   if(auxRandom<=indice)
     dir = 1; 
   else
     dir = -1; 
   
   return dir;
}
