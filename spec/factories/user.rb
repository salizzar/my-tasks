Factory.sequence :email do |n|
  "salizzar#{n}@gmail.com"
end

Factory.define :user do |u|
  u.email                 Factory.next(:email)
  u.password              'plataforma'
  u.password_confirmation 'plataforma'
  u.confirmation_token    nil
  u.confirmed_at          Time.now
end

