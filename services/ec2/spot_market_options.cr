private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The options for Spot Instances.
  class SpotMarketOptions
    # The maximum hourly price that you're willing to pay for a Spot Instance. We do not recommend
    # using this parameter because it can lead to increased interruptions. If you do not specify this
    # parameter, you will pay the current Spot price.
    #
    # If you specify a maximum price, your Spot Instances will be interrupted more frequently than if
    # you do not specify this parameter.
    #
    # If you specify a maximum price, it must be more than USD $0.001. Specifying a value below USD
    # $0.001 will result in an `InvalidParameterValue` error message.
    property max_price : String | Nil

    # The Spot Instance request type. For
    # [RunInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RunInstances),
    # persistent Spot Instance requests are only supported when the instance interruption behavior is
    # either `hibernate` or `stop`.
    property spot_instance_type : SpotInstanceType | Nil

    # Deprecated.
    property block_duration_minutes : Int32 | Nil

    # The end date of the request, in UTC format (*YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z). Supported only
    # for persistent requests.
    #
    # - For a persistent request, the request remains active until the `ValidUntil` date and time is
    # reached. Otherwise, the request remains active until you cancel it.
    #
    # - For a one-time request, `ValidUntil` is not supported. The request remains active until all
    # instances launch or you cancel the request.
    property valid_until : Time | Nil

    # The behavior when a Spot Instance is interrupted.
    #
    # If `Configured` (for [ `HibernationOptions`
    # ](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_HibernationOptionsRequest.html)) is
    # set to `true`, the `InstanceInterruptionBehavior` parameter is automatically set to `hibernate`.
    # If you set it to `stop` or `terminate`, you'll get an error.
    #
    # If `Configured` (for [ `HibernationOptions`
    # ](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_HibernationOptionsRequest.html)) is
    # set to `false` or `null`, the `InstanceInterruptionBehavior` parameter is automatically set to
    # `terminate`. You can also set it to `stop` or `hibernate`.
    #
    # For more information, see [Interruption
    # behavior](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/interruption-behavior.html) in the
    # *Amazon EC2 User Guide*.
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
