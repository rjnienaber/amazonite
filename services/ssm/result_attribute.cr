private alias Core = Amazonite::Core

module Amazonite::Ssm
  # The inventory item result attribute.
  class ResultAttribute
    include JSON::Serializable

    # Name of the inventory item type. Valid value: `AWS:InstanceInformation`. Default Value:
    # `AWS:InstanceInformation`.
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
