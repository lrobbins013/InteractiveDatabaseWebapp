import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class WebInterfaceSim {
	
	static Scanner input = new Scanner(System.in);
	
	public static void main (String[] args){
		
		
		
		System.out.println();
		System.out.println();
		System.out.println("##########################################\n\nWelcome to Levi & Lucus's Dentist Database \n       Web User Interface simulator \n\n##########################################\n");

		
		System.out.println("Options\n--------------");
		String[] options = {"Add new patient",
							"Display all patients",
							"Update patient information",
							"Remove patient", 
							"Make an appointment",
							"Display all appointments",
							"Cancel appointment", 
							"Log a service",
							"Make a payment",
							"View transaction history",
							"Write a splpl query"};
		int choice;
		for(int i = 0; i < options.length; i++){
			System.out.println(i + ") " + options[i]);
		}
		//get user input
		System.out.print("Please choose option > ");
		choice = input.nextInt();
		input.nextLine();
		
		switch(choice){
		case 0: //Add a patient
			try {
				addPatient();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case 1: // Display all patients 
			try {
				displayAllPatients();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case 2: // Remove patient
			
			break;
		case 3: // Make an appointment
			try {
				displayAllPatients();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			break;
		case 4: // Display all appointments
			try {
				displayAllAppointments();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			break;
		case 5: //
			
			break;
		case 6: //
			
			break;
		case 7: //
			
			break;
		case 8: //
			
			break;
		default:
			System.out.println("Choice Not Found, Please try again");
			break;
		}
		
	}

	private static void displayAllAppointments() throws ClassNotFoundException, SQLException {
		// ----------------- HTML ------------------
				System.out.println("\n\n");
				System.out.println("Display all patients\n-----------------------\n");
				
				// ----------------- JSP ------------------
				Class.forName("oracle.jdbc.OracleDriver");
				Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@aloe.cs.arizona.edu:1521:oracle", "levihill", "a3012");
				Statement stmt = dbconn.createStatement();
				
				String query = "select * from Levihill.Appointment";
				
				ResultSet answer = stmt.executeQuery(query);
				
				if(answer != null){
					
					System.out.println("\nThe results of the query [" + query 
		                   + "] are:\n");
					
					ResultSetMetaData answermetadata = answer.getMetaData();

		           for (int i = 1; i <= answermetadata.getColumnCount(); i++) {
		        	   String temp = answermetadata.getColumnName(i);
		        	   if(i == 1 || i == 2){
		        		   while(temp.length() < 30){
		            		   temp = temp + " ";
		            	   } 
		        		   System.out.print(temp);
		        	   }
		        	   else {
		        		   System.out.print(answermetadata.getColumnName(i) + "\t\t");
		        	   }
		 
		               
		           }
		           System.out.println();

		           //print in a table format
		           while (answer.next()) {
		               
		               System.out.println( answer.getInt("appID") +  "\t\t\t" + answer.getInt("patID") +  "\t\t\t"
		                       		+ answer.getInt("appID") +  "\t\t\t" + answer.getInt("patID") +  "\t\t\t" +  answer.getInt("balance"));
		           }
				}
				else {
					while (answer.next()) {
		               System.out.println(answer.getString(1));
		           }
				}
				stmt.close();
		
	}

	private static void displayAllPatients() throws ClassNotFoundException, SQLException{
		// ----------------- HTML ------------------
		System.out.println("\n\n");
		System.out.println("Display all patients\n-----------------------\n");
		
		// ----------------- JSP ------------------
		Class.forName("oracle.jdbc.OracleDriver");
		Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@aloe.cs.arizona.edu:1521:oracle", "levihill", "a3012");
		Statement stmt = dbconn.createStatement();
		
		String query = "select * from Levihill.Patient";
		
		ResultSet answer = stmt.executeQuery(query);
		
		if(answer != null){
			
			System.out.println("\nThe results of the query [" + query 
                   + "] are:\n");
			
			ResultSetMetaData answermetadata = answer.getMetaData();

           for (int i = 1; i <= answermetadata.getColumnCount(); i++) {
        	   String temp = answermetadata.getColumnName(i);
        	   if(i == 1 || i == 2){
        		   while(temp.length() < 30){
            		   temp = temp + " ";
            	   } 
        		   System.out.print(temp);
        	   }
        	   else {
        		   System.out.print(answermetadata.getColumnName(i) + "\t\t");
        	   }
 
               
           }
           System.out.println();

           //print in a table format
           while (answer.next()) {
               
               System.out.println( answer.getInt("patID") +  "\t\t\t"
                       		+ answer.getString("firstName") +  "\t\t\t" + answer.getString("lastName") +  "\t\t\t" +  answer.getInt("balance"));
           }
		}
		else {
			while (answer.next()) {
               System.out.println(answer.getString(1));
           }
		}
		stmt.close();

		
	}

	private static void addPatient() throws ClassNotFoundException, SQLException {
		// ----------------- HTML ------------------
		System.out.println("\n\n");
		System.out.println("Add a patient\n-----------------------\n");
		System.out.print("First Name: ");
		String firstName = input.nextLine();
		System.out.print("Last Name: ");
		String lastName = input.nextLine();
		
		// ----------------- JSP ------------------
		Class.forName("oracle.jdbc.OracleDriver");
		Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@aloe.cs.arizona.edu:1521:oracle", "levihill", "a3012");
		Statement stmt = dbconn.createStatement();
		
		String query = "INSERT INTO Levihill.Patient (patID, firstName, lastName, balance) "
					+ "VALUES ((Select MAX(patID)+1  FROM Levihill.Patient), '" + firstName + "', '" + lastName + "', 0)";
		
		//System.out.println(query);

		
		ResultSet answer = stmt.executeQuery(query);
		
		System.out.println(firstName + " " + lastName + " has been added");
		stmt.close();
		
	}

}
