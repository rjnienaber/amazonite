private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for PurchaseReservedInstancesOffering.
  class PurchaseReservedInstancesOfferingRequest
    # The number of Reserved Instances to purchase.
    property instance_count : Int32

    # The ID of the Reserved Instance offering to purchase.
    property reserved_instances_offering_id : String

    # The time at which to purchase the Reserved Instance, in UTC format (for example,
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z).
    property purchase_time : Time | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Specified for Reserved Instance Marketplace offerings to limit the total order and ensure that
    # the Reserved Instances are not purchased at unexpected prices.
    property limit_price : ReservedInstanceLimitPrice | Nil

    def initialize(
      @instance_count : Int32,
      @reserved_instances_offering_id : String,
      @purchase_time : Time | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @limit_price : ReservedInstanceLimitPrice | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceCount", @instance_count.to_s}

      params << {"#{prefix}ReservedInstancesOfferingId", @reserved_instances_offering_id}

      if value = @purchase_time
        params << {"#{prefix}PurchaseTime", Core::QueryValue.time(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @limit_price
        params.concat(value.to_query_params("#{prefix}LimitPrice."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='InstanceCount']")).not_nil!,
        reserved_instances_offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ReservedInstancesOfferingId']")).not_nil!,
        purchase_time: Core::XMLValue.time(node.xpath_node("*[local-name()='PurchaseTime']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        limit_price: node.xpath_node("*[local-name()='limitPrice']").try { |n| ReservedInstanceLimitPrice.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @limit_price
        value.validate!
      end
    end

    def_equals_and_hash(@instance_count, @reserved_instances_offering_id, @purchase_time, @dry_run, @limit_price)
  end
end
