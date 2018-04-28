package com.entity;

import java.io.Serializable;
import java.util.Date;

public class Todo implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 8696869288738610875L;

	private Integer id;

    private String content;

    private Date creatime;

    private String category;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatime() {
        return creatime;
    }

    public void setCreatime(Date creatime) {
        this.creatime = creatime;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

	@Override
	public String toString() {
		return "Todo [id=" + id + ", content=" + content + ", creatime="
				+ creatime + ", category=" + category + "]";
	}
    
     
}