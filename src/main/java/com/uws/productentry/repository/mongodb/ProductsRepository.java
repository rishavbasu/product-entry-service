/**
 * 
 */
package com.uws.productentry.repository.mongodb;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.uws.productentry.domainobject.Product;

/**
 * @author Rishav
 *
 */
public interface ProductsRepository extends MongoRepository<Product, String>{

}
