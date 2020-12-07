package co.grandcircus.YelpFusion.Service;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.YelpFusion.Model.Event;


public interface EventRepository extends JpaRepository<Event, Long>{
	

}
