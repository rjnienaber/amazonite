private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceMetadataOptionsResult
    # The ID of the instance.
    property instance_id : String | Nil

    # The metadata options for the instance.
    property instance_metadata_options : InstanceMetadataOptionsResponse | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @instance_metadata_options : InstanceMetadataOptionsResponse | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @instance_metadata_options
        params.concat(value.to_query_params("#{prefix}InstanceMetadataOptions."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        instance_metadata_options: node.xpath_node("*[local-name()='instanceMetadataOptions']").try { |n| InstanceMetadataOptionsResponse.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @instance_metadata_options
        value.validate!
      end
    end

    def_equals_and_hash(@instance_id, @instance_metadata_options)
  end
end
