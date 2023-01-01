module Amazonite::SsmV1
  class DeleteParameterRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String
    )
    end
  end
end
