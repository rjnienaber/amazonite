module Amazonite::SsmV1
  class NonCompliantSummary
    include JSON::Serializable

    @[JSON::Field(key: "NonCompliantCount")]
    property non_compliant_count : Int32 | Nil

    @[JSON::Field(key: "SeveritySummary")]
    property severity_summary : SeveritySummary | Nil

    def initialize(
      @non_compliant_count : Int32 | Nil = nil,
      @severity_summary : SeveritySummary | Nil = nil
    )
    end
  end
end
