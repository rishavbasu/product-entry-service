package com.uws.productentry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.uws.productentry.domainobject.Product;
import com.uws.productentry.dto.ProductEntryForm;
import com.uws.productentry.service.ProductEntryService;
import java.util.List;

@RestController
@RequestMapping(value = "/products")
public class ProductEntryController {

	@Autowired
	private ProductEntryService productEntryService;

	@InitBinder
	protected void initBinder(ServletRequestDataBinder binder) {
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}

	@RequestMapping(method = RequestMethod.POST)
	public String saveProducts(ProductEntryForm productEntryForm) {
		productEntryService.saveProducts(productEntryForm.getProducts());
		return "success";
	}

	@RequestMapping(method = RequestMethod.PUT)
	public String updateProducts(ProductEntryForm productEntryForm) {
		productEntryService.saveProducts(productEntryForm.getProducts());
		return "success";
	}

	@RequestMapping(value = "/{productId}", method = RequestMethod.GET)
	public Product fetchProductById(@PathVariable String productId) {
		return productEntryService.fetchProductById(productId);
	}
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public List<Product> fetchProductById() {
		return productEntryService.getAllProducts();
	}
}
