package com.aroundog.model.service;

import java.util.List;

import com.aroundog.model.domain.FreeComment;

public interface FreeCommentService {
	public List selectAll();
	public void delete(int freecomment_id);
	public void insert(FreeComment freeComment);
	public void update(FreeComment freeComment);
	public FreeComment select(int freecomment_id);
	public void commentAdd(FreeComment freeComment);
}
