module Amazonite::SsmV1
  class DeleteParametersRequest
    include JSON::Serializable

    @[JSON::Field(key: "Names")]
    property names : Array(String)

    def initialize(
      @names : Array(String)
    )
    end
  end
end
