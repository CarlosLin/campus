//= require masonry/jquery.masonry
//= require masonry/jquery.infinitescroll.min
//= require masonry/jquery.imagesloaded.min
//= require bootsy
//= require_tree .
//= require_self

var alertModule = (function(){
	if(!window.jQuery){ throw new Error("REQUIRES JQUERY")}
	var $ = window.jQuery;
	function alertButton() {
		$('#alertB').click(function(){
			alert(favID);
		});
	}
	// Likebutton ( ajax )
	function likeButton() {
		$('#favorites_button').click(function(){
			$.ajax({
				url: "/posts/" + postID + "/favorites",
				type:"POST",
				dataType:"json",
				success: function(data){
					$('#test').html(data.id);
					favID = data.id;
					$('#favorites_button').hide();
					$('#favorited_button').show();
				}
			});
		});
		$('#favorited_button').click(function () {
			$.ajax({
				url: "/posts/" + postID + "/favorites/" + favID,
				type:"POST",
				data: {"_method":"delete"},
				success: function(){
					$('#favorited_button').hide();
					$('#favorites_button').show();
				}
			});
		});		
	}
	// 判斷顯示button
	function hideOrShow(){
		if (typeof favID == "undefined"){
			$('#favorited_button').hide();
		} else {
			$('#favorites_button').hide();
		}
		likeButton();
	}
	return {
		// 初始該篇 postID, favID
		initialize: function(e, f){
			postID = e;
			favID  = f;
			alertButton();
		},
		// 定義 like button
		likeOrDislike: function(){
			hideOrShow();
		}
	};
}());