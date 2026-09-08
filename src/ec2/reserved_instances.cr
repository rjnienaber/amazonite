private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Reserved Instance.
  class ReservedInstances
    # The currency of the Reserved Instance. It's specified using ISO 4217 standard currency codes. At
    # this time, the only supported currency is `USD`.
    property currency_code : CurrencyCodeValues | Nil

    # The tenancy of the instance.
    property instance_tenancy : Tenancy | Nil

    # The offering class of the Reserved Instance.
    property offering_class : OfferingClassType | Nil

    # The Reserved Instance offering type.
    property offering_type : OfferingTypeValues | Nil

    # The recurring charge tag assigned to the resource.
    property recurring_charges : Array(RecurringCharge) | Nil

    # The scope of the Reserved Instance.
    property scope : Scope | Nil

    # Any tags assigned to the resource.
    property tags : Array(Tag) | Nil

    # The ID of the Availability Zone.
    property availability_zone_id : String | Nil

    # The ID of the Reserved Instance.
    property reserved_instances_id : String | Nil

    # The instance type on which the Reserved Instance can be used.
    property instance_type : InstanceType | Nil

    # The Availability Zone in which the Reserved Instance can be used.
    property availability_zone : String | Nil

    # The date and time the Reserved Instance started.
    property start : Time | Nil

    # The time when the Reserved Instance expires.
    property end : Time | Nil

    # The duration of the Reserved Instance, in seconds.
    property duration : Int64 | Nil

    # The usage price of the Reserved Instance, per hour.
    property usage_price : Float32 | Nil

    # The purchase price of the Reserved Instance.
    property fixed_price : Float32 | Nil

    # The number of reservations purchased.
    property instance_count : Int32 | Nil

    # The Reserved Instance product platform description.
    property product_description : RIProductDescription | Nil

    # The state of the Reserved Instance purchase.
    property state : ReservedInstanceState | Nil

    def initialize(
      @currency_code : CurrencyCodeValues | Nil = nil,
      @instance_tenancy : Tenancy | Nil = nil,
      @offering_class : OfferingClassType | Nil = nil,
      @offering_type : OfferingTypeValues | Nil = nil,
      @recurring_charges : Array(RecurringCharge) | Nil = nil,
      @scope : Scope | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @reserved_instances_id : String | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @availability_zone : String | Nil = nil,
      @start : Time | Nil = nil,
      @end : Time | Nil = nil,
      @duration : Int64 | Nil = nil,
      @usage_price : Float32 | Nil = nil,
      @fixed_price : Float32 | Nil = nil,
      @instance_count : Int32 | Nil = nil,
      @product_description : RIProductDescription | Nil = nil,
      @state : ReservedInstanceState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @currency_code
        params << {"#{prefix}CurrencyCode", value.to_json_object_key}
      end

      if value = @instance_tenancy
        params << {"#{prefix}InstanceTenancy", value.to_json_object_key}
      end

      if value = @offering_class
        params << {"#{prefix}OfferingClass", value.to_json_object_key}
      end

      if value = @offering_type
        params << {"#{prefix}OfferingType", value.to_json_object_key}
      end

      (@recurring_charges || [] of RecurringCharge).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RecurringCharges.#{i}."))
      end

      if value = @scope
        params << {"#{prefix}Scope", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @reserved_instances_id
        params << {"#{prefix}ReservedInstancesId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @start
        params << {"#{prefix}Start", Core::QueryValue.time(value)}
      end

      if value = @end
        params << {"#{prefix}End", Core::QueryValue.time(value)}
      end

      if value = @duration
        params << {"#{prefix}Duration", value.to_s}
      end

      if value = @usage_price
        params << {"#{prefix}UsagePrice", value.to_s}
      end

      if value = @fixed_price
        params << {"#{prefix}FixedPrice", value.to_s}
      end

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      if value = @product_description
        params << {"#{prefix}ProductDescription", value.to_json_object_key}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        currency_code: (n = node.xpath_node("*[local-name()='currencyCode']")) ? AEC::CurrencyCodeValues.from_json_object_key?(n.content) : nil,
        instance_tenancy: (n = node.xpath_node("*[local-name()='instanceTenancy']")) ? AEC::Tenancy.from_json_object_key?(n.content) : nil,
        offering_class: (n = node.xpath_node("*[local-name()='offeringClass']")) ? AEC::OfferingClassType.from_json_object_key?(n.content) : nil,
        offering_type: (n = node.xpath_node("*[local-name()='offeringType']")) ? AEC::OfferingTypeValues.from_json_object_key?(n.content) : nil,
        recurring_charges: node.xpath_nodes("*[local-name()='recurringCharges']/*[local-name()='item']").map { |n| RecurringCharge.from_xml(n) },
        scope: (n = node.xpath_node("*[local-name()='scope']")) ? AEC::Scope.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        reserved_instances_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstancesId']")),
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        start: Core::XMLValue.time(node.xpath_node("*[local-name()='start']")),
        end: Core::XMLValue.time(node.xpath_node("*[local-name()='end']")),
        duration: Core::XMLValue.i64(node.xpath_node("*[local-name()='duration']")),
        usage_price: Core::XMLValue.f32(node.xpath_node("*[local-name()='usagePrice']")),
        fixed_price: Core::XMLValue.f32(node.xpath_node("*[local-name()='fixedPrice']")),
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        product_description: (n = node.xpath_node("*[local-name()='productDescription']")) ? AEC::RIProductDescription.from_json_object_key?(n.content) : nil,
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::ReservedInstanceState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @recurring_charges
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@currency_code, @instance_tenancy, @offering_class, @offering_type, @recurring_charges, @scope, @tags, @availability_zone_id, @reserved_instances_id, @instance_type, @availability_zone, @start, @end, @duration, @usage_price, @fixed_price, @instance_count, @product_description, @state)
  end
end
