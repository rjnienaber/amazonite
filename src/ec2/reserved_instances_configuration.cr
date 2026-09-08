private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the configuration settings for the modified Reserved Instances.
  class ReservedInstancesConfiguration
    # The Availability Zone for the modified Reserved Instances.
    property availability_zone : String | Nil

    # The number of modified Reserved Instances.
    #
    # This is a required field for a request.
    property instance_count : Int32 | Nil

    # The instance type for the modified Reserved Instances.
    property instance_type : InstanceType | Nil

    # The network platform of the modified Reserved Instances.
    property platform : String | Nil

    # Whether the Reserved Instance is applied to instances in a Region or instances in a specific
    # Availability Zone.
    property scope : Scope | Nil

    # The ID of the Availability Zone.
    property availability_zone_id : String | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @instance_count : Int32 | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @platform : String | Nil = nil,
      @scope : Scope | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @platform
        params << {"#{prefix}Platform", value}
      end

      if value = @scope
        params << {"#{prefix}Scope", value.to_json_object_key}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        platform: Core::XMLValue.string(node.xpath_node("*[local-name()='platform']")),
        scope: (n = node.xpath_node("*[local-name()='scope']")) ? AEC::Scope.from_json_object_key?(n.content) : nil,
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@availability_zone, @instance_count, @instance_type, @platform, @scope, @availability_zone_id)
  end
end
