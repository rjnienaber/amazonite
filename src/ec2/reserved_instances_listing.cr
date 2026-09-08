private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Reserved Instance listing.
  class ReservedInstancesListing
    # A unique, case-sensitive key supplied by the client to ensure that the request is idempotent.
    # For more information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # The time the listing was created.
    property create_date : Time | Nil

    # The number of instances in this state.
    property instance_counts : Array(InstanceCount) | Nil

    # The price of the Reserved Instance listing.
    property price_schedules : Array(PriceSchedule) | Nil

    # The ID of the Reserved Instance.
    property reserved_instances_id : String | Nil

    # The ID of the Reserved Instance listing.
    property reserved_instances_listing_id : String | Nil

    # The status of the Reserved Instance listing.
    property status : ListingStatus | Nil

    # The reason for the current status of the Reserved Instance listing. The response can be blank.
    property status_message : String | Nil

    # Any tags assigned to the resource.
    property tags : Array(Tag) | Nil

    # The last modified timestamp of the listing.
    property update_date : Time | Nil

    def initialize(
      @client_token : String | Nil = nil,
      @create_date : Time | Nil = nil,
      @instance_counts : Array(InstanceCount) | Nil = nil,
      @price_schedules : Array(PriceSchedule) | Nil = nil,
      @reserved_instances_id : String | Nil = nil,
      @reserved_instances_listing_id : String | Nil = nil,
      @status : ListingStatus | Nil = nil,
      @status_message : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @update_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      (@instance_counts || [] of InstanceCount).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceCounts.#{i}."))
      end

      (@price_schedules || [] of PriceSchedule).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PriceSchedules.#{i}."))
      end

      if value = @reserved_instances_id
        params << {"#{prefix}ReservedInstancesId", value}
      end

      if value = @reserved_instances_listing_id
        params << {"#{prefix}ReservedInstancesListingId", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @update_date
        params << {"#{prefix}UpdateDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='createDate']")),
        instance_counts: node.xpath_nodes("*[local-name()='instanceCounts']/*[local-name()='item']").map { |n| InstanceCount.from_xml(n) },
        price_schedules: node.xpath_nodes("*[local-name()='priceSchedules']/*[local-name()='item']").map { |n| PriceSchedule.from_xml(n) },
        reserved_instances_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstancesId']")),
        reserved_instances_listing_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstancesListingId']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::ListingStatus.from_json_object_key?(n.content) : nil,
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        update_date: Core::XMLValue.time(node.xpath_node("*[local-name()='updateDate']")),
      )
    end

    def validate! : Nil
      if value = @instance_counts
        value.each(&.validate!)
      end

      if value = @price_schedules
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@client_token, @create_date, @instance_counts, @price_schedules, @reserved_instances_id, @reserved_instances_listing_id, @status, @status_message, @tags, @update_date)
  end
end
