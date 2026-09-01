private alias Core = Amazonite::Core

module Amazonite::Iam
  class ListPoliciesGrantingServiceAccessRequest
    # Use this parameter only when paginating results and only after you receive a response indicating
    # that the results are truncated. Set it to the value of the `Marker` element in the response that
    # you received to indicate where the next call should start.
    property marker : String | Nil

    # The ARN of the IAM identity (user, group, or role) whose policies you want to list.
    property arn : String

    # The service namespace for the Amazon Web Services services whose policies you want to list.
    #
    # To learn the service namespace for a service, see [Actions, resources, and condition keys for
    # Amazon Web Services
    # services](https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html)
    # in the *IAM User Guide*. Choose the name of the service to view details for that service. In the
    # first paragraph, find the service prefix. For example, `(service prefix: a4b)`. For more
    # information about service namespaces, see [Amazon Web Services service
    # namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
    # in the *Amazon Web Services General Reference*.
    property service_namespaces : Array(String) = [] of String

    def initialize(
      @arn : String,
      @service_namespaces : Array(String),
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      params << {"#{prefix}Arn", @arn}

      @service_namespaces.each_with_index(1) do |item, i|
        params << {"#{prefix}ServiceNamespaces.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        service_namespaces: node.xpath_nodes("*[local-name()='ServiceNamespaces']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @marker
        raise Core::ValidationError.new("Marker length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Marker length must be <= 320") if value.size > 320
        raise Core::ValidationError.new("Marker does not match the required pattern") unless value.matches?(Regex.new("^[ -ÿ]+$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
      end

      if value = @service_namespaces
        raise Core::ValidationError.new("ServiceNamespaces must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ServiceNamespaces must have at most 200 item(s)") if value.size > 200
      end
    end

    def_equals_and_hash(@marker, @arn, @service_namespaces)
  end
end
