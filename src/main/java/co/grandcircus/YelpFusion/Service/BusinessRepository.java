package co.grandcircus.YelpFusion.Service;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.YelpFusion.Model.Business;
import co.grandcircus.YelpFusion.Model.Event;

public interface BusinessRepository extends JpaRepository<Business, Long>{

}
