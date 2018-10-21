module monitor.rest {
	requires java.xml.bind;
	requires java.annotation;

	requires monitor.utils;
	requires monitor.statistics;

	requires spark.core;
	requires jackson.core;
	requires jackson.databind;

	exports monitor.rest;
	opens monitor.rest to java.xml.bind;
}
