private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes a payer responsibility setting for a VPC endpoint.
  class PayerResponsibilityEntry
    # The scope of usage/charges.
    property scope : PayerResponsibilityScope | Nil

    # The Amazon Web Services account to which the usage is charged.
    property payer_responsibility_type : PayerResponsibilityType | Nil

    def initialize(
      @scope : PayerResponsibilityScope | Nil = nil,
      @payer_responsibility_type : PayerResponsibilityType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @scope
        params << {"#{prefix}Scope", value.to_json_object_key}
      end

      if value = @payer_responsibility_type
        params << {"#{prefix}PayerResponsibilityType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        scope: (n = node.xpath_node("*[local-name()='scope']")) ? AEC::PayerResponsibilityScope.from_json_object_key?(n.content) : nil,
        payer_responsibility_type: (n = node.xpath_node("*[local-name()='payerResponsibilityType']")) ? AEC::PayerResponsibilityType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@scope, @payer_responsibility_type)
  end
end
