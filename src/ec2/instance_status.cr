private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the status of an instance, including system status, instance status, attached EBS
  # status, and application status.
  class InstanceStatus
    # The Availability Zone of the instance.
    property availability_zone : String | Nil

    # The ID of the Availability Zone of the instance.
    property availability_zone_id : String | Nil

    # The Amazon Resource Name (ARN) of the Outpost.
    property outpost_arn : String | Nil

    # The service provider that manages the instance.
    property operator : OperatorResponse | Nil

    # Any scheduled events associated with the instance.
    property events : Array(InstanceStatusEvent) | Nil

    # The ID of the instance.
    property instance_id : String | Nil

    # The intended state of the instance. DescribeInstanceStatus requires that an instance be in the
    # `running` state.
    property instance_state : InstanceState | Nil

    # Reports impaired functionality that stems from issues internal to the instance, such as impaired
    # reachability.
    property instance_status : InstanceStatusSummary | Nil

    # Reports impaired functionality that stems from issues related to the systems that support an
    # instance, such as hardware failures and network connectivity problems.
    property system_status : InstanceStatusSummary | Nil

    # Reports impaired functionality that stems from an attached Amazon EBS volume that is unreachable
    # and unable to complete I/O operations.
    property attached_ebs_status : EbsStatusSummary | Nil

    # Reports the application-level health status for the instance.
    property application_status : ApplicationStatusSummary | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @operator : OperatorResponse | Nil = nil,
      @events : Array(InstanceStatusEvent) | Nil = nil,
      @instance_id : String | Nil = nil,
      @instance_state : InstanceState | Nil = nil,
      @instance_status : InstanceStatusSummary | Nil = nil,
      @system_status : InstanceStatusSummary | Nil = nil,
      @attached_ebs_status : EbsStatusSummary | Nil = nil,
      @application_status : ApplicationStatusSummary | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end

      (@events || [] of InstanceStatusEvent).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}EventsSet.#{i}."))
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @instance_state
        params.concat(value.to_query_params("#{prefix}InstanceState."))
      end

      if value = @instance_status
        params.concat(value.to_query_params("#{prefix}InstanceStatus."))
      end

      if value = @system_status
        params.concat(value.to_query_params("#{prefix}SystemStatus."))
      end

      if value = @attached_ebs_status
        params.concat(value.to_query_params("#{prefix}AttachedEbsStatus."))
      end

      if value = @application_status
        params.concat(value.to_query_params("#{prefix}ApplicationStatus."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
        events: node.xpath_nodes("*[local-name()='eventsSet']/*[local-name()='item']").map { |n| InstanceStatusEvent.from_xml(n) },
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        instance_state: node.xpath_node("*[local-name()='instanceState']").try { |n| InstanceState.from_xml(n) },
        instance_status: node.xpath_node("*[local-name()='instanceStatus']").try { |n| InstanceStatusSummary.from_xml(n) },
        system_status: node.xpath_node("*[local-name()='systemStatus']").try { |n| InstanceStatusSummary.from_xml(n) },
        attached_ebs_status: node.xpath_node("*[local-name()='attachedEbsStatus']").try { |n| EbsStatusSummary.from_xml(n) },
        application_status: node.xpath_node("*[local-name()='applicationStatus']").try { |n| ApplicationStatusSummary.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @operator
        value.validate!
      end

      if value = @events
        value.each(&.validate!)
      end

      if value = @instance_state
        value.validate!
      end

      if value = @instance_status
        value.validate!
      end

      if value = @system_status
        value.validate!
      end

      if value = @attached_ebs_status
        value.validate!
      end

      if value = @application_status
        value.validate!
      end
    end

    def_equals_and_hash(@availability_zone, @availability_zone_id, @outpost_arn, @operator, @events, @instance_id, @instance_state, @instance_status, @system_status, @attached_ebs_status, @application_status)
  end
end
