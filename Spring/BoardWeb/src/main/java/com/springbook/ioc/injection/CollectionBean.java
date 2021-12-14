package com.springbook.ioc.injection;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class CollectionBean {

	//list
	private List<String> addressList;
	
	public void setAddressList(List<String> addressList) {
		this.addressList = addressList;
	}
	
	public List<String> getAddressList() {
		return addressList;
	}
	
	//set
	private Set<String> addressList1;
	
	public void SetAddressList1(Set<String> addressList1)	{
		this.addressList1 = addressList1;
	}
	
	public Set<String> getAddressList1() {
		return addressList1;
	}
	
	//map
	private Map<String, String> addressList2;

	public Map<String, String> getAddressList2() {
		return addressList2;
	}

	public void setAddressList2(Map<String, String> addressList2) {
		this.addressList2 = addressList2;
	}
	
	
	
	
	
}
