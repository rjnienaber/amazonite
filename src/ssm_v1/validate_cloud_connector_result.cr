module Amazonite::SsmV1
  class ValidateCloudConnectorResult
    include JSON::Serializable

    @[JSON::Field(key: "ValidationFindings")]
    property validation_findings : Array(ValidationFinding) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @validation_findings : Array(ValidationFinding) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
