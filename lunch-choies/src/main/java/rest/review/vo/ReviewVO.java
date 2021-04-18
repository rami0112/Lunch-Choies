package rest.review.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReviewVO {
	private Long review_code;
	private String content;
	private String nickname;
	private String member_id;
	private String place_name;
	private String address;
	private LocalDateTime reg_date;
	private Long rating;
}
