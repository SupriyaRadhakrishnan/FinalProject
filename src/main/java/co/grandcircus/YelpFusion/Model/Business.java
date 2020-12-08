package co.grandcircus.YelpFusion.Model;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "business")
public class Business {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long businessid;
	private String id;
	private String name;
	private String image_url;
	private String url;
	@Transient
	private boolean is_closed;
	@Transient
	private int review_count;
	@Transient
	private String phone;
	@Transient
	private String display_phone;
	@Transient
	private double distance;
	@Transient
	private String alias;
	@Transient
	private double rating;
	@Transient
	private List<Category> categories;
	@Transient
	private Coordinates coordinates;
	@Transient
	private List<String> transactions;
	@Transient
	private Location location;
	private int favourite;
	private int notfavourite;

	@ManyToOne
	private Activity activity;

	public Business() {

	}

	public Business(long businessid, String id, String name, String image_url, String url, boolean is_closed,
			int review_count, String phone, String display_phone, double distance, String alias, double rating,
			List<Category> categories, Coordinates coordinates, List<String> transactions, Location location) {
		super();
		this.businessid = businessid;
		this.id = id;
		this.name = name;
		this.image_url = image_url;
		this.url = url;
		this.is_closed = is_closed;
		this.review_count = review_count;
		this.phone = phone;
		this.display_phone = display_phone;
		this.distance = distance;
		this.alias = alias;
		this.rating = rating;
		this.categories = categories;
		this.coordinates = coordinates;
		this.transactions = transactions;
		this.location = location;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public boolean isIs_closed() {
		return is_closed;
	}

	public void setIs_closed(boolean is_closed) {
		this.is_closed = is_closed;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getReview_count() {
		return review_count;
	}

	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDisplay_phone() {
		return display_phone;
	}

	public void setDisplay_phone(String display_phone) {
		this.display_phone = display_phone;
	}

	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public Coordinates getCoordinates() {
		return coordinates;
	}

	public void setCoordinates(Coordinates coordinates) {
		this.coordinates = coordinates;
	}

	public List<String> getTransactions() {
		return transactions;
	}

	public void setTransactions(List<String> transactions) {
		this.transactions = transactions;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public long getBusinessid() {
		return businessid;
	}

	public void setBusinessid(long businessid) {
		this.businessid = businessid;
	}

	public int getFavourite() {
		return favourite;
	}

	public void setFavourite(int favourite) {
		this.favourite = favourite;
	}

	public int getNotfavourite() {
		return notfavourite;
	}

	public void setNotfavourite(int notfavourite) {
		this.notfavourite = notfavourite;
	}

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	@Override
	public String toString() {
		return "Business [businessid=" + businessid + ", id=" + id + ", name=" + name + ", image_url=" + image_url
				+ ", url=" + url + ", is_closed=" + is_closed + ", review_count=" + review_count + ", phone=" + phone
				+ ", display_phone=" + display_phone + ", distance=" + distance + ", alias=" + alias + ", rating="
				+ rating + ", categories=" + categories + ", coordinates=" + coordinates + ", transactions="
				+ transactions + ", location=" + location + ", favourite=" + favourite + ", notfavourite="
				+ notfavourite + ", activity=" + activity + "]";
	}

}
