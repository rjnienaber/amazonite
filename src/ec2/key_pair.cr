private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a key pair.
  class KeyPair
    # The ID of the key pair.
    property key_pair_id : String | Nil

    # Any tags applied to the key pair.
    property tags : Array(Tag) | Nil

    # The name of the key pair.
    property key_name : String | Nil

    # - For RSA key pairs, the key fingerprint is the SHA-1 digest of the DER encoded private key.
    #
    # - For ED25519 key pairs, the key fingerprint is the base64-encoded SHA-256 digest, which is the
    # default for OpenSSH, starting with OpenSSH 6.8.
    property key_fingerprint : String | Nil

    # An unencrypted PEM encoded RSA or ED25519 private key.
    property key_material : String | Nil

    def initialize(
      @key_pair_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @key_name : String | Nil = nil,
      @key_fingerprint : String | Nil = nil,
      @key_material : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @key_pair_id
        params << {"#{prefix}KeyPairId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @key_name
        params << {"#{prefix}KeyName", value}
      end

      if value = @key_fingerprint
        params << {"#{prefix}KeyFingerprint", value}
      end

      if value = @key_material
        params << {"#{prefix}KeyMaterial", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key_pair_id: Core::XMLValue.string(node.xpath_node("*[local-name()='keyPairId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='keyName']")),
        key_fingerprint: Core::XMLValue.string(node.xpath_node("*[local-name()='keyFingerprint']")),
        key_material: Core::XMLValue.string(node.xpath_node("*[local-name()='keyMaterial']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@key_pair_id, @tags, @key_name, @key_fingerprint, @key_material)
  end
end
