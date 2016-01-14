package com.tob.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tob.global.Command;
import com.tob.reply.ReplyVO;

@Repository
public interface ReplyMapper {
	public int insert(ReplyVO o);
	public int update(ReplyVO o);
	public int delete(String writer);
	public int count();
	public List<ReplyVO> selectAll(Command command);
}
