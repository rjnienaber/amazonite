private alias Core = Amazonite::Core

module Amazonite::EC2
  # The minimum and maximum amount of network bandwidth, in gigabits per second (Gbps).
  #
  # Setting the minimum bandwidth does not guarantee that your instance will achieve the minimum
  # bandwidth. Amazon EC2 will identify instance types that support the specified minimum bandwidth,
  # but the actual bandwidth of your instance might go below the specified minimum at times. For
  # more information, see [Available instance
  # bandwidth](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-network-bandwidth.html#available-instance-bandwidth)
  # in the *Amazon EC2 User Guide*.
  class NetworkBandwidthGbps
    # The minimum amount of network bandwidth, in Gbps. If this parameter is not specified, there is
    # no minimum limit.
    property min : Float64 | Nil

    # The maximum amount of network bandwidth, in Gbps. If this parameter is not specified, there is
    # no maximum limit.
    property max : Float64 | Nil

    def initialize(
      @min : Float64 | Nil = nil,
      @max : Float64 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @min
        params << {"#{prefix}Min", value.to_s}
      end

      if value = @max
        params << {"#{prefix}Max", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        min: Core::XMLValue.f64(node.xpath_node("*[local-name()='min']")),
        max: Core::XMLValue.f64(node.xpath_node("*[local-name()='max']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@min, @max)
  end
end
