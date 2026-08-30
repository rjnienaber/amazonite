private alias Core = Amazonite::Core

module Amazonite::IamV1
  # An object that contains details about when a principal in the reported Organizations entity last
  # attempted to access an Amazon Web Services service. A principal can be an IAM user, an IAM role,
  # or the Amazon Web Services account root user within the reported Organizations entity.
  #
  # This data type is a response element in the
  # [GetOrganizationsAccessReport](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOrganizationsAccessReport.html)
  # operation.
  class AccessDetail
    # The name of the service in which access was attempted.
    property service_name : String

    # The namespace of the service in which access was attempted.
    #
    # To learn the service namespace of a service, see [Actions, resources, and condition keys for
    # Amazon Web Services
    # services](https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html)
    # in the *Service Authorization Reference*. Choose the name of the service to view details for
    # that service. In the first paragraph, find the service prefix. For example, `(service prefix:
    # a4b)`. For more information about service namespaces, see [Amazon Web Services service
    # namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
    # in the *Amazon Web Services General Reference*.
    property service_namespace : String

    # The Region where the last service access attempt occurred.
    #
    # This field is null if no principals in the reported Organizations entity attempted to access the
    # service within the [tracking
    # period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
    property region : String | Nil

    # The path of the Organizations entity (root, organizational unit, or account) from which an
    # authenticated principal last attempted to access the service. Amazon Web Services does not
    # report unauthenticated requests.
    #
    # This field is null if no principals (IAM users, IAM roles, or root user) in the reported
    # Organizations entity attempted to access the service within the [tracking
    # period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
    property entity_path : String | Nil

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when an
    # authenticated principal most recently attempted to access the service. Amazon Web Services does
    # not report unauthenticated requests.
    #
    # This field is null if no principals in the reported Organizations entity attempted to access the
    # service within the [tracking
    # period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
    property last_authenticated_time : Time | Nil

    # The number of accounts with authenticated principals (root user, IAM users, and IAM roles) that
    # attempted to access the service in the tracking period.
    property total_authenticated_entities : Int32 | Nil

    def initialize(
      @service_name : String,
      @service_namespace : String,
      @region : String | Nil = nil,
      @entity_path : String | Nil = nil,
      @last_authenticated_time : Time | Nil = nil,
      @total_authenticated_entities : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ServiceName", @service_name}

      params << {"#{prefix}ServiceNamespace", @service_namespace}

      if value = @region
        params << {"#{prefix}Region", value}
      end

      if value = @entity_path
        params << {"#{prefix}EntityPath", value}
      end

      if value = @last_authenticated_time
        params << {"#{prefix}LastAuthenticatedTime", Core::QueryValue.time(value)}
      end

      if value = @total_authenticated_entities
        params << {"#{prefix}TotalAuthenticatedEntities", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceName']")).not_nil!,
        service_namespace: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceNamespace']")).not_nil!,
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='Region']")),
        entity_path: Core::XMLValue.string(node.xpath_node("*[local-name()='EntityPath']")),
        last_authenticated_time: Core::XMLValue.time(node.xpath_node("*[local-name()='LastAuthenticatedTime']")),
        total_authenticated_entities: Core::XMLValue.i32(node.xpath_node("*[local-name()='TotalAuthenticatedEntities']")),
      )
    end

    def_equals_and_hash(@service_name, @service_namespace, @region, @entity_path, @last_authenticated_time, @total_authenticated_entities)
  end
end
