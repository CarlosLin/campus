//= require masonry/jquery.masonry
//= require masonry/jquery.infinitescroll.min
//= require masonry/jquery.imagesloaded.min
//= require bootsy
//= require_tree .
//= require_self

var alertModule = (function(){
	if(!window.jQuery){ throw new Error("REQUIRES JQUERY")}
	var $ = window.jQuery;
	var _alertButton = function(id) {
		$('#alertB').click(function(){
			alert(id);
		});
	}

	var _likeButton = function(post_id,favorite_id) {
		$('#favorites_button').click(function(){
			$.ajax({
				url: "/posts/" + post_id + "/favorites",
				type:"POST",
				success: function(){
					$('#favorites_button').hide();
					$('#favorited_button').show();
				}
			});
		});
		$('#favorited_button').click(function () {
			$.ajax({
				url: "/posts/" + post_id + "/favorites/" + favorite_id,
				type:"POST",
				data: {"_method":"delete"},
				success: function(){
					$('#favorited_button').hide();
					$('#favorites_button').show();
				}
			});
		});		
	}
	var _hideOrShow = function(post_id, favorite_id){
		if (typeof favorite_id == "undefined"){
			$('#favorited_button').hide();
		} else {
			$('#favorites_button').hide();
		}
		_likeButton(post_id, favorite_id);
	}
	return {
		initialize: function(e){
			_alertButton(e);
		},
		likeOrDislike: function(post_id, favorite_id){
			_hideOrShow(post_id, favorite_id);
		}
	};
}());