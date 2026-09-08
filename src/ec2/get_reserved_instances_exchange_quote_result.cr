private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of GetReservedInstancesExchangeQuote.
  class GetReservedInstancesExchangeQuoteResult
    # The currency of the transaction.
    property currency_code : String | Nil

    # If `true`, the exchange is valid. If `false`, the exchange cannot be completed.
    property is_valid_exchange : Bool | Nil

    # The new end date of the reservation term.
    property output_reserved_instances_will_expire_at : Time | Nil

    # The total true upfront charge for the exchange.
    property payment_due : String | Nil

    # The cost associated with the Reserved Instance.
    property reserved_instance_value_rollup : ReservationValue | Nil

    # The configuration of your Convertible Reserved Instances.
    property reserved_instance_value_set : Array(ReservedInstanceReservationValue) | Nil

    # The cost associated with the Reserved Instance.
    property target_configuration_value_rollup : ReservationValue | Nil

    # The values of the target Convertible Reserved Instances.
    property target_configuration_value_set : Array(TargetReservationValue) | Nil

    # Describes the reason why the exchange cannot be completed.
    property validation_failure_reason : String | Nil

    def initialize(
      @currency_code : String | Nil = nil,
      @is_valid_exchange : Bool | Nil = nil,
      @output_reserved_instances_will_expire_at : Time | Nil = nil,
      @payment_due : String | Nil = nil,
      @reserved_instance_value_rollup : ReservationValue | Nil = nil,
      @reserved_instance_value_set : Array(ReservedInstanceReservationValue) | Nil = nil,
      @target_configuration_value_rollup : ReservationValue | Nil = nil,
      @target_configuration_value_set : Array(TargetReservationValue) | Nil = nil,
      @validation_failure_reason : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @currency_code
        params << {"#{prefix}CurrencyCode", value}
      end

      if value = @is_valid_exchange
        params << {"#{prefix}IsValidExchange", Core::QueryValue.bool(value)}
      end

      if value = @output_reserved_instances_will_expire_at
        params << {"#{prefix}OutputReservedInstancesWillExpireAt", Core::QueryValue.time(value)}
      end

      if value = @payment_due
        params << {"#{prefix}PaymentDue", value}
      end

      if value = @reserved_instance_value_rollup
        params.concat(value.to_query_params("#{prefix}ReservedInstanceValueRollup."))
      end

      (@reserved_instance_value_set || [] of ReservedInstanceReservationValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ReservedInstanceValueSet.#{i}."))
      end

      if value = @target_configuration_value_rollup
        params.concat(value.to_query_params("#{prefix}TargetConfigurationValueRollup."))
      end

      (@target_configuration_value_set || [] of TargetReservationValue).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TargetConfigurationValueSet.#{i}."))
      end

      if value = @validation_failure_reason
        params << {"#{prefix}ValidationFailureReason", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        currency_code: Core::XMLValue.string(node.xpath_node("*[local-name()='currencyCode']")),
        is_valid_exchange: Core::XMLValue.bool(node.xpath_node("*[local-name()='isValidExchange']")),
        output_reserved_instances_will_expire_at: Core::XMLValue.time(node.xpath_node("*[local-name()='outputReservedInstancesWillExpireAt']")),
        payment_due: Core::XMLValue.string(node.xpath_node("*[local-name()='paymentDue']")),
        reserved_instance_value_rollup: node.xpath_node("*[local-name()='reservedInstanceValueRollup']").try { |n| ReservationValue.from_xml(n) },
        reserved_instance_value_set: node.xpath_nodes("*[local-name()='reservedInstanceValueSet']/*[local-name()='item']").map { |n| ReservedInstanceReservationValue.from_xml(n) },
        target_configuration_value_rollup: node.xpath_node("*[local-name()='targetConfigurationValueRollup']").try { |n| ReservationValue.from_xml(n) },
        target_configuration_value_set: node.xpath_nodes("*[local-name()='targetConfigurationValueSet']/*[local-name()='item']").map { |n| TargetReservationValue.from_xml(n) },
        validation_failure_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='validationFailureReason']")),
      )
    end

    def validate! : Nil
      if value = @reserved_instance_value_rollup
        value.validate!
      end

      if value = @reserved_instance_value_set
        value.each(&.validate!)
      end

      if value = @target_configuration_value_rollup
        value.validate!
      end

      if value = @target_configuration_value_set
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@currency_code, @is_valid_exchange, @output_reserved_instances_will_expire_at, @payment_due, @reserved_instance_value_rollup, @reserved_instance_value_set, @target_configuration_value_rollup, @target_configuration_value_set, @validation_failure_reason)
  end
end
