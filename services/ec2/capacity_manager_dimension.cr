private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Represents dimension values for capacity metrics, including resource identifiers, geographic
  # information, and reservation details used for grouping and filtering capacity data.
  class CapacityManagerDimension
    # The Amazon Web Services Region where the capacity resource is located.
    property resource_region : String | Nil

    # The unique identifier of the Availability Zone where the capacity resource is located.
    property availability_zone_id : String | Nil

    # The Amazon Web Services account ID that owns the capacity resource.
    property account_id : String | Nil

    # The name of the Amazon Web Services account that owns the capacity resource. This dimension is
    # only available when Organizations access is enabled for Capacity Manager.
    property account_name : String | Nil

    # The EC2 instance family of the capacity resource.
    property instance_family : String | Nil

    # The specific EC2 instance type of the capacity resource.
    property instance_type : String | Nil

    # The platform or operating system of the instance.
    property instance_platform : String | Nil

    # The Amazon Resource Name (ARN) of the capacity reservation. This provides a unique identifier
    # that can be used across Amazon Web Services services to reference the specific reservation.
    property reservation_arn : String | Nil

    # The unique identifier of the capacity reservation.
    property reservation_id : String | Nil

    # The type of capacity reservation.
    property reservation_type : ReservationType | Nil

    # The timestamp when the capacity reservation was originally created, in milliseconds since epoch.
    # This differs from the start timestamp as reservations can be created before they become active.
    property reservation_create_timestamp : Time | Nil

    # The timestamp when the capacity reservation becomes active and available for use, in
    # milliseconds since epoch. This is when the reservation begins providing capacity.
    property reservation_start_timestamp : Time | Nil

    # The timestamp when the capacity reservation expires and is no longer available, in milliseconds
    # since epoch. After this time, the reservation will not provide any capacity.
    property reservation_end_timestamp : Time | Nil

    # The type of end date for the capacity reservation. This indicates whether the reservation has a
    # fixed end date, is open-ended, or follows a specific termination pattern.
    property reservation_end_date_type : ReservationEndDateType | Nil

    # The tenancy of the EC2 instances associated with this capacity dimension. Valid values are
    # 'default' for shared tenancy, 'dedicated' for dedicated instances, or 'host' for dedicated
    # hosts.
    property tenancy : CapacityTenancy | Nil

    # The current state of the capacity reservation.
    property reservation_state : ReservationState | Nil

    # The instance matching criteria for the capacity reservation, determining how instances are
    # matched to the reservation.
    property reservation_instance_match_criteria : String | Nil

    # The Amazon Web Services account ID that is financially responsible for unused capacity
    # reservation costs.
    property reservation_unused_financial_owner : String | Nil

    # The tags associated with the capacity resource, represented as key-value pairs. Only tags that
    # have been activated for monitoring via `UpdateCapacityManagerMonitoredTagKeys` are included.
    property tags : Array(CapacityManagerTagDimension) | Nil

    def initialize(
      @resource_region : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @account_id : String | Nil = nil,
      @account_name : String | Nil = nil,
      @instance_family : String | Nil = nil,
      @instance_type : String | Nil = nil,
      @instance_platform : String | Nil = nil,
      @reservation_arn : String | Nil = nil,
      @reservation_id : String | Nil = nil,
      @reservation_type : ReservationType | Nil = nil,
      @reservation_create_timestamp : Time | Nil = nil,
      @reservation_start_timestamp : Time | Nil = nil,
      @reservation_end_timestamp : Time | Nil = nil,
      @reservation_end_date_type : ReservationEndDateType | Nil = nil,
      @tenancy : CapacityTenancy | Nil = nil,
      @reservation_state : ReservationState | Nil = nil,
      @reservation_instance_match_criteria : String | Nil = nil,
      @reservation_unused_financial_owner : String | Nil = nil,
      @tags : Array(CapacityManagerTagDimension) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_region
        params << {"#{prefix}ResourceRegion", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @account_id
        params << {"#{prefix}AccountId", value}
      end

      if value = @account_name
        params << {"#{prefix}AccountName", value}
      end

      if value = @instance_family
        params << {"#{prefix}InstanceFamily", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @instance_platform
        params << {"#{prefix}InstancePlatform", value}
      end

      if value = @reservation_arn
        params << {"#{prefix}ReservationArn", value}
      end

      if value = @reservation_id
        params << {"#{prefix}ReservationId", value}
      end

      if value = @reservation_type
        params << {"#{prefix}ReservationType", value.to_json_object_key}
      end

      if value = @reservation_create_timestamp
        params << {"#{prefix}ReservationCreateTimestamp", Core::QueryValue.time(value)}
      end

      if value = @reservation_start_timestamp
        params << {"#{prefix}ReservationStartTimestamp", Core::QueryValue.time(value)}
      end

      if value = @reservation_end_timestamp
        params << {"#{prefix}ReservationEndTimestamp", Core::QueryValue.time(value)}
      end

      if value = @reservation_end_date_type
        params << {"#{prefix}ReservationEndDateType", value.to_json_object_key}
      end

      if value = @tenancy
        params << {"#{prefix}Tenancy", value.to_json_object_key}
      end

      if value = @reservation_state
        params << {"#{prefix}ReservationState", value.to_json_object_key}
      end

      if value = @reservation_instance_match_criteria
        params << {"#{prefix}ReservationInstanceMatchCriteria", value}
      end

      if value = @reservation_unused_financial_owner
        params << {"#{prefix}ReservationUnusedFinancialOwner", value}
      end

      (@tags || [] of CapacityManagerTagDimension).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_region: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceRegion']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='accountId']")),
        account_name: Core::XMLValue.string(node.xpath_node("*[local-name()='accountName']")),
        instance_family: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceFamily']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        instance_platform: Core::XMLValue.string(node.xpath_node("*[local-name()='instancePlatform']")),
        reservation_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='reservationArn']")),
        reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservationId']")),
        reservation_type: (n = node.xpath_node("*[local-name()='reservationType']")) ? AEC::ReservationType.from_json_object_key?(n.content) : nil,
        reservation_create_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='reservationCreateTimestamp']")),
        reservation_start_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='reservationStartTimestamp']")),
        reservation_end_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='reservationEndTimestamp']")),
        reservation_end_date_type: (n = node.xpath_node("*[local-name()='reservationEndDateType']")) ? AEC::ReservationEndDateType.from_json_object_key?(n.content) : nil,
        tenancy: (n = node.xpath_node("*[local-name()='tenancy']")) ? AEC::CapacityTenancy.from_json_object_key?(n.content) : nil,
        reservation_state: (n = node.xpath_node("*[local-name()='reservationState']")) ? AEC::ReservationState.from_json_object_key?(n.content) : nil,
        reservation_instance_match_criteria: Core::XMLValue.string(node.xpath_node("*[local-name()='reservationInstanceMatchCriteria']")),
        reservation_unused_financial_owner: Core::XMLValue.string(node.xpath_node("*[local-name()='reservationUnusedFinancialOwner']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| CapacityManagerTagDimension.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@resource_region, @availability_zone_id, @account_id, @account_name, @instance_family, @instance_type, @instance_platform, @reservation_arn, @reservation_id, @reservation_type, @reservation_create_timestamp, @reservation_start_timestamp, @reservation_end_timestamp, @reservation_end_date_type, @tenancy, @reservation_state, @reservation_instance_match_criteria, @reservation_unused_financial_owner, @tags)
  end
end
