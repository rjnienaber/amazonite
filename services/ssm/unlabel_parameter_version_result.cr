private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @removed_labels
        raise Core::ValidationError.new("RemovedLabels must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("RemovedLabels must have at most 10 item(s)") if value.size > 10
      end

      if value = @invalid_labels
        raise Core::ValidationError.new("InvalidLabels must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("InvalidLabels must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@removed_labels, @invalid_labels)
  end
end
