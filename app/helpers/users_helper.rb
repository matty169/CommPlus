module UsersHelper

	def gravatar_for(user)
		#default_url = "#images/Communityplus.png"
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=180&d=#{CGI.escape(default_url)}"
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=180"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
