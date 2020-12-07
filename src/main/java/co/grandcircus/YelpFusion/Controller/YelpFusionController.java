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
	
	
	
	
	@GetMapping("/register") // Registration Page
	public String register(Model model)
	{
		model.addAttribute("message",message);
		message = "";
	   return "register";
	}
	
	@PostMapping("/register") // Checking if Registration Details are valid,If yes saves it to DB,else redirects to register page with a message
	public String register(User user,Model model)
	{
		User u = urep.findByEmail(user.getEmail());
		if(u!= null)
		{
			message = "Email id already exists";
			 return "redirect:/register";
		}
		else {
		urep.save(user);
		model.addAttribute("user",user);
		session.setAttribute("username", user.getUsername());
		session.setAttribute("userid", user.getId());
		session.setAttribute("useremail", user.getEmail());
		model.addAttribute("groups",user.getUsergroup());	
		model.addAttribute("username",session.getAttribute("username"));	
	    return "index";
		}
	}
	
	@PostMapping("/login") // Check if the login details are valid, else redirects to login page with a message
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
			session.setAttribute("useremail", user.getEmail());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("userid", user.getId());
			model.addAttribute("groups",user.getUsergroup());
	    model.addAttribute("username",session.getAttribute("username"));
		return "index";
		}
	}
		
}
