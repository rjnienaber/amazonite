private alias Core = Amazonite::Core

module Amazonite::EC2
  # The total value of the new Convertible Reserved Instances.
  class TargetReservationValue
    # The total value of the Convertible Reserved Instances that make up the exchange. This is the sum
    # of the list value, remaining upfront price, and additional upfront cost of the exchange.
    property reservation_value : ReservationValue | Nil

    # The configuration of the Convertible Reserved Instances that make up the exchange.
    property target_configuration : TargetConfiguration | Nil

    def initialize(
      @reservation_value : ReservationValue | Nil = nil,
      @target_configuration : TargetConfiguration | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @reservation_value
        params.concat(value.to_query_params("#{prefix}ReservationValue."))
      end

      if value = @target_configuration
        params.concat(value.to_query_params("#{prefix}TargetConfiguration."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reservation_value: node.xpath_node("*[local-name()='reservationValue']").try { |n| ReservationValue.from_xml(n) },
        target_configuration: node.xpath_node("*[local-name()='targetConfiguration']").try { |n| TargetConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @reservation_value
        value.validate!
      end

      if value = @target_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@reservation_value, @target_configuration)
  end
end
