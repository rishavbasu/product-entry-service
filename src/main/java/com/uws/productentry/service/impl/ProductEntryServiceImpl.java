/**
 * 
 */
package com.uws.productentry.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uws.productentry.domainobject.Product;
import com.uws.productentry.repository.mongodb.ProductsRepository;
import com.uws.productentry.service.ProductEntryService;
import java.util.List;

/**
 * @author Rishav
 *
 */
@Service
public class ProductEntryServiceImpl implements ProductEntryService {
	
	@Autowired
	private ProductsRepository productsRepository;

	/* (non-Javadoc)
	 * @see com.uws.productentry.service.ProductEntryService#saveProducts(java.util.List)
	 */
	@Override
	public void saveProducts(Iterable<Product> products) {
		productsRepository.save(products);

	}

	/* (non-Javadoc)
	 * @see com.uws.productentry.service.ProductEntryService#saveProduct(com.uws.productentry.domainobject.Product)
	 */
	@Override
	public void saveProduct(Product product) {
		productsRepository.save(product);

	}

	/* (non-Javadoc)
	 * @see com.uws.productentry.service.ProductEntryService#fetchProductById(java.lang.String)
	 */
	@Override
	public Product fetchProductById(String id) {
		return productsRepository.findOne(id);
	}

	/* (non-Javadoc)
	 * @see com.uws.productentry.service.ProductEntryService#getAllProducts()
	 */
	@Override
	public List<Product> getAllProducts() {
		return productsRepository.findAll();
	}
}
