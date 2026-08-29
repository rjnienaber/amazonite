private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListSSHPublicKeysResponse
    property ssh_public_keys : Array(SSHPublicKeyMetadata) | Nil

    property is_truncated : Bool | Nil

    property marker : String | Nil

    def initialize(
      @ssh_public_keys : Array(SSHPublicKeyMetadata) | Nil = nil,
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ssh_public_keys || [] of SSHPublicKeyMetadata).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SSHPublicKeys.member.#{i}."))
      end

      if value = @is_truncated
        params << {"#{prefix}IsTruncated", Core::QueryValue.bool(value)}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ssh_public_keys: node.xpath_nodes("*[local-name()='SSHPublicKeys']/*[local-name()='member']").map { |n| SSHPublicKeyMetadata.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end
  end
end
