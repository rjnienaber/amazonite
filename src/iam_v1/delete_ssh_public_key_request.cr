private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteSSHPublicKeyRequest
    property user_name : String

    property ssh_public_key_id : String

    def initialize(
      @user_name : String,
      @ssh_public_key_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}SSHPublicKeyId", @ssh_public_key_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        ssh_public_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SSHPublicKeyId']")).not_nil!,
      )
    end
  end
end
