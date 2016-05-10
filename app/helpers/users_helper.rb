module UsersHelper
  def gravatar_for user, options = {size: Setting.avatar_size_default}
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    size = options[:size]
    gravatar_url = if user.avatar.nil? || user.avatar.empty?
      asset_path "f.png"
    else
      user.avatar
    end
    image_tag gravatar_url, alt: user.name, class: "gravatar",
      size: Settings.avatar_size_default
  end
end
