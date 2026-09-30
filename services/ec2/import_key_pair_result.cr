private alias Core = Amazonite::Core

module Amazonite::EC2
  class ImportKeyPairResult
    # - For RSA key pairs, the key fingerprint is the MD5 public key fingerprint as specified in
    # section 4 of RFC 4716.
    #
    # - For ED25519 key pairs, the key fingerprint is the base64-encoded SHA-256 digest, which is the
    # default for OpenSSH, starting with [OpenSSH 6.8](http://www.openssh.com/txt/release-6.8).
    property key_fingerprint : String | Nil

    # The key pair name that you provided.
    property key_name : String | Nil

    # The ID of the resulting key pair.
    property key_pair_id : String | Nil

    # The tags applied to the imported key pair.
    property tags : Array(Tag) | Nil

    def initialize(
      @key_fingerprint : String | Nil = nil,
      @key_name : String | Nil = nil,
      @key_pair_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @key_fingerprint
        params << {"#{prefix}KeyFingerprint", value}
      end

      if value = @key_name
        params << {"#{prefix}KeyName", value}
      end

      if value = @key_pair_id
        params << {"#{prefix}KeyPairId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key_fingerprint: Core::XMLValue.string(node.xpath_node("*[local-name()='keyFingerprint']")),
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='keyName']")),
        key_pair_id: Core::XMLValue.string(node.xpath_node("*[local-name()='keyPairId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@key_fingerprint, @key_name, @key_pair_id, @tags)
  end
end
