package model;


import java.sql.SQLException;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;



public class Movie {
	private int id;
	private String name;

	private int currentEpisode;
	private int totalEpisode;
	private List<AvartarMovie> avatars;
	private String descriptionVN;
	private String descriptionEN;
	private int status;

	private LocalDateTime createAt;

	private double price;
	private double renderPrice;
	private LocalDateTime purchaseAt;
	private Double purchasePrice;


	public Movie() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public int getCurrentEpisode() {
		return currentEpisode;
	}

	public void setCurrentEpisode(int currentEpisode) {
		this.currentEpisode = currentEpisode;
	}

	public int getTotalEpisode() {
		return totalEpisode;
	}

	public void setTotalEpisode(int totalEpisode) {
		this.totalEpisode = totalEpisode;
	}



	public List<AvartarMovie> getAvatars() {
		return avatars;
	}

	public void setAvatars(List<AvartarMovie> avatars) {
		this.avatars = avatars;
	}


	public String getDescriptionVN() {
		return descriptionVN;
	}

	public void setDescriptionVN(String descriptionVN) {
		this.descriptionVN = descriptionVN;
	}

	public String getDescriptionEN() {
		return descriptionEN;
	}

	public void setDescriptionEN(String descriptionEN) {
		this.descriptionEN = descriptionEN;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}


	public LocalDateTime getCreateAt() {
		return createAt;
	}

	public void setCreateAt(LocalDateTime createAt) {
		this.createAt = createAt;
	}


	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	public String getFirstAvatar(){
		try{
			return avatars.get(0).getName();
		}catch (Exception e){
			return "null";
		}
	}


	public Double getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(Double purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public void setRenderPrice(double renderPrice) {
		this.renderPrice = renderPrice;
	}



	public LocalDateTime getPurchaseAt() {
		return purchaseAt;
	}

	public String changeFormat(){
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy   HH:mm:ss");
		String formattedDateTime = purchaseAt.format(formatter);
		return  formattedDateTime;
	}
	public void setPurchaseAt(LocalDateTime purchaseAt) {
		this.purchaseAt = purchaseAt;
	}

	@Override
	public String toString() {
		return "Movie{" +
				"id=" + id +
				", name='" + name + '\'' +
				", currentEpisode=" + currentEpisode +
				", totalEpisode=" + totalEpisode +
				", avatars=" + avatars +
				", descriptionVN='" + descriptionVN + '\'' +
				", descriptionEN='" + descriptionEN + '\'' +
				", status=" + status +
				", createAt=" + createAt +
				", price=" + price +
				", renderPrice=" + renderPrice +
				", purchaseAt=" + purchaseAt +
				", purchasePrice=" + purchasePrice +
				'}';
	}
}
