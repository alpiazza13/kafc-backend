module TestUtils
  def auth_header(user)
    {
      'Authorization' => %Q[Token token="#{user.email}"],
      'CONTENT_TYPE' => 'application/json'
    }
  end
end