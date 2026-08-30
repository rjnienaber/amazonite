private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateAccessKeyRequest
    # The name of the IAM user that the new key will belong to.
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
