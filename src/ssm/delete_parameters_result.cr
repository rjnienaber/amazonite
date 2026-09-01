private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DeleteParametersResult
    include JSON::Serializable

    # The names of the deleted parameters.
    @[JSON::Field(key: "DeletedParameters")]
    property deleted_parameters : Array(String) | Nil

    # The names of parameters that weren't deleted because the parameters aren't valid.
    @[JSON::Field(key: "InvalidParameters")]
    property invalid_parameters : Array(String) | Nil

    def initialize(
      @deleted_parameters : Array(String) | Nil = nil,
      @invalid_parameters : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @deleted_parameters
        raise Core::ValidationError.new("DeletedParameters must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("DeletedParameters must have at most 10 item(s)") if value.size > 10
      end

      if value = @invalid_parameters
        raise Core::ValidationError.new("InvalidParameters must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("InvalidParameters must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@deleted_parameters, @invalid_parameters)
  end
end
