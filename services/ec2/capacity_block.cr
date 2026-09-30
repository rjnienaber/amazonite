private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Reserve powerful GPU instances on a future date to support your short duration machine learning
  # (ML) workloads. Instances that run inside a Capacity Block are automatically placed close
  # together inside [Amazon EC2 UltraClusters](http://aws.amazon.com/ec2/ultraclusters/), for
  # low-latency, petabit-scale, non-blocking networking.
  #
  # You can also reserve Amazon EC2 UltraServers. UltraServers connect multiple EC2 instances using
  # a low-latency, high-bandwidth accelerator interconnect (NeuronLink). They are built to tackle
  # very large-scale AI/ML workloads that require significant processing power. For more
  # information, see Amazon EC2 UltraServers.
  class CapacityBlock
    # The ID of the Capacity Block.
    property capacity_block_id : String | Nil

    # The EC2 UltraServer type of the Capacity Block.
    property ultraserver_type : String | Nil

    # The Availability Zone of the Capacity Block.
    property availability_zone : String | Nil

    # The Availability Zone ID of the Capacity Block.
    property availability_zone_id : String | Nil

    # The ID of the Capacity Reservation.
    property capacity_reservation_ids : Array(String) | Nil

    # The date and time at which the Capacity Block was started.
    property start_date : Time | Nil

    # The date and time at which the Capacity Block expires. When a Capacity Block expires, all
    # instances in the Capacity Block are terminated.
    property end_date : Time | Nil

    # The date and time at which the Capacity Block was created.
    property create_date : Time | Nil

    # The state of the Capacity Block.
    property state : CapacityBlockResourceState | Nil

    # The tags assigned to the Capacity Block.
    property tags : Array(Tag) | Nil

    def initialize(
      @capacity_block_id : String | Nil = nil,
      @ultraserver_type : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @capacity_reservation_ids : Array(String) | Nil = nil,
      @start_date : Time | Nil = nil,
      @end_date : Time | Nil = nil,
      @create_date : Time | Nil = nil,
      @state : CapacityBlockResourceState | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_block_id
        params << {"#{prefix}CapacityBlockId", value}
      end

      if value = @ultraserver_type
        params << {"#{prefix}UltraserverType", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      (@capacity_reservation_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}CapacityReservationIdSet.#{i}", item}
      end

      if value = @start_date
        params << {"#{prefix}StartDate", Core::QueryValue.time(value)}
      end

      if value = @end_date
        params << {"#{prefix}EndDate", Core::QueryValue.time(value)}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_block_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityBlockId']")),
        ultraserver_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ultraserverType']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        capacity_reservation_ids: node.xpath_nodes("*[local-name()='capacityReservationIdSet']/*[local-name()='item']").map { |n| n.content },
        start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='startDate']")),
        end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='endDate']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='createDate']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::CapacityBlockResourceState.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_block_id, @ultraserver_type, @availability_zone, @availability_zone_id, @capacity_reservation_ids, @start_date, @end_date, @create_date, @state, @tags)
  end
end
