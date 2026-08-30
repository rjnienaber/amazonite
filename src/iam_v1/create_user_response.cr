module Amazonite::IamV1
  # Contains the response to a successful
  # [CreateUser](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateUser.html) request.
  class CreateUserResponse
    # A structure with details about the new IAM user.
    property user : User | Nil

    def initialize(
      @user : User | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user
        params.concat(value.to_query_params("#{prefix}User."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user: node.xpath_node("*[local-name()='User']").try { |n| User.from_xml(n) },
      )
    end
  end
end
