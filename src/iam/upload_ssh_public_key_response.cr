private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the response to a successful
  # [UploadSSHPublicKey](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UploadSSHPublicKey.html)
  # request.
  class UploadSSHPublicKeyResponse
    # Contains information about the SSH public key.
    property ssh_public_key : SSHPublicKey | Nil

    def initialize(
      @ssh_public_key : SSHPublicKey | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ssh_public_key
        params.concat(value.to_query_params("#{prefix}SSHPublicKey."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ssh_public_key: node.xpath_node("*[local-name()='SSHPublicKey']").try { |n| SSHPublicKey.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ssh_public_key
        value.validate!
      end
    end

    def_equals_and_hash(@ssh_public_key)
  end
end
