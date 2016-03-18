module ApplicationHelper
	def gravatar_for(user, options = { size: 150 })
		gravata_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravata_url = "https://secure.gravatar.com/avatar/#{gravata_id}?s=#{size}"
		image_tag(gravata_url, alt: user.username, class: "img-circle")
	end
end
