import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Scanner;

public class createTables {
	
	public static boolean deBug = true; // Print staments for debug
	public static boolean test = false;
	public static boolean onLectura = false;
	
	
	public static void main (String[] args){
		
	
		//get csv files and write commands 
		writeSqlFile();
		

	}
	
	/** writeSqlFile
	 * 
	 */
	private static void writeSqlFile(){
		// All cvs files for Dentist schema 
		String[] fileNames = {"csvFiles/Account.csv", "csvFiles/Appointment.csv", "csvFiles/Employee.csv", "csvFiles/Laboratory.csv", "csvFiles/Patient.csv",
								"csvFiles/Payment.csv", "csvFiles/Procedure.csv", "csvFiles/proSup.csv", "csvFiles/ServiceLog.csv", "csvFiles/Supplies.csv"};
		PrintWriter sqlFile;
		Scanner input = null;
		
		String line;
		
		for(int fn = 0; fn < fileNames.length; fn++){
			try {
				

				
				input = new Scanner(new File(fileNames[fn]));
				line = input.nextLine();
				String[] fieldsNames = line.split("\\,");
				//get Table name
				String tableName = fieldsNames[0];
				
				sqlFile = new PrintWriter("sqlFiles/" + (tableName +".sql"), "UTF-8");
				
				
				line = input.nextLine();
				fieldsNames = line.split("\\,");
				
				//create query to create the table
				String createTableQuery = ("create table levihill." + tableName + "\n( ");
				//add all fields but last to avoid extra comma
				for(int i = 0; i < fieldsNames.length-1; i++){
					
					if(fieldsNames[i].contains("#")){
						createTableQuery = createTableQuery + fieldsNames[i].replaceAll("#", "") + " number(4) NOT NULL,\n";
					}
					else {
						createTableQuery = createTableQuery  + fieldsNames[i] + " varchar2(30) NOT NULL,\n";
					}
					
				}
				createTableQuery = createTableQuery + fieldsNames[fieldsNames.length-1].replaceAll("#", "") + " number(4) NOT NULL );";
				
				if(deBug){
					System.out.println(createTableQuery);
					System.out.println();
					System.out.println();
				
				}
				sqlFile.println("DROP TABLE levihill." + tableName + ";");
				sqlFile.println();
				
				sqlFile.println(createTableQuery);
				sqlFile.println();
				
				
				//write inserts
				String[] fields;
				String insertQuery = null;
				int insertCount = 0;
				while(input.hasNextLine()){
					line = input.nextLine();
					fields = line.split("\\,");
					
					// For all fields replace spaces with _
					for(int i = 0; i < fields.length; i++){
						fields[i] = fields[i].replace(" ", "_" );
						fields[i] = fields[i].replace("&", "and" );
					}
					
					
					
					for(int i = 0; i < fields.length; i++){
						if(fields[i].equals("") ){
							fields[i] = "-1";
						}
					}
					String valueTemp = "";
					
					insertQuery = ("INSERT INTO levihill." + tableName + "\n( ");
					int i = 0;
					for(i = 0; i < fieldsNames.length - 1; i++){
						
						//If the field has '#' then it is a number 
						if(fieldsNames[i].contains("#")){
							insertQuery = insertQuery + fieldsNames[i].replaceAll("#", "") + ",";
							valueTemp = valueTemp + fields[i] + ",";
							
						}
						else{
							insertQuery = insertQuery + fieldsNames[i] + ",";
							valueTemp = valueTemp + "'" + fields[i] + "',";
						}
					}
					insertQuery = insertQuery + fieldsNames[i].replaceAll("#", "") + " )\nVALUES\n(";
					insertQuery = insertQuery + valueTemp + fields[i] +" );\n";
					
					
					//write sql insert command to file 
					sqlFile.println(insertQuery);
					sqlFile.println();

					insertCount++;
					
				}
				sqlFile.println("GRANT SELECT ON levihill." + tableName + " TO PUBLIC;");
				sqlFile.println();
				
				if(deBug){
					System.out.println(insertQuery);
					System.out.println();
					System.out.println("INSERT COUNT: " + insertCount);
					System.out.println();
				
				}
				
				sqlFile.close();
			} 
			catch (FileNotFoundException e) {
				 System.err.println("*** FileNotFoundException:  "
		                    + "Could not open csv files.");
		                System.err.println("\tMessage:   " + e.getMessage());
		                System.out.println("Could Not Find: " + fileNames[fn]);
		                
		                
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.exit(-1);
			} 
		}
			
		
	}

}
