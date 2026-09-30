private alias Core = Amazonite::Core

module Amazonite::Ssm
  # The inventory item schema definition. Users can use this to compose inventory query filters.
  class InventoryItemSchema
    include JSON::Serializable

    # The name of the inventory type. Default inventory item type names start with Amazon Web
    # Services. Custom inventory type names will start with Custom. Default inventory item types
    # include the following: `AWS:AWSComponent`, `AWS:Application`, `AWS:InstanceInformation`,
    # `AWS:Network`, and `AWS:WindowsUpdate`.
    @[JSON::Field(key: "TypeName")]
    property type_name : String

    # The schema version for the inventory item.
    @[JSON::Field(key: "Version")]
    property version : String | Nil

    # The schema attributes for inventory. This contains data type and attribute name.
    @[JSON::Field(key: "Attributes")]
    property attributes : Array(InventoryItemAttribute) = [] of InventoryItemAttribute

    # The alias name of the inventory type. The alias name is used for display purposes.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    def initialize(
      @type_name : String,
      @attributes : Array(InventoryItemAttribute),
      @version : String | Nil = nil,
      @display_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TypeName length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^(AWS|Custom):.*$"))
      end

      if value = @version
        raise Core::ValidationError.new("Version does not match the required pattern") unless value.matches?(Regex.new("^([0-9]{1,6})(\\.[0-9]{1,6})$"))
      end

      if value = @attributes
        raise Core::ValidationError.new("Attributes must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Attributes must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@type_name, @version, @attributes, @display_name)
  end
end
