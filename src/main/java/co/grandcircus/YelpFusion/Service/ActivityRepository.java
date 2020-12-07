package co.grandcircus.YelpFusion.Service;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.YelpFusion.Model.Activity;

public interface ActivityRepository extends JpaRepository<Activity, Long>{

}
