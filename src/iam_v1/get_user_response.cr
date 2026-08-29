module Amazonite::IamV1
  class GetUserResponse
    property user : User

    def initialize(
      @user : User,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@user.to_query_params("#{prefix}User."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user: node.xpath_node("*[local-name()='User']").try { |n| User.from_xml(n) }.not_nil!,
      )
    end
  end
end
