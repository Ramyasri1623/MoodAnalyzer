package Models;

public class User {
	 private int id;
	    private String username;
	    private String email;
	    private String password;

	    public User(int id, String name, String email) {
	        this.id = id;
	        this.username = username;
	        this.email = email;
	        this.password = password;
	    }

	    // Getters and Setters
	    public int getId() { return id; }
	    public void setId(int id) { this.id = id; }

	    public String getName() { return username; }
	    public void setName(String name) { this.username = username; }

	    public String getEmail() { return email; }
	    public void setEmail(String email) { this.email = email; }
}
