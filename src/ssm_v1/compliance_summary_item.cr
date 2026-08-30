private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # A summary of compliance information by compliance type.
  class ComplianceSummaryItem
    include JSON::Serializable

    # The type of compliance item. For example, the compliance type can be Association, Patch, or
    # Custom:string.
    @[JSON::Field(key: "ComplianceType")]
    property compliance_type : String | Nil

    # A list of COMPLIANT items for the specified compliance type.
    @[JSON::Field(key: "CompliantSummary")]
    property compliant_summary : CompliantSummary | Nil

    # A list of NON_COMPLIANT items for the specified compliance type.
    @[JSON::Field(key: "NonCompliantSummary")]
    property non_compliant_summary : NonCompliantSummary | Nil

    def initialize(
      @compliance_type : String | Nil = nil,
      @compliant_summary : CompliantSummary | Nil = nil,
      @non_compliant_summary : NonCompliantSummary | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @compliance_type
        raise Core::ValidationError.new("ComplianceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ComplianceType length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("ComplianceType does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9_\\-]\\w+|Custom:[a-zA-Z0-9_\\-]\\w+$"))
      end

      if value = @compliant_summary
        value.validate!
      end

      if value = @non_compliant_summary
        value.validate!
      end
    end

    def_equals_and_hash(@compliance_type, @compliant_summary, @non_compliant_summary)
  end
end
