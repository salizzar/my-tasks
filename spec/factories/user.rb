Factory.define :user do |u|
  u.sequence(:email)      { |n| "salizzar#{n}@gmail.com" }
  u.password              'plataforma'
  u.password_confirmation 'plataforma'
  u.confirmation_token    nil
  u.confirmed_at          Time.now
end

