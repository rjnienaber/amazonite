module Amazonite::SsmV1
  class LabelParameterVersionResult
    include JSON::Serializable

    @[JSON::Field(key: "InvalidLabels")]
    property invalid_labels : Array(String) | Nil

    @[JSON::Field(key: "ParameterVersion")]
    property parameter_version : Int64 | Nil

    def initialize(
      @invalid_labels : Array(String) | Nil = nil,
      @parameter_version : Int64 | Nil = nil
    )
    end
  end
end
