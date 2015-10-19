require 'addressable/uri'
require 'rest-client'

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users/1'
# ).to_s
#
# puts RestClient.get url

# puts RestClient::Request.execute(method: :get, url: 'http://example.com/resource',
#                                   timeout: 10, headers: {params: {foo: 'bar'}})

def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: name, email: email } }
  )
end

def update_user(id, name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}"
  ).to_s

  puts RestClient.put(
    url,
    { user: { name: name, email: email } }
  )
end

def destroy_user(id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}"
  ).to_s

  puts RestClient.delete(url)
end

def create_contact(name, email, user_id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts.json'
  ).to_s

  puts RestClient.post(
    url,
    { contact: { name: name, email: email, user_id: user_id } }
  )
end

def update_contact(id, name, email, user_id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/contacts/#{id}"
  ).to_s

  puts RestClient.put(
    url,
    { contact: { name: name, email: email, user_id: user_id } }
  )
end

def destroy_contact(id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/contacts/#{id}"
  ).to_s

  puts RestClient.delete(url)
end

create_contact("me", "me@me.com", 5)

update_contact(6, "changed", "changed_email", 5)

destroy_contact(6)
