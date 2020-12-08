package co.grandcircus.YelpFusion.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import co.grandcircus.YelpFusion.Model.*;
import co.grandcircus.YelpFusion.Service.*;

@Controller
public class YelpFusionController {
	
	@Autowired
	HttpSession session;

	@Autowired
	private UserRepository urep;	

	private String message = "";

	public static BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("message", message);
		message = "";
		return "login";
	}

	@GetMapping("/index")
	public String goHome(Model model) {
		String email = (String) session.getAttribute("useremail");
		User user = urep.findByEmail(email);
		model.addAttribute("username", session.getAttribute("username"));
		model.addAttribute("groups", user.getUsergroup());
		return "index";
	}

	// Registration Page
	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("message", message);
		message = "";
		return "register";
	}

	/*
	 * Checking if Registration Details are valid, If yes saves it to DB, else
	 * redirects to register page with a message
	 */
	@PostMapping("/register")
	public String register(User user, Model model) {
		User u = urep.findByEmail(user.getEmail());
		if (u != null) {
			message = "Email already exists";
			return "redirect:/register";
		} else {
			
			String pw = user.getPassword();
			pw = pwEncoder.encode(pw);
			user.setPassword(pw);
			urep.save(user);
			
			model.addAttribute("user", user);
			
			session.setAttribute("username", user.getUsername());
			session.setAttribute("userid", user.getId());
			session.setAttribute("useremail", user.getEmail());
			
			model.addAttribute("groups", user.getUsergroup());
			model.addAttribute("username", session.getAttribute("username"));
			
			return "index";
		}
	}

	/*
	 * Check if the login details are valid, else redirects to login page with a
	 * message
	 */
	@PostMapping("/login")
	public String login(String email, String password, Model model) {
		System.out.println("Unencrypted: " + password);
		User user = urep.findByEmail(email);
		System.out.println(user.getPassword());
		if (user != null) {

			if (pwEncoder.matches(password, user.getPassword())) {
				
				session.setAttribute("useremail", user.getEmail());
				session.setAttribute("username", user.getUsername());
				session.setAttribute("userid", user.getId());
				
				model.addAttribute("groups", user.getUsergroup());
				model.addAttribute("username", session.getAttribute("username"));
				return "index";
			}
		}
		
		session.invalidate();
		
		System.out.println("Invalid user details");
		
		message = "Invalid Login Details";
		
		return "redirect:/";
	}
}


