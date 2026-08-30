private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TypeName length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^(AWS|Custom):.*$"))
      end
    end

    def_equals_and_hash(@type_name)
  end
end
