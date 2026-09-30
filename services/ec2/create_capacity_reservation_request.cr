private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateCapacityReservationRequest
    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensure
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # The instance type for which to reserve capacity.
    #
    # You can request future-dated Capacity Reservations for instance types in the C, M, R, I, T, and
    # G instance families only.
    #
    # For more information, see [Instance
    # types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html) in the *Amazon
    # EC2 User Guide*.
    property instance_type : String

    # The type of operating system for which to reserve capacity.
    property instance_platform : CapacityReservationInstancePlatform

    # The Availability Zone in which to create the Capacity Reservation.
    property availability_zone : String | Nil

    # The ID of the Availability Zone in which to create the Capacity Reservation.
    property availability_zone_id : String | Nil

    # Indicates the tenancy of the Capacity Reservation. A Capacity Reservation can have one of the
    # following tenancy settings:
    #
    # - `default` - The Capacity Reservation is created on hardware that is shared with other Amazon
    # Web Services accounts.
    #
    # - `dedicated` - The Capacity Reservation is created on single-tenant hardware that is dedicated
    # to a single Amazon Web Services account.
    property tenancy : CapacityReservationTenancy | Nil

    # The number of instances for which to reserve capacity.
    #
    # You can request future-dated Capacity Reservations for an instance count with a minimum of 32
    # vCPUs. For example, if you request a future-dated Capacity Reservation for `m5.xlarge`
    # instances, you must request at least 8 instances (*8 * m5.xlarge = 32 vCPUs*).
    #
    # Valid range: 1 - 1000
    property instance_count : Int32

    # Indicates whether the Capacity Reservation supports EBS-optimized instances. This optimization
    # provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide
    # optimal I/O performance. This optimization isn't available with all instance types. Additional
    # usage charges apply when using an EBS- optimized instance.
    property ebs_optimized : Bool | Nil

    # *Deprecated.*
    property ephemeral_storage : Bool | Nil

    # The date and time at which the Capacity Reservation expires. When a Capacity Reservation
    # expires, the reserved capacity is released and you can no longer launch instances into it. The
    # Capacity Reservation's state changes to `expired` when it reaches its end date and time.
    #
    # You must provide an `EndDate` value if `EndDateType` is `limited`. Omit `EndDate` if
    # `EndDateType` is `unlimited`.
    #
    # If the `EndDateType` is `limited`, the Capacity Reservation is cancelled within an hour from the
    # specified time. For example, if you specify 5/31/2019, 13:30:55, the Capacity Reservation is
    # guaranteed to end between 13:30:55 and 14:30:55 on 5/31/2019.
    #
    # If you are requesting a future-dated Capacity Reservation, you can't specify an end date and
    # time that is within the commitment duration.
    property end_date : Time | Nil

    # Indicates the way in which the Capacity Reservation ends. A Capacity Reservation can have one of
    # the following end types:
    #
    # - `unlimited` - The Capacity Reservation remains active until you explicitly cancel it. Do not
    # provide an `EndDate` if the `EndDateType` is `unlimited`.
    #
    # - `limited` - The Capacity Reservation expires automatically at a specified date and time. You
    # must provide an `EndDate` value if the `EndDateType` value is `limited`.
    property end_date_type : EndDateType | Nil

    # Indicates the type of instance launches that the Capacity Reservation accepts. The options
    # include:
    #
    # - `open` - The Capacity Reservation automatically matches all instances that have matching
    # attributes (instance type, platform, and Availability Zone). Instances that have matching
    # attributes run in the Capacity Reservation automatically without specifying any additional
    # parameters.
    #
    # - `targeted` - The Capacity Reservation only accepts instances that have matching attributes
    # (instance type, platform, and Availability Zone), and explicitly target the Capacity
    # Reservation. This ensures that only permitted instances can use the reserved capacity.
    #
    # If you are requesting a future-dated Capacity Reservation, you must specify `targeted`.
    #
    # Default: `open`
    property instance_match_criteria : InstanceMatchCriteria | Nil

    # The tags to apply to the Capacity Reservation during launch.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Not supported for future-dated Capacity Reservations.
    #
    # The Amazon Resource Name (ARN) of the Outpost on which to create the Capacity Reservation.
    property outpost_arn : String | Nil

    # Not supported for future-dated Capacity Reservations.
    #
    # The Amazon Resource Name (ARN) of the cluster placement group in which to create the Capacity
    # Reservation. For more information, see [ Capacity Reservations for cluster placement
    # groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/cr-cpg.html) in the *Amazon EC2 User
    # Guide*.
    property placement_group_arn : String | Nil

    # Required for future-dated Capacity Reservations only. To create a Capacity Reservation for
    # immediate use, omit this parameter.
    #
    # The date and time at which the future-dated Capacity Reservation should become available for
    # use, in the ISO8601 format in the UTC time zone (`YYYY-MM-DDThh:mm:ss.sssZ`).
    #
    # You can request a future-dated Capacity Reservation between 5 and 120 days in advance.
    property start_date : Time | Nil

    # Required for future-dated Capacity Reservations only. To create a Capacity Reservation for
    # immediate use, omit this parameter.
    #
    # Specify a commitment duration, in seconds, for the future-dated Capacity Reservation.
    #
    # The commitment duration is a minimum duration for which you commit to having the future-dated
    # Capacity Reservation in the `active` state in your account after it has been delivered.
    #
    # For more information, see [ Commitment
    # duration](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/cr-concepts.html#cr-commitment-duration).
    property commitment_duration : Int64 | Nil

    # Required for future-dated Capacity Reservations only. To create a Capacity Reservation for
    # immediate use, omit this parameter.
    #
    # Indicates that the requested capacity will be delivered in addition to any running instances or
    # reserved capacity that you have in your account at the requested date and time.
    #
    # The only supported value is `incremental`.
    property delivery_preference : CapacityReservationDeliveryPreference | Nil

    def initialize(
      @instance_type : String,
      @instance_platform : CapacityReservationInstancePlatform,
      @instance_count : Int32,
      @client_token : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @tenancy : CapacityReservationTenancy | Nil = nil,
      @ebs_optimized : Bool | Nil = nil,
      @ephemeral_storage : Bool | Nil = nil,
      @end_date : Time | Nil = nil,
      @end_date_type : EndDateType | Nil = nil,
      @instance_match_criteria : InstanceMatchCriteria | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @placement_group_arn : String | Nil = nil,
      @start_date : Time | Nil = nil,
      @commitment_duration : Int64 | Nil = nil,
      @delivery_preference : CapacityReservationDeliveryPreference | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      params << {"#{prefix}InstanceType", @instance_type}

      params << {"#{prefix}InstancePlatform", @instance_platform.to_json_object_key}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @tenancy
        params << {"#{prefix}Tenancy", value.to_json_object_key}
      end

      params << {"#{prefix}InstanceCount", @instance_count.to_s}

      if value = @ebs_optimized
        params << {"#{prefix}EbsOptimized", Core::QueryValue.bool(value)}
      end

      if value = @ephemeral_storage
        params << {"#{prefix}EphemeralStorage", Core::QueryValue.bool(value)}
      end

      if value = @end_date
        params << {"#{prefix}EndDate", Core::QueryValue.time(value)}
      end

      if value = @end_date_type
        params << {"#{prefix}EndDateType", value.to_json_object_key}
      end

      if value = @instance_match_criteria
        params << {"#{prefix}InstanceMatchCriteria", value.to_json_object_key}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecifications.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @placement_group_arn
        params << {"#{prefix}PlacementGroupArn", value}
      end

      if value = @start_date
        params << {"#{prefix}StartDate", Core::QueryValue.time(value)}
      end

      if value = @commitment_duration
        params << {"#{prefix}CommitmentDuration", value.to_s}
      end

      if value = @delivery_preference
        params << {"#{prefix}DeliveryPreference", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceType']")).not_nil!,
        instance_platform: ((n = node.xpath_node("*[local-name()='InstancePlatform']")) ? AEC::CapacityReservationInstancePlatform.from_json_object_key?(n.content) : nil).not_nil!,
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
        tenancy: (n = node.xpath_node("*[local-name()='Tenancy']")) ? AEC::CapacityReservationTenancy.from_json_object_key?(n.content) : nil,
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='InstanceCount']")).not_nil!,
        ebs_optimized: Core::XMLValue.bool(node.xpath_node("*[local-name()='EbsOptimized']")),
        ephemeral_storage: Core::XMLValue.bool(node.xpath_node("*[local-name()='EphemeralStorage']")),
        end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='EndDate']")),
        end_date_type: (n = node.xpath_node("*[local-name()='EndDateType']")) ? AEC::EndDateType.from_json_object_key?(n.content) : nil,
        instance_match_criteria: (n = node.xpath_node("*[local-name()='InstanceMatchCriteria']")) ? AEC::InstanceMatchCriteria.from_json_object_key?(n.content) : nil,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecifications']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OutpostArn']")),
        placement_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PlacementGroupArn']")),
        start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='StartDate']")),
        commitment_duration: Core::XMLValue.i64(node.xpath_node("*[local-name()='CommitmentDuration']")),
        delivery_preference: (n = node.xpath_node("*[local-name()='DeliveryPreference']")) ? AEC::CapacityReservationDeliveryPreference.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @outpost_arn
        raise Core::ValidationError.new("OutpostArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z-]+)?:outposts:[a-z\\d-]+:\\d{12}:outpost/op-[a-f0-9]{17}$"))
      end

      if value = @placement_group_arn
        raise Core::ValidationError.new("PlacementGroupArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z-]+)?:ec2:[a-z\\d-]+:\\d{12}:placement-group/^.{1,255}$"))
      end

      if value = @commitment_duration
        raise Core::ValidationError.new("CommitmentDuration value must be >= 1") if value < 1
        raise Core::ValidationError.new("CommitmentDuration value must be <= 200000000") if value > 200000000
      end
    end

    def_equals_and_hash(@client_token, @instance_type, @instance_platform, @availability_zone, @availability_zone_id, @tenancy, @instance_count, @ebs_optimized, @ephemeral_storage, @end_date, @end_date_type, @instance_match_criteria, @tag_specifications, @dry_run, @outpost_arn, @placement_group_arn, @start_date, @commitment_duration, @delivery_preference)
  end
end
