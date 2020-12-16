import java.util.Scanner;

public class Lab1 {
		public static void main(String[] arg) {
			double radius; //declare radius
			double area; //declare area
			
			System.out.print("Enter the radius:-->");
			Scanner sdtn = new Scanner(System.in);
			
			radius = sdtn.nextDouble(); //new value is radius
			area = radius * radius * 3.14159;// compute area
			
			System.out.println("The area for the circle" + " of radius " + radius + " is " + area); //display results
			sdtn.close();
			
		}
}