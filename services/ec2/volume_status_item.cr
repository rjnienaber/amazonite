private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the volume status.
  class VolumeStatusItem
    # The details of the operation.
    property actions : Array(VolumeStatusAction) | Nil

    # The Availability Zone of the volume.
    property availability_zone : String | Nil

    # The Amazon Resource Name (ARN) of the Outpost.
    property outpost_arn : String | Nil

    # A list of events associated with the volume.
    property events : Array(VolumeStatusEvent) | Nil

    # The volume ID.
    property volume_id : String | Nil

    # The volume status.
    property volume_status : VolumeStatusInfo | Nil

    # Information about the instances to which the volume is attached.
    property attachment_statuses : Array(VolumeStatusAttachmentStatus) | Nil

    # Information about the volume initialization. It can take up to 5 minutes for the volume
    # initialization information to be updated.
    #
    # Only available for volumes created from snapshots. Not available for empty volumes created
    # without a snapshot.
    #
    # For more information, see [ Initialize Amazon EBS
    # volumes](https://docs.aws.amazon.com/ebs/latest/userguide/initalize-volume.html).
    property initialization_status_details : InitializationStatusDetails | Nil

    # The ID of the Availability Zone.
    property availability_zone_id : String | Nil

    # The service provider that manages the resource.
    property operator : OperatorResponse | Nil

    def initialize(
      @actions : Array(VolumeStatusAction) | Nil = nil,
      @availability_zone : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @events : Array(VolumeStatusEvent) | Nil = nil,
      @volume_id : String | Nil = nil,
      @volume_status : VolumeStatusInfo | Nil = nil,
      @attachment_statuses : Array(VolumeStatusAttachmentStatus) | Nil = nil,
      @initialization_status_details : InitializationStatusDetails | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @operator : OperatorResponse | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@actions || [] of VolumeStatusAction).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ActionsSet.#{i}."))
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      (@events || [] of VolumeStatusEvent).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}EventsSet.#{i}."))
      end

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end

      if value = @volume_status
        params.concat(value.to_query_params("#{prefix}VolumeStatus."))
      end

      (@attachment_statuses || [] of VolumeStatusAttachmentStatus).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AttachmentStatuses.#{i}."))
      end

      if value = @initialization_status_details
        params.concat(value.to_query_params("#{prefix}InitializationStatusDetails."))
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        actions: node.xpath_nodes("*[local-name()='actionsSet']/*[local-name()='item']").map { |n| VolumeStatusAction.from_xml(n) },
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        events: node.xpath_nodes("*[local-name()='eventsSet']/*[local-name()='item']").map { |n| VolumeStatusEvent.from_xml(n) },
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='volumeId']")),
        volume_status: node.xpath_node("*[local-name()='volumeStatus']").try { |n| VolumeStatusInfo.from_xml(n) },
        attachment_statuses: node.xpath_nodes("*[local-name()='attachmentStatuses']/*[local-name()='item']").map { |n| VolumeStatusAttachmentStatus.from_xml(n) },
        initialization_status_details: node.xpath_node("*[local-name()='initializationStatusDetails']").try { |n| InitializationStatusDetails.from_xml(n) },
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @actions
        value.each(&.validate!)
      end

      if value = @events
        value.each(&.validate!)
      end

      if value = @volume_status
        value.validate!
      end

      if value = @attachment_statuses
        value.each(&.validate!)
      end

      if value = @initialization_status_details
        value.validate!
      end

      if value = @operator
        value.validate!
      end
    end

    def_equals_and_hash(@actions, @availability_zone, @outpost_arn, @events, @volume_id, @volume_status, @attachment_statuses, @initialization_status_details, @availability_zone_id, @operator)
  end
end
