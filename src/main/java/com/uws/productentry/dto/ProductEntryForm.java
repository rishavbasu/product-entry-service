package com.uws.productentry.dto;

import java.util.List;

import com.uws.productentry.domainobject.Product;

public class ProductEntryForm {

	private List<Product> products;

	public final List<Product> getProducts() {
		return this.products;
	}

	public final void setProducts(List<Product> products) {
		this.products = products;
	}

}