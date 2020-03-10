module ShopsHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(people, size: 130)
    gravatar_id  = Digest::MD5.hexdigest(people.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: people.name, class: 'gravatar')
  end

end
