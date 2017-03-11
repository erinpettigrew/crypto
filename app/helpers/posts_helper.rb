module PostsHelper
  def is_video?(post)
    post.url.include?("youtube.com") ? true : false
  end

  def render_media(post)
    if is_video?(post)
      "<iframe width='352' height='198' src='https://www.youtube.com/embed/#{self.video_id(post)}?autoplay=0&enablejsapi=1' frameborder='0' allowfullscreen></iframe>".html_safe
    else
      link_to image_tag(post.image), post.url
    end
  end

  def video_id(post)
    post.url.gsub("https://www.youtube.com/watch?v=", "")
  end
end
