package co.grandcircus.YelpFusion.Service;


import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.YelpFusion.Model.User;

public interface UserRepository extends JpaRepository<User, Long>{
	
	User findByEmail(String email);

}
