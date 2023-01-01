module Amazonite::SsmV1
  class MaintenanceWindowStepFunctionsParameters
    include JSON::Serializable

    @[JSON::Field(key: "Input")]
    property input : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @input : String | Nil = nil,
      @name : String | Nil = nil
    )
    end
  end
end
