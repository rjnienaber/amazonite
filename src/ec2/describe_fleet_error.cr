private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the instances that could not be launched by the fleet.
  class DescribeFleetError
    # The launch templates and overrides that were used for launching the instances. The values that
    # you specify in the Overrides replace the values in the launch template.
    property launch_template_and_overrides : LaunchTemplateAndOverridesResponse | Nil

    # Indicates if the instance that could not be launched was a Spot, On-Demand, Capacity Block for
    # ML, or interruptible Capacity Reservation instance. If you are using `ReservedCapacityOptions`
    # with `on-demand-capacity-reservation` in the `ReservationTypes` list, the value can also be
    # `on-demand-capacity-reservation`.
    property lifecycle : InstanceLifecycle | Nil

    # The error code that indicates why the instance could not be launched. For more information about
    # error codes, see [Error
    # codes](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/errors-overview.html).
    property error_code : String | Nil

    # The error message that describes why the instance could not be launched. For more information
    # about error messages, see [Error
    # codes](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/errors-overview.html).
    property error_message : String | Nil

    def initialize(
      @launch_template_and_overrides : LaunchTemplateAndOverridesResponse | Nil = nil,
      @lifecycle : InstanceLifecycle | Nil = nil,
      @error_code : String | Nil = nil,
      @error_message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @launch_template_and_overrides
        params.concat(value.to_query_params("#{prefix}LaunchTemplateAndOverrides."))
      end

      if value = @lifecycle
        params << {"#{prefix}Lifecycle", value.to_json_object_key}
      end

      if value = @error_code
        params << {"#{prefix}ErrorCode", value}
      end

      if value = @error_message
        params << {"#{prefix}ErrorMessage", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template_and_overrides: node.xpath_node("*[local-name()='launchTemplateAndOverrides']").try { |n| LaunchTemplateAndOverridesResponse.from_xml(n) },
        lifecycle: (n = node.xpath_node("*[local-name()='lifecycle']")) ? AEC::InstanceLifecycle.from_json_object_key?(n.content) : nil,
        error_code: Core::XMLValue.string(node.xpath_node("*[local-name()='errorCode']")),
        error_message: Core::XMLValue.string(node.xpath_node("*[local-name()='errorMessage']")),
      )
    end

    def validate! : Nil
      if value = @launch_template_and_overrides
        value.validate!
      end
    end

    def_equals_and_hash(@launch_template_and_overrides, @lifecycle, @error_code, @error_message)
  end
end
