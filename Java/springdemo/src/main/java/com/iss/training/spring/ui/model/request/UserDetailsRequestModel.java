package com.iss.training.spring.ui.model.request;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class UserDetailsRequestModel {
	@NotNull(message = "First Name cannot be null")
	private String firstName;
	@NotNull(message = "Last Name cannot be null")
	private String lastName;
	@NotNull(message = "Email cannot be null")
	@Email
	private String email;
	@Size(min=8, max=16, message = "Password Should be 8 to 16 chars")
	@NotNull(message = "First Name cannot be null")
	private String password;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
