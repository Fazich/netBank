package com.bank.domain;

public class Password {
	private String oldpwd;
	private String newpwd;
    private String confirmpwd;
	public String getOldpwd() {
		return oldpwd;
	}
	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}
	public String getNewpwd() {
		return newpwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
	public String getConfirmpwd() {
		return confirmpwd;
	}
	public void setConfirmpwd(String confirmpwd) {
		this.confirmpwd = confirmpwd;
	}

    @Override
    public String toString() {
        return "Password{" +
                "confirmpwd='" + confirmpwd + '\'' +
                ", oldpwd='" + oldpwd + '\'' +
                ", newpwd='" + newpwd + '\'' +
                '}';
    }
}
