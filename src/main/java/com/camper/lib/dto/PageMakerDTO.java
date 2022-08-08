package com.camper.lib.dto;

import com.camper.lib.utils.Criteria;

public class PageMakerDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;
	
    public PageMakerDTO(Criteria cri, int total) {
        this.cri = cri;
        this.total = total;
        
    	if(cri.getPageNum() < 1) {
    		cri.setPageNum(1);
    	}
    	
        int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));
        if(cri.getPageNum() > realEnd) {
        	cri.setPageNum(realEnd);
        }
        
        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
        this.startPage = this.endPage - 9;
        
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }
        
        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;
    }
    
    public PageMakerDTO(int pageNum, int total) {
    	if(pageNum < 1) {
    		pageNum = 1;
    	}
    	
        this.total = total;
        int realEnd = (int)(Math.ceil(total * 1.0/10));
        if(pageNum > realEnd) {
        	pageNum = realEnd;
        }
        
        this.endPage = (int)(Math.ceil(pageNum/10.0))*10;
        this.startPage = this.endPage - 9;
        
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }
        
        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;
    }
    
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}

}