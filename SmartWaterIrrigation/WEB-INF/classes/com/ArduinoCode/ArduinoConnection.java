package com.ArduinoCode;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import gnu.io.CommPortIdentifier; 
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent; 
import gnu.io.SerialPortEventListener; 
import java.util.Enumeration;


import java.util.Properties;
import javax.sound.midi.MidiDevice.Info;
import com.waterirrigation.DBconnect;

public class ArduinoConnection implements SerialPortEventListener {
SerialPort serialPort;
    /** The port we're normally going to use. */
private static final String PORT_NAMES[] = {"/dev/tty.usbserial-A9007UX1", // Mac OS X
        "/dev/ttyUSB0", // Linux
        "COM11", // Windows
};

static String id;
static String temp;
static String hum;
static String moisture;
static String motor;
static String ph;
static String messageString;
static BufferedReader input;
private static OutputStream output;
private static final int TIME_OUT = 2000;
private static final int DATA_RATE = 9600;
Properties prop = new Properties();
public void initialize() {
	
    CommPortIdentifier portId = null;
    Enumeration portEnum = CommPortIdentifier.getPortIdentifiers();

    //First, Find an instance of serial port as set in PORT_NAMES.
    while (portEnum.hasMoreElements()) {
        CommPortIdentifier currPortId = (CommPortIdentifier) portEnum.nextElement();
        for (String portName : PORT_NAMES) {
            if (currPortId.getName().equals(portName)) {
                portId = currPortId;
                break;
            }
        }
    }
    if (portId == null) {
        System.out.println("Could not find COM port...");
        return;
    }

    try {
        serialPort = (SerialPort) portId.open(this.getClass().getName(),
                TIME_OUT);
        serialPort.setSerialPortParams(DATA_RATE,
                SerialPort.DATABITS_8,
                SerialPort.STOPBITS_1,
                SerialPort.PARITY_NONE);

        // open the streams
        input = new BufferedReader(new InputStreamReader(serialPort.getInputStream()));
        output = serialPort.getOutputStream();
//        output=serialPort.getOutputBufferSize();

        
       
        
        serialPort.addEventListener(this);
        serialPort.notifyOnDataAvailable(true);
        
        
    } catch (Exception e) {
        System.err.println(e.toString());
    }
}


public synchronized void close() {
    if (serialPort != null) {
        serialPort.removeEventListener();
        serialPort.close();
    }
}

public synchronized void serialEvent(SerialPortEvent oEvent) {
    if (oEvent.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
    	
    	 try {
         
           if(input.ready())
              
           id=input.readLine();
           System.out.println("id = "+id);
           Thread.sleep(1000);
           temp=input.readLine();
           System.out.println("temp = "+temp);
           Thread.sleep(1000);
           hum=input.readLine();
           System.out.println("hum = "+hum);
           Thread.sleep(1000);
           moisture=input.readLine();
           System.out.println("moisture = "+moisture);
           Thread.sleep(1000);
           motor=input.readLine();
           System.out.println("motor = "+motor);
           Thread.sleep(1000);
           ph="0";
 
       Connection conn=DBconnect.getConnect();

       if(Integer.parseInt(id)>=0)
       {
    	   PreparedStatement pss1 = conn.prepareStatement("select motorstatus from farmer where id=?");
           pss1.setString(1,id);
           ResultSet rss1 = pss1.executeQuery();
    	   if(rss1.next())
    	   {
    		   if(rss1.getString("motorstatus").equals("7") || rss1.getString("motorstatus").equals("9"))
    		   {
		    	   PreparedStatement ps = conn.prepareStatement("UPDATE farmer SET soilmoist=?, temp=?, hum=?, ph=? where id=?");
		 	       ps.setString(1,moisture);
		 	       ps.setString(2,temp);
		 	       ps.setString(3,hum);
		 	       ps.setString(4,ph);
		 	       ps.setString(5,id);
		 	       ps.executeUpdate();
    		   }
    		   else
    		   {
		    	   PreparedStatement ps = conn.prepareStatement("UPDATE farmer SET soilmoist=?, temp=?, hum=?, ph=?, motorstatus=? where id=?");
		 	       ps.setString(1,moisture);
		 	       ps.setString(2,temp);
		 	       ps.setString(3,hum);
		 	       ps.setString(4,ph);
		 	       ps.setString(5,motor);
		 	       ps.setString(6,id);
		 	       ps.executeUpdate();
    		   }
    	   }
       }
       
       PreparedStatement pss = conn.prepareStatement("select motorstatus from farmer where id=?");
       pss.setString(1,id);
       ResultSet rss = pss.executeQuery();
       if(rss.next())
       {
    	   if(rss.getString("motorstatus").equals("7"))
    	   {
    		   messageString="7";
    		   System.out.println("Writing to arduino: "+messageString);
    	       output.write(messageString.getBytes());
    	       PreparedStatement ps11 = conn.prepareStatement("UPDATE farmer SET motorstatus=? where id=?");
	 	       ps11.setString(1,"1");
	 	       ps11.setString(2,id);
	 	       ps11.executeUpdate();
    	   }
    	   if(rss.getString("motorstatus").equals("9"))
    	   {
    		   messageString="9";
    		   System.out.println("Writing to arduino: "+messageString);
    	       output.write(messageString.getBytes());
    	       PreparedStatement ps11 = conn.prepareStatement("UPDATE farmer SET motorstatus=? where id=?");
	 	       ps11.setString(1,"0");
	 	       ps11.setString(2,id);
	 	       ps11.executeUpdate();
    	   }
    	   
       }
       	
       
        	 	
        }
    	 catch(Exception e)
    	 {
    		 System.err.println(e);
    		 e.printStackTrace();
    	 }
           
            
        }
   
    
    }
    

  
    // Ignore all the other eventTypes, but you should consider the other ones.


private Object open(String inputLine, String string) {
	
	// TODO Auto-generated method stub
	return null;
}
public static void main(String[] args) throws SQLException {
	 
	ArduinoConnection main = new ArduinoConnection();
 
    
   main.initialize();
  
        
    Thread t=new Thread() {
        public void run() {
            //the following line will keep this app alive for 1000    seconds,
            //waiting for events to occur and responding to them    (printing incoming messages to console).
            try {Thread.sleep(1000000);} catch (InterruptedException    ie) {}
        }
    };

    
    
   
 
          t.start();
    
    System.out.println("Started");
    
    
   
}
}

