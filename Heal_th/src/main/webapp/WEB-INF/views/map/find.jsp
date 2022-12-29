<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/header.jsp" />

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<style>
#map{left:153px;}
.map_wrap, .map_wrap * {margin:0;padding:0;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:52px;left:275px;bottom:0;width:250px; height: 595px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(220, 220, 220, 0.7);z-index: 1;font-size:12px;border-radius: 10px;opacity: 0;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

#twoDepth-list a:nth-child(1){
	color: #b571e9;
	border-bottom: 2px solid #b571e9;
	margin-top: 1px;
	font-weight: 700;
}

.big-container h3:nth-child(1){
	text-align: center;
}

.big-container {
	width: 1200px;
	margin: 0 auto;
}
#loc,#fac{
    height: 40px;
    width: 280px;
    border: 2px solid #7ca3f5;
    transition: 0.4s;
    padding-top: 8px;
    padding-bottom: 8px;
    text-align: center;
    caret-color: #7ca3f5;
    color:#7ca3f5;
    font-weight: 500;
    font-size: 17px;
}
#loc{
    border-top-left-radius: 30px;
    border-bottom-left-radius: 30px;
}
#fac{
    border-bottom-right-radius: 30px;
    border-top-right-radius: 30px;
}
#loc:hover,#fac:hover{
  box-shadow: 0px 0px .5px 1px #7ca3f5;
  width: 290px;
}
#loc:focus,#fac:focus{
  box-shadow: 0px 0px .5px 1px #7ca3f5;
  width: 290px;
  outline: 2px solid #7ca3f5;
}
.option{
	text-align: center;
}
#searchIcon{
 margin-left: -39px;
  width: 30px;
  height: 30px;
  background-color: #fff;
  color: #7ca3f5;
  justify-content: center;
  align-items: center;
  border-radius: 50%;
  border: none;
}
input:focus::-webkit-input-placeholder,
textarea:focus::-webkit-input-placeholder { /* WebKit browsers */
  color:transparent;
}

input:focus:-moz-placeholder,
textarea:focus:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
  color:transparent;
}

input:focus::-moz-placeholder,
textarea:focus::-moz-placeholder { /* Mozilla Firefox 19+ */
  color:transparent;
}

input:focus:-ms-input-placeholder,
textarea:focus:-ms-input-placeholder { /* Internet Explorer 10+ */
  color:transparent;
}
</style>
<body>
<div id="subvisual">
   <div id="subvisual-A">
      <p id="subv-title">운동 도우미</p>
   </div>
</div>
<div id="twoDepth">
	<div id="twoDepth-list">
		<a href="/map/find">운동 시설 추천</a>
		<a href="/dghelper/healthrecord">운동 일기장</a>
		<a href="/dghelper/healthtest">운동 성향 테스트</a>
		<a href="/dghelper/healthguide">칼로리 사전</a>
		<a href="/dghelper/dgmagotchi">득근이 키우기</a>
	</div>
</div>
<!-- appkey=5398ad247816ce4ac9d9a7374d499494 -->
<div class="big-container">
<h3>주변 시설찾기</h3>
<div class="map_wrap">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    <input type="text" value="" id="loc" class="inputBox" size="15" placeholder="지역을 입력해 주세요"> 
                    <input type="text" value="" id="fac" class="inputBox" size="15" placeholder="찾는 운동시설을 입력해 주세요"> 
                    <button id="searchIcon"><i class="fas fa-search"></i></button>
<!--                     <button type="submit">검색하기</button>  -->
                </form>
            </div>
        </div>
        <br>
	<div id="mapContainer">
	    <div id="map" style="width:75%;height:600px;position:relative;overflow:hidden;"></div>
	
	    <div id="menu_wrap"  class="bg_white">
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
	    </div>
    </div>
</div>
<br><br><br>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5398ad247816ce4ac9d9a7374d499494&libraries=services,clusterer,drawing""></script>

<script type="text/javascript">
function searchAni(){
	console.log("start ani")
	$("#menu_wrap").animate( {
        left:"0px",
        opacity:"100%",
    },500 )
    $("#map").animate( {
        left:"280px",
    },500 )
}
function currentLocation() {
	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
            var locPosition= new kakao.maps.LatLng(lat, lon) // geolocation으로 얻어온 좌표
	            
	        geocoder.coord2Address(locPosition.getLng(), locPosition.getLat(), callback);
	        console.log(locPosition.getLng(), locPosition.getLat());
	        map.setCenter(locPosition);   
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 
	    
		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667)
	    alert('현재 위치를 찾을 수 없습니다!');
	}
	
}
currentLocation();
var markers = [];
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 


//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var geo;
var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {

        console.log('지역 명칭 : ' + result[0].address.address_name);
        geo = result[0].address.address_name;
    }
};

var mapMove = (lng,lat) => {
    return new Promise((resolve, reject) => {
	    geocoder.coord2Address(lng,lat, function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        
		        console.log('지역 명칭 + : ' + result[0].address.address_name);
		        geo = result[0].address.address_name;
			    resolve(geo);
		    } else {
			    reject(status);
		    }
	    });
    });
};

//function mapMove(lng,lat) {
//return new Promise(function(resolve, reject) {
//	geocoder.coord2Address(lng,lat, callback);
 
//  resolve(geo);
//});
//}

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

//마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'dragend', async function() {        
    
	// 지도 중심좌표를 얻어옵니다 
    var latlng = map.getCenter(); 
	
//     mapMove(latlng.getLng(), latlng.getLat()).then(function(geo){})
// 	console.log("geo?----",geo)
// 	mapMove(latlng.getLng(), latlng.getLat()).then(function(geo){
// 		console.log("geo?----",geo)
// 	})
	await mapMove(latlng.getLng(), latlng.getLat())
	console.log("geo?----",geo)

// 	geocoder.coord2Address(latlng.getLng(), latlng.getLat(), callback); // 원래꺼
// 	console.log("geo?----",geo)
	
	
	var fac = document.getElementById('fac').value;
    if (fac.replace(/^\s+|\s+$/g, '')) {
    	ps.keywordSearch(geo + " " + fac, placesSearchCB); 
    }
    
});


// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
	searchAni()
	$(".inputBox").blur()
	var loc = document.getElementById('loc').value;
    var fac = document.getElementById('fac').value;

    if (!loc.replace(/^\s+|\s+$/g, '')) {  //지역 입력 안함
        loc=geo;
    	
    }
    

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(loc + " " + fac, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]) // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
        
        
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

	        // 마커에 클릭이벤트를 등록합니다
	        kakao.maps.event.addListener(marker, 'click', function() {
	              // 해당 마커로 검색하기
	              searchMarker(title);  
	        });
        	
            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
//                 console.log(infowindow.n.La, infowindow.n.Ma); // Wcongnamul 좌표 정보
                var coords = new kakao.maps.Coords(infowindow.n.La, infowindow.n.Ma);
//                 console.log(coords.toLatLng().toString()) // Wcongnamul 좌표 정보 를 WGS84 좌표 정보로 변환
//                 map.setCenter(coords.toLatLng()); //센터를 좌표로 이동
                map.panTo(coords.toLatLng());	//좌표를 센터로 부드럽게 이동
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
    map.setLevel(4);
//     map.panTo(moveLatLon);//부드럽게 이동
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<a href="https://search.daum.net/search?w=tot&DA=YZR&t__nil_searchbox=btn&sug=&sugo=&sq=&o=&q='+places.place_name +'"target="_blank"><div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div></a>';           

    el.innerHTML = itemStr;
    el.className = 'item';
	
    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i,
        value; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                    value = window.scrollY
					console.log("스크롤위치",value)
					
                }
            })(i);
	        window.scrollTo({top:value}) // 페이지 클릭전 스크롤 좌표로 이동
			console.log("스크롤위치",value)
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>'; 


    infowindow.setContent(content);
    infowindow.open(map, marker);
    
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 // 마커 클릭으로 검색하기
function searchMarker(title) {
	var link = "https://search.daum.net/search?w=tot&DA=YZR&t__nil_searchbox=btn&sug=&sugo=&sq=&o=&q="+title
	window.open(link);
}

</script>
</div>
</body>
<jsp:include page="../layout/footer.jsp" />
</html>