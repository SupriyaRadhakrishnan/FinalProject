package co.grandcircus.YelpFusion.Service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import co.grandcircus.YelpFusion.Model.BusinessResponse;

@Service
public class YelpFusionService {

	String apikey = System.getenv("APIKEY");

	private RestTemplate rt = new RestTemplate();

	public BusinessResponse getBusinesses(String location, String categories, String pricerange) {

	System.out.println("apikey " + apikey);	
	System.out.println(" System get env: " + System.getenv("APIKEY"));
		
		String url = "https://api.yelp.com/v3/businesses/search?&location={location}&radius=40000&price={pricerange}";
		if (!categories.isEmpty()) {
			url += "&categories={categories}";
		}
		// Set up headers.
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + apikey);
		BusinessResponse response = rt.exchange(url, HttpMethod.GET, new HttpEntity<>(headers), BusinessResponse.class,
				location, pricerange, categories).getBody();
		// System.out.println("response " + response);
		return response;
	}
}
