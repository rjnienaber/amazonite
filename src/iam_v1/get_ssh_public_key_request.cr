private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetSSHPublicKeyRequest
    property user_name : String

    property ssh_public_key_id : String

    property encoding : EncodingType

    def initialize(
      @user_name : String,
      @ssh_public_key_id : String,
      @encoding : EncodingType,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}SSHPublicKeyId", @ssh_public_key_id}

      params << {"#{prefix}Encoding", @encoding.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        ssh_public_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SSHPublicKeyId']")).not_nil!,
        encoding: ((n = node.xpath_node("*[local-name()='Encoding']")) ? AI::EncodingType.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end
  end
end
