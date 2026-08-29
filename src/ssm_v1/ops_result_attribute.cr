module Amazonite::SsmV1
  # The OpsItem data type to return.
  class OpsResultAttribute
    include JSON::Serializable

    # Name of the data type. Valid value: `AWS:OpsItem`, `AWS:EC2InstanceInformation`,
    # `AWS:OpsItemTrendline`, or `AWS:ComplianceSummary`.
    @[JSON::Field(key: "TypeName")]
    property type_name : String

    def initialize(
      @type_name : String,
    )
    end
  end
end
