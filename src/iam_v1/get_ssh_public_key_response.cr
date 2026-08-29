module Amazonite::IamV1
  class GetSSHPublicKeyResponse
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
  end
end
