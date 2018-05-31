package todo.beans;

import java.sql.Date;

public class Todo {

	private int id;
	private String title;
	private String note;
	private String star;
	private Date deadline;
	public Todo(int id, String title, String note, String star, Date deadline) {
		super();
		this.id = id;
		this.title = title;
		this.note = note;
		this.star = star;
		this.deadline = deadline;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
}