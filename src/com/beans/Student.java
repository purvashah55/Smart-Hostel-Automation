package com.beans;

public class Student
{
	private String firstName,middleName,lastName,studentUserName,studentPassword;

	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Student(String studentUserName, String studentPassword) {
		super();
		this.studentUserName = studentUserName;
		this.studentPassword = studentPassword;
	}
	
	public Student(String firstName,String middleName,String lastName,String studentUserName, String studentPassword)
	{
		super();
		this.firstName=firstName;
		this.middleName=middleName;
		this.lastName=lastName;
		this.studentUserName = studentUserName;
		this.studentPassword = studentPassword;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getStudentUserName() {
		return studentUserName;
	}

	public void setStudentUserName(String studentUserName) {
		this.studentUserName = studentUserName;
	}

	public String getStudentPassword() {
		return studentPassword;
	}

	public void setStudentPassword(String studentPassword) {
		this.studentPassword = studentPassword;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((middleName == null) ? 0 : middleName.hashCode());
		result = prime * result + ((studentPassword == null) ? 0 : studentPassword.hashCode());
		result = prime * result + ((studentUserName == null) ? 0 : studentUserName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Student other = (Student) obj;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (middleName == null) {
			if (other.middleName != null)
				return false;
		} else if (!middleName.equals(other.middleName))
			return false;
		if (studentPassword == null) {
			if (other.studentPassword != null)
				return false;
		} else if (!studentPassword.equals(other.studentPassword))
			return false;
		if (studentUserName == null) {
			if (other.studentUserName != null)
				return false;
		} else if (!studentUserName.equals(other.studentUserName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Student [firstName=" + firstName + ", middleName=" + middleName + ", lastName=" + lastName
				+ ", studentUserName=" + studentUserName + ", studentPassword=" + studentPassword + "]";
	}
	
	
}
