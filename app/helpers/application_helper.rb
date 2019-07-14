# frozen_string_literal: true

module ApplicationHelper
  def provider_icon(name)
    data = {
      twitter: 'fab fa-twitter',
      google_oauth2: 'fab fa-google',
      github: 'fab fa-github',
      facebook: 'fab fa-facebook',
      linkedin: 'fab fa-linkedin'
    }
    content_tag(:i, '', class: data[name])
  end
end
