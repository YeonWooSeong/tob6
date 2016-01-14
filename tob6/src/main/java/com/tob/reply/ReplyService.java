package com.tob.reply;

import java.util.List;

import com.tob.global.Command;

public interface ReplyService {
	public int insert(ReplyVO o);
	public int update(ReplyVO o);
	public int delete(String writer);
	public int count();
	public List<ReplyVO> selectAll(Command command);
}
