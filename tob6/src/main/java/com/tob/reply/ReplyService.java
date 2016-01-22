package com.tob.reply;

import java.util.List;

import com.tob.global.Command;

public interface ReplyService {
	public int insert(ReplyVO o);
	public int update(ReplyVO o);
	public int delete(int replySeq);
	public int reply(ReplyVO reply);
	public int count();
	public List<ReplyVO> selectAll();
	public List<String> getList(String evtId);
}
