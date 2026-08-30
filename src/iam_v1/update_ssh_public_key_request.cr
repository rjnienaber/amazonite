private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateSSHPublicKeyRequest
    # The name of the IAM user associated with the SSH public key.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String

    # The unique identifier for the SSH public key.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters that can consist of any upper or lowercased letter or digit.
    property ssh_public_key_id : String

    # The status to assign to the SSH public key. `Active` means that the key can be used for
    # authentication with an CodeCommit repository. `Inactive` means that the key cannot be used.
    property status : StatusType

    def initialize(
      @user_name : String,
      @ssh_public_key_id : String,
      @status : StatusType,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}SSHPublicKeyId", @ssh_public_key_id}

      params << {"#{prefix}Status", @status.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        ssh_public_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SSHPublicKeyId']")).not_nil!,
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AI::StatusType.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def_equals_and_hash(@user_name, @ssh_public_key_id, @status)
  end
end
