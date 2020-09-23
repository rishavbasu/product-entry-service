
package com.uws.productentry.domainobject;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "Products")
public class Product implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8060241643836470548L;
	
	@Id
	private String id;
	private String product;
	private String	description;
	private byte[]	image;
	private String createdDate;
	private String updatedDate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public final String getDescription() {
		return this.description;
	}

	public final void setDescription(String description) {
		this.description = description;
	}

	public final byte[] getImage() {
		return this.image;
	}

	public final void setImage(byte[] image) {
		this.image = image;
	}
}
