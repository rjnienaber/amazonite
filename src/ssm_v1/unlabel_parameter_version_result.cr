module Amazonite::SsmV1
  class UnlabelParameterVersionResult
    include JSON::Serializable

    @[JSON::Field(key: "RemovedLabels")]
    property removed_labels : Array(String) | Nil

    @[JSON::Field(key: "InvalidLabels")]
    property invalid_labels : Array(String) | Nil

    def initialize(
      @removed_labels : Array(String) | Nil = nil,
      @invalid_labels : Array(String) | Nil = nil
    )
    end
  end
end
