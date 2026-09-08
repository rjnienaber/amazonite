private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetInstanceTpmEkPubRequest
    # The ID of the instance for which to get the public endorsement key.
    property instance_id : String

    # The required public endorsement key type.
    property key_type : EkPubKeyType

    # The required public endorsement key format. Specify `der` for a DER-encoded public key that is
    # compatible with OpenSSL. Specify `tpmt` for a TPM 2.0 format that is compatible with tpm2-tools.
    # The returned key is base64 encoded.
    property key_format : EkPubKeyFormat

    # Specify this parameter to verify whether the request will succeed, without actually making the
    # request. If the request will succeed, the response is `DryRunOperation`. Otherwise, the response
    # is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @instance_id : String,
      @key_type : EkPubKeyType,
      @key_format : EkPubKeyFormat,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceId", @instance_id}

      params << {"#{prefix}KeyType", @key_type.to_json_object_key}

      params << {"#{prefix}KeyFormat", @key_format.to_json_object_key}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        key_type: ((n = node.xpath_node("*[local-name()='KeyType']")) ? AEC::EkPubKeyType.from_json_object_key?(n.content) : nil).not_nil!,
        key_format: ((n = node.xpath_node("*[local-name()='KeyFormat']")) ? AEC::EkPubKeyFormat.from_json_object_key?(n.content) : nil).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @key_type, @key_format, @dry_run)
  end
end
