package co.grandcircus.YelpFusion.Model;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "usergroup")
public class UserGroup {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long groupid;
	private String groupname;

	@OneToMany(mappedBy = "usergroup")
	private List<Event> events;

	@ManyToMany(mappedBy = "usergroup")
	private List<User> user;

	public UserGroup() {

	}

	public UserGroup(long groupid, String groupname, List<Event> events, List<User> user) {
		super();
		this.groupid = groupid;
		this.groupname = groupname;
		this.events = events;
		this.user = user;
	}

	public long getGroupid() {
		return groupid;
	}

	public void setGroupid(long groupid) {
		this.groupid = groupid;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public List<User> getUser() {
		return user;
	}

	public void setUser(List<User> user) {
		this.user = user;
	}
	
	
}
