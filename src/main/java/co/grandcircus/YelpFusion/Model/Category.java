package co.grandcircus.YelpFusion.Model;

public class Category {

	private String alias;
	private String title;

	public Category() {

	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "Category [alias=" + alias + ", title=" + title + "]";
	}

	
	
}
