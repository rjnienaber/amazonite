private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class GetMetricDataQueryDefinitionInput
    include JSON::Serializable

    # The ID of the metric data query definition to retrieve.
    @[JSON::Field(key: "Id")]
    property id : String

    def initialize(
      @id : String,
    )
    end

    def validate! : Nil
      if value = @id
        raise Core::ValidationError.new("Id length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Id length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Id does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-]{1,64}$"))
      end
    end

    def_equals_and_hash(@id)
  end
end
