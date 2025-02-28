package Models;
import java.util.Date;

public class Mood {

	private int id;
    private int userId;
    private String mood;
    private Date date;

    public Mood(int id, int userId, String mood, Date date) {
        this.id = id;
        this.userId = userId;
        this.mood = mood;
        this.date = date;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getMood() { return mood; }
    public void setMood(String mood) { this.mood = mood; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }
	
}
