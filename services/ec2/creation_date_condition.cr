private alias Core = Amazonite::Core

module Amazonite::EC2
  # The maximum age for allowed images.
  class CreationDateCondition
    # The maximum number of days that have elapsed since the image was created. For example, a value
    # of `300` allows images that were created within the last 300 days.
    property maximum_days_since_created : Int32 | Nil

    def initialize(
      @maximum_days_since_created : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @maximum_days_since_created
        params << {"#{prefix}MaximumDaysSinceCreated", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        maximum_days_since_created: Core::XMLValue.i32(node.xpath_node("*[local-name()='maximumDaysSinceCreated']")),
      )
    end

    def validate! : Nil
      if value = @maximum_days_since_created
        raise Core::ValidationError.new("MaximumDaysSinceCreated value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaximumDaysSinceCreated value must be <= 2147483647") if value > 2147483647
      end
    end

    def_equals_and_hash(@maximum_days_since_created)
  end
end
