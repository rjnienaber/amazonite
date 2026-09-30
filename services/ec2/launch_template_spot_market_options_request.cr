private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The options for Spot Instances.
  class LaunchTemplateSpotMarketOptionsRequest
    # The maximum hourly price you're willing to pay for a Spot Instance. We do not recommend using
    # this parameter because it can lead to increased interruptions. If you do not specify this
    # parameter, you will pay the current Spot price. If you do specify this parameter, it must be
    # more than USD $0.001. Specifying a value below USD $0.001 will result in an
    # `InvalidParameterValue` error message when the launch template is used to launch an instance.
    #
    # If you specify a maximum price, your Spot Instances will be interrupted more frequently than if
    # you do not specify this parameter.
    property max_price : String | Nil

    # The Spot Instance request type.
    property spot_instance_type : SpotInstanceType | Nil

    # Deprecated.
    property block_duration_minutes : Int32 | Nil

    # The end date of the request, in UTC format (*YYYY-MM-DD*T*HH:MM:SS*Z). Supported only for
    # persistent requests.
    #
    # - For a persistent request, the request remains active until the `ValidUntil` date and time is
    # reached. Otherwise, the request remains active until you cancel it.
    #
    # - For a one-time request, `ValidUntil` is not supported. The request remains active until all
    # instances launch or you cancel the request.
    #
    # Default: 7 days from the current date
    property valid_until : Time | Nil

    # The behavior when a Spot Instance is interrupted. The default is `terminate`.
    property instance_interruption_behavior : InstanceInterruptionBehavior | Nil

    def initialize(
      @max_price : String | Nil = nil,
      @spot_instance_type : SpotInstanceType | Nil = nil,
      @block_duration_minutes : Int32 | Nil = nil,
      @valid_until : Time | Nil = nil,
      @instance_interruption_behavior : InstanceInterruptionBehavior | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @max_price
        params << {"#{prefix}MaxPrice", value}
      end

      if value = @spot_instance_type
        params << {"#{prefix}SpotInstanceType", value.to_json_object_key}
      end

      if value = @block_duration_minutes
        params << {"#{prefix}BlockDurationMinutes", value.to_s}
      end

      if value = @valid_until
        params << {"#{prefix}ValidUntil", Core::QueryValue.time(value)}
      end

      if value = @instance_interruption_behavior
        params << {"#{prefix}InstanceInterruptionBehavior", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        max_price: Core::XMLValue.string(node.xpath_node("*[local-name()='MaxPrice']")),
        spot_instance_type: (n = node.xpath_node("*[local-name()='SpotInstanceType']")) ? AEC::SpotInstanceType.from_json_object_key?(n.content) : nil,
        block_duration_minutes: Core::XMLValue.i32(node.xpath_node("*[local-name()='BlockDurationMinutes']")),
        valid_until: Core::XMLValue.time(node.xpath_node("*[local-name()='ValidUntil']")),
        instance_interruption_behavior: (n = node.xpath_node("*[local-name()='InstanceInterruptionBehavior']")) ? AEC::InstanceInterruptionBehavior.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@max_price, @spot_instance_type, @block_duration_minutes, @valid_until, @instance_interruption_behavior)
  end
end
