package co.grandcircus.YelpFusion.Controller;

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
		memberlist.add(user);
		currentgroups.add(ug);
		user.setUsergroup(currentgroups);
		ug.setUser(memberlist);
		ugrep.save(ug);
		urep.save(user);
		model.addAttribute("groups", user.getUsergroup());
		model.addAttribute("username", session.getAttribute("username"));
		
		
		return "/index";

	}
	
	
	@GetMapping("/groupdetails/{groupid}")
	public String groupdetails(@PathVariable("groupid") long id,Model model)
	{
		
		UserGroup ug = ugrep.findById(id).orElse(null);
		model.addAttribute("groupinfo",ug);
		model.addAttribute("event",ug.getEvents());
		return "groupinfo";
	}
	
	
	
	
	@PostMapping("/createevent") 
	public String createevent(@RequestParam(value = "groupid") long groupid,Event event,@RequestParam(value = "category") List<String> category, Model model) {
		User user = urep.findByEmail((String) session.getAttribute("useremail"));
		List<Business> listofBusiness = new ArrayList<>();
		List<Activity> activitylist = new ArrayList<>();
		BusinessResponse bs= null;
		UserGroup groupinfo = ugrep.findById(groupid).get();
		System.out.println("groupinfo"  + groupinfo);
		event.setUsergroup(groupinfo);
		event.setEventadmin(user.getId());

		 erep.save(event);
		
		for(String c: category)
		{
			 bs = yfs.getBusinesses(event.getEventcity(), c);
			Activity activity = new Activity();
			 activity.setActivityname(c);	
			 activity.setBusiness(bs.getBusinesses());
			 activitylist.add(activity);
			 activity.setEvent(event);
			 arep.save(activity);
			 for(Business business : bs.getBusinesses())
			 {
				 listofBusiness.add(business);
				 business.setActivity(activity);
	             brep.save(business);
			 }
					
		}   		
	    model.addAttribute("event",groupinfo.getEvents());
		return "groupinfo";
	}
	
	
	@GetMapping("/eventdetails")
	public String eventdetails(@RequestParam(value = "event") long id,Model model)
	{
		System.out.println("inside eventdetails");
		Event e = erep.findById(id).orElse(null);
		System.out.println("event " + e);
				model.addAttribute("event",e);	
		return "eventdetails";
	}
	
	@PostMapping("/savevotes")
	public String savevotes(Business business,@RequestParam(required = false) String restaurants_favorite,@RequestParam(required = false) String restaurants_notfavorite,@RequestParam(required = false) String parks_favorite,@RequestParam(required = false) String parks_notfavorite, Model model)
	{
					System.out.println(restaurants_favorite+ " "+restaurants_notfavorite + " " +parks_favorite+ " " +parks_notfavorite);    
		return "eventdetails";
	}

}
