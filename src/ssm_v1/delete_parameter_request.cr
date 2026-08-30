private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@name)
  end
end
