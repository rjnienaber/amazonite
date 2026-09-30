private alias Core = Amazonite::Core

module Amazonite::EC2
  class ImportSnapshotRequest
    # The client-specific data.
    property client_data : ClientData | Nil

    # Token to enable idempotency for VM import requests.
    property client_token : String | Nil

    # The description string for the import snapshot task.
    property description : String | Nil

    # Information about the disk container.
    property disk_container : SnapshotDiskContainer | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Specifies whether the destination snapshot of the imported image should be encrypted. The
    # default KMS key for EBS is used unless you specify a non-default KMS key using `KmsKeyId`. For
    # more information, see [Amazon EBS
    # Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) in the
    # *Amazon Elastic Compute Cloud User Guide*.
    property encrypted : Bool | Nil

    # An identifier for the symmetric KMS key to use when creating the encrypted snapshot. This
    # parameter is only required if you want to use a non-default KMS key; if this parameter is not
    # specified, the default KMS key for EBS is used. If a `KmsKeyId` is specified, the `Encrypted`
    # flag must also be set.
    #
    # The KMS key identifier may be provided in any of the following formats:
    #
    # - Key ID
    #
    # - Key alias
    #
    # - ARN using key ID. The ID ARN contains the `arn:aws:kms` namespace, followed by the Region of
    # the key, the Amazon Web Services account ID of the key owner, the `key` namespace, and then the
    # key ID. For example,
    # arn:aws:kms:*us-east-1*:*012345678910*:key/*abcd1234-a123-456a-a12b-a123b4cd56ef*.
    #
    # - ARN using key alias. The alias ARN contains the `arn:aws:kms` namespace, followed by the
    # Region of the key, the Amazon Web Services account ID of the key owner, the `alias` namespace,
    # and then the key alias. For example,
    # arn:aws:kms:*us-east-1*:*012345678910*:alias/*ExampleAlias*.
    #
    # Amazon Web Services parses `KmsKeyId` asynchronously, meaning that the action you call may
    # appear to complete even though you provided an invalid identifier. This action will eventually
    # report failure.
    #
    # The specified KMS key must exist in the Region that the snapshot is being copied to.
    #
    # Amazon EBS does not support asymmetric KMS keys.
    property kms_key_id : String | Nil

    # The name of the role to use when not using the default role, 'vmimport'.
    property role_name : String | Nil

    # The tags to apply to the import snapshot task during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @client_data : ClientData | Nil = nil,
      @client_token : String | Nil = nil,
      @description : String | Nil = nil,
      @disk_container : SnapshotDiskContainer | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @encrypted : Bool | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @role_name : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_data
        params.concat(value.to_query_params("#{prefix}ClientData."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @disk_container
        params.concat(value.to_query_params("#{prefix}DiskContainer."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @kms_key_id
        params << {"#{prefix}KmsKeyId", value}
      end

      if value = @role_name
        params << {"#{prefix}RoleName", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_data: node.xpath_node("*[local-name()='ClientData']").try { |n| ClientData.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        disk_container: node.xpath_node("*[local-name()='DiskContainer']").try { |n| SnapshotDiskContainer.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='Encrypted']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KmsKeyId']")),
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @client_data
        value.validate!
      end

      if value = @disk_container
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@client_data, @client_token, @description, @disk_container, @dry_run, @encrypted, @kms_key_id, @role_name, @tag_specifications)
  end
end
