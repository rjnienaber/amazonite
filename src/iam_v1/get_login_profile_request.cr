private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetLoginProfileRequest
    # The name of the user whose login profile you want to retrieve.
    #
    # This parameter is optional. If no user name is included, it defaults to the principal making the
    # request. When you make this request with root user credentials, you must use an
    # [AssumeRoot](https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoot.html) session to
    # omit the user name.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String | Nil

    def initialize(
      @user_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
      )
    end

    def_equals_and_hash(@user_name)
  end
end
