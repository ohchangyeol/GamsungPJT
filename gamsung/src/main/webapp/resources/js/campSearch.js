$(document).ready(function () {

    $("#sido").on("propertychange change keyup paste input", function(){

    var sido = $("#sido").val();
    
    if(sido == '서울'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='강남'>강남구</option>");
        $("#sigungu").append("<option value='강동'>강동구</option>");
        $("#sigungu").append("<option value='강북'>강북구</option>");
        $("#sigungu").append("<option value='강서'>강서구</option>");
        $("#sigungu").append("<option value='관악'>관악구</option>");
        $("#sigungu").append("<option value='광진'>광진구</option>");
        $("#sigungu").append("<option value='구로'>구로구</option>");
        $("#sigungu").append("<option value='금천'>금천구</option>");
        $("#sigungu").append("<option value='노원'>노원구</option>");
        $("#sigungu").append("<option value='도봉'>도봉구</option>");
        $("#sigungu").append("<option value='동대문'>동대문구</option>");
        $("#sigungu").append("<option value='동작'>동작구</option>");
        $("#sigungu").append("<option value='마포'>마포구</option>");
        $("#sigungu").append("<option value='서대문'>서대문구</option>");
        $("#sigungu").append("<option value='서초'>서초구</option>");
        $("#sigungu").append("<option value='성동'>성동구</option>");
        $("#sigungu").append("<option value='성북'>성북구</option>");
        $("#sigungu").append("<option value='송파'>송파구</option>");
        $("#sigungu").append("<option value='양천'>양천구</option>");
        $("#sigungu").append("<option value='영등포'>영등포구</option>");
        $("#sigungu").append("<option value='용산'>용산구</option>");
        $("#sigungu").append("<option value='은평'>은평구</option>");
        $("#sigungu").append("<option value='종로'>종로구</option>");
        $("#sigungu").append("<option value='중구'>중구</option>");
        $("#sigungu").append("<option value='중랑'>중랑구</option>");
    };

    if(sido == '부산'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='강서'>강서구</option>");
        $("#sigungu").append("<option value='금정'>금정구</option>");
        $("#sigungu").append("<option value='기장'>기장군</option>");
        $("#sigungu").append("<option value='남구'>남구</option>");
        $("#sigungu").append("<option value='동구'>동구</option>");
        $("#sigungu").append("<option value='동래'>동래구</option>");
        $("#sigungu").append("<option value='부산진'>부산진구</option>");
        $("#sigungu").append("<option value='북구'>북구</option>");
        $("#sigungu").append("<option value='사상'>사상구</option>");
        $("#sigungu").append("<option value='사하'>사하구</option>");
        $("#sigungu").append("<option value='서구'>서구</option>");
        $("#sigungu").append("<option value='수영'>수영구</option>");
        $("#sigungu").append("<option value='연제'>연제구</option>");
        $("#sigungu").append("<option value='영도'>영도구</option>");
        $("#sigungu").append("<option value='중구'>중구</option>");
        $("#sigungu").append("<option value='해운대'>해운대구</option>");
    };

    if(sido == '대구'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='남구'>남구</option>");
        $("#sigungu").append("<option value='달서'>달서구</option>");
        $("#sigungu").append("<option value='달성'>달성군</option>");
        $("#sigungu").append("<option value='동구'>동구</option>");
        $("#sigungu").append("<option value='북구'>북구</option>");
        $("#sigungu").append("<option value='상주'>상주</option>");
        $("#sigungu").append("<option value='서구'>서구</option>");
        $("#sigungu").append("<option value='수성'>수성구</option>");
        $("#sigungu").append("<option value='중구'>중구</option>");
    };

    if(sido == '인천'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='강화'>강화군</option>");
        $("#sigungu").append("<option value='계양'>계양구</option>");
        $("#sigungu").append("<option value='남구'>남구</option>");
        $("#sigungu").append("<option value='남동'>남동구</option>");
        $("#sigungu").append("<option value='동구'>동구</option>");
        $("#sigungu").append("<option value='부평'>부평구</option>");
        $("#sigungu").append("<option value='서구'>서구</option>");
        $("#sigungu").append("<option value='연수'>연수구</option>");
        $("#sigungu").append("<option value='옹진'>옹진구</option>");
        $("#sigungu").append("<option value='중구'>중구</option>");
    };
    
    if(sido == '광주'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='광산'>광산구</option>");
        $("#sigungu").append("<option value='남구'>남구</option>");
        $("#sigungu").append("<option value='동구'>동구</option>");
        $("#sigungu").append("<option value='북구'>북구</option>");
        $("#sigungu").append("<option value='서구'>서구</option>");
    };

    if(sido == '대전'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='대덕'>대덕구</option>");
        $("#sigungu").append("<option value='동구'>동구</option>");
        $("#sigungu").append("<option value='서구'>서구</option>");
        $("#sigungu").append("<option value='유성'>유성구</option>");
        $("#sigungu").append("<option value='중구'>중구</option>");
    };

    if(sido == '울산'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='남구'>남구</option>");
        $("#sigungu").append("<option value='동구'>동구</option>");
        $("#sigungu").append("<option value='북구'>북구</option>");
        $("#sigungu").append("<option value='율주'>율주군</option>");
        $("#sigungu").append("<option value='중구'>중구</option>");
    };

    if(sido == '세종'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='금남'>금남면</option>");
        $("#sigungu").append("<option value='세종'>세종시</option>");
        $("#sigungu").append("<option value='소정'>소정면</option>");
        $("#sigungu").append("<option value='연서'>연서면</option>");
        $("#sigungu").append("<option value='전동'>전동면</option>");
    };

    if(sido == '경기'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='가평'>가평군</option>");
        $("#sigungu").append("<option value='고양'>고양시</option>");
        $("#sigungu").append("<option value='과천'>과천시</option>");
        $("#sigungu").append("<option value='광명'>광명시</option>");
        $("#sigungu").append("<option value='광주'>광주시</option>");
        $("#sigungu").append("<option value='구리'>구리시</option>");
        $("#sigungu").append("<option value='군포'>군포시</option>");
        $("#sigungu").append("<option value='김포'>김포시</option>");
        $("#sigungu").append("<option value='남양주'>남양주시</option>");
        $("#sigungu").append("<option value='동두천'>동두천시</option>");
        $("#sigungu").append("<option value='부천'>부천시</option>");
        $("#sigungu").append("<option value='성남'>성남시</option>");
        $("#sigungu").append("<option value='수원'>수원시</option>");
        $("#sigungu").append("<option value='시흥'>시흥시</option>");
        $("#sigungu").append("<option value='안산'>안산시</option>");
        $("#sigungu").append("<option value='안성'>안성시</option>");
        $("#sigungu").append("<option value='안양'>안양시</option>");
        $("#sigungu").append("<option value='양주'>양주시</option>");
        $("#sigungu").append("<option value='양평'>양평군</option>");
        $("#sigungu").append("<option value='여주'>여주시</option>");
        $("#sigungu").append("<option value='연천'>연천군</option>");
        $("#sigungu").append("<option value='오산'>오산시</option>");
        $("#sigungu").append("<option value='용인'>용인시</option>");
        $("#sigungu").append("<option value='의왕'>의왕시</option>");
        $("#sigungu").append("<option value='의정부'>의정부시</option>");
        $("#sigungu").append("<option value='이천'>이천시</option>");
        $("#sigungu").append("<option value='파주'>파주시</option>");
        $("#sigungu").append("<option value='평택'>평택시</option>");
        $("#sigungu").append("<option value='포천'>포천시</option>");
        $("#sigungu").append("<option value='하남'>하남시</option>");
        $("#sigungu").append("<option value='화성'>화성시</option>");
    };

    if(sido == '강원'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='강릉'>강릉시</option>");
        $("#sigungu").append("<option value='고성'>고성군</option>");
        $("#sigungu").append("<option value='동해'>동해시</option>");
        $("#sigungu").append("<option value='삼척'>삼청시</option>");
        $("#sigungu").append("<option value='속초'>속초시</option>");
        $("#sigungu").append("<option value='양구'>양구군</option>");
        $("#sigungu").append("<option value='양양'>양양군</option>");
        $("#sigungu").append("<option value='영월'>영월군</option>");
        $("#sigungu").append("<option value='원주'>원주시</option>");
        $("#sigungu").append("<option value='인제'>인제군</option>");
        $("#sigungu").append("<option value='정선'>정선군</option>");
        $("#sigungu").append("<option value='철원'>철원군</option>");
        $("#sigungu").append("<option value='춘천'>춘천시</option>");
        $("#sigungu").append("<option value='태백'>태백시</option>");
        $("#sigungu").append("<option value='평창'>평창군</option>");
        $("#sigungu").append("<option value='홍천'>홍천군</option>");
        $("#sigungu").append("<option value='화천'>화천군</option>");
        $("#sigungu").append("<option value='횡성'>횡성군</option>");
    };

    if(sido == '충북'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='괴산'>괴산군</option>");
        $("#sigungu").append("<option value='단양'>단양군</option>");
        $("#sigungu").append("<option value='보은'>보은군</option>");
        $("#sigungu").append("<option value='영동'>영동군</option>");
        $("#sigungu").append("<option value='옥천'>옥천군</option>");
        $("#sigungu").append("<option value='음성'>음성군</option>");
        $("#sigungu").append("<option value='제천'>제천시</option>");
        $("#sigungu").append("<option value='증평'>증평군</option>");
        $("#sigungu").append("<option value='진천'>진천군</option>");
        $("#sigungu").append("<option value='청원'>청원군</option>");
        $("#sigungu").append("<option value='청주'>청주시</option>");
        $("#sigungu").append("<option value='충주'>충주시</option>");
    };

    if(sido == '충남'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='계룡'>계룡시</option>");
        $("#sigungu").append("<option value='공주'>공주시</option>");
        $("#sigungu").append("<option value='금산'>금산군</option>");
        $("#sigungu").append("<option value='논산'>논산시</option>");
        $("#sigungu").append("<option value='당진'>당진시</option>");
        $("#sigungu").append("<option value='보령'>보령시</option>");
        $("#sigungu").append("<option value='부여'>부여군</option>");
        $("#sigungu").append("<option value='서산'>서산시</option>");
        $("#sigungu").append("<option value='서천'>서천군</option>");
        $("#sigungu").append("<option value='아산'>아산시</option>");
        $("#sigungu").append("<option value='예산'>예산군</option>");
        $("#sigungu").append("<option value='천안'>천안시</option>");
        $("#sigungu").append("<option value='청양'>청양군</option>");
        $("#sigungu").append("<option value='태안'>태안군</option>");
        $("#sigungu").append("<option value='홍성'>홍성군</option>");
    };

    if(sido == '전북'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='고창'>고창군</option>");
        $("#sigungu").append("<option value='군산'>군산시</option>");
        $("#sigungu").append("<option value='김제'>김제시</option>");
        $("#sigungu").append("<option value='남원'>남원시</option>");
        $("#sigungu").append("<option value='무주'>무주군</option>");
        $("#sigungu").append("<option value='부안'>부안군</option>");
        $("#sigungu").append("<option value='순창'>순창군</option>");
        $("#sigungu").append("<option value='완주'>완주군</option>");
        $("#sigungu").append("<option value='익산'>익산시</option>");
        $("#sigungu").append("<option value='임실'>임실군</option>");
        $("#sigungu").append("<option value='장수'>장수군</option>");
        $("#sigungu").append("<option value='전주'>전주시</option>");
        $("#sigungu").append("<option value='정읍'>정읍시</option>");
        $("#sigungu").append("<option value='진안'>진안군</option>");
    };
    
    if(sido == '전남'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='강진'>강진군</option>");
        $("#sigungu").append("<option value='고흥'>고흥군</option>");
        $("#sigungu").append("<option value='곡성'>곡성군</option>");
        $("#sigungu").append("<option value='광양'>광양시</option>");
        $("#sigungu").append("<option value='구례'>구례군</option>");
        $("#sigungu").append("<option value='나주'>나주시</option>");
        $("#sigungu").append("<option value='담양'>담양군</option>");
        $("#sigungu").append("<option value='목포'>목포시</option>");
        $("#sigungu").append("<option value='무안'>무안군</option>");
        $("#sigungu").append("<option value='보성'>보성군</option>");
        $("#sigungu").append("<option value='순천'>순천시</option>");
        $("#sigungu").append("<option value='신안'>신안군</option>");
        $("#sigungu").append("<option value='여수'>여수시</option>");
        $("#sigungu").append("<option value='영광'>영광군</option>");
        $("#sigungu").append("<option value='영암'>영암군</option>");
        $("#sigungu").append("<option value='완도'>완도군</option>");
        $("#sigungu").append("<option value='장성'>장성군</option>");
        $("#sigungu").append("<option value='장흥'>장흥군</option>");
        $("#sigungu").append("<option value='진도'>진도군</option>");
    };

    if(sido == '전남'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='강진'>강진군</option>");
        $("#sigungu").append("<option value='고흥'>고흥군</option>");
        $("#sigungu").append("<option value='곡성'>곡성군</option>");
        $("#sigungu").append("<option value='광양'>광양시</option>");
        $("#sigungu").append("<option value='구례'>구례군</option>");
        $("#sigungu").append("<option value='나주'>나주시</option>");
        $("#sigungu").append("<option value='담양'>담양군</option>");
        $("#sigungu").append("<option value='목포'>목포시</option>");
        $("#sigungu").append("<option value='무안'>무안군</option>");
        $("#sigungu").append("<option value='보성'>보성군</option>");
        $("#sigungu").append("<option value='순천'>순천시</option>");
        $("#sigungu").append("<option value='신안'>신안군</option>");
        $("#sigungu").append("<option value='여수'>여수시</option>");
        $("#sigungu").append("<option value='영광'>영광군</option>");
        $("#sigungu").append("<option value='영암'>영암군</option>");
        $("#sigungu").append("<option value='완도'>완도군</option>");
        $("#sigungu").append("<option value='장성'>장성군</option>");
        $("#sigungu").append("<option value='장흥'>장흥군</option>");
        $("#sigungu").append("<option value='진도'>진도군</option>");
        $("#sigungu").append("<option value='함평'>함평군</option>");
        $("#sigungu").append("<option value='해남'>해남군</option>");
        $("#sigungu").append("<option value='화순'>화순군</option>");
    };

    if(sido == '경북'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='경산'>경산시</option>");
        $("#sigungu").append("<option value='경주'>경주시</option>");
        $("#sigungu").append("<option value='고령'>고령군</option>");
        $("#sigungu").append("<option value='구미'>구미시</option>");
        $("#sigungu").append("<option value='군위'>군위군</option>");
        $("#sigungu").append("<option value='김천'>김천시</option>");
        $("#sigungu").append("<option value='문경'>문경시</option>");
        $("#sigungu").append("<option value='봉화'>봉화군</option>");
        $("#sigungu").append("<option value='상주'>상주시</option>");
        $("#sigungu").append("<option value='성주'>성주군</option>");
        $("#sigungu").append("<option value='안동'>안동시</option>");
        $("#sigungu").append("<option value='영덕'>영덕군</option>");
        $("#sigungu").append("<option value='영양'>영양군</option>");
        $("#sigungu").append("<option value='영주'>영주시</option>");
        $("#sigungu").append("<option value='영천'>영천시</option>");
        $("#sigungu").append("<option value='예천'>예천군</option>");
        $("#sigungu").append("<option value='울릉'>울릉군</option>");
        $("#sigungu").append("<option value='울진'>울진군</option>");
        $("#sigungu").append("<option value='의성'>의성군</option>");
        $("#sigungu").append("<option value='청도'>청도군</option>");
        $("#sigungu").append("<option value='청송'>청송군</option>");
        $("#sigungu").append("<option value='칠곡'>칠곡군</option>");
        $("#sigungu").append("<option value='포항'>포항시</option>");
    };

    if(sido == '경남'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='거제'>거제시</option>");
        $("#sigungu").append("<option value='거창'>거창군</option>");
        $("#sigungu").append("<option value='고성'>고성군</option>");
        $("#sigungu").append("<option value='김해'>김해시</option>");
        $("#sigungu").append("<option value='남해'>남해군</option>");
        $("#sigungu").append("<option value='밀양'>밀양시</option>");
        $("#sigungu").append("<option value='사천'>사천시</option>");
        $("#sigungu").append("<option value='산청'>산청군</option>");
        $("#sigungu").append("<option value='양산'>양산시</option>");
        $("#sigungu").append("<option value='의령'>의령군</option>");
        $("#sigungu").append("<option value='진주'>진주시</option>");
        $("#sigungu").append("<option value='창녕'>창년군</option>");
        $("#sigungu").append("<option value='창원'>창원시</option>");
        $("#sigungu").append("<option value='통영'>통영시</option>");
        $("#sigungu").append("<option value='하동'>하동군</option>");
        $("#sigungu").append("<option value='함안'>함안군</option>");
        $("#sigungu").append("<option value='함양'>함양군</option>");
        $("#sigungu").append("<option value='합천'>합천군</option>");
    };

    if(sido == '제주'){
        $("#sigungu option").remove();
        $("#sigungu").append("<option value=''>전체/시/군</option>");
        $("#sigungu").append("<option value='서귀포'>서귀포시</option>");
        $("#sigungu").append("<option value='제주'>제주시</option>");
    };
    
    }); 

    $("#search").focus();

    $("#searchKeyword").keypress(function(e) { 
        if (e.keyCode == 13){
        $("#search").attr("method","POST").attr("action","/campGeneral/listCamp").submit();
            }    
    });

    $("#searchbtn").on("click" , function() {
        $("#search").attr("method","POST").attr("action","/campGeneral/listCamp").submit();
    });
    
    $("#detail_search").on("click" , function() {
        $("#detailSearch").attr("method","POST").attr("action","/campGeneral/listCamp").submit();
    });
});	
