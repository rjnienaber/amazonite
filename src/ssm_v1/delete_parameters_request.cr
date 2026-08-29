module Amazonite::SsmV1
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
  end
end
