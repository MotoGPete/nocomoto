package com.codingdojo.nocomoto.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.nocomoto.models.Episode;
import com.codingdojo.nocomoto.repositories.EpisodeRepository;




@Service
public class EpisodeService {
	 // adding the book repository as a dependency
//		private final EpisodeRepository episodeRepository;
	 	@Autowired
	 	private EpisodeRepository episodeRepository;
//		public EpisodeService(EpisodeRepository episodeRepository) {
//			this.episodeRepository = episodeRepository;
//		}
		// returns all 
		public List<Episode> allEpisodes() {
			return episodeRepository.findAll();
		}
		
		public List<Episode> findDescendingEpisodes(){
			return episodeRepository.descendingEpisodes();
		}
		
		// creates
		
		public Episode createEpisode(Episode episode) {
			return episodeRepository.save(episode);
		}
		// retrieves one
		public Episode findEpisode(Long id) {
			Optional<Episode> optionalEpisode = episodeRepository.findById(id);
			if(optionalEpisode.isPresent()) {
	         return optionalEpisode.get();
	     } else {
	         return null;
	     	}
		}

		//deletes
		public void deleteEpisode(Long id) {
			episodeRepository.deleteById(id);	
		}
		//updates
		public Episode updateEpisode(Episode episode) {
			return episodeRepository.save(episode);
		}
		//add comment eventually
//		public Episode addUserToEpisode?(Episode episode, User user) {
//			episode.getEpisode().add(user);
//			return episodeRepository.save(episode);
			
//	}

}
