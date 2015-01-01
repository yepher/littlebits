## CloudBit Protocol Note

![http://littlebits.cc/](https://s3.amazonaws.com/media.littlebits.cc/images/littlebits-logo.svg) 

![CloudBit](https://s3.amazonaws.com/lb-spree/spree/products/2403/large/Cloud_1LR.jpg)

[Cloud Bit Schematic](https://github.com/littlebitselectronics/eagle-files/tree/master/WIRE/LB_BIT_w20_CLOUD/LB_BIT_w20_cloudV1-(3_3)OHW)

## To Document

* Devices
* Devices Info
* Ping
* output

### Get Serial Number Command Line

If you unplug the USB WiFI adapter and plug it into your mack you can get the Serial number with the following shell command:

`````
> system_profiler SPUSBDataType | egrep 'Serial Number: [0-9A-F]{12}'

`````

[USB WiFi Dongle](http://www.realtek.com.tw/products/productsView.aspx?Langid=1&PFid=48&Level=5&Conn=4&ProdID=228)

![RealTec](http://pingbin.com/wp-content/uploads/2012/12/jpeg-300x253.)

### Idntify Device

This is done while the CloubBit is acting as a WiFi access point.

#### Request

`````
GET /identify/ HTTP/1.1
Host: cloudsetup.cc
Accept: */*
Referer: http://cloudsetup.cc/
Accept-Encoding: gzip, deflate, sdch
Accept-Language: en-US,en;q=0.8,es;q=0.6
Pragma: no-cache
Cache-Control: no-cache

`````

#### Response

| Field | type | example | description |
|---|---|---|---|
| id | String | 000000000000 |This appears to be derived from MAC address|
| mac | String | 000000000000 |WiFi MAC address|
| hash | String | ABCDEF012345677889 |I assume this is some sort of MD5(mac) hopefully security is not built on this|
| firmware | String | 1.0.140611a | |
| device | String | littlebits-module-cloud | |
| protocol_version | String | 1.1.0 | |
| setup_version | String | 1.0.0 | |


`````
HTTP/1.1 200 OK
Access-Control-Allow-Headers: Authorization, Content-Type, If-None-Match
Access-Control-Allow-Methods: GET, HEAD, POST, PUT, DELETE, OPTIONS
Access-Control-Allow-Origin: *
Access-Control-Expose-Headers: WWW-Authenticate, Server-Authorization
Access-Control-Max-Age: 86400
Content-Type: application/json; charset=utf-8
Transfer-Encoding: chunked
Date: Sun, 28 Dec 2014 23:38:19 GMT
Server: lighttpd/1.4.35
Expires: 0
Cache-Control: no-cache

{
	"id":"000000000000",
	"mac":"000000000000",
	"hash":"ABCDEF012345677889",
	"firmware_version":"1.0.140611a",
	"device":"littlebits-module-cloud",
	"protocol_version":"1.1.0",
	"setup_version":"1.0.0"
}

````

### Scan WiFi

This is done while the CloubBit is acting as a WiFi access point.

#### Request

`````
GET /scan-wifi/ HTTP/1.1
Host: cloudsetup.cc
Safari/537.36
Accept: */*
Referer: http://cloudsetup.cc/
Accept-Encoding: gzip, deflate, sdch
Accept-Language: en-US,en;q=0.8,es;q=0.6
Pragma: no-cache
Cache-Control: no-cache

`````

#### Response

`````
HTTP/1.1 200 OK
Access-Control-Allow-Headers: Authorization, Content-Type, If-None-Match
Access-Control-Allow-Methods: GET, HEAD, POST, PUT, DELETE, OPTIONS
Access-Control-Allow-Origin: *
Access-Control-Expose-Headers: WWW-Authenticate, Server-Authorization
Access-Control-Max-Age: 86400
Content-Type: application/json; charset=utf-8
Transfer-Encoding: chunked
Date: Sun, 28 Dec 2014 23:38:04 GMT
Server: lighttpd/1.4.35
Expires: 0
Cache-Control: no-cache

{"survey": {
	"accessPoints":
		[
			{
				"ssid": "AccessPointName",
				"mac": "000000000000",
				"security": "wpa2",
				"encryption": "on"
			},
			{
				"ssid": "AnotherAccessPoint",
				"mac": "111111111111",
				"security": "wpa2",
				"encryption": "on"
			}
		]
	}
}

`````


### Set WiFi

This is done while CloudBit is acting as a WiFi access point

#### Request

| Field | type | example | description |
|---|---|---|---|
| ssid | String | AbcAccessPoint | The SSID of the access point to connect to|
| mac | String | | |
| security | String | | They of encryption that the access point uses |
| encryption | Bool | on | "on" or "off" |
| password | String | | Key for the access point |


`````
POST /set-wifi/ HTTP/1.1
Host: cloudsetup.cc
Content-Length: 87
Origin: http://cloudsetup.cc
Content-Type: application/x-www-form-urlencoded
Accept: */*
Referer: http://cloudsetup.cc/
Accept-Encoding: gzip, deflate
Pragma: no-cache
Cache-Control: no-cache

ssid=YOUR_SSID&mac=YOUR_MAC&security=wpa2&encryption=on&password=AP_KEY

`````


#### Response

`````
HTTP/1.1 200 OK
Access-Control-Allow-Headers: Authorization, Content-Type, If-None-Match
Access-Control-Allow-Methods: GET, HEAD, POST, PUT, DELETE, OPTIONS
Access-Control-Allow-Origin: *
Access-Control-Expose-Headers: WWW-Authenticate, Server-Authorization
Access-Control-Max-Age: 86400
Content-Type: application/json; charset=utf-8
Transfer-Encoding: chunked
Date: Sun, 28 Dec 2014 23:38:17 GMT
Server: lighttpd/1.4.35
Expires: 0
Cache-Control: no-cache

{ 
    "success": true 
}

`````

