private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Reserved Instance offering.
  class ReservedInstancesOffering
    # The currency of the Reserved Instance offering you are purchasing. It's specified using ISO 4217
    # standard currency codes. At this time, the only supported currency is `USD`.
    property currency_code : CurrencyCodeValues | Nil

    # The tenancy of the instance.
    property instance_tenancy : Tenancy | Nil

    # Indicates whether the offering is available through the Reserved Instance Marketplace (resale)
    # or Amazon Web Services. If it's a Reserved Instance Marketplace offering, this is `true`.
    property marketplace : Bool | Nil

    # If `convertible` it can be exchanged for Reserved Instances of the same or higher monetary
    # value, with different configurations. If `standard`, it is not possible to perform an exchange.
    property offering_class : OfferingClassType | Nil

    # The Reserved Instance offering type.
    property offering_type : OfferingTypeValues | Nil

    # The pricing details of the Reserved Instance offering.
    property pricing_details : Array(PricingDetail) | Nil

    # The recurring charge tag assigned to the resource.
    property recurring_charges : Array(RecurringCharge) | Nil

    # Whether the Reserved Instance is applied to instances in a Region or an Availability Zone.
    property scope : Scope | Nil

    # The ID of the Availability Zone.
    property availability_zone_id : String | Nil

    # The ID of the Reserved Instance offering. This is the offering ID used in
    # GetReservedInstancesExchangeQuote to confirm that an exchange can be made.
    property reserved_instances_offering_id : String | Nil

    # The instance type on which the Reserved Instance can be used.
    property instance_type : InstanceType | Nil

    # The Availability Zone in which the Reserved Instance can be used.
    property availability_zone : String | Nil

    # The duration of the Reserved Instance, in seconds.
    property duration : Int64 | Nil

    # The usage price of the Reserved Instance, per hour.
    property usage_price : Float32 | Nil

    # The purchase price of the Reserved Instance.
    property fixed_price : Float32 | Nil

    # The Reserved Instance product platform description.
    property product_description : RIProductDescription | Nil

    def initialize(
      @currency_code : CurrencyCodeValues | Nil = nil,
      @instance_tenancy : Tenancy | Nil = nil,
      @marketplace : Bool | Nil = nil,
      @offering_class : OfferingClassType | Nil = nil,
      @offering_type : OfferingTypeValues | Nil = nil,
      @pricing_details : Array(PricingDetail) | Nil = nil,
      @recurring_charges : Array(RecurringCharge) | Nil = nil,
      @scope : Scope | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @reserved_instances_offering_id : String | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @availability_zone : String | Nil = nil,
      @duration : Int64 | Nil = nil,
      @usage_price : Float32 | Nil = nil,
      @fixed_price : Float32 | Nil = nil,
      @product_description : RIProductDescription | Nil = nil,
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

      if value = @marketplace
        params << {"#{prefix}Marketplace", Core::QueryValue.bool(value)}
      end

      if value = @offering_class
        params << {"#{prefix}OfferingClass", value.to_json_object_key}
      end

      if value = @offering_type
        params << {"#{prefix}OfferingType", value.to_json_object_key}
      end

      (@pricing_details || [] of PricingDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PricingDetailsSet.#{i}."))
      end

      (@recurring_charges || [] of RecurringCharge).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RecurringCharges.#{i}."))
      end

      if value = @scope
        params << {"#{prefix}Scope", value.to_json_object_key}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @reserved_instances_offering_id
        params << {"#{prefix}ReservedInstancesOfferingId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
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

      if value = @product_description
        params << {"#{prefix}ProductDescription", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        currency_code: (n = node.xpath_node("*[local-name()='currencyCode']")) ? AEC::CurrencyCodeValues.from_json_object_key?(n.content) : nil,
        instance_tenancy: (n = node.xpath_node("*[local-name()='instanceTenancy']")) ? AEC::Tenancy.from_json_object_key?(n.content) : nil,
        marketplace: Core::XMLValue.bool(node.xpath_node("*[local-name()='marketplace']")),
        offering_class: (n = node.xpath_node("*[local-name()='offeringClass']")) ? AEC::OfferingClassType.from_json_object_key?(n.content) : nil,
        offering_type: (n = node.xpath_node("*[local-name()='offeringType']")) ? AEC::OfferingTypeValues.from_json_object_key?(n.content) : nil,
        pricing_details: node.xpath_nodes("*[local-name()='pricingDetailsSet']/*[local-name()='item']").map { |n| PricingDetail.from_xml(n) },
        recurring_charges: node.xpath_nodes("*[local-name()='recurringCharges']/*[local-name()='item']").map { |n| RecurringCharge.from_xml(n) },
        scope: (n = node.xpath_node("*[local-name()='scope']")) ? AEC::Scope.from_json_object_key?(n.content) : nil,
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        reserved_instances_offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstancesOfferingId']")),
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        duration: Core::XMLValue.i64(node.xpath_node("*[local-name()='duration']")),
        usage_price: Core::XMLValue.f32(node.xpath_node("*[local-name()='usagePrice']")),
        fixed_price: Core::XMLValue.f32(node.xpath_node("*[local-name()='fixedPrice']")),
        product_description: (n = node.xpath_node("*[local-name()='productDescription']")) ? AEC::RIProductDescription.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @pricing_details
        value.each(&.validate!)
      end

      if value = @recurring_charges
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@currency_code, @instance_tenancy, @marketplace, @offering_class, @offering_type, @pricing_details, @recurring_charges, @scope, @availability_zone_id, @reserved_instances_offering_id, @instance_type, @availability_zone, @duration, @usage_price, @fixed_price, @product_description)
  end
end
