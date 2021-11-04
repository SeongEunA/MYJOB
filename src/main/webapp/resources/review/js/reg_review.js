//화면 로딩 후 바로 실행
$(document).ready(function(){

	    
	    var img_count = 0;
	        
	    //input 파일첨부 버튼 클릭하면 실행되는 change 메서드
	    //$("#img").change(function fileadd() {
	   // $('[id^="img"]').change(function fileadd() {
	    $(document).on('change', '[id^="img"]', function() {
	        var reader = new FileReader;
	    //이미지 파일 정보와 화면출력을 위해 <img> 태그를 변수로 만듦
	        var str = "<img id='img_"+(img_count)+"' src=''/  style='margin-left:20px'>";
	    //파일 경로에 넣기 위해 String으로 변환시켜줌
	        var img_count_string = img_count.toString();
	        
	        
	        alert(img_count);
	        alert(img_count_string);
	    //jQuery append 메서드를 사용해 <div id="pr_img"> 안에 <img> 태그 변수를 추가해줌
	        $("#pr_img").append(str);
	    //<img src=""> 사용자가 업로드한 이미지 파일 경로를 src로 저장해줌(data.target.result) 
	        
	    //onload는 파일이 업로드 완료된 시점에 function을 발생시키는 메서드
	        reader.onload = function(data) {
	    //태그 안의 속성을 입력할 수 있는 jQuery attr 메서드를 사용 
           $('#img_' + img_count_string).attr('src', data.target.result).width(150).height(150);
	       };
	      
	   //    $('#img_' + img_count).attr('src', data.target.result).width(150).height(150);
	   //   };	
	        	
	        
	    //화면에 이미지를 출력해주는 FileReader 객체 인스턴스 reader.readAsDataURL();
	    //this.files는 <input type="file">을 통해 업로드한 파일의 정보를 저장하고 있는 배열이다.
	    //첨부하기 1회당 file 하나만 업로드해서 <img_0,1,2...>에 각각의 파일들을
	    //할당시켜줄 것이기 때문에 files[0]로 index 고정
	        reader.readAsDataURL(this.files[0]);
	        img_count++;
	        
//	        $(this).attr('display', 'none');
	        $(this).hide();
	        $('#pr_img').prepend('<input type="file" value="새로운" id="img' + img_count + '" name="file' + img_count + '">');
	    });

	
   
});

//함수 선언 영역
(function($){
	//aaa = function(){
	//};
   //
	
	
	
})(jQuery);
























