private alias Core = Amazonite::Core

module Amazonite::EC2
  # The maximum period since deprecation for allowed images.
  class DeprecationTimeCondition
    # The maximum number of days that have elapsed since the image was deprecated. When set to `0`, no
    # deprecated images are allowed.
    property maximum_days_since_deprecated : Int32 | Nil

    def initialize(
      @maximum_days_since_deprecated : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @maximum_days_since_deprecated
        params << {"#{prefix}MaximumDaysSinceDeprecated", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        maximum_days_since_deprecated: Core::XMLValue.i32(node.xpath_node("*[local-name()='maximumDaysSinceDeprecated']")),
      )
    end

    def validate! : Nil
      if value = @maximum_days_since_deprecated
        raise Core::ValidationError.new("MaximumDaysSinceDeprecated value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaximumDaysSinceDeprecated value must be <= 2147483647") if value > 2147483647
      end
    end

    def_equals_and_hash(@maximum_days_since_deprecated)
  end
end
