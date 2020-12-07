package co.grandcircus.YelpFusion.Model;

import java.sql.Date;
import java.util.List;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "event")
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long eventid;

	private String eventname;
	private String eventdescription;
	private Date eventdate;
	private String eventcity;
	private long eventadmin;


	@ManyToOne
	@JoinColumn(name = "groupid")
	private UserGroup usergroup;
	
	@OneToMany(mappedBy = "event")
	private List<Activity> activity;

	public Event() {

	}

	public Event(long eventid, String eventname, String eventdescription, Date eventdate, long eventadmin, UserGroup usergroup) {
		super();
		this.eventid = eventid;
		this.eventname = eventname;
		this.eventdescription = eventdescription;
		this.eventdate = eventdate;
		this.eventadmin = eventadmin;
		this.usergroup = usergroup;
	}

	public String getEventname() {
		return eventname;
	}

	public void setEventname(String eventname) {
		this.eventname = eventname;
	}

	public String getEventdescription() {
		return eventdescription;
	}

	public void setEventdescription(String eventdescription) {
		this.eventdescription = eventdescription;
	}

	public Date getEventdate() {
		return eventdate;
	}

	public void setEventdate(Date eventdate) {
		this.eventdate = eventdate;
	}

	public long getEventadmin() {
		return eventadmin;
	}

	public void setEventadmin(long eventadmin) {
		this.eventadmin = eventadmin;
	}

	public UserGroup getUsergroup() {
		return usergroup;
	}

	public void setUsergroup(UserGroup usergroup) {
		this.usergroup = usergroup;
	}

	public String getEventcity() {
		return eventcity;
	}

	public void setEventcity(String eventcity) {
		this.eventcity = eventcity;
	}

	public long getEventid() {
		return eventid;
	}

	public void setEventid(long eventid) {
		this.eventid = eventid;
	}

	public List<Activity> getActivity() {
		return activity;
	}

	public void setActivity(List<Activity> activity) {
		this.activity = activity;
	}

}
