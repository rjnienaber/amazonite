private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a key pair.
  class KeyPairInfo
    # The ID of the key pair.
    property key_pair_id : String | Nil

    # The type of key pair.
    property key_type : KeyType | Nil

    # Any tags applied to the key pair.
    property tags : Array(Tag) | Nil

    # The public key material.
    property public_key : String | Nil

    # If you used Amazon EC2 to create the key pair, this is the date and time when the key was
    # created, in [ISO 8601 date-time format](https://www.iso.org/iso-8601-date-and-time-format.html),
    # in the UTC time zone.
    #
    # If you imported an existing key pair to Amazon EC2, this is the date and time the key was
    # imported, in [ISO 8601 date-time
    # format](https://www.iso.org/iso-8601-date-and-time-format.html), in the UTC time zone.
    property create_time : Time | Nil

    # The name of the key pair.
    property key_name : String | Nil

    # If you used CreateKeyPair to create the key pair:
    #
    # - For RSA key pairs, the key fingerprint is the SHA-1 digest of the DER encoded private key.
    #
    # - For ED25519 key pairs, the key fingerprint is the base64-encoded SHA-256 digest, which is the
    # default for OpenSSH, starting with [OpenSSH 6.8](http://www.openssh.com/txt/release-6.8).
    #
    # If you used ImportKeyPair to provide Amazon Web Services the public key:
    #
    # - For RSA key pairs, the key fingerprint is the MD5 public key fingerprint as specified in
    # section 4 of RFC4716.
    #
    # - For ED25519 key pairs, the key fingerprint is the base64-encoded SHA-256 digest, which is the
    # default for OpenSSH, starting with [OpenSSH 6.8](http://www.openssh.com/txt/release-6.8).
    property key_fingerprint : String | Nil

    def initialize(
      @key_pair_id : String | Nil = nil,
      @key_type : KeyType | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @public_key : String | Nil = nil,
      @create_time : Time | Nil = nil,
      @key_name : String | Nil = nil,
      @key_fingerprint : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @key_pair_id
        params << {"#{prefix}KeyPairId", value}
      end

      if value = @key_type
        params << {"#{prefix}KeyType", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @public_key
        params << {"#{prefix}PublicKey", value}
      end

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      if value = @key_name
        params << {"#{prefix}KeyName", value}
      end

      if value = @key_fingerprint
        params << {"#{prefix}KeyFingerprint", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key_pair_id: Core::XMLValue.string(node.xpath_node("*[local-name()='keyPairId']")),
        key_type: (n = node.xpath_node("*[local-name()='keyType']")) ? AEC::KeyType.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        public_key: Core::XMLValue.string(node.xpath_node("*[local-name()='publicKey']")),
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='keyName']")),
        key_fingerprint: Core::XMLValue.string(node.xpath_node("*[local-name()='keyFingerprint']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@key_pair_id, @key_type, @tags, @public_key, @create_time, @key_name, @key_fingerprint)
  end
end
