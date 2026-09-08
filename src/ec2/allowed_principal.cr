private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a principal.
  class AllowedPrincipal
    # The type of principal.
    property principal_type : PrincipalType | Nil

    # The Amazon Resource Name (ARN) of the principal.
    property principal : String | Nil

    # The ID of the service permission.
    property service_permission_id : String | Nil

    # The tags.
    property tags : Array(Tag) | Nil

    # The ID of the service.
    property service_id : String | Nil

    def initialize(
      @principal_type : PrincipalType | Nil = nil,
      @principal : String | Nil = nil,
      @service_permission_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @service_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @principal_type
        params << {"#{prefix}PrincipalType", value.to_json_object_key}
      end

      if value = @principal
        params << {"#{prefix}Principal", value}
      end

      if value = @service_permission_id
        params << {"#{prefix}ServicePermissionId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @service_id
        params << {"#{prefix}ServiceId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        principal_type: (n = node.xpath_node("*[local-name()='principalType']")) ? AEC::PrincipalType.from_json_object_key?(n.content) : nil,
        principal: Core::XMLValue.string(node.xpath_node("*[local-name()='principal']")),
        service_permission_id: Core::XMLValue.string(node.xpath_node("*[local-name()='servicePermissionId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        service_id: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceId']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@principal_type, @principal, @service_permission_id, @tags, @service_id)
  end
end
