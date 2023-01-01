module Amazonite::SsmV1
  class DeleteParametersResult
    include JSON::Serializable

    @[JSON::Field(key: "DeletedParameters")]
    property deleted_parameters : Array(String) | Nil

    @[JSON::Field(key: "InvalidParameters")]
    property invalid_parameters : Array(String) | Nil

    def initialize(
      @deleted_parameters : Array(String) | Nil = nil,
      @invalid_parameters : Array(String) | Nil = nil
    )
    end
  end
end
