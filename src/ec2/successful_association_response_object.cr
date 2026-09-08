private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a successful application status check association.
  class SuccessfulAssociationResponseObject
    # The ID of the application status check.
    property application_status_check_id : String | Nil

    # The type of association. Valid values: `EC2TAG` and `INSTANCE_ID`.
    property association_type : String | Nil

    # The association value. For `EC2TAG`, the value is formatted as `key=value`. For `INSTANCE_ID`,
    # the value is the instance ID.
    property association_value : String | Nil

    def initialize(
      @application_status_check_id : String | Nil = nil,
      @association_type : String | Nil = nil,
      @association_value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @application_status_check_id
        params << {"#{prefix}ApplicationStatusCheckId", value}
      end

      if value = @association_type
        params << {"#{prefix}AssociationType", value}
      end

      if value = @association_value
        params << {"#{prefix}AssociationValue", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        application_status_check_id: Core::XMLValue.string(node.xpath_node("*[local-name()='applicationStatusCheckId']")),
        association_type: Core::XMLValue.string(node.xpath_node("*[local-name()='associationType']")),
        association_value: Core::XMLValue.string(node.xpath_node("*[local-name()='associationValue']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@application_status_check_id, @association_type, @association_value)
  end
end
