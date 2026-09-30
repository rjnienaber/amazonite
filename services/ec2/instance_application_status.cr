private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the application status for an instance.
  class InstanceApplicationStatus
    # The ID of the instance.
    property instance_id : String | Nil

    # The Availability Zone of the instance.
    property availability_zone : String | Nil

    # The ID of the Availability Zone of the instance.
    property availability_zone_id : String | Nil

    # The application status for the instance.
    property application_status : ApplicationStatus | Nil

    # The tags assigned to the instance.
    property tags : Array(Tag) | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @application_status : ApplicationStatus | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @application_status
        params.concat(value.to_query_params("#{prefix}ApplicationStatus."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        application_status: node.xpath_node("*[local-name()='applicationStatus']").try { |n| ApplicationStatus.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @application_status
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_id, @availability_zone, @availability_zone_id, @application_status, @tags)
  end
end
