private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class GetMetricStreamInput
    include JSON::Serializable

    # The name of the metric stream to retrieve information about.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 255") if value.size > 255
      end
    end

    def_equals_and_hash(@name)
  end
end
