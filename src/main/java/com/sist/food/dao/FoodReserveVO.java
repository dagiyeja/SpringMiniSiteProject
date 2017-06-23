package com.sist.food.dao;
/*
 *   NO
     NAME
     KIND
     ADDR
     TEL
     IMAGE      RESERVE => 날짜 (time)
     GU
     SELECT address FROM food
     WHERE kind='한식';
 */
public class FoodReserveVO {
    private int no;
    private String name;
    private String addr;
    private String tel;
    private String image;
    private String gu;
    private String poster;
    
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	   
}
