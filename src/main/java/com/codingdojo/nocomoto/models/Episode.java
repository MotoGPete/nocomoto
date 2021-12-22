package com.codingdojo.nocomoto.models;

import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="episodes")
@JsonIgnoreProperties(ignoreUnknown= true)
public class Episode {
	
	@Id
	private Long id;
	
	private String title;
	private String audio_url;
	private String artwork_url;
	private String description;
	private String summary;
	private String artist;
	private String tags;
	private String published_at;
	private Integer duration;
	private Integer episode_number;
	private Integer total_plays;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	@PrePersist
	protected void onCreated() {
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	@OneToMany(mappedBy = "episode",fetch = FetchType.LAZY)
	private List<Comment> comments;
		
		
	
	public Episode() {}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAudio_url() {
		return audio_url;
	}
	public void setAudio_url(String audio_url) {
		this.audio_url = audio_url;
	}
	public String getArtwork_url() {
		return artwork_url;
	}
	public void setArtwork_url(String artwork_url) {
		this.artwork_url = artwork_url;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getPublished_at() {
		return published_at;
	}
	public void setPublished_at(String published_at) {
		this.published_at = published_at;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public Integer getEpisode_number() {
		return episode_number;
	}
	public void setEpisode_number(Integer episode_number) {
		this.episode_number = episode_number;
	}
	public Integer getTotal_plays() {
		return total_plays;
	}
	public void setTotal_plays(Integer total_plays) {
		this.total_plays = total_plays;
	}
	
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
	@Override
	public String toString() {
		return "Episode [comments=" + comments + ", id=" + id + ", title=" + title + ", audio_url=" + audio_url + ", artwork_url=" + artwork_url
				+ ", description=" + description + ", summary=" + summary + ", artist=" + artist + ", tags=" + tags
				+ ", published_at=" + published_at + ", duration=" + duration + ", episode_number=" + episode_number
				+ ", total_plays=" + total_plays + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + "]";
	}
	
	
		
}
