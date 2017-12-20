module UserHelper
  def gravatar_for(user, options = { size: 80 })
    name = Faker::Name.name
    gravatar_id = Digest::MD5::hexdigest(name)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: name, class: "gravatar")
  end
end
