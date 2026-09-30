private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # An Amazon Web Services Verified Access endpoint specifies the application that Amazon Web
  # Services Verified Access provides access to. It must be attached to an Amazon Web Services
  # Verified Access group. An Amazon Web Services Verified Access endpoint must also have an
  # attached access policy before you attached it to a group.
  class VerifiedAccessEndpoint
    # The ID of the Amazon Web Services Verified Access instance.
    property verified_access_instance_id : String | Nil

    # The ID of the Amazon Web Services Verified Access group.
    property verified_access_group_id : String | Nil

    # The ID of the Amazon Web Services Verified Access endpoint.
    property verified_access_endpoint_id : String | Nil

    # The DNS name for users to reach your application.
    property application_domain : String | Nil

    # The type of Amazon Web Services Verified Access endpoint. Incoming application requests will be
    # sent to an IP address, load balancer or a network interface depending on the endpoint type
    # specified.
    property endpoint_type : VerifiedAccessEndpointType | Nil

    # The type of attachment used to provide connectivity between the Amazon Web Services Verified
    # Access endpoint and the application.
    property attachment_type : VerifiedAccessEndpointAttachmentType | Nil

    # The ARN of a public TLS/SSL certificate imported into or created with ACM.
    property domain_certificate_arn : String | Nil

    # A DNS name that is generated for the endpoint.
    property endpoint_domain : String | Nil

    # Returned if endpoint has a device trust provider attached.
    property device_validation_domain : String | Nil

    # The IDs of the security groups for the endpoint.
    property security_group_ids : Array(String) | Nil

    # The load balancer details if creating the Amazon Web Services Verified Access endpoint as
    # `load-balancer`type.
    property load_balancer_options : VerifiedAccessEndpointLoadBalancerOptions | Nil

    # The options for network-interface type endpoint.
    property network_interface_options : VerifiedAccessEndpointEniOptions | Nil

    # The endpoint status.
    property status : VerifiedAccessEndpointStatus | Nil

    # A description for the Amazon Web Services Verified Access endpoint.
    property description : String | Nil

    # The creation time.
    property creation_time : String | Nil

    # The last updated time.
    property last_updated_time : String | Nil

    # The deletion time.
    property deletion_time : String | Nil

    # The tags.
    property tags : Array(Tag) | Nil

    # The options in use for server side encryption.
    property sse_specification : VerifiedAccessSseSpecificationResponse | Nil

    # The options for an RDS endpoint.
    property rds_options : VerifiedAccessEndpointRdsOptions | Nil

    # The options for a CIDR endpoint.
    property cidr_options : VerifiedAccessEndpointCidrOptions | Nil

    def initialize(
      @verified_access_instance_id : String | Nil = nil,
      @verified_access_group_id : String | Nil = nil,
      @verified_access_endpoint_id : String | Nil = nil,
      @application_domain : String | Nil = nil,
      @endpoint_type : VerifiedAccessEndpointType | Nil = nil,
      @attachment_type : VerifiedAccessEndpointAttachmentType | Nil = nil,
      @domain_certificate_arn : String | Nil = nil,
      @endpoint_domain : String | Nil = nil,
      @device_validation_domain : String | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @load_balancer_options : VerifiedAccessEndpointLoadBalancerOptions | Nil = nil,
      @network_interface_options : VerifiedAccessEndpointEniOptions | Nil = nil,
      @status : VerifiedAccessEndpointStatus | Nil = nil,
      @description : String | Nil = nil,
      @creation_time : String | Nil = nil,
      @last_updated_time : String | Nil = nil,
      @deletion_time : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @sse_specification : VerifiedAccessSseSpecificationResponse | Nil = nil,
      @rds_options : VerifiedAccessEndpointRdsOptions | Nil = nil,
      @cidr_options : VerifiedAccessEndpointCidrOptions | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @verified_access_instance_id
        params << {"#{prefix}VerifiedAccessInstanceId", value}
      end

      if value = @verified_access_group_id
        params << {"#{prefix}VerifiedAccessGroupId", value}
      end

      if value = @verified_access_endpoint_id
        params << {"#{prefix}VerifiedAccessEndpointId", value}
      end

      if value = @application_domain
        params << {"#{prefix}ApplicationDomain", value}
      end

      if value = @endpoint_type
        params << {"#{prefix}EndpointType", value.to_json_object_key}
      end

      if value = @attachment_type
        params << {"#{prefix}AttachmentType", value.to_json_object_key}
      end

      if value = @domain_certificate_arn
        params << {"#{prefix}DomainCertificateArn", value}
      end

      if value = @endpoint_domain
        params << {"#{prefix}EndpointDomain", value}
      end

      if value = @device_validation_domain
        params << {"#{prefix}DeviceValidationDomain", value}
      end

      (@security_group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupIdSet.#{i}", item}
      end

      if value = @load_balancer_options
        params.concat(value.to_query_params("#{prefix}LoadBalancerOptions."))
      end

      if value = @network_interface_options
        params.concat(value.to_query_params("#{prefix}NetworkInterfaceOptions."))
      end

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", value}
      end

      if value = @last_updated_time
        params << {"#{prefix}LastUpdatedTime", value}
      end

      if value = @deletion_time
        params << {"#{prefix}DeletionTime", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
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
        verified_access_instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='verifiedAccessInstanceId']")),
        verified_access_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='verifiedAccessGroupId']")),
        verified_access_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='verifiedAccessEndpointId']")),
        application_domain: Core::XMLValue.string(node.xpath_node("*[local-name()='applicationDomain']")),
        endpoint_type: (n = node.xpath_node("*[local-name()='endpointType']")) ? AEC::VerifiedAccessEndpointType.from_json_object_key?(n.content) : nil,
        attachment_type: (n = node.xpath_node("*[local-name()='attachmentType']")) ? AEC::VerifiedAccessEndpointAttachmentType.from_json_object_key?(n.content) : nil,
        domain_certificate_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='domainCertificateArn']")),
        endpoint_domain: Core::XMLValue.string(node.xpath_node("*[local-name()='endpointDomain']")),
        device_validation_domain: Core::XMLValue.string(node.xpath_node("*[local-name()='deviceValidationDomain']")),
        security_group_ids: node.xpath_nodes("*[local-name()='securityGroupIdSet']/*[local-name()='item']").map { |n| n.content },
        load_balancer_options: node.xpath_node("*[local-name()='loadBalancerOptions']").try { |n| VerifiedAccessEndpointLoadBalancerOptions.from_xml(n) },
        network_interface_options: node.xpath_node("*[local-name()='networkInterfaceOptions']").try { |n| VerifiedAccessEndpointEniOptions.from_xml(n) },
        status: node.xpath_node("*[local-name()='status']").try { |n| VerifiedAccessEndpointStatus.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        creation_time: Core::XMLValue.string(node.xpath_node("*[local-name()='creationTime']")),
        last_updated_time: Core::XMLValue.string(node.xpath_node("*[local-name()='lastUpdatedTime']")),
        deletion_time: Core::XMLValue.string(node.xpath_node("*[local-name()='deletionTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        sse_specification: node.xpath_node("*[local-name()='sseSpecification']").try { |n| VerifiedAccessSseSpecificationResponse.from_xml(n) },
        rds_options: node.xpath_node("*[local-name()='rdsOptions']").try { |n| VerifiedAccessEndpointRdsOptions.from_xml(n) },
        cidr_options: node.xpath_node("*[local-name()='cidrOptions']").try { |n| VerifiedAccessEndpointCidrOptions.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @load_balancer_options
        value.validate!
      end

      if value = @network_interface_options
        value.validate!
      end

      if value = @status
        value.validate!
      end

      if value = @tags
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

    def_equals_and_hash(@verified_access_instance_id, @verified_access_group_id, @verified_access_endpoint_id, @application_domain, @endpoint_type, @attachment_type, @domain_certificate_arn, @endpoint_domain, @device_validation_domain, @security_group_ids, @load_balancer_options, @network_interface_options, @status, @description, @creation_time, @last_updated_time, @deletion_time, @tags, @sse_specification, @rds_options, @cidr_options)
  end
end
