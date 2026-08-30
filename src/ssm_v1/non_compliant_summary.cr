module Amazonite::SsmV1
  # A summary of resources that aren't compliant. The summary is organized according to resource
  # type.
  class NonCompliantSummary
    include JSON::Serializable

    # The total number of compliance items that aren't compliant.
    @[JSON::Field(key: "NonCompliantCount")]
    property non_compliant_count : Int32 | Nil

    # A summary of the non-compliance severity by compliance type
    @[JSON::Field(key: "SeveritySummary")]
    property severity_summary : SeveritySummary | Nil

    def initialize(
      @non_compliant_count : Int32 | Nil = nil,
      @severity_summary : SeveritySummary | Nil = nil,
    )
    end

    def_equals_and_hash(@non_compliant_count, @severity_summary)
  end
end
