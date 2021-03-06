package com.codingdojo.nocomoto.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.codingdojo.nocomoto.models.Episode;

@Repository
public interface EpisodeRepository extends CrudRepository<Episode, Long>{
	List<Episode> findAll();
	
	Episode save(Episode episode);
	
	@Query(value="SELECT * FROM episodes ORDER BY id DESC", nativeQuery=true)
	List<Episode> descendingEpisodes();
	
}
