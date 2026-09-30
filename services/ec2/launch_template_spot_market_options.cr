private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The options for Spot Instances.
  class LaunchTemplateSpotMarketOptions
    # The maximum hourly price you're willing to pay for a Spot Instance. We do not recommend using
    # this parameter because it can lead to increased interruptions. If you do not specify this
    # parameter, you will pay the current Spot price. If you do specify this parameter, it must be
    # more than USD $0.001. Specifying a value below USD $0.001 will result in an
    # `InvalidParameterValue` error message when the launch template is used to launch an instance.
    property max_price : String | Nil

    # The Spot Instance request type.
    property spot_instance_type : SpotInstanceType | Nil

    # The required duration for the Spot Instances (also known as Spot blocks), in minutes. This value
    # must be a multiple of 60 (60, 120, 180, 240, 300, or 360).
    property block_duration_minutes : Int32 | Nil

    # The end date of the request. For a one-time request, the request remains active until all
    # instances launch, the request is canceled, or this date is reached. If the request is
    # persistent, it remains active until it is canceled or this date and time is reached.
    property valid_until : Time | Nil

    # The behavior when a Spot Instance is interrupted.
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
        max_price: Core::XMLValue.string(node.xpath_node("*[local-name()='maxPrice']")),
        spot_instance_type: (n = node.xpath_node("*[local-name()='spotInstanceType']")) ? AEC::SpotInstanceType.from_json_object_key?(n.content) : nil,
        block_duration_minutes: Core::XMLValue.i32(node.xpath_node("*[local-name()='blockDurationMinutes']")),
        valid_until: Core::XMLValue.time(node.xpath_node("*[local-name()='validUntil']")),
        instance_interruption_behavior: (n = node.xpath_node("*[local-name()='instanceInterruptionBehavior']")) ? AEC::InstanceInterruptionBehavior.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@max_price, @spot_instance_type, @block_duration_minutes, @valid_until, @instance_interruption_behavior)
  end
end
