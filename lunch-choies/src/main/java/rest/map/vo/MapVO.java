package rest.map.vo;

import lombok.Data;

@Data
public class MapVO {
	private Long map_code;
	private String place_name;
	private String address;
	private double lat;
	private double lon;
	private Long favo;
}
