private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetInstanceTpmEkPubResult
    # The ID of the instance.
    property instance_id : String | Nil

    # The public endorsement key type.
    property key_type : EkPubKeyType | Nil

    # The public endorsement key format.
    property key_format : EkPubKeyFormat | Nil

    # The public endorsement key material.
    property key_value : String | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @key_type : EkPubKeyType | Nil = nil,
      @key_format : EkPubKeyFormat | Nil = nil,
      @key_value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @key_type
        params << {"#{prefix}KeyType", value.to_json_object_key}
      end

      if value = @key_format
        params << {"#{prefix}KeyFormat", value.to_json_object_key}
      end

      if value = @key_value
        params << {"#{prefix}KeyValue", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        key_type: (n = node.xpath_node("*[local-name()='keyType']")) ? AEC::EkPubKeyType.from_json_object_key?(n.content) : nil,
        key_format: (n = node.xpath_node("*[local-name()='keyFormat']")) ? AEC::EkPubKeyFormat.from_json_object_key?(n.content) : nil,
        key_value: Core::XMLValue.string(node.xpath_node("*[local-name()='keyValue']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @key_type, @key_format, @key_value)
  end
end
