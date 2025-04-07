package com.formacion.entities;

import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "cliente")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firstName;
    private String lastName;
    private String maidenName;
    private Integer age;
    private String gender;
    private String email;
    private String phone;
    private String username;
    private String password;
    private String birthDate;
    private String image;
    private String bloodGroup;
    private Double height;
    private Double weight;
    private String eyeColor;
    private String hairColor;
    private String hairType;

    private String address;
    private String city;
    private String state;
    private String stateCode;
    private String postalCode;
    private Double lat;
    private Double lng;
    private String country;

    private String macAddress;
    private String university;
    
    private String bankCardExpire;
    private String bankCardNumber;
    private String bankCardType;
    private String bankCurrency;
    private String bankIban;
    
    private String companyDepartment;
    private String companyName;
    private String companyTitle;
    private String companyAddress;
    private String companyCity;
    private String companyState;
    private String companyStateCode;
    private String companyPostalCode;
    private Double companyLat;
    private Double companyLng;
    private String companyCountry;
    
    private String ein;
    private String ssn;
    private String userAgent;
    
    private String cryptoCoin;
    private String cryptoWallet;
    private String cryptoNetwork;
    
    private String role;

    
    
    
	public Long getId() {
		return id;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getMaidenName() {
		return maidenName;
	}

	public Integer getAge() {
		return age;
	}

	public String getGender() {
		return gender;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public String getImage() {
		return image;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public Double getHeight() {
		return height;
	}

	public Double getWeight() {
		return weight;
	}

	public String getEyeColor() {
		return eyeColor;
	}

	public String getHairColor() {
		return hairColor;
	}

	public String getHairType() {
		return hairType;
	}

	public String getAddress() {
		return address;
	}

	public String getCity() {
		return city;
	}

	public String getState() {
		return state;
	}

	public String getStateCode() {
		return stateCode;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public Double getLat() {
		return lat;
	}

	public Double getLng() {
		return lng;
	}

	public String getCountry() {
		return country;
	}

	public String getMacAddress() {
		return macAddress;
	}

	public String getUniversity() {
		return university;
	}

	public String getBankCardExpire() {
		return bankCardExpire;
	}

	public String getBankCardNumber() {
		return bankCardNumber;
	}

	public String getBankCardType() {
		return bankCardType;
	}

	public String getBankCurrency() {
		return bankCurrency;
	}

	public String getBankIban() {
		return bankIban;
	}

	public String getCompanyDepartment() {
		return companyDepartment;
	}

	public String getCompanyName() {
		return companyName;
	}

	public String getCompanyTitle() {
		return companyTitle;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public String getCompanyCity() {
		return companyCity;
	}

	public String getCompanyState() {
		return companyState;
	}

	public String getCompanyStateCode() {
		return companyStateCode;
	}

	public String getCompanyPostalCode() {
		return companyPostalCode;
	}

	public Double getCompanyLat() {
		return companyLat;
	}

	public Double getCompanyLng() {
		return companyLng;
	}

	public String getCompanyCountry() {
		return companyCountry;
	}

	public String getEin() {
		return ein;
	}

	public String getSsn() {
		return ssn;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public String getCryptoCoin() {
		return cryptoCoin;
	}

	public String getCryptoWallet() {
		return cryptoWallet;
	}

	public String getCryptoNetwork() {
		return cryptoNetwork;
	}

	public String getRole() {
		return role;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setMaidenName(String maidenName) {
		this.maidenName = maidenName;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public void setEyeColor(String eyeColor) {
		this.eyeColor = eyeColor;
	}

	public void setHairColor(String hairColor) {
		this.hairColor = hairColor;
	}

	public void setHairType(String hairType) {
		this.hairType = hairType;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public void setMacAddress(String macAddress) {
		this.macAddress = macAddress;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public void setBankCardExpire(String bankCardExpire) {
		this.bankCardExpire = bankCardExpire;
	}

	public void setBankCardNumber(String bankCardNumber) {
		this.bankCardNumber = bankCardNumber;
	}

	public void setBankCardType(String bankCardType) {
		this.bankCardType = bankCardType;
	}

	public void setBankCurrency(String bankCurrency) {
		this.bankCurrency = bankCurrency;
	}

	public void setBankIban(String bankIban) {
		this.bankIban = bankIban;
	}

	public void setCompanyDepartment(String companyDepartment) {
		this.companyDepartment = companyDepartment;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public void setCompanyTitle(String companyTitle) {
		this.companyTitle = companyTitle;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public void setCompanyCity(String companyCity) {
		this.companyCity = companyCity;
	}

	public void setCompanyState(String companyState) {
		this.companyState = companyState;
	}

	public void setCompanyStateCode(String companyStateCode) {
		this.companyStateCode = companyStateCode;
	}

	public void setCompanyPostalCode(String companyPostalCode) {
		this.companyPostalCode = companyPostalCode;
	}

	public void setCompanyLat(Double companyLat) {
		this.companyLat = companyLat;
	}

	public void setCompanyLng(Double companyLng) {
		this.companyLng = companyLng;
	}

	public void setCompanyCountry(String companyCountry) {
		this.companyCountry = companyCountry;
	}

	public void setEin(String ein) {
		this.ein = ein;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public void setCryptoCoin(String cryptoCoin) {
		this.cryptoCoin = cryptoCoin;
	}

	public void setCryptoWallet(String cryptoWallet) {
		this.cryptoWallet = cryptoWallet;
	}

	public void setCryptoNetwork(String cryptoNetwork) {
		this.cryptoNetwork = cryptoNetwork;
	}

	public void setRole(String role) {
		this.role = role;
	}

    // Getters y setters (se omiten por brevedad)
    
}
