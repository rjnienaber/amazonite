module Amazonite::SsmV1
  class ValidateCloudConnectorResult
    include JSON::Serializable

    # A list of validation findings for the cloud connector.
    @[JSON::Field(key: "ValidationFindings")]
    property validation_findings : Array(ValidationFinding) | Nil

    # The token to use when requesting the next set of items.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @validation_findings : Array(ValidationFinding) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
