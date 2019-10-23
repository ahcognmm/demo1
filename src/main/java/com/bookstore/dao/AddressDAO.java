package com.bookstore.dao;
import java.util.List;
import com.bookstore.model.Address;
public interface AddressDAO {
	List<Address> findAll();
	int save(Address address);
	Address findBy(int id);
	List<Address> findByUserId(int userId);
}
