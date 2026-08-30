module Amazonite::SsmV1
  class DeleteParameterRequest
    include JSON::Serializable

    # The name of the parameter to delete.
    #
    # You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end

    def_equals_and_hash(@name)
  end
end
