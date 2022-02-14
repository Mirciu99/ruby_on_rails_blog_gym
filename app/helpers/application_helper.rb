module ApplicationHelper
  def gravatar_for(commenter, options = { size: 30 })
    gravatar_id = Digest::MD5::hexdigest(commenter.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: commenter, class: "img-circle")
  end
end
