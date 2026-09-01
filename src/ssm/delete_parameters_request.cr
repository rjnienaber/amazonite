private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DeleteParametersRequest
    include JSON::Serializable

    # The names of the parameters to delete. After deleting a parameter, wait for at least 30 seconds
    # to create a parameter with the same name.
    #
    # You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.
    @[JSON::Field(key: "Names")]
    property names : Array(String) = [] of String

    def initialize(
      @names : Array(String),
    )
    end

    def validate! : Nil
      if value = @names
        raise Core::ValidationError.new("Names must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Names must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@names)
  end
end
