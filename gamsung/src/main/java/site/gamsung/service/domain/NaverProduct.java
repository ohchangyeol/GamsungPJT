package site.gamsung.service.domain;

import java.util.List;

public class NaverProduct {
	private List<NaverProduct> items;
	private String title;
	private String image;
	private String mallName;
	private String maker;
	private String brand;
	private String link;
	private String productId;
	private String productType;
	private String hprice;
	private String lprice;
	private String category1;
	private String category2;
	private String category3;
	private String category4;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title.replaceAll("<b>캠핑</b>", "");
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getLprice() {
		return lprice;
	}
	public void setLprice(String lprice) {
		this.lprice = lprice;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = "#"+category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = "#"+category2;
	}
	public String getCategory3() {
		return category3;
	}
	public void setCategory3(String category3) {
		this.category3 = "#"+category3;
	}
	public String getMallName() {
		return mallName;
	}
	public void setMallName(String mallName) {
		this.mallName = mallName;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getHprice() {
		return hprice;
	}
	public void setHprice(String hprice) {
		this.hprice = hprice;
	}
	public List<NaverProduct> getItems() {
		return items;
	}
	public void setItems(List<NaverProduct> items) {
		this.items = items;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getCategory4() {
		return category4;
	}
	public void setCategory4(String category4) {
		this.category4 = category4;
	}
	@Override
	public String toString() {
		return "NaverProduct [items=" + items + ", title=" + title + ", image=" + image + ", mallName=" + mallName
				+ ", maker=" + maker + ", brand=" + brand + ", link=" + link + ", productId=" + productId
				+ ", productType=" + productType + ", hprice=" + hprice + ", lprice=" + lprice + ", category1="
				+ category1 + ", category2=" + category2 + ", category3=" + category3 + ", category4=" + category4
				+ "]\n";
	}
}
