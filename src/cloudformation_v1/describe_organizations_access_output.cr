private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  class DescribeOrganizationsAccessOutput
    property status : OrganizationStatus | Nil

    def initialize(
      @status : OrganizationStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::OrganizationStatus.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
