package co.grandcircus.YelpFusion.Controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import co.grandcircus.YelpFusion.Model.Business;
import co.grandcircus.YelpFusion.Model.BusinessResponse;
import co.grandcircus.YelpFusion.Model.User;
import co.grandcircus.YelpFusion.Service.UserRepository;
import co.grandcircus.YelpFusion.Service.YelpFusionService;

@Controller
public class YelpFusionController {
	
	
	@Autowired
	private YelpFusionService yfs;
	

	@Autowired
	HttpSession session;
	
	@Autowired
	private UserRepository urep;
	
	
	private BusinessResponse br = new BusinessResponse() ;
	private String message ="";
	
	@GetMapping("/")
	public String index(Model model)
	{
		model.addAttribute("message",message);
		message ="";
	   return "login";
	}
	@GetMapping("/register")
	public String register()
	{
	   return "register";
	}
	
	@PostMapping("/register")
	public String register(User user,Model model)
	{
		//System.out.println(user.getEmail()+" " +user.getUsername()+" "+user.getPassword());
		urep.save(user);
		model.addAttribute("user",user);
		session.setAttribute("username", user.getUsername());
		session.setAttribute("userid", user.getId());
		model.addAttribute("username",session.getAttribute("username"));		
	    return "index";
	}
	
	@PostMapping("/login")
	public String login(String email,String password,Model model)
	{
		System.out.println(email +" "+ password);
		User user = urep.findByEmail(email);
		if(user == null || !user.getPassword().equals(password))
		{
		 System.out.println("Invalid user details");
		message = "Invalid Login Details";
		 return "redirect:/";
		}
		else {
			session.setAttribute("username", user.getUsername());
			session.setAttribute("userid", user.getId());
	    model.addAttribute("username",session.getAttribute("username"));		
		return "index";
		}
	}
	
	@PostMapping("/Search")
	public String search(String location,String categories,Model model)
	{
		br = yfs.getBusinesses(location,categories);
		System.out.println(br);
	    model.addAttribute("businesses",br.getBusinesses());
		return "homepage";
	}
	

	@PostMapping("/random")
	public String random(Model model)
	{
		Random rand = new Random(); 
		List<Business> bs = br.getBusinesses();
		System.out.println(" br.getBusinesses() :" +  br.getBusinesses());
        Business businesschoice = bs.get(rand.nextInt(bs.size())); 
        System.out.println("businesschoice :" + businesschoice);
	    model.addAttribute("businesschoice",businesschoice);
	    model.addAttribute("businesses",br.getBusinesses());
		return "homepage";
	}
	
	
	
	
}
