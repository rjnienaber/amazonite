private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a set of filters for a path analysis. Use path filters to scope the analysis when
  # there can be multiple resulting paths.
  class PathRequestFilter
    # The source IPv4 address.
    property source_address : String | Nil

    # The source port range.
    property source_port_range : RequestFilterPortRange | Nil

    # The destination IPv4 address.
    property destination_address : String | Nil

    # The destination port range.
    property destination_port_range : RequestFilterPortRange | Nil

    def initialize(
      @source_address : String | Nil = nil,
      @source_port_range : RequestFilterPortRange | Nil = nil,
      @destination_address : String | Nil = nil,
      @destination_port_range : RequestFilterPortRange | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @source_address
        params << {"#{prefix}SourceAddress", value}
      end

      if value = @source_port_range
        params.concat(value.to_query_params("#{prefix}SourcePortRange."))
      end

      if value = @destination_address
        params << {"#{prefix}DestinationAddress", value}
      end

      if value = @destination_port_range
        params.concat(value.to_query_params("#{prefix}DestinationPortRange."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_address: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceAddress']")),
        source_port_range: node.xpath_node("*[local-name()='SourcePortRange']").try { |n| RequestFilterPortRange.from_xml(n) },
        destination_address: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationAddress']")),
        destination_port_range: node.xpath_node("*[local-name()='DestinationPortRange']").try { |n| RequestFilterPortRange.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @source_address
        raise Core::ValidationError.new("SourceAddress length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SourceAddress length must be <= 15") if value.size > 15
        raise Core::ValidationError.new("SourceAddress does not match the required pattern") unless value.matches?(Regex.new("^([0-9]{1,3}.){3}[0-9]{1,3}$"))
      end

      if value = @source_port_range
        value.validate!
      end

      if value = @destination_address
        raise Core::ValidationError.new("DestinationAddress length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("DestinationAddress length must be <= 15") if value.size > 15
        raise Core::ValidationError.new("DestinationAddress does not match the required pattern") unless value.matches?(Regex.new("^([0-9]{1,3}.){3}[0-9]{1,3}$"))
      end

      if value = @destination_port_range
        value.validate!
      end
    end

    def_equals_and_hash(@source_address, @source_port_range, @destination_address, @destination_port_range)
  end
end
