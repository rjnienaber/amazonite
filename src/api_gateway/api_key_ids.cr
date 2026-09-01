module Amazonite::ApiGateway
  # The identifier of an ApiKey used in a UsagePlan.
  class ApiKeyIds
    include JSON::Serializable

    # A list of all the ApiKey identifiers.
    @[JSON::Field(key: "ids")]
    property ids : Array(String) | Nil

    # A list of warning messages.
    @[JSON::Field(key: "warnings")]
    property warnings : Array(String) | Nil

    def initialize(
      @ids : Array(String) | Nil = nil,
      @warnings : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ids, @warnings)
  end
end
