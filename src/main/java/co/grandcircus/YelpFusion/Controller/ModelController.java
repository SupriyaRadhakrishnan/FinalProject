package co.grandcircus.YelpFusion.Controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import co.grandcircus.YelpFusion.Model.*;
import co.grandcircus.YelpFusion.Service.*;

@Controller
public class ModelController {

	@Autowired
	HttpSession session;

	@Autowired
	private UserRepository urep;

	@Autowired
	private UserGroupRepository ugrep;

	@Autowired
	private YelpFusionService yfs;

	@Autowired
	private EventRepository erep;

	@Autowired
	private ActivityRepository arep;

	@Autowired
	private BusinessRepository brep;
	// below 3 lines are used to set the min date to current date(restricts creating an event in past date).
	static Date todayDate = Calendar.getInstance().getTime(); 
	static SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
	private static String todayString = formatter.format(todayDate);
    /*
     * This method uses the post method form to create a group,it will add valid email to the 
     * group member list and writes the data to the usergroup and the user tables.Return back to the
     * same page(index.jsp) with the new group name added in the list of groups.
     */
	@PostMapping("/creategroup")
	public String creategroup(String email, String groupname, Model model) {
		User user = urep.findByEmail((String) session.getAttribute("useremail"));

		List<UserGroup> currentgroups = user.getUsergroup();
		List<User> memberlist = new ArrayList<User>();
		UserGroup ug = new UserGroup();
		String memberinput[] = email.split(";");

		ug.setGroupname(groupname);

		for (int i = 0; i < memberinput.length; i++) {
			System.out.println(memberinput[0]);
			User memberuser = urep.findByEmail(memberinput[i]);
			if (memberuser != null) {
				List<UserGroup> currentmembergroups = memberuser.getUsergroup();
				currentmembergroups.add(ug);
				memberuser.setUsergroup(currentmembergroups);
				memberlist.add(memberuser);
			}
		}
		if(memberlist.contains(user));
		else
		{
	    memberlist.add(user);
     	currentgroups.add(ug);
		user.setUsergroup(currentgroups);
		ug.setUser(memberlist);
		}
		ugrep.save(ug);
		urep.save(user);
		model.addAttribute("groups", user.getUsergroup());
		model.addAttribute("username", session.getAttribute("username"));

		return "/index";

	}
	 /*
     * This method uses the group id in PathVariable to fetch info from table and and adds it to the model.
     * It returns to the groupinfo page displaying the members,events and allows you to create an event.
     */
	@GetMapping("/groupdetails/{groupid}")
	public String groupdetails(@PathVariable("groupid") long id, Model model) {

		UserGroup ug = ugrep.findById(id).orElse(null);
		model.addAttribute("groupinfo", ug);
		model.addAttribute("event", ug.getEvents());
		model.addAttribute("todayString", todayString);
		model.addAttribute("username", session.getAttribute("username"));
		return "groupinfo";
	}
	
	@GetMapping("/leavegroup/{groupid}")
	public String leavegroup(@PathVariable("groupid") long id, Model model) {
		UserGroup ug = ugrep.findById(id).orElse(null);
		User user = urep.findByEmail((String) session.getAttribute("useremail"));
		ug.removeUser(user);
		ugrep.save(ug);
		user.removeUsergroup(ug);
		urep.save(user);
		model.addAttribute("groups", user.getUsergroup());
		model.addAttribute("username", session.getAttribute("username"));
		return "/index";
	}
    /*
     * This method uses the post method form to update a group,it will add valid email to the already existing 
     * group member list and updates the data to the usergroup and the user tables.Return back to the
     * same page(index.jsp) with the new group members added.
     */
	@PostMapping("/addmembers")
	public String addmembers(@RequestParam(value = "groupid") long groupid, String email, Model model) {
		
		UserGroup userGroup = ugrep.findById(groupid).get();
		String memberinput[] = email.split(";");
		List<User> memberlist = userGroup.getUser();
		
		for (int i = 0; i < memberinput.length; i++) {
			System.out.println(memberinput[0]);
			User memberuser = urep.findByEmail(memberinput[i]);
			if (memberuser != null) {
				List<UserGroup> currentmembergroups = memberuser.getUsergroup();
				if(currentmembergroups.contains(userGroup));
				else {
				currentmembergroups.add(userGroup);
				memberuser.setUsergroup(currentmembergroups);
				memberlist.add(memberuser);	
				}
			}
		}
		ugrep.save(userGroup);
		model.addAttribute("groupinfo", userGroup);
		model.addAttribute("event", userGroup.getEvents());
		model.addAttribute("userid", session.getAttribute("userid"));
		model.addAttribute("todayString", todayString);
		model.addAttribute("username", session.getAttribute("username"));
		return "groupinfo";
	}
    /*
     * This method uses the post method form to create an event.It creates an entry for each of the activity
     * and business related to the activity(category).It creates an entry in event, activity and business tables.
     * It returns to the same page(groupinfo.jsp) with the new event listed. 
     */
	@PostMapping("/createevent")
	public String createevent(String pricerange, @RequestParam(value = "groupid") long groupid, Event event,
			@RequestParam(value = "category") List<String> category, Model model) {
		User user = urep.findByEmail((String) session.getAttribute("useremail"));
		List<Business> listofBusiness = new ArrayList<>();
		List<Activity> activitylist = new ArrayList<>();
		BusinessResponse bs = null;
		UserGroup groupinfo = ugrep.findById(groupid).get();
		System.out.println("groupinfo" + groupinfo);
		event.setUsergroup(groupinfo);
		event.setEventadmin(user.getId());

		erep.save(event);
		// The API call uses the param pricerange="1,2,3,4"
		// or as a single number eg. pricerange=3
		if (pricerange.equals("1")) {
			pricerange = "1";
		} else if (pricerange.equals("2")) {
			pricerange = "1,2";
		} else if (pricerange.equals("3")) {
			pricerange = "1,2,3";
		} else {
			pricerange = "1,2,3,4";
		}

		System.out.println("pricerange" + pricerange);
		for (String c : category) {
			bs = yfs.getBusinesses(event.getEventcity(), c, pricerange);
			if(!bs.getBusinesses().isEmpty()) {
			Activity activity = new Activity();
			activity.setActivityname(c);
			activity.setBusiness(bs.getBusinesses());
			activitylist.add(activity);
			activity.setEvent(event);
			arep.save(activity);
			for (Business business : bs.getBusinesses()) {			
				listofBusiness.add(business);
				business.setActivity(activity);
				brep.save(business);
			}
		}
		}
		model.addAttribute("groupinfo", groupinfo);
		model.addAttribute("event", groupinfo.getEvents());
		model.addAttribute("todayString", todayString);
		model.addAttribute("userid",session.getAttribute("userid"));
		model.addAttribute("username", session.getAttribute("username"));
		return "groupinfo";
	}
	 /*
     * This method uses the event id to fetch info from table and and adds it to the model.
     * It returns to the eventdetails page displaying the category.
     */
	@GetMapping("/eventdetails")
	public String eventdetails(@RequestParam(value = "event") long id, @RequestParam(value = "group") long groupid,Model model) {
	
		Event e = erep.findById(id).orElse(null);
		System.out.println("event " + e);
		model.addAttribute("event", e);
		model.addAttribute("groupid",groupid);
		User user = urep.findByEmail((String) session.getAttribute("useremail"));
		System.out.println("String.valueOf(user.getId())" + String.valueOf(user.getId()));
		model.addAttribute("username", session.getAttribute("username"));
		return "eventdetails";
	}
	 /*
     * This method saves the favorite and notfavorite votes(votes are not mandate) for each category to business table.It returns to the samepage(eventdetails.jsp)
     *  it displays the updated vote count and the business list sorted based on the max favourite votes.
     */
	@PostMapping("/savevotes")
	public String savevotes(@RequestParam(value = "eventid") long eventid,@RequestParam(value = "activityid") long activityid,long groupid,
			@RequestParam(required = false) String restaurants_favorite,
			@RequestParam(required = false) String restaurants_notfavorite,
			@RequestParam(required = false) String tours_favorite,
			@RequestParam(required = false) String tours_notfavorite,
			@RequestParam(required = false) String hotels_favorite,
			@RequestParam(required = false) String hotels_notfavorite,
			@RequestParam(required = false) String parks_favorite,
			@RequestParam(required = false) String parks_notfavorite, Model model) {
		
	

		Event event = erep.findById(eventid).get();
		String selectedactivity ="";
		Activity activitydetails = arep.findById(activityid).get();
		String favbusinessname = "";
		String nfavbusinessname = "";

			String activityname = activitydetails.getActivityname();
			System.out.println("activityname"+ activityname);
			
			if (activityname.equals("restaurants")) {
				favbusinessname = restaurants_favorite;
				nfavbusinessname = restaurants_notfavorite;
				selectedactivity = "restaurants";
				
			} else if (activityname.equals("parks")) {
				favbusinessname = parks_favorite;
				nfavbusinessname = parks_notfavorite;
				selectedactivity = "parks";	
			}
			
			else if (activityname.equals("tours")) {
				favbusinessname = tours_favorite;
				nfavbusinessname = tours_notfavorite;
				selectedactivity = "tours";	
			}
			
			else if (activityname.equals("hotels")) {
				favbusinessname = hotels_favorite;
				nfavbusinessname = hotels_notfavorite;
				selectedactivity = "hotels";	
			}
			if ((activityname + "_favorite") != null || (activityname + "_notfavorite") != null) {
				List<Business> businesslist = activitydetails.getBusiness();
				for (Business business : businesslist) {

					if (business.getName().equals(favbusinessname) && (favbusinessname) != null) {
						
						business.setFavourite(business.getFavourite() + 1);
					}
					if (business.getName().equals(nfavbusinessname) && (nfavbusinessname) != null) {
						
						business.setNotfavourite(business.getNotfavourite() + 1);
					}
					brep.save(business);
				}
			}
		
		User user = urep.findByEmail((String) session.getAttribute("useremail"));
		event.setVotedmembers(event.getVotedmembers() + "," +selectedactivity+ "_" + user.getId());
		erep.save(event);
		List<Business> business = activitydetails.getBusiness();
		Collections.sort(business, new Comparator<Business>() {
			  @Override
			  public int compare(Business b1, Business b2) {
			    return ((Integer)(b2.getFavourite())).compareTo((Integer)(b1.getFavourite()));
			  }
			});
		model.addAttribute("businesses",business);
		model.addAttribute("message","You have already Voted");
		model.addAttribute("groupid",groupid);
		model.addAttribute("selectedactivity",activitydetails);
		model.addAttribute("event", event);
		model.addAttribute("username", session.getAttribute("username"));
		return "eventdetails";
	}
	 /*
     * This method uses the event id to fetch info from table and and deletes it in the model.
     * It also deletes the activity and business associated to the event in the respective tables.
     * It returns to the same page(groupinfo.jsp) with the event deleted from the event list.
     */
	@GetMapping("/delete")
	public String deleteevent(@RequestParam(value = "eventdetails") long id,@RequestParam(value = "group") long groupid,Model model) {
		UserGroup usergroup = ugrep.findById(groupid).get();
		Event event = erep.findById(id).get();
		List<Activity> activitylist = event.getActivity();
		for(Activity activity : activitylist)
		{
			if(activity != null) {
			List<Business> businesslist = activity.getBusiness();
			for(Business business: businesslist)
			{
				if(business!=null)
				brep.deleteById(business.getBusinessid());
			}
			}
			arep.deleteById(activity.getActivityid());
	}
	
		erep.deleteById(id);
		model.addAttribute("todayString", todayString);
		model.addAttribute("groupinfo",usergroup);
		model.addAttribute("event", usergroup.getEvents());
		model.addAttribute("userid",session.getAttribute("userid"));
		model.addAttribute("username", session.getAttribute("username"));
		return "groupinfo";
	}
	
	 /*
     * It returns to the Business details sorted based on max favorite votes.
     * And send it to the eventdetails page.
     */
	@PostMapping("/selectedactivity")
	public String selectedactivity(long activity,long groupid,long eventid,Model model)
	{
		Activity selectedactivity = arep.findById(activity).get();
		String activityname = selectedactivity.getActivityname();
		List<Business> business = selectedactivity.getBusiness();
		Event event = erep.findById(eventid).get();
		User user = urep.findByEmail((String) session.getAttribute("useremail"));
		boolean voted = false;
		Collections.sort(business, new Comparator<Business>() {
			  @Override
			  public int compare(Business b1, Business b2) {
			    return ((Integer)(b2.getFavourite())).compareTo((Integer)(b1.getFavourite()));
			  }
			});
		
		if(event.getVotedmembers()!=null)
		{
		voted = event.getVotedmembers().contains(activityname + "_" +String.valueOf(user.getId()));
		}
		if(voted)
		{
			
			model.addAttribute("message","You have already Voted");
		}
		
		model.addAttribute("groupid",groupid);
		model.addAttribute("event", event);
		model.addAttribute("businesses",business);
		model.addAttribute("selectedactivity",selectedactivity);
		model.addAttribute("username", session.getAttribute("username"));
		return "eventdetails";
	}
	
	@GetMapping("/editevent")
	public String editevent(@RequestParam(value = "eventdetails") long id,@RequestParam(value = "group") long groupid,Model model) {
		UserGroup usergroup = ugrep.findById(groupid).get();
		Event event = erep.findById(id).get();
		model.addAttribute("todayString", todayString);
		model.addAttribute("groupinfo",usergroup);
		model.addAttribute("event", event);
		model.addAttribute("userid",session.getAttribute("userid"));
		model.addAttribute("username", session.getAttribute("username"));

		return "editevent";
	}
	
	@PostMapping("/saveeventchanges")
	public String saveeventchanges(String pricerange, @RequestParam(value = "groupid") long groupid, Event event, @RequestParam(value = "category") List<String> category, Model model) 
	{
		
		User user = urep.findByEmail((String) session.getAttribute("useremail"));
		List<Business> listofBusiness = new ArrayList<>();
		List<Activity> activitylist = new ArrayList<>();
		BusinessResponse bs = null;
		UserGroup groupinfo = ugrep.findById(groupid).get();
		System.out.println("groupinfo" + groupinfo);
		
		System.out.println(event.getEventid());
		Event updatingevent =  erep.findById(event.getEventid()).get();
		updatingevent.setEventcity(event.getEventcity());
		updatingevent.setEventdescription(event.getEventdescription());
		updatingevent.setEventdate(event.getEventdate());
		updatingevent.setEventname(event.getEventname());
		updatingevent.setVotedmembers("");
		// The API call uses the param pricerange="1,2,3,4"
		// or as a single number eg. pricerange=3
		
		if (pricerange.equals("1")) {
			pricerange = "1";
		} else if (pricerange.equals("2")) {
			pricerange = "1,2";
		} else if (pricerange.equals("3")) {
			pricerange = "1,2,3";
		} else {
			pricerange = "1,2,3,4";
		}
		
		for(Activity removeactivity : updatingevent.getActivity())
		{

          for(Business removebusiness : removeactivity.getBusiness())
          {
        	  brep.deleteById(removebusiness.getBusinessid());
          }
		}
		for(Activity removeactivity : updatingevent.getActivity())
		{
		 arep.deleteById(removeactivity.getActivityid());
		}
		updatingevent.setActivity(null);
		erep.save(updatingevent);
		for (String c : category) {
			bs = yfs.getBusinesses(event.getEventcity(), c, pricerange);
			if(!bs.getBusinesses().isEmpty()) {
			Activity activity = new Activity();
			activity.setActivityname(c);
			activity.setBusiness(bs.getBusinesses());
			activitylist.add(activity);
			activity.setEvent(updatingevent);
			
			arep.save(activity);
			for (Business business : bs.getBusinesses()) {			
				listofBusiness.add(business);
				business.setActivity(activity);
				brep.save(business);
			}
		}
		}
		erep.save(updatingevent);
		model.addAttribute("groupinfo", groupinfo);
		model.addAttribute("event", groupinfo.getEvents());
		model.addAttribute("todayString", todayString);
		model.addAttribute("userid",session.getAttribute("userid"));
		model.addAttribute("username", session.getAttribute("username"));
		return "groupinfo";
	}

}
