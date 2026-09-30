private alias Core = Amazonite::Core

module Amazonite::EC2
  # Reserved. If you need to sustain traffic greater than the [documented
  # limits](https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html#vpc-limits-gateways),
  # contact Amazon Web Services Support.
  class ProvisionedBandwidth
    # Reserved.
    property provision_time : Time | Nil

    # Reserved.
    property provisioned : String | Nil

    # Reserved.
    property request_time : Time | Nil

    # Reserved.
    property requested : String | Nil

    # Reserved.
    property status : String | Nil

    def initialize(
      @provision_time : Time | Nil = nil,
      @provisioned : String | Nil = nil,
      @request_time : Time | Nil = nil,
      @requested : String | Nil = nil,
      @status : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @provision_time
        params << {"#{prefix}ProvisionTime", Core::QueryValue.time(value)}
      end

      if value = @provisioned
        params << {"#{prefix}Provisioned", value}
      end

      if value = @request_time
        params << {"#{prefix}RequestTime", Core::QueryValue.time(value)}
      end

      if value = @requested
        params << {"#{prefix}Requested", value}
      end

      if value = @status
        params << {"#{prefix}Status", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        provision_time: Core::XMLValue.time(node.xpath_node("*[local-name()='provisionTime']")),
        provisioned: Core::XMLValue.string(node.xpath_node("*[local-name()='provisioned']")),
        request_time: Core::XMLValue.time(node.xpath_node("*[local-name()='requestTime']")),
        requested: Core::XMLValue.string(node.xpath_node("*[local-name()='requested']")),
        status: Core::XMLValue.string(node.xpath_node("*[local-name()='status']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@provision_time, @provisioned, @request_time, @requested, @status)
  end
end
