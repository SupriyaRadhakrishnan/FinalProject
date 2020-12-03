package co.grandcircus.YelpFusion.Controller;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import co.grandcircus.YelpFusion.Model.Business;
import co.grandcircus.YelpFusion.Model.BusinessResponse;
import co.grandcircus.YelpFusion.Service.YelpFusionService;

@Controller
public class YelpFusionController {
	
	
	@Autowired
	private YelpFusionService yfs;
	
	private BusinessResponse br = new BusinessResponse() ;
	
	@GetMapping("/")
	public String index()
	{
	    br = new BusinessResponse();
		return"index";
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
