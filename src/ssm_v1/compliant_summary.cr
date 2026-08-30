private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # A summary of resources that are compliant. The summary is organized according to the resource
  # count for each compliance type.
  class CompliantSummary
    include JSON::Serializable

    # The total number of resources that are compliant.
    @[JSON::Field(key: "CompliantCount")]
    property compliant_count : Int32 | Nil

    # A summary of the compliance severity by compliance type.
    @[JSON::Field(key: "SeveritySummary")]
    property severity_summary : SeveritySummary | Nil

    def initialize(
      @compliant_count : Int32 | Nil = nil,
      @severity_summary : SeveritySummary | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @severity_summary
        value.validate!
      end
    end

    def_equals_and_hash(@compliant_count, @severity_summary)
  end
end
