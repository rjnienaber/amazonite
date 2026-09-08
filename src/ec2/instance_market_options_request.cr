private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the market (purchasing) option for the instances.
  class InstanceMarketOptionsRequest
    # The market type.
    property market_type : MarketType | Nil

    # The options for Spot Instances.
    property spot_options : SpotMarketOptions | Nil

    def initialize(
      @market_type : MarketType | Nil = nil,
      @spot_options : SpotMarketOptions | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @market_type
        params << {"#{prefix}MarketType", value.to_json_object_key}
      end

      if value = @spot_options
        params.concat(value.to_query_params("#{prefix}SpotOptions."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        market_type: (n = node.xpath_node("*[local-name()='MarketType']")) ? AEC::MarketType.from_json_object_key?(n.content) : nil,
        spot_options: node.xpath_node("*[local-name()='SpotOptions']").try { |n| SpotMarketOptions.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @spot_options
        value.validate!
      end
    end

    def_equals_and_hash(@market_type, @spot_options)
  end
end
