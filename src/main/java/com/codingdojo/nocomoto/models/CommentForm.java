package com.codingdojo.nocomoto.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import org.springframework.format.annotation.DateTimeFormat;

public class CommentForm {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
//	@ManyToOne(fetch = FetchType.LAZY)
//	@MapsId("userId")
//	@JoinColumn(name = "user_id")
//	User user;
	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@MapsId("episodeId")
//	@JoinColumn(name = "episode_id")
//	Episode episode;
	
//	@Column(updatable=false)
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
//	private Date createdAt;
	
//	@DateTimeFormat(pattern="yyyy-MM-dd")
//	private Date updatedAt;
	
//	@PrePersist
//	protected void onCreated() {
//		this.createdAt = new Date();
//	}
	
//	@PreUpdate
//	protected void onUpdate() {
//		this.updatedAt = new Date();
//	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	public CommentForm() {}
	
	public CommentForm(String content) {
		this.content = content;
	}
	
	private String content;

	private String href;
	
	private String label;
	
	private Long user_id;
	
	private Long episode_id;

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	public Long getEpisode_id() {
		return episode_id;
	}

	public void setEpisode_id(Long episode_id) {
		this.episode_id = episode_id;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}


	
}
