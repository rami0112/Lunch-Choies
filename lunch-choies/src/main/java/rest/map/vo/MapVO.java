package rest.map.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MapVO {
	private Long map_code;
	private String place_name;
	private String address;
	private double lat;
	private double lon;
	private String member_id;
	private LocalDateTime reg_date;
}
