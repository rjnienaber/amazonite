private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The instance types offered.
  class InstanceTypeOffering
    # The instance type. For more information, see [Instance
    # types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html) in the *Amazon
    # EC2 User Guide*.
    property instance_type : InstanceType | Nil

    # The location type.
    property location_type : LocationType | Nil

    # The identifier for the location. This depends on the location type. For example, if the location
    # type is `region`, the location is the Region code (for example, `us-east-2`.)
    property location : String | Nil

    def initialize(
      @instance_type : InstanceType | Nil = nil,
      @location_type : LocationType | Nil = nil,
      @location : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @location_type
        params << {"#{prefix}LocationType", value.to_json_object_key}
      end

      if value = @location
        params << {"#{prefix}Location", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        location_type: (n = node.xpath_node("*[local-name()='locationType']")) ? AEC::LocationType.from_json_object_key?(n.content) : nil,
        location: Core::XMLValue.string(node.xpath_node("*[local-name()='location']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_type, @location_type, @location)
  end
end
