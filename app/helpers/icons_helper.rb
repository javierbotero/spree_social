module IconsHelper
  ICONS = {
    'google_oauth2' => '<i class="fa-brands fa-google"></i>',
    'twitter' => '<i class="fa-brands fa-twitter"></i>'
  }

  def icon_by_provider(name)
    ICONS[name]&.html_safe
  end
end
