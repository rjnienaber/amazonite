module Amazonite::SsmV1
  class MaintenanceWindowTaskParameterValueExpression
    include JSON::Serializable

    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    def initialize(
      @values : Array(String) | Nil = nil
    )
    end
  end
end
