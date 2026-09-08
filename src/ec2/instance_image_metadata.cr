private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the instance and the AMI used to launch the instance.
  class InstanceImageMetadata
    # The ID of the instance.
    property instance_id : String | Nil

    # The instance type.
    property instance_type : InstanceType | Nil

    # The time the instance was launched.
    property launch_time : Time | Nil

    # The Availability Zone or Local Zone of the instance.
    property availability_zone : String | Nil

    # The ID of the Availability Zone or Local Zone of the instance.
    property zone_id : String | Nil

    # The current state of the instance.
    property state : InstanceState | Nil

    # The ID of the Amazon Web Services account that owns the instance.
    property owner_id : String | Nil

    # Any tags assigned to the instance.
    property tags : Array(Tag) | Nil

    # Information about the AMI used to launch the instance.
    property image_metadata : ImageMetadata | Nil

    # The entity that manages the instance.
    property operator : OperatorResponse | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @launch_time : Time | Nil = nil,
      @availability_zone : String | Nil = nil,
      @zone_id : String | Nil = nil,
      @state : InstanceState | Nil = nil,
      @owner_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @image_metadata : ImageMetadata | Nil = nil,
      @operator : OperatorResponse | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @launch_time
        params << {"#{prefix}LaunchTime", Core::QueryValue.time(value)}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @zone_id
        params << {"#{prefix}ZoneId", value}
      end

      if value = @state
        params.concat(value.to_query_params("#{prefix}InstanceState."))
      end

      if value = @owner_id
        params << {"#{prefix}InstanceOwnerId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @image_metadata
        params.concat(value.to_query_params("#{prefix}ImageMetadata."))
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        launch_time: Core::XMLValue.time(node.xpath_node("*[local-name()='launchTime']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='zoneId']")),
        state: node.xpath_node("*[local-name()='instanceState']").try { |n| InstanceState.from_xml(n) },
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceOwnerId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        image_metadata: node.xpath_node("*[local-name()='imageMetadata']").try { |n| ImageMetadata.from_xml(n) },
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @state
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @image_metadata
        value.validate!
      end

      if value = @operator
        value.validate!
      end
    end

    def_equals_and_hash(@instance_id, @instance_type, @launch_time, @availability_zone, @zone_id, @state, @owner_id, @tags, @image_metadata, @operator)
  end
end
