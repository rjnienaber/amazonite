module Amazonite::SsmV1
  # Defines the values for a task parameter.
  class MaintenanceWindowTaskParameterValueExpression
    include JSON::Serializable

    # This field contains an array of 0 or more strings, each 1 to 255 characters in length.
    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    def initialize(
      @values : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@values)
  end
end
