package com.codingdojo.nocomoto.models;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Embeddable;

@SuppressWarnings("serial")
@Embeddable
public class CommentKey implements Serializable {
	
	

	@Column(name = "user_id")
	Long userId;
	
	@Column(name = "episode_id")
	Long episodeId;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getEpisodeId() {
		return episodeId;
	}

	public void setEpisodeId(Long episodeId) {
		this.episodeId = episodeId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(episodeId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentKey other = (CommentKey) obj;
		return Objects.equals(episodeId, other.episodeId) && Objects.equals(userId, other.userId);
	}
	
}