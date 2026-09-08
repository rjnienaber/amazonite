private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a load balancer target.
  class AnalysisLoadBalancerTarget
    # The IP address.
    property address : String | Nil

    # The Availability Zone.
    property availability_zone : String | Nil

    # The ID of the Availability Zone.
    property availability_zone_id : String | Nil

    # Information about the instance.
    property instance : AnalysisComponent | Nil

    # The port on which the target is listening.
    property port : Int32 | Nil

    def initialize(
      @address : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @instance : AnalysisComponent | Nil = nil,
      @port : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @address
        params << {"#{prefix}Address", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @instance
        params.concat(value.to_query_params("#{prefix}Instance."))
      end

      if value = @port
        params << {"#{prefix}Port", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        address: Core::XMLValue.string(node.xpath_node("*[local-name()='address']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        instance: node.xpath_node("*[local-name()='instance']").try { |n| AnalysisComponent.from_xml(n) },
        port: Core::XMLValue.i32(node.xpath_node("*[local-name()='port']")),
      )
    end

    def validate! : Nil
      if value = @address
        raise Core::ValidationError.new("Address length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Address length must be <= 15") if value.size > 15
        raise Core::ValidationError.new("Address does not match the required pattern") unless value.matches?(Regex.new("^([0-9]{1,3}.){3}[0-9]{1,3}$"))
      end

      if value = @instance
        value.validate!
      end

      if value = @port
        raise Core::ValidationError.new("Port value must be >= 0") if value < 0
        raise Core::ValidationError.new("Port value must be <= 65535") if value > 65535
      end
    end

    def_equals_and_hash(@address, @availability_zone, @availability_zone_id, @instance, @port)
  end
end
