
//Clase que maneja lo relacionado con los menus
public class Menu{
  //Variables para el menu
  PApplet ventanaPadre;
  PImage bgMenuPrincipal,bgMenuAjustes;
  SoundFile musicaMP;
  float volumenMusica;
  boolean estadoMusica;
  int alto;
  int ancho;
  EstadosMenu ultimoEstadoMenu;
  //Variables G4P
  GButton botonEmpezar;
  GButton botonSalir;
  GButton botonAjustes;
  GTextArea menuInfo; 
  GSlider sliderMusica; 
  GLabel etiquetaVolumen;
  GButton botonVolverAjustes;
  GLabel etiquetaModo;
  GDropList dlModo;
  String ultimoModo,modoActual;
  
  //Construcor que cargara todos los recursos necesarios
  public Menu(PApplet ventanaPadre){
    this.ventanaPadre = ventanaPadre;
    bgMenuPrincipal = loadImage("recursos/FondoTest.png");
    bgMenuAjustes = loadImage("recursos/MenuAjustes.jpg");
    
    musicaMP = new SoundFile(ventanaPadre, "recursos/MusicaTest.mp3");
    estadoMusica = false;
    //Ajustes de la libreria G4P
    G4P.messagesEnabled(false);
    G4P.setGlobalColorScheme(GCScheme.GOLD_SCHEME);
    G4P.setMouseOverEnabled(false);
  }
  
  //Inicializa elementos en el setup
  public void iniGUI(){
    //Obtener el alto y ancho de la ventana
    ancho = width;
    alto = height;
    //redimensionar background
    bgMenuPrincipal.resize(width,height);
    bgMenuPrincipal.filter(BLUR,2);
    bgMenuAjustes.resize(width,height);
    bgMenuAjustes.filter(BLUR,2);
    //Volumen Musica
    volumenMusica = 0.05f;
    musicaMP.amp(volumenMusica);
    //Estado
    ultimoEstadoMenu = EstadosMenu.PRINCIPAL;
    ultimoModo = "2D";
    //----Elementos de interfaz G4P----
    //*********** MENU PRINCIPAL ***********
    //Boton de Empezar
    botonEmpezar = new GButton(ventanaPadre, width/5, height/2-40, 80, 40, "Empezar");
    botonEmpezar.setLocalColorScheme(GCScheme.GREEN_SCHEME);
    botonEmpezar.addEventHandler(this, "empezar");
    //Boton Ajustes
    botonAjustes = new GButton(ventanaPadre, width/5, height/2+10, 80, 40, "Ajustes");
    botonAjustes.addEventHandler(this, "mostrarAjustes");
    botonAjustes.setLocalColorScheme(GCScheme.CYAN_SCHEME);
    //Boton Salir
    botonSalir = new GButton(ventanaPadre, width/5, height/2+60, 80, 40, "Salir");
    botonSalir.setLocalColorScheme(GCScheme.RED_SCHEME);
    botonSalir.addEventHandler(this, "cerrarVentana");
    //Info menu
    menuInfo = new GTextArea(ventanaPadre, width/1.7, height/6, width/2.6, height/1.3, G4P.SCROLLBARS_VERTICAL_ONLY | G4P.SCROLLBARS_AUTOHIDE);
    menuInfo.setText(cargaInfoTxt("recursos/info.txt"));
    menuInfo.setPromptText("Algo Salio Mal.");
    menuInfo.setOpaque(false);
    menuInfo.setTextEditEnabled(false);
    //menuInfo.addStyle(G4P.BACKGROUND, new Color(255,255,255,100), 0, 0, 100);
    for(int i = 0;i < menuInfo.getTextAsArray().length;i++){
          menuInfo.addStyle(G4P.FOREGROUND, new Color(0, 0, 0), i);
    }
    menuInfo.setLocalColor(7, color(180,110));
    Font f = new Font("Arial", Font.BOLD, 16);
    menuInfo.setFont(f);
    
    //Ocultar elementos
    //botonEmpezar.setVisible(false);
    //botonAjustes.setVisible(false);
    //botonSalir.setVisible(false);
    //menuInfo.setVisible(false);
    
    //*********** MENU AJUSTES ***********
    //Etiqueta Volumen
    etiquetaVolumen = new GLabel(ventanaPadre, width/10, 20, 150, 40);
    etiquetaVolumen.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    etiquetaVolumen.setText("Volumen Musica:");
    etiquetaVolumen.setLocalColorScheme(GCScheme.RED_SCHEME);
    etiquetaVolumen.setFont(new Font("Monospaced", Font.PLAIN, 16));
    etiquetaVolumen.setOpaque(false);
    //Slider de volumen
    sliderMusica = new GSlider(ventanaPadre, width/10, 60, 150, 50, 10.0);
    sliderMusica.setShowValue(true);
    sliderMusica.setShowLimits(true);
    sliderMusica.setLimits(0.05, 0.0, 1.0);
    sliderMusica.setStickToTicks(false);
    sliderMusica.setShowTicks(true);
    sliderMusica.setNumberFormat(G4P.DECIMAL, 3);
    sliderMusica.setOpaque(false);
    sliderMusica.addEventHandler(this,"cambiarVolumen");
    //Boton Volver
    botonVolverAjustes = new GButton(ventanaPadre, width/10, height-60, 80, 40, "Volver");
    botonVolverAjustes.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
    botonVolverAjustes.addEventHandler(this, "volverMenu");
    //Ocultar elementos
    etiquetaVolumen.setVisible(false);
    sliderMusica.setVisible(false);
    botonVolverAjustes.setVisible(false);
    //*********** MENU ARBOL ***********
    etiquetaModo = new GLabel(ventanaPadre, 10, 20, 80, 40,"Modo:");
    etiquetaModo.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    etiquetaModo.setFont(new Font("Monospaced", Font.PLAIN, 16));
    etiquetaModo.setOpaque(false);
    dlModo = new GDropList(ventanaPadre, etiquetaModo.getX()+80, etiquetaModo.getY()+12, 50, 80, 3, 20);
    dlModo.setItems(new String[] {"2D","3D"}, 0);
    dlModo.addEventHandler(this, "dropList1_click1");
    dlModo.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    vista3D = new GView(ventanaPadre, width/3, 0, (width - width/3), height, P3D);
    vista2D = new GView(ventanaPadre, width/3, 0, (width - width/3), height, P2D);
    //Ocultar elementos
    etiquetaModo.setVisible(false);
    dlModo.setVisible(false);
    vista3D.setVisible(false);
    vista2D.setVisible(false);
    
  }
  
  // ========= Metodos de utilidad ===============
  
  boolean dimensionCambiada(){
    if(ancho != width && alto != height){
      ancho = width;
      alto = height;
      return true;
    }
    else{
      return false;
    }     
  }
  
  public void setMusicaMenu(boolean musica){
    //Musica de fondo
    if(musica == true){
      musicaMP.loop();
      estadoMusica = true;
    }else{
      musicaMP.stop();
      estadoMusica = false;
    }
  }
  
  public boolean getEstadoMusicaMenu(){
    return estadoMusica;
  }
  //Carga informacion desde un fichero y añade info de la GPU
  private String cargaInfoTxt(String infoUrl){
    StringBuilder str = new StringBuilder();
    String[] txtArray = loadStrings(infoUrl);
    for(int i = 0;i < txtArray.length;i++){
      str.append(txtArray[i]+"\n");
    }
    str.append("\n\n");
    str.append("\n===[ GPU INFO ]===\n");
    str.append("\nOPENGL_VENDOR: " + PGraphicsOpenGL.OPENGL_VENDOR);
    str.append("\nOPENGL_RENDERER: " + PGraphicsOpenGL.OPENGL_RENDERER);
    str.append("\nOPENGL_VERSION: " + PGraphicsOpenGL.OPENGL_VERSION);
    str.append("\nGLSL_VERSION: " + PGraphicsOpenGL.GLSL_VERSION);
    str.append("\n===[ CARACTERISTICAS SOPORTADAS ]===\n");
    str.append("\nanisoSamplingSupported: " + PGraphicsOpenGL.anisoSamplingSupported);
    str.append("\nautoMipmapGenSupported: " + PGraphicsOpenGL.autoMipmapGenSupported);
    str.append("\nblendEqSupported: " + PGraphicsOpenGL.blendEqSupported);
    str.append("\nfboMultisampleSupported: " + PGraphicsOpenGL.fboMultisampleSupported);
    str.append("\nnpotTexSupported: " + PGraphicsOpenGL.npotTexSupported);
    str.append("\npackedDepthStencilSupported: " + PGraphicsOpenGL.packedDepthStencilSupported);
    str.append("\nmaxSamples: " + PGraphicsOpenGL.maxSamples);
    str.append("\nmaxTextureSize: " + PGraphicsOpenGL.maxTextureSize);
    return str.toString();
  }
  // Actualiza la visibilidad de los componentes de la interfaz
  public void actualizarVisibilidadInterfaz(){
    if(ultimoEstadoMenu != estadoMenu){
      //Ocultar elementos de GUI anterior
      switch(ultimoEstadoMenu){
        case PRINCIPAL: mostrarElemetosPrincipal(false);
        break;
        case AJUSTES: mostrarElemetosAjustes(false);
        break;
        case ARBOL: mostrarElementosArbol(false);
        break;
      }
      //Mostrar los elemntos de GUI actuales
      switch(estadoMenu){
        case PRINCIPAL: mostrarElemetosPrincipal(true);
        break;
        case AJUSTES: mostrarElemetosAjustes(true);
        break;
        case ARBOL: mostrarElementosArbol(true);
        break;
      }
      
      ultimoEstadoMenu = estadoMenu;
    }
  }
  
  
  // ========= MENU PRINCIPAL ===========
  public void menuPrincipal(){
    
    actualizarVisibilidadInterfaz();
    
    if(dimensionCambiada() == true){
        bgMenuPrincipal.resize(width,height);
        botonEmpezar.moveTo(width/5, height/2-40);
        botonAjustes.moveTo(width/5, height/2+10);
        botonSalir.moveTo(width/5, height/2+60);
        menuInfo.moveTo(width/1.7,height/6);
     }
      
     background(bgMenuPrincipal);

  }
  
  private void mostrarElemetosPrincipal(boolean activar){
      botonEmpezar.setVisible(activar);
      botonAjustes.setVisible(activar);
      botonSalir.setVisible(activar);
      menuInfo.setVisible(activar);
  }
  
  // ========= MENU AJUSTES =========
  
  public void menuAjustes(){
    
    actualizarVisibilidadInterfaz();
    
    if(dimensionCambiada() == true){
      bgMenuAjustes.resize(width,height);
      etiquetaVolumen.moveTo(width/10, 20);
      sliderMusica.moveTo(width/10, 60);
      botonVolverAjustes.moveTo(width/10, height-60);
    }
      
    background(bgMenuAjustes);
      
 }
 
   private void mostrarElemetosAjustes(boolean activar){
      etiquetaVolumen.setVisible(activar);
      sliderMusica.setVisible(activar);
      botonVolverAjustes.setVisible(activar);
  }
    
  // ========= MENU ARBOL ==========
  
  public void menuArbol(){
    
    modoActual = dlModo.getSelectedText();
    
    actualizarVisibilidadInterfaz();
    
    if(dimensionCambiada() == true){
      bgMenuAjustes.resize(width,height);
      //redimensionar vistas
      vista3D = new GView(ventanaPadre, width/3, 0, (width - width/3), height, P3D);
      vista2D = new GView(ventanaPadre, width/3, 0, (width - width/3), height, P2D);

    }
    
    background(60);
    
    if(modoActual != ultimoModo){
      if(modoActual == "2D"){
        vista2D.setVisible(true);
        vista3D.setVisible(false);
      }else{
        vista2D.setVisible(false);
        vista3D.setVisible(true);
      }
      ultimoModo = modoActual;
    }    
 }
 
   private void mostrarElementosArbol(boolean activar){
     etiquetaModo.setVisible(activar);
     dlModo.setVisible(activar);
     
     if(activar == false){
       if(vista3D.isVisible());
         vista3D.setVisible(false);
       if(vista2D.isVisible());
         vista2D.setVisible(false);
     }else{
       if(modoActual == "2D")
         vista2D.setVisible(true);
       else
         vista3D.setVisible(true);
     }
  }
      

  
  // ========= EVENTOS DE LOS ELEMENTOS ========
  
  //%%%%%%%%%%%%%%%%%% MENU PRINCIPAL %%%%%%%%%%%%%%%%%%%%%
  public void cerrarVentana(GButton source, GEvent event) {
    //Cierra el programa
    println("Salir - GButton >> GEvent." + event + " @ " + millis());
    exit();
  }
  
  public void empezar(GButton source, GEvent event) {
    //Pasa al estado ARBOL 
    if(estadoMusica == true) //Desctivar musica
      setMusicaMenu(false);
    estadoMenu = EstadosMenu.ARBOL;
    println("Empezar - GButton >> GEvent." + event + " @ " + millis());
  }
  
  public void mostrarAjustes(GButton source, GEvent event) {
    //Pasa al estado AJUSTES
    estadoMenu = EstadosMenu.AJUSTES; 
    println("Ajustes - GButton >> GEvent." + event + " @ " + millis());
  }
   
    //%%%%%%%%%%%%%%%%%% MENU AJUSTES %%%%%%%%%%%%%%%%%%%%%
    public void cambiarVolumen(GSlider source, GEvent event) { 
      volumenMusica = sliderMusica.getValueF();
      musicaMP.amp(volumenMusica);
      println("SldVolumenMS - GSlider >> GEvent." + event + " @ " + millis());
    }
    
    public void volverMenu(GButton source, GEvent event) { 
      estadoMenu = EstadosMenu.PRINCIPAL; 
      println("SldVolumenMS - GSlider >> GEvent." + event + " @ " + millis());
    } 
    
    //%%%%%%%%%%%%%%%%%% MENU ARBOL %%%%%%%%%%%%%%%%%%%%%

  
}
