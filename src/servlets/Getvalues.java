package servlets;

public class Getvalues {

	public static int id;
	public static String name;
	

	public static String getName() {
		return name;
	}

	public static void setName(String name) {
		Getvalues.name = name;
	}

	public static int getId() {
		return id;
	}

	public static void setId(int id) {
		Getvalues.id = id;
		System.out.println(id);
	}
}
