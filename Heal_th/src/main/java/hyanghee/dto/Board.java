package hyanghee.dto;

import java.sql.Date;

public class Board {

	//비포애프터 게시글
	private int bf_no;
	private Date bf_inst_date;
	private String bf_title;
	private int height;
	private String gender;
	private int weight;
	private String bf_exercise;
	private String g_weight;
	private String s_date;
	private String e_date;
	private String sele_exercise;
	private String before_con;
	private String c_weight;
	private String g_result;
	private String after_con;
	private Date bf_upt_date;
	private Date bf_delete_date;
	private int bf_hit;
	private int bf_thumbs;
	
	
	//식단 공유 게시글
	private int diet_no;
	private Date d_inst_date;
	private String d_title;
	private String prod_classification;
	private String d_content;
	private Date d_upt_date;
	private Date d_delete_date;
	private int d_hit;
	private int d_thumbs;
	
	
	//후기 게시글
	private int review_no;
	private Date r_inst_date;
	private String r_title;
	private String 	gym_name;
	private String gym_introduce;
	private String classification;
	private String price;
	private String address;
	private int score;
	private String review;
	private Date r_upt_date;
	private Date r_delete_date;
	private int r_hit;
	private int r_thumbs;
	
	
	//운동인증 게시글
	private int verify_no;
	private String v_title;
	private String exercise;
	private String time;
	private int kcal;
	private String verify_content;
	private int v_hit;
	private Date v_inst_date;
	private Date v_upt_date;
	private Date v_delete_date;
	private int v_thumbs;
	
	//공통 요소
	private int user_no;
	private int category_no;
	
	
	public Board() {	}


	public Board(int bf_no, Date bf_inst_date, String bf_title, int height, String gender, int weight,
			String bf_exercise, String g_weight, String s_date, String e_date, String sele_exercise, String before_con,
			String c_weight, String g_result, String after_con, Date bf_upt_date, Date bf_delete_date, int bf_hit,
			int bf_thumbs, int diet_no, Date d_inst_date, String d_title, String prod_classification, String d_content,
			Date d_upt_date, Date d_delete_date, int d_hit, int d_thumbs, int review_no, Date r_inst_date,
			String r_title, String gym_name, String gym_introduce, String classification, String price, String address,
			int score, String review, Date r_upt_date, Date r_delete_date, int r_hit, int r_thumbs, int verify_no,
			String v_title, String exercise, String time, int kcal, String verify_content, int v_hit, Date v_inst_date,
			Date v_upt_date, Date v_delete_date, int v_thumbs, int user_no, int category_no) {
		super();
		this.bf_no = bf_no;
		this.bf_inst_date = bf_inst_date;
		this.bf_title = bf_title;
		this.height = height;
		this.gender = gender;
		this.weight = weight;
		this.bf_exercise = bf_exercise;
		this.g_weight = g_weight;
		this.s_date = s_date;
		this.e_date = e_date;
		this.sele_exercise = sele_exercise;
		this.before_con = before_con;
		this.c_weight = c_weight;
		this.g_result = g_result;
		this.after_con = after_con;
		this.bf_upt_date = bf_upt_date;
		this.bf_delete_date = bf_delete_date;
		this.bf_hit = bf_hit;
		this.bf_thumbs = bf_thumbs;
		this.diet_no = diet_no;
		this.d_inst_date = d_inst_date;
		this.d_title = d_title;
		this.prod_classification = prod_classification;
		this.d_content = d_content;
		this.d_upt_date = d_upt_date;
		this.d_delete_date = d_delete_date;
		this.d_hit = d_hit;
		this.d_thumbs = d_thumbs;
		this.review_no = review_no;
		this.r_inst_date = r_inst_date;
		this.r_title = r_title;
		this.gym_name = gym_name;
		this.gym_introduce = gym_introduce;
		this.classification = classification;
		this.price = price;
		this.address = address;
		this.score = score;
		this.review = review;
		this.r_upt_date = r_upt_date;
		this.r_delete_date = r_delete_date;
		this.r_hit = r_hit;
		this.r_thumbs = r_thumbs;
		this.verify_no = verify_no;
		this.v_title = v_title;
		this.exercise = exercise;
		this.time = time;
		this.kcal = kcal;
		this.verify_content = verify_content;
		this.v_hit = v_hit;
		this.v_inst_date = v_inst_date;
		this.v_upt_date = v_upt_date;
		this.v_delete_date = v_delete_date;
		this.v_thumbs = v_thumbs;
		this.user_no = user_no;
		this.category_no = category_no;
	}


	@Override
	public String toString() {
		return "Board [bf_no=" + bf_no + ", bf_inst_date=" + bf_inst_date + ", bf_title=" + bf_title + ", height="
				+ height + ", gender=" + gender + ", weight=" + weight + ", bf_exercise=" + bf_exercise + ", g_weight="
				+ g_weight + ", s_date=" + s_date + ", e_date=" + e_date + ", sele_exercise=" + sele_exercise
				+ ", before_con=" + before_con + ", c_weight=" + c_weight + ", g_result=" + g_result + ", after_con="
				+ after_con + ", bf_upt_date=" + bf_upt_date + ", bf_delete_date=" + bf_delete_date + ", bf_hit="
				+ bf_hit + ", bf_thumbs=" + bf_thumbs + ", diet_no=" + diet_no + ", d_inst_date=" + d_inst_date
				+ ", d_title=" + d_title + ", prod_classification=" + prod_classification + ", d_content=" + d_content
				+ ", d_upt_date=" + d_upt_date + ", d_delete_date=" + d_delete_date + ", d_hit=" + d_hit + ", d_thumbs="
				+ d_thumbs + ", review_no=" + review_no + ", r_inst_date=" + r_inst_date + ", r_title=" + r_title
				+ ", gym_name=" + gym_name + ", gym_introduce=" + gym_introduce + ", classification=" + classification
				+ ", price=" + price + ", address=" + address + ", score=" + score + ", review=" + review
				+ ", r_upt_date=" + r_upt_date + ", r_delete_date=" + r_delete_date + ", r_hit=" + r_hit + ", r_thumbs="
				+ r_thumbs + ", verify_no=" + verify_no + ", v_title=" + v_title + ", exercise=" + exercise + ", time="
				+ time + ", kcal=" + kcal + ", verify_content=" + verify_content + ", v_hit=" + v_hit + ", v_inst_date="
				+ v_inst_date + ", v_upt_date=" + v_upt_date + ", v_delete_date=" + v_delete_date + ", v_thumbs="
				+ v_thumbs + ", user_no=" + user_no + ", category_no=" + category_no + "]";
	}


	public int getBf_no() {
		return bf_no;
	}


	public void setBf_no(int bf_no) {
		this.bf_no = bf_no;
	}


	public Date getBf_inst_date() {
		return bf_inst_date;
	}


	public void setBf_inst_date(Date bf_inst_date) {
		this.bf_inst_date = bf_inst_date;
	}


	public String getBf_title() {
		return bf_title;
	}


	public void setBf_title(String bf_title) {
		this.bf_title = bf_title;
	}


	public int getHeight() {
		return height;
	}


	public void setHeight(int height) {
		this.height = height;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getWeight() {
		return weight;
	}


	public void setWeight(int weight) {
		this.weight = weight;
	}


	public String getBf_exercise() {
		return bf_exercise;
	}


	public void setBf_exercise(String bf_exercise) {
		this.bf_exercise = bf_exercise;
	}


	public String getG_weight() {
		return g_weight;
	}


	public void setG_weight(String g_weight) {
		this.g_weight = g_weight;
	}


	public String getS_date() {
		return s_date;
	}


	public void setS_date(String s_date) {
		this.s_date = s_date;
	}


	public String getE_date() {
		return e_date;
	}


	public void setE_date(String e_date) {
		this.e_date = e_date;
	}


	public String getSele_exercise() {
		return sele_exercise;
	}


	public void setSele_exercise(String sele_exercise) {
		this.sele_exercise = sele_exercise;
	}


	public String getBefore_con() {
		return before_con;
	}


	public void setBefore_con(String before_con) {
		this.before_con = before_con;
	}


	public String getC_weight() {
		return c_weight;
	}


	public void setC_weight(String c_weight) {
		this.c_weight = c_weight;
	}


	public String getG_result() {
		return g_result;
	}


	public void setG_result(String g_result) {
		this.g_result = g_result;
	}


	public String getAfter_con() {
		return after_con;
	}


	public void setAfter_con(String after_con) {
		this.after_con = after_con;
	}


	public Date getBf_upt_date() {
		return bf_upt_date;
	}


	public void setBf_upt_date(Date bf_upt_date) {
		this.bf_upt_date = bf_upt_date;
	}


	public Date getBf_delete_date() {
		return bf_delete_date;
	}


	public void setBf_delete_date(Date bf_delete_date) {
		this.bf_delete_date = bf_delete_date;
	}


	public int getBf_hit() {
		return bf_hit;
	}


	public void setBf_hit(int bf_hit) {
		this.bf_hit = bf_hit;
	}


	public int getBf_thumbs() {
		return bf_thumbs;
	}


	public void setBf_thumbs(int bf_thumbs) {
		this.bf_thumbs = bf_thumbs;
	}


	public int getDiet_no() {
		return diet_no;
	}


	public void setDiet_no(int diet_no) {
		this.diet_no = diet_no;
	}


	public Date getD_inst_date() {
		return d_inst_date;
	}


	public void setD_inst_date(Date d_inst_date) {
		this.d_inst_date = d_inst_date;
	}


	public String getD_title() {
		return d_title;
	}


	public void setD_title(String d_title) {
		this.d_title = d_title;
	}


	public String getProd_classification() {
		return prod_classification;
	}


	public void setProd_classification(String prod_classification) {
		this.prod_classification = prod_classification;
	}


	public String getD_content() {
		return d_content;
	}


	public void setD_content(String d_content) {
		this.d_content = d_content;
	}


	public Date getD_upt_date() {
		return d_upt_date;
	}


	public void setD_upt_date(Date d_upt_date) {
		this.d_upt_date = d_upt_date;
	}


	public Date getD_delete_date() {
		return d_delete_date;
	}


	public void setD_delete_date(Date d_delete_date) {
		this.d_delete_date = d_delete_date;
	}


	public int getD_hit() {
		return d_hit;
	}


	public void setD_hit(int d_hit) {
		this.d_hit = d_hit;
	}


	public int getD_thumbs() {
		return d_thumbs;
	}


	public void setD_thumbs(int d_thumbs) {
		this.d_thumbs = d_thumbs;
	}


	public int getReview_no() {
		return review_no;
	}


	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}


	public Date getR_inst_date() {
		return r_inst_date;
	}


	public void setR_inst_date(Date r_inst_date) {
		this.r_inst_date = r_inst_date;
	}


	public String getR_title() {
		return r_title;
	}


	public void setR_title(String r_title) {
		this.r_title = r_title;
	}


	public String getGym_name() {
		return gym_name;
	}


	public void setGym_name(String gym_name) {
		this.gym_name = gym_name;
	}


	public String getGym_introduce() {
		return gym_introduce;
	}


	public void setGym_introduce(String gym_introduce) {
		this.gym_introduce = gym_introduce;
	}


	public String getClassification() {
		return classification;
	}


	public void setClassification(String classification) {
		this.classification = classification;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public String getReview() {
		return review;
	}


	public void setReview(String review) {
		this.review = review;
	}


	public Date getR_upt_date() {
		return r_upt_date;
	}


	public void setR_upt_date(Date r_upt_date) {
		this.r_upt_date = r_upt_date;
	}


	public Date getR_delete_date() {
		return r_delete_date;
	}


	public void setR_delete_date(Date r_delete_date) {
		this.r_delete_date = r_delete_date;
	}


	public int getR_hit() {
		return r_hit;
	}


	public void setR_hit(int r_hit) {
		this.r_hit = r_hit;
	}


	public int getR_thumbs() {
		return r_thumbs;
	}


	public void setR_thumbs(int r_thumbs) {
		this.r_thumbs = r_thumbs;
	}


	public int getVerify_no() {
		return verify_no;
	}


	public void setVerify_no(int verify_no) {
		this.verify_no = verify_no;
	}


	public String getV_title() {
		return v_title;
	}


	public void setV_title(String v_title) {
		this.v_title = v_title;
	}


	public String getExercise() {
		return exercise;
	}


	public void setExercise(String exercise) {
		this.exercise = exercise;
	}


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public int getKcal() {
		return kcal;
	}


	public void setKcal(int kcal) {
		this.kcal = kcal;
	}


	public String getVerify_content() {
		return verify_content;
	}


	public void setVerify_content(String verify_content) {
		this.verify_content = verify_content;
	}


	public int getV_hit() {
		return v_hit;
	}


	public void setV_hit(int v_hit) {
		this.v_hit = v_hit;
	}


	public Date getV_inst_date() {
		return v_inst_date;
	}


	public void setV_inst_date(Date v_inst_date) {
		this.v_inst_date = v_inst_date;
	}


	public Date getV_upt_date() {
		return v_upt_date;
	}


	public void setV_upt_date(Date v_upt_date) {
		this.v_upt_date = v_upt_date;
	}


	public Date getV_delete_date() {
		return v_delete_date;
	}


	public void setV_delete_date(Date v_delete_date) {
		this.v_delete_date = v_delete_date;
	}


	public int getV_thumbs() {
		return v_thumbs;
	}


	public void setV_thumbs(int v_thumbs) {
		this.v_thumbs = v_thumbs;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public int getCategory_no() {
		return category_no;
	}


	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	
	
	
	
}
