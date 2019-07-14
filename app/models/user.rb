# frozen_string_literal: true

class User < ApplicationRecord
  devise :rememberable, :omniauthable, omniauth_providers: %i[google_oauth2 facebook twitter github linkedin]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email || "#{SecureRandom.hex}@#{SecureRandom.hex}"
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end
end
