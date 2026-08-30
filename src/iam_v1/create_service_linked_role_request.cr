private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateServiceLinkedRoleRequest
    # The service principal for the Amazon Web Services service to which this role is attached. You
    # use a string similar to a URL but without the http:// in front. For example:
    # `elasticbeanstalk.amazonaws.com`.
    #
    # Service principals are unique and case-sensitive. To find the exact service principal for your
    # service-linked role, see [Amazon Web Services services that work with
    # IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-services-that-work-with-iam.html)
    # in the *IAM User Guide*. Look for the services that have **Yes **in the **Service-Linked Role**
    # column. Choose the **Yes** link to view the service-linked role documentation for that service.
    property aws_service_name : String

    # The description of the role.
    property description : String | Nil

    # A string that you provide, which is combined with the service-provided prefix to form the
    # complete role name. If you make multiple requests for the same service, then you must supply a
    # different `CustomSuffix` for each request. Otherwise the request fails with a duplicate role
    # name error. For example, you could add `-1` or `-debug` to the suffix.
    #
    # Some services do not support the `CustomSuffix` parameter. If you provide an optional suffix and
    # the operation fails, try the operation again without the suffix.
    property custom_suffix : String | Nil

    def initialize(
      @aws_service_name : String,
      @description : String | Nil = nil,
      @custom_suffix : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AWSServiceName", @aws_service_name}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @custom_suffix
        params << {"#{prefix}CustomSuffix", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        aws_service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='AWSServiceName']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        custom_suffix: Core::XMLValue.string(node.xpath_node("*[local-name()='CustomSuffix']")),
      )
    end

    def validate! : Nil
      if value = @aws_service_name
        raise Core::ValidationError.new("AWSServiceName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AWSServiceName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("AWSServiceName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 1000") if value.size > 1000
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new("^[\\u0009\\u000A\\u000D\\u0020-\\u007E\\u00A1-\\u00FF]*$"))
      end

      if value = @custom_suffix
        raise Core::ValidationError.new("CustomSuffix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CustomSuffix length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("CustomSuffix does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end
    end

    def_equals_and_hash(@aws_service_name, @description, @custom_suffix)
  end
end
