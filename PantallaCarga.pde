import javax.swing.*;
import java.awt.*;

//Clase que crean la ventana de carga
public class SplashScreen extends JWindow {
   Image splashScreen;
   ImageIcon imageIcon;
   public SplashScreen(String urlImagen) {
       splashScreen = Toolkit.getDefaultToolkit().getImage(urlImagen + "/recursos/CargaTest.png");
       // Create ImageIcon from Image
       imageIcon = new ImageIcon(splashScreen);
       // Set JWindow size from image size
       setSize(imageIcon.getIconWidth(),imageIcon.getIconHeight());
       // Get current screen size
       Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
       // Get x coordinate on screen for make JWindow locate at center
       int x = (screenSize.width-getSize().width)/2;
       // Get y coordinate on screen for make JWindow locate at center
       int y = (screenSize.height-getSize().height)/2;
       // Set new location for JWindow
        
       setBackground(new Color(1.0f,1.0f,1.0f,0f));
       setLocation(x,y);
       // Make JWindow visible
       setVisible(true);
   }
   // Paint image onto JWindow
   public void paint(Graphics g) {
      super.paint(g);
      g.drawImage(splashScreen, 0, 0, this);
   }
   
   //Cierra la ventana de carga
   public void cerrar(){
     setVisible(false);
     dispose();
   }
      
}


// Otra forma
/*
JWindow window = new JWindow();
window.getContentPane().add(
    new JLabel("", new ImageIcon(new URL("http://docs.oracle.com/javase/tutorial/uiswing/examples/misc/SplashDemoProject/src/misc/images/splash.gif")), SwingConstants.CENTER));
window.setBounds(500, 150, 300, 200);
window.setVisible(true);
*/
