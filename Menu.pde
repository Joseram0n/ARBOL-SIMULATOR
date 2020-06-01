import java.util.ArrayList;


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
  GButton botonSalirArbol;
  GTextArea menuInfo; 
  GSlider sliderMusica; 
  GLabel etiquetaVolumen;
  GButton botonVolverAjustes;
  GLabel etiquetaModo;
  GDropList dlModo;
  String ultimoModo,modoActual;
  GLabel etiquetaIteraciones;
  GTextField txtIteraciones;
  GLabel etiquetaAxioma;
  GTextField txtAxioma;
  GLabel etiquetaReglas;
  GLabel etiquetaAngulo;
  GTextField txtIAngulo;
  GLabel etiquetaLongitud;
  GTextField txtLongitud;
  GLabel etiquetaPLongitud;
  GTextField txtPLongitud;
  GLabel etiquetaGrosor;
  GTextField txtGrosor;
  GLabel etiquetaPGrosor;
  GTextField txtPGrosor;
  GTextArea txtReglas;
  GButton botonGenArbol3D;
  
  
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
    vista3D = new GViewPeasyCam(ventanaPadre, width/3, 0, (width - width/3), height, 300);
    vista2D = new GView(ventanaPadre, width/3, 0, (width - width/3), height, P2D);
    botonSalirArbol = new GButton(ventanaPadre, 40, height-60, 80, 40, "Volver");
    botonSalirArbol.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
    botonSalirArbol.addEventHandler(this, "volverMenu");
    etiquetaIteraciones = new GLabel(ventanaPadre, etiquetaModo.getX(), etiquetaModo.getY()+40, 180, 40,"Nº Iteraciones:");
    etiquetaIteraciones.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    etiquetaIteraciones.setFont(new Font("Monospaced", Font.PLAIN, 16));
    etiquetaIteraciones.setOpaque(false);
    txtIteraciones = new GTextField(ventanaPadre, etiquetaIteraciones.getX()+200,  etiquetaIteraciones.getY()+5, 40, 30, G4P.SCROLLBARS_NONE);
    txtIteraciones.setOpaque(true);
    txtIteraciones.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtIteraciones.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    etiquetaLongitud = new GLabel(ventanaPadre, etiquetaIteraciones.getX(), etiquetaIteraciones.getY()+40, 200, 40,"Longitud Inicial:");
    etiquetaLongitud.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    etiquetaLongitud.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtLongitud = new GTextField(ventanaPadre, etiquetaLongitud.getX()+200,  etiquetaLongitud.getY()+5, 40, 30, G4P.SCROLLBARS_NONE);
    txtLongitud.setOpaque(true);
    txtLongitud.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtLongitud.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    etiquetaPLongitud = new GLabel(ventanaPadre, 10, etiquetaLongitud.getY()+40, 260, 40,"(%)Disminucion Longitud:");
    etiquetaPLongitud.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    etiquetaPLongitud.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtPLongitud = new GTextField(ventanaPadre, etiquetaPLongitud.getX()+260,  etiquetaPLongitud.getY()+5, 40, 30, G4P.SCROLLBARS_NONE);
    txtPLongitud.setOpaque(true);
    txtPLongitud.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtPLongitud.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    etiquetaAngulo = new GLabel(ventanaPadre, 10, etiquetaPLongitud.getY()+40, 110, 40,"Angulo:");
    etiquetaAngulo.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    etiquetaAngulo.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtIAngulo = new GTextField(ventanaPadre, etiquetaAngulo.getX()+120,  etiquetaAngulo.getY()+5, 40, 30, G4P.SCROLLBARS_NONE);
    txtIAngulo.setOpaque(true);
    txtIAngulo.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtIAngulo.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    etiquetaGrosor = new GLabel(ventanaPadre, 10, etiquetaAngulo.getY()+40, 180, 40,"Grosor Inicial:");
    etiquetaGrosor.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    etiquetaGrosor.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtGrosor = new GTextField(ventanaPadre, etiquetaGrosor.getX()+180,  etiquetaGrosor.getY()+5, 40, 30, G4P.SCROLLBARS_NONE);
    txtGrosor.setOpaque(true);
    txtGrosor.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtGrosor.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    etiquetaPGrosor = new GLabel(ventanaPadre, 10, etiquetaGrosor.getY()+40, 240, 40,"(%)Disminucion Grosor:");
    etiquetaPGrosor.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    etiquetaPGrosor.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtPGrosor = new GTextField(ventanaPadre, etiquetaPGrosor.getX()+250,  etiquetaPGrosor.getY()+5, 40, 30, G4P.SCROLLBARS_NONE);
    txtPGrosor.setOpaque(true);
    txtPGrosor.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtPGrosor.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    etiquetaAxioma = new GLabel(ventanaPadre, 10, etiquetaPGrosor.getY()+40, 100, 40,"Axioma:");
    etiquetaAxioma.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    etiquetaAxioma.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtAxioma = new GTextField(ventanaPadre, etiquetaAxioma.getX()+120,  etiquetaAxioma.getY()+5, 40, 30, G4P.SCROLLBARS_NONE);
    txtAxioma.setOpaque(true);
    txtAxioma.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtAxioma.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    etiquetaReglas = new GLabel(ventanaPadre, 10, etiquetaAxioma.getY()+40, 100, 40,"Reglas:");
    etiquetaReglas.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    etiquetaReglas.setFont(new Font("Monospaced", Font.PLAIN, 16));
    txtReglas = new GTextArea(ventanaPadre, 40,etiquetaReglas.getY()+40, 300, 160, G4P.SCROLLBARS_BOTH);
    txtReglas.setOpaque(true);
    txtReglas.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    txtReglas.setFont(new Font("Monospaced", Font.PLAIN, 16));
    botonGenArbol3D = new GButton(ventanaPadre, botonSalirArbol.getX()+220, height-60, 80, 40, "Generar");
    botonGenArbol3D.setLocalColorScheme(GCScheme.GREEN_SCHEME);
    botonGenArbol3D.addEventHandler(this, "Genera_Arbol");

    
    //Ocultar elementos
    etiquetaModo.setVisible(false);
    dlModo.setVisible(false);
    vista3D.setVisible(false);
    vista2D.setVisible(false);
    botonSalirArbol.setVisible(false);
    etiquetaIteraciones.setVisible(false);
    txtIteraciones.setVisible(false);
    etiquetaAngulo.setVisible(false);
    etiquetaAxioma.setVisible(false);
    etiquetaGrosor.setVisible(false);
    etiquetaIteraciones.setVisible(false);
    etiquetaLongitud.setVisible(false);
    etiquetaPGrosor.setVisible(false);
    etiquetaPLongitud.setVisible(false);
    etiquetaReglas.setVisible(false);
    txtAxioma.setVisible(false);
    txtGrosor.setVisible(false);
    txtIAngulo.setVisible(false);
    txtIteraciones.setVisible(false);
    txtIteraciones.setVisible(false);
    txtPGrosor.setVisible(false);
    txtLongitud.setVisible(false);
    txtPLongitud.setVisible(false);
    txtReglas.setVisible(false);
    botonGenArbol3D.setVisible(false);
    
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
      //redimensionar vistas, Necesita arreglo
      boolean mantenerVentana2D,mantenerVentana3D;
      mantenerVentana2D = vista2D.isVisible();
      mantenerVentana3D = vista3D.isVisible();

      vista2D = new GView(ventanaPadre, width/3, 0, (width - width/3), height, P2D);
      vista2D.addListener(new Arbol2D());
      vista2D.setVisible(mantenerVentana2D);

      vista3D = new GViewPeasyCam(ventanaPadre, width/3, 0, (width - width/3), height, 200);
      vista3D.addListener(new Arbol3D(vista3D.getPeasyCam()));
      vista3D.setVisible(mantenerVentana3D);
    }
    
    background(60);
    
    if(modoActual != ultimoModo){
      if(modoActual == "2D"){
        vista2D.setVisible(true);
        vista3D.setVisible(false);
        //---
        etiquetaIteraciones.setVisible(false);
        txtIteraciones.setVisible(false);
        etiquetaAngulo.setVisible(false);
        etiquetaAxioma.setVisible(false);
        etiquetaGrosor.setVisible(false);
        etiquetaIteraciones.setVisible(false);
        etiquetaLongitud.setVisible(false);
        etiquetaPGrosor.setVisible(false);
        etiquetaPLongitud.setVisible(false);
        etiquetaReglas.setVisible(false);
        txtAxioma.setVisible(false);
        txtGrosor.setVisible(false);
        txtIAngulo.setVisible(false);
        txtIteraciones.setVisible(false);
        txtIteraciones.setVisible(false);
        txtPGrosor.setVisible(false);
        txtPLongitud.setVisible(false);
        txtReglas.setVisible(false);
        txtLongitud.setVisible(false);
      }else{
        vista2D.setVisible(false);
        vista3D.setVisible(true);
        //---
        etiquetaIteraciones.setVisible(true);
        txtIteraciones.setVisible(true);
        etiquetaAngulo.setVisible(true);
        etiquetaAxioma.setVisible(true);
        etiquetaGrosor.setVisible(true);
        etiquetaIteraciones.setVisible(true);
        etiquetaLongitud.setVisible(true);
        etiquetaPGrosor.setVisible(true);
        etiquetaPLongitud.setVisible(true);
        etiquetaReglas.setVisible(true);
        txtAxioma.setVisible(true);
        txtGrosor.setVisible(true);
        txtIAngulo.setVisible(true);
        txtIteraciones.setVisible(true);
        txtIteraciones.setVisible(true);
        txtPGrosor.setVisible(true);
        txtPLongitud.setVisible(true);
        txtReglas.setVisible(true);
        txtLongitud.setVisible(true);
      }
      ultimoModo = modoActual;
    }    
    
 }
 
   private void mostrarElementosArbol(boolean activar){
     etiquetaModo.setVisible(activar);
     dlModo.setVisible(activar);
     botonSalirArbol.setVisible(activar);
     botonGenArbol3D.setVisible(activar);
     
     // Para botones de vista
     if(modoActual == "3D"){
       etiquetaIteraciones.setVisible(activar);
       txtIteraciones.setVisible(activar);
       etiquetaAngulo.setVisible(activar);
       etiquetaAxioma.setVisible(activar);
       etiquetaGrosor.setVisible(activar);
       etiquetaIteraciones.setVisible(activar);
       etiquetaLongitud.setVisible(activar);
       etiquetaPGrosor.setVisible(activar);
       etiquetaPLongitud.setVisible(activar);
       etiquetaReglas.setVisible(activar);
       txtAxioma.setVisible(activar);
       txtGrosor.setVisible(activar);
       txtIAngulo.setVisible(activar);
       txtIteraciones.setVisible(activar);
       txtIteraciones.setVisible(activar);
       txtPGrosor.setVisible(activar);
       txtPLongitud.setVisible(activar);
       txtReglas.setVisible(activar);
       txtLongitud.setVisible(activar);
     }

     if(modoActual == "2D"){

     }
     
     // Para vistas
     if(activar == false){
       if(vista3D.isVisible()){
          vista3D.setVisible(false);
       }
         
       if(vista2D.isVisible()){
         vista2D.setVisible(false);
       }
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
 
    public void Genera_Arbol(GButton source, GEvent event) {
      String reg = txtReglas.getText();
      ArrayList<LSRegla> r = parse_txtReglas(reg);
      int n = Integer.parseInt(txtIteraciones.getText());
      String axi = txtAxioma.getText();
      float g = Float.parseFloat(txtGrosor.getText());
      float ang = Float.parseFloat(txtIAngulo.getText());
      float lar = Float.parseFloat(txtLongitud.getText());
      float dg = Float.parseFloat(txtPGrosor.getText());
      float dl = Float.parseFloat(txtPLongitud.getText());
      
      arbolSys = new LSystem(n,axi,g,ang,lar,r,dl,dg);
      arbolSys.genera();
      
      a3d.updateArbolView(arbolSys);
      
    }
    
    public ArrayList<LSRegla> parse_txtReglas(String reg){
      ArrayList<LSRegla> str = new ArrayList<LSRegla>();
      
      String regWSP = reg.replaceAll("\\s+","");
      String[] r = regWSP.split("=|;");
      
      for(int i = 1;i < r.length;i++){
        str.add(new LSRegla(r[i-1],r[i]));
        i++;
      }
      
      return str;
    }
  
}
