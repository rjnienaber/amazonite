private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UploadSSHPublicKeyRequest
    # The name of the IAM user to associate the SSH public key with.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String

    # The SSH public key. The public key must be encoded in ssh-rsa format or PEM format. The minimum
    # bit-length of the public key is 2048 bits. For example, you can generate a 2048-bit key, and the
    # resulting PEM file is 1679 bytes long.
    #
    # The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this parameter is a string
    # of characters consisting of the following:
    #
    # - Any printable ASCII character ranging from the space character (`\u0020`) through the end of
    # the ASCII character range
    #
    # - The printable characters in the Basic Latin and Latin-1 Supplement character set (through
    # `\u00FF`)
    #
    # - The special characters tab (`\u0009`), line feed (`\u000A`), and carriage return (`\u000D`)
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

    def_equals_and_hash(@user_name, @ssh_public_key_body)
  end
end
