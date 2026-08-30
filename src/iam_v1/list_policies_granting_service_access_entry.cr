private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains details about the permissions policies that are attached to the specified identity
  # (user, group, or role).
  #
  # This data type is used as a response element in the
  # [ListPoliciesGrantingServiceAccess](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPoliciesGrantingServiceAccess.html)
  # operation.
  class ListPoliciesGrantingServiceAccessEntry
    # The namespace of the service that was accessed.
    #
    # To learn the service namespace of a service, see [Actions, resources, and condition keys for
    # Amazon Web Services
    # services](https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html)
    # in the *Service Authorization Reference*. Choose the name of the service to view details for
    # that service. In the first paragraph, find the service prefix. For example, `(service prefix:
    # a4b)`. For more information about service namespaces, see [Amazon Web Services service
    # namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
    # in the *Amazon Web Services General Reference*.
    property service_namespace : String | Nil

    # The `PoliciesGrantingServiceAccess` object that contains details about the policy.
    property policies : Array(PolicyGrantingServiceAccess) | Nil

    def initialize(
      @service_namespace : String | Nil = nil,
      @policies : Array(PolicyGrantingServiceAccess) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @service_namespace
        params << {"#{prefix}ServiceNamespace", value}
      end

      (@policies || [] of PolicyGrantingServiceAccess).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Policies.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_namespace: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceNamespace']")),
        policies: node.xpath_nodes("*[local-name()='Policies']/*[local-name()='member']").map { |n| PolicyGrantingServiceAccess.from_xml(n) },
      )
    end
  end
end
