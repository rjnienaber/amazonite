private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateMacSystemIntegrityProtectionModificationTaskRequest
    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the Amazon EC2 Mac instance.
    property instance_id : String

    # **[Apple silicon Mac instances only]** Specifies the following credentials:
    #
    # - **Internal disk administrative user**
    #
    # - **Username** - Only the default administrative user (`aws-managed-user`) is supported and it
    # is used by default. You can't specify a different administrative user.
    #
    # - **Password** - If you did not change the default password for `aws-managed-user`, specify the
    # default password, which is *blank*. Otherwise, specify your password.
    #
    # - **Amazon EBS root volume administrative user**
    #
    # - **Username** - If you did not change the default administrative user, specify `ec2-user`.
    # Otherwise, specify the username for your administrative user.
    #
    # - **Password** - Specify the password for the administrative user.
    #
    # The credentials must be specified in the following JSON format:
    #
    # `{ "internalDiskPassword":"*internal-disk-admin_password*",
    # "rootVolumeUsername":"*root-volume-admin_username*",
    # "rootVolumepassword":"*root-volume-admin_password*" }`
    property mac_credentials : String | Nil

    # Specifies the overrides to selectively enable or disable individual SIP settings. The individual
    # settings you specify here override the overall SIP status you specify for
    # **MacSystemIntegrityProtectionStatus**.
    property mac_system_integrity_protection_configuration : MacSystemIntegrityProtectionConfigurationRequest | Nil

    # Specifies the overall SIP status for the instance. To enable all SIP settings, specify
    # `enabled`. To disable all SIP settings, specify `disabled`.
    property mac_system_integrity_protection_status : MacSystemIntegrityProtectionSettingStatus

    # Specifies tags to apply to the SIP modification task.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @instance_id : String,
      @mac_system_integrity_protection_status : MacSystemIntegrityProtectionSettingStatus,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @mac_credentials : String | Nil = nil,
      @mac_system_integrity_protection_configuration : MacSystemIntegrityProtectionConfigurationRequest | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}InstanceId", @instance_id}

      if value = @mac_credentials
        params << {"#{prefix}MacCredentials", value}
      end

      if value = @mac_system_integrity_protection_configuration
        params.concat(value.to_query_params("#{prefix}MacSystemIntegrityProtectionConfiguration."))
      end

      params << {"#{prefix}MacSystemIntegrityProtectionStatus", @mac_system_integrity_protection_status.to_json_object_key}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        mac_credentials: Core::XMLValue.string(node.xpath_node("*[local-name()='MacCredentials']")),
        mac_system_integrity_protection_configuration: node.xpath_node("*[local-name()='MacSystemIntegrityProtectionConfiguration']").try { |n| MacSystemIntegrityProtectionConfigurationRequest.from_xml(n) },
        mac_system_integrity_protection_status: ((n = node.xpath_node("*[local-name()='MacSystemIntegrityProtectionStatus']")) ? AEC::MacSystemIntegrityProtectionSettingStatus.from_json_object_key?(n.content) : nil).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @mac_system_integrity_protection_configuration
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@client_token, @dry_run, @instance_id, @mac_credentials, @mac_system_integrity_protection_configuration, @mac_system_integrity_protection_status, @tag_specifications)
  end
end
