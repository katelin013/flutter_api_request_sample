import 'package:flutterweathersample/generated/json/base/json_convert_content.dart';
import 'package:flutterweathersample/generated/json/base/json_filed.dart';

class WeatherResult.dartEntity with JsonConvert<WeatherResult.dartEntity> {
	String success;
	WeatherResult.dartResult result;
	WeatherResult.dartRecords records;
}

class WeatherResult.dartResult with JsonConvert<WeatherResult.dartResult> {
	@JSONField(name: "resource_id")
	String resourceId;
	List<WeatherResult.dartResultField> fields;
}

class WeatherResult.dartResultField with JsonConvert<WeatherResult.dartResultField> {
	String id;
	String type;
}

class WeatherResult.dartRecords with JsonConvert<WeatherResult.dartRecords> {
	String datasetDescription;
	List<WeatherResult.dartRecordsLocation> location;
}

class WeatherResult.dartRecordsLocation with JsonConvert<WeatherResult.dartRecordsLocation> {
	String locationName;
	List<WeatherResult.dartRecordsLocationWeatherElemant> weatherElement;
}

class WeatherResult.dartRecordsLocationWeatherElemant with JsonConvert<WeatherResult.dartRecordsLocationWeatherElemant> {
	String elementName;
	List<WeatherResult.dartRecordsLocationWeatherElemantTime> time;
}

class WeatherResult.dartRecordsLocationWeatherElemantTime with JsonConvert<WeatherResult.dartRecordsLocationWeatherElemantTime> {
	String startTime;
	String endTime;
	WeatherResult.dartRecordsLocationWeatherElementTimeParameter parameter;
}

class WeatherResult.dartRecordsLocationWeatherElementTimeParameter with JsonConvert<WeatherResult.dartRecordsLocationWeatherElementTimeParameter> {
	String parameterName;
	String parameterValue;
}
