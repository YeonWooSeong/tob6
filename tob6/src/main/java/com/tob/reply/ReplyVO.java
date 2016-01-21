package com.tob.reply;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class ReplyVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int  replySeq;
	private String comment;
	private String writer;
	private String regDate;
	private String evtId;
	
	
	public ReplyVO() {
		// TODO Auto-generated constructor stub
	}
	
	public ReplyVO(int  replySeq,String comment,String writer,String regDate,String evtId) {
		this.replySeq = replySeq;
		this.comment = comment;
		this.writer = writer;
		this.regDate = regDate;
		this.evtId = evtId;
	}

	public int getReplySeq() {
		return replySeq;
	}

	public String getComment() {
		return comment;
	}

	public String getWriter() {
		return writer;
	}

	public String getRegDate() {
		return regDate;
	}

	
	public String getEvtId() {
		return evtId;
	}

	public void setReplySeq(int replySeq) {
		this.replySeq = replySeq;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	
	public void setEvtId(String evtId) {
		this.evtId = evtId;
	}

	
	
	

}
