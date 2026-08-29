private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains details about the most recent attempt to access the service.
  #
  # This data type is used as a response element in the
  # [GetServiceLastAccessedDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetails.html)
  # operation.
  class ServiceLastAccessed
    # The name of the service in which access was attempted.
    property service_name : String

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when an
    # authenticated entity most recently attempted to access the service. Amazon Web Services does not
    # report unauthenticated requests.
    #
    # This field is null if no IAM entities attempted to access the service within the [tracking
    # period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
    property last_authenticated : Time | Nil

    # The namespace of the service in which access was attempted.
    #
    # To learn the service namespace of a service, see [Actions, resources, and condition keys for
    # Amazon Web Services
    # services](https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html)
    # in the *Service Authorization Reference*. Choose the name of the service to view details for
    # that service. In the first paragraph, find the service prefix. For example, `(service prefix:
    # a4b)`. For more information about service namespaces, see [Amazon Web Services Service
    # Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
    # in the *Amazon Web Services General Reference*.
    property service_namespace : String

    # The ARN of the authenticated entity (user or role) that last attempted to access the service.
    # Amazon Web Services does not report unauthenticated requests.
    #
    # This field is null if no IAM entities attempted to access the service within the [tracking
    # period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
    property last_authenticated_entity : String | Nil

    # The Region from which the authenticated entity (user or role) last attempted to access the
    # service. Amazon Web Services does not report unauthenticated requests.
    #
    # This field is null if no IAM entities attempted to access the service within the [tracking
    # period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
    property last_authenticated_region : String | Nil

    # The total number of authenticated principals (root user, IAM users, or IAM roles) that have
    # attempted to access the service.
    #
    # This field is null if no principals attempted to access the service within the [tracking
    # period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
    property total_authenticated_entities : Int32 | Nil

    # An object that contains details about the most recent attempt to access a tracked action within
    # the service.
    #
    # This field is null if there no tracked actions or if the principal did not use the tracked
    # actions within the [tracking
    # period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
    # This field is also null if the report was generated at the service level and not the action
    # level. For more information, see the `Granularity` field in
    # [GenerateServiceLastAccessedDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GenerateServiceLastAccessedDetails.html).
    property tracked_actions_last_accessed : Array(TrackedActionLastAccessed) | Nil

    def initialize(
      @service_name : String,
      @service_namespace : String,
      @last_authenticated : Time | Nil = nil,
      @last_authenticated_entity : String | Nil = nil,
      @last_authenticated_region : String | Nil = nil,
      @total_authenticated_entities : Int32 | Nil = nil,
      @tracked_actions_last_accessed : Array(TrackedActionLastAccessed) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ServiceName", @service_name}

      if value = @last_authenticated
        params << {"#{prefix}LastAuthenticated", Core::QueryValue.time(value)}
      end

      params << {"#{prefix}ServiceNamespace", @service_namespace}

      if value = @last_authenticated_entity
        params << {"#{prefix}LastAuthenticatedEntity", value}
      end

      if value = @last_authenticated_region
        params << {"#{prefix}LastAuthenticatedRegion", value}
      end

      if value = @total_authenticated_entities
        params << {"#{prefix}TotalAuthenticatedEntities", value.to_s}
      end

      (@tracked_actions_last_accessed || [] of TrackedActionLastAccessed).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TrackedActionsLastAccessed.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceName']")).not_nil!,
        last_authenticated: Core::XMLValue.time(node.xpath_node("*[local-name()='LastAuthenticated']")),
        service_namespace: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceNamespace']")).not_nil!,
        last_authenticated_entity: Core::XMLValue.string(node.xpath_node("*[local-name()='LastAuthenticatedEntity']")),
        last_authenticated_region: Core::XMLValue.string(node.xpath_node("*[local-name()='LastAuthenticatedRegion']")),
        total_authenticated_entities: Core::XMLValue.i32(node.xpath_node("*[local-name()='TotalAuthenticatedEntities']")),
        tracked_actions_last_accessed: node.xpath_nodes("*[local-name()='TrackedActionsLastAccessed']/*[local-name()='member']").map { |n| TrackedActionLastAccessed.from_xml(n) },
      )
    end
  end
end
