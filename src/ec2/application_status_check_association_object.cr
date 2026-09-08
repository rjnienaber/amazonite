private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about an application status check association. Each item in the `associationSet` of
  # a `DescribeApplicationStatusCheckAssociations` response is of this type.
  class ApplicationStatusCheckAssociationObject
    # The ID of the application status check.
    property application_status_check_id : String | Nil

    # The type of target that the application status check is associated with. Possible values:
    #
    # - `tag` – The check applies to current and future instances with a matching tag key-value pair.
    #
    # - `instance-id` – The check applies to a specific instance.
    property association_type : AssociationTypeEnum | Nil

    # The key for the association. This value is present only for tag-based associations, where it
    # contains the tag key. For instance-based associations, this value is absent.
    property key : String | Nil

    # The value for the association target. For tag-based associations, this is the tag value. For
    # instance-based associations, this is the instance ID (for example, `i-0123456789abcdef0`).
    property value : String | Nil

    def initialize(
      @application_status_check_id : String | Nil = nil,
      @association_type : AssociationTypeEnum | Nil = nil,
      @key : String | Nil = nil,
      @value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @application_status_check_id
        params << {"#{prefix}ApplicationStatusCheckId", value}
      end

      if value = @association_type
        params << {"#{prefix}AssociationType", value.to_json_object_key}
      end

      if value = @key
        params << {"#{prefix}Key", value}
      end

      if value = @value
        params << {"#{prefix}Value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        application_status_check_id: Core::XMLValue.string(node.xpath_node("*[local-name()='applicationStatusCheckId']")),
        association_type: (n = node.xpath_node("*[local-name()='associationType']")) ? AEC::AssociationTypeEnum.from_json_object_key?(n.content) : nil,
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='key']")),
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='value']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@application_status_check_id, @association_type, @key, @value)
  end
end
