private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVerifiedAccessEndpointRequest
    # The ID of the Verified Access group to associate the endpoint with.
    property verified_access_group_id : String

    # The type of Verified Access endpoint to create.
    property endpoint_type : VerifiedAccessEndpointType

    # The type of attachment.
    property attachment_type : VerifiedAccessEndpointAttachmentType

    # The ARN of the public TLS/SSL certificate in Amazon Web Services Certificate Manager to
    # associate with the endpoint. The CN in the certificate must match the DNS name your end users
    # will use to reach your application.
    property domain_certificate_arn : String | Nil

    # The DNS name for users to reach your application.
    property application_domain : String | Nil

    # A custom identifier that is prepended to the DNS name that is generated for the endpoint.
    property endpoint_domain_prefix : String | Nil

    # The IDs of the security groups to associate with the Verified Access endpoint. Required if
    # `AttachmentType` is set to `vpc`.
    property security_group_ids : Array(String) | Nil

    # The load balancer details. This parameter is required if the endpoint type is `load-balancer`.
    property load_balancer_options : CreateVerifiedAccessEndpointLoadBalancerOptions | Nil

    # The network interface details. This parameter is required if the endpoint type is
    # `network-interface`.
    property network_interface_options : CreateVerifiedAccessEndpointEniOptions | Nil

    # A description for the Verified Access endpoint.
    property description : String | Nil

    # The Verified Access policy document.
    property policy_document : String | Nil

    # The tags to assign to the Verified Access endpoint.
    property tag_specifications : Array(TagSpecification) | Nil

    # A unique, case-sensitive token that you provide to ensure idempotency of your modification
    # request. For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The options for server side encryption.
    property sse_specification : VerifiedAccessSseSpecificationRequest | Nil

    # The RDS details. This parameter is required if the endpoint type is `rds`.
    property rds_options : CreateVerifiedAccessEndpointRdsOptions | Nil

    # The CIDR options. This parameter is required if the endpoint type is `cidr`.
    property cidr_options : CreateVerifiedAccessEndpointCidrOptions | Nil

    def initialize(
      @verified_access_group_id : String,
      @endpoint_type : VerifiedAccessEndpointType,
      @attachment_type : VerifiedAccessEndpointAttachmentType,
      @domain_certificate_arn : String | Nil = nil,
      @application_domain : String | Nil = nil,
      @endpoint_domain_prefix : String | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @load_balancer_options : CreateVerifiedAccessEndpointLoadBalancerOptions | Nil = nil,
      @network_interface_options : CreateVerifiedAccessEndpointEniOptions | Nil = nil,
      @description : String | Nil = nil,
      @policy_document : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @sse_specification : VerifiedAccessSseSpecificationRequest | Nil = nil,
      @rds_options : CreateVerifiedAccessEndpointRdsOptions | Nil = nil,
      @cidr_options : CreateVerifiedAccessEndpointCidrOptions | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VerifiedAccessGroupId", @verified_access_group_id}

      params << {"#{prefix}EndpointType", @endpoint_type.to_json_object_key}

      params << {"#{prefix}AttachmentType", @attachment_type.to_json_object_key}

      if value = @domain_certificate_arn
        params << {"#{prefix}DomainCertificateArn", value}
      end

      if value = @application_domain
        params << {"#{prefix}ApplicationDomain", value}
      end

      if value = @endpoint_domain_prefix
        params << {"#{prefix}EndpointDomainPrefix", value}
      end

      (@security_group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupId.#{i}", item}
      end

      if value = @load_balancer_options
        params.concat(value.to_query_params("#{prefix}LoadBalancerOptions."))
      end

      if value = @network_interface_options
        params.concat(value.to_query_params("#{prefix}NetworkInterfaceOptions."))
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @policy_document
        params << {"#{prefix}PolicyDocument", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @sse_specification
        params.concat(value.to_query_params("#{prefix}SseSpecification."))
      end

      if value = @rds_options
        params.concat(value.to_query_params("#{prefix}RdsOptions."))
      end

      if value = @cidr_options
        params.concat(value.to_query_params("#{prefix}CidrOptions."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VerifiedAccessGroupId']")).not_nil!,
        endpoint_type: ((n = node.xpath_node("*[local-name()='EndpointType']")) ? AEC::VerifiedAccessEndpointType.from_json_object_key?(n.content) : nil).not_nil!,
        attachment_type: ((n = node.xpath_node("*[local-name()='AttachmentType']")) ? AEC::VerifiedAccessEndpointAttachmentType.from_json_object_key?(n.content) : nil).not_nil!,
        domain_certificate_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='DomainCertificateArn']")),
        application_domain: Core::XMLValue.string(node.xpath_node("*[local-name()='ApplicationDomain']")),
        endpoint_domain_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='EndpointDomainPrefix']")),
        security_group_ids: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='item']").map { |n| n.content },
        load_balancer_options: node.xpath_node("*[local-name()='LoadBalancerOptions']").try { |n| CreateVerifiedAccessEndpointLoadBalancerOptions.from_xml(n) },
        network_interface_options: node.xpath_node("*[local-name()='NetworkInterfaceOptions']").try { |n| CreateVerifiedAccessEndpointEniOptions.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyDocument']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        sse_specification: node.xpath_node("*[local-name()='SseSpecification']").try { |n| VerifiedAccessSseSpecificationRequest.from_xml(n) },
        rds_options: node.xpath_node("*[local-name()='RdsOptions']").try { |n| CreateVerifiedAccessEndpointRdsOptions.from_xml(n) },
        cidr_options: node.xpath_node("*[local-name()='CidrOptions']").try { |n| CreateVerifiedAccessEndpointCidrOptions.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @load_balancer_options
        value.validate!
      end

      if value = @network_interface_options
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @sse_specification
        value.validate!
      end

      if value = @rds_options
        value.validate!
      end

      if value = @cidr_options
        value.validate!
      end
    end

    def_equals_and_hash(@verified_access_group_id, @endpoint_type, @attachment_type, @domain_certificate_arn, @application_domain, @endpoint_domain_prefix, @security_group_ids, @load_balancer_options, @network_interface_options, @description, @policy_document, @tag_specifications, @client_token, @dry_run, @sse_specification, @rds_options, @cidr_options)
  end
end
