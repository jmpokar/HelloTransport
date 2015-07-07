
import java.io.PrintWriter;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.dto.updated.PlaceUpdated;
import com.corporate.transportdb.dto.updated.RoutePlaceMappingUpdated;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/transport-application-context.xml"})
public class Test {


	@Autowired
	TransportServiceUpdated transportService;	

	public TransportServiceUpdated getTransportService() {
		return transportService;
	}

	public void setTransportService(TransportServiceUpdated transportService) {
		this.transportService = transportService;
	}
	
//	@org.junit.Test
//	public void getAllRoutePlaceMapping(){
//		System.out.println("Started");
//		List<RoutePlaceMappingUpdated> l = transportService.getAllRoutePlaceMapping();
//		
//		for (RoutePlaceMappingUpdated routePlaceMappingUpdated : l) {
//			System.out.println(routePlaceMappingUpdated.getPlace().getPlaceName());
//			System.out.println(routePlaceMappingUpdated.getRoute().getRouteName());
//		}
//		
//	}
	
	@org.junit.Test
	public void getAllPlaceMatchingWithGivenWord(){
		System.out.println("Started");
		List<PlaceUpdated> l = transportService.getAllPlaceMatchingWithGivenWord("M - ");
		
		JSONArray jsonArray = new JSONArray();

		for (PlaceUpdated routePlaceMappingUpdated : l) {
			JSONObject jsonObject = new JSONObject();
			try {
				jsonObject.put("id", routePlaceMappingUpdated.getPlaceId());
				jsonObject.put("name", routePlaceMappingUpdated.getPlaceName());
			} catch (JSONException e) {
				e.printStackTrace();
			}
			jsonArray.put(jsonObject);
			
			System.out.println(routePlaceMappingUpdated.getPlaceName());
		}
		
		
		
		System.out.println("INSIDE 6 :"+jsonArray.toString());
		
//		PrintWriter pw = response.getWriter();
//		
//		log.debug("FINAL JSON :"+jsonArray.toString());
//		
//		pw.print(jsonArray.toString());
	}
	
}
