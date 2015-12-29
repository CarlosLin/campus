module PostHelper
	 # ***************
	 #     首頁圖片
	 # ***************
  def index_cover_image(post)
    if post.avatar_file_name?
      link_to (image_tag post.avatar.url(:medium)), post,class: 'thumbnail'
    else
      link_to (image_tag post.cover_image), post, class: 'thumbnail'
    end
  end
  # ***************
	#  	 show_page
  # ***************
  def have_avatar_file
  	image_tag @post.avatar.url(:medium) if @post.avatar_file_name?
  end
end
