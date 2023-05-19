package model;

import javax.security.auth.Subject;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Role {
	private int id;
	private String description;


	public Role(int id, String description) {
		super();
		this.id = id;
		this.description = description;
	}
	public Role() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}




	@Override
	public String toString() {
		return "Role{" +
				"id=" + id +
				", description='" + description + '\'' +
				'}';
	}
}
