# frozen_string_literal: true

module ApplicationHelper
  def provider_icon(name)
    data = {
      twitter: { name: 'Twitter', icon: 'fab fa-twitter' },
      google_oauth2: { name: 'Google', icon: 'fab fa-google' },
      github: { name: 'GitHub', icon: 'fab fa-github' },
      facebook: { name: 'Facebook', icon: 'fab fa-facebook' }
    }
    content_tag(:i, '', class: data[name][:icon])
  end
end
