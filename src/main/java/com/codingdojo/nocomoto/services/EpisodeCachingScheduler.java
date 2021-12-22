package com.codingdojo.nocomoto.services;

import java.net.http.HttpClient;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.config.ConfigData.Option;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.codingdojo.nocomoto.models.Episode;
import com.codingdojo.nocomoto.repositories.EpisodeRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class EpisodeCachingScheduler {
	
    Logger logger = LoggerFactory.getLogger(this.getClass());
    
    private final RestTemplate restTemplate;
 
    private final EpisodeRepository episodeRepository;
  
    public EpisodeCachingScheduler(final RestTemplateBuilder restTemplateBuilder, final EpisodeRepository episodeRepository) {
    	this.restTemplate = restTemplateBuilder.build();
    	this.episodeRepository = episodeRepository;
    }
	
	@Scheduled(cron = "0 * * * * *")
	public void updateEpisodeDetails()
	{
		List<Episode> episodePayload = getEpisodesFromBuzzsprout();
		episodePayload.forEach(episode -> episodeRepository.save(episode));
	}
	
	public List<Episode> getEpisodesFromBuzzsprout()
	{
		ObjectMapper objectMapper = new ObjectMapper();
		
		String payload = restTemplate.getForObject("https://www.buzzsprout.com/api/147064/episodes.json?api_token=b3b550c2006d4111d5b7f906df6ae6f3", String.class);
		List<Episode> episodes = null;
		try {
			episodes = objectMapper.readValue(payload, new TypeReference<List<Episode>>(){});
		}
		catch(JsonProcessingException e)
		{
			logger.error("shits all fucked up",e);
		}
		
		return episodes;
	}

}
