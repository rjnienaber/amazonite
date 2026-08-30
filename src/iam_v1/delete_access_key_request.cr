private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteAccessKeyRequest
    # The name of the user whose access key pair you want to delete.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String | Nil

    # The access key ID for the access key ID and secret access key you want to delete.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters that can consist of any upper or lowercased letter or digit.
    property access_key_id : String

    def initialize(
      @access_key_id : String,
      @user_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      params << {"#{prefix}AccessKeyId", @access_key_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        access_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AccessKeyId']")).not_nil!,
      )
    end

    def_equals_and_hash(@user_name, @access_key_id)
  end
end
