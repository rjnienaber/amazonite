module Amazonite::SsmV1
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

    def_equals_and_hash(@type_name)
  end
end
