module Amazonite::SsmV1
  class CompliantSummary
    include JSON::Serializable

    @[JSON::Field(key: "CompliantCount")]
    property compliant_count : Int32 | Nil

    @[JSON::Field(key: "SeveritySummary")]
    property severity_summary : SeveritySummary | Nil

    def initialize(
      @compliant_count : Int32 | Nil = nil,
      @severity_summary : SeveritySummary | Nil = nil
    )
    end
  end
end
