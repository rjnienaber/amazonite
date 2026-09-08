private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for CreateReservedInstancesListing.
  class CreateReservedInstancesListingRequest
    # The ID of the active Standard Reserved Instance.
    property reserved_instances_id : String

    # The number of instances that are a part of a Reserved Instance account to be listed in the
    # Reserved Instance Marketplace. This number should be less than or equal to the instance count
    # associated with the Reserved Instance ID specified in this call.
    property instance_count : Int32

    # A list specifying the price of the Standard Reserved Instance for each month remaining in the
    # Reserved Instance term.
    property price_schedules : Array(PriceScheduleSpecification) = [] of PriceScheduleSpecification

    # Unique, case-sensitive identifier you provide to ensure idempotency of your listings. This helps
    # avoid duplicate listings. For more information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String

    def initialize(
      @reserved_instances_id : String,
      @instance_count : Int32,
      @price_schedules : Array(PriceScheduleSpecification),
      @client_token : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ReservedInstancesId", @reserved_instances_id}

      params << {"#{prefix}InstanceCount", @instance_count.to_s}

      @price_schedules.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PriceSchedules.#{i}."))
      end

      params << {"#{prefix}ClientToken", @client_token}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reserved_instances_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstancesId']")).not_nil!,
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")).not_nil!,
        price_schedules: node.xpath_nodes("*[local-name()='priceSchedules']/*[local-name()='item']").map { |n| PriceScheduleSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @price_schedules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@reserved_instances_id, @instance_count, @price_schedules, @client_token)
  end
end
