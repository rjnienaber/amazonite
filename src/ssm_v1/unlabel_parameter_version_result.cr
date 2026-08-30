module Amazonite::SsmV1
  class UnlabelParameterVersionResult
    include JSON::Serializable

    # A list of all labels deleted from the parameter.
    @[JSON::Field(key: "RemovedLabels")]
    property removed_labels : Array(String) | Nil

    # The labels that aren't attached to the given parameter version.
    @[JSON::Field(key: "InvalidLabels")]
    property invalid_labels : Array(String) | Nil

    def initialize(
      @removed_labels : Array(String) | Nil = nil,
      @invalid_labels : Array(String) | Nil = nil,
    )
    end

    def_equals_and_hash(@removed_labels, @invalid_labels)
  end
end
