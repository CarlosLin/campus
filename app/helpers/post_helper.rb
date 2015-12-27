module PostHelper
  def index_cover_image(post)
    if post.avatar_file_name?
      link_to (image_tag post.avatar.url(:medium)), post,class: 'thumbnail'
    else
      link_to (image_tag post.cover_image), post, class: 'thumbnail'
    end
  end
end
