module Amazonite::SsmV1
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

    def_equals_and_hash(@deleted_parameters, @invalid_parameters)
  end
end
