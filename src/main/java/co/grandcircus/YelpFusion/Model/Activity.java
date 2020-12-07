package co.grandcircus.YelpFusion.Model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="activity")
public class Activity {
	


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long activityid;
	private String activityname;
	
	@OneToMany(mappedBy = "activity")
	private List<Business> business;
	

	@ManyToOne
	private Event event;
	
	public Activity()
	{
		
	}
	public Activity(long activityid, String activityname, List<Business> business) {
		super();
		this.activityid = activityid;
		this.activityname = activityname;
		this.business = business;
	}

	public long getActivityid() {
		return activityid;
	}

	public void setActivityid(long activityid) {
		this.activityid = activityid;
	}

	public String getActivityname() {
		return activityname;
	}

	public void setActivityname(String activityname) {
		this.activityname = activityname;
	}

	public List<Business> getBusiness() {
		return business;
	}

	public void setBusiness(List<Business> business) {
		this.business = business;
	}
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}

}
