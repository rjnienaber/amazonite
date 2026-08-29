private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UploadSSHPublicKeyRequest
    property user_name : String

    property ssh_public_key_body : String

    def initialize(
      @user_name : String,
      @ssh_public_key_body : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}SSHPublicKeyBody", @ssh_public_key_body}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        ssh_public_key_body: Core::XMLValue.string(node.xpath_node("*[local-name()='SSHPublicKeyBody']")).not_nil!,
      )
    end
  end
end
