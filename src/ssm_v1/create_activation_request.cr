private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class CreateActivationRequest
    include JSON::Serializable

    # A user-defined description of the resource that you want to register with Systems Manager.
    #
    # Don't enter personally identifiable information in this field.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The name of the registered, managed node as it will appear in the Amazon Web Services Systems
    # Manager console or when you use the Amazon Web Services command line tools to list Systems
    # Manager resources.
    #
    # Don't enter personally identifiable information in this field.
    @[JSON::Field(key: "DefaultInstanceName")]
    property default_instance_name : String | Nil

    # The name of the Identity and Access Management (IAM) role that you want to assign to the managed
    # node. This IAM role must provide AssumeRole permissions for the Amazon Web Services Systems
    # Manager service principal `ssm.amazonaws.com`. For more information, see [Create the IAM service
    # role required for Systems Manager in a hybrid and multicloud
    # environments](https://docs.aws.amazon.com/systems-manager/latest/userguide/hybrid-multicloud-service-role.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    #
    # You can't specify an IAM service-linked role for this parameter. You must create a unique role.
    @[JSON::Field(key: "IamRole")]
    property iam_role : String

    # Specify the maximum number of managed nodes you want to register. The default value is `1`.
    @[JSON::Field(key: "RegistrationLimit")]
    property registration_limit : Int32 | Nil

    # The date by which this activation request should expire, in timestamp format, such as
    # "2024-07-07T00:00:00". You can specify a date up to 30 days in advance. If you don't provide an
    # expiration date, the activation code expires in 24 hours.
    @[JSON::Field(key: "ExpirationDate", converter: Core::AWSEpochConverter)]
    property expiration_date : Time | Nil

    # Optional metadata that you assign to a resource. Tags enable you to categorize a resource in
    # different ways, such as by purpose, owner, or environment. For example, you might want to tag an
    # activation to identify which servers or virtual machines (VMs) in your on-premises environment
    # you intend to activate. In this case, you could specify the following key-value pairs:
    #
    # - `Key=OS,Value=Windows`
    #
    # - `Key=Environment,Value=Production`
    #
    # When you install SSM Agent on your on-premises servers and VMs, you specify an activation ID and
    # code. When you specify the activation ID and code, tags assigned to the activation are
    # automatically applied to the on-premises servers or VMs.
    #
    # You can't add tags to or delete tags from an existing activation. You can tag your on-premises
    # servers, edge devices, and VMs after they connect to Systems Manager for the first time and are
    # assigned a managed node ID. This means they are listed in the Amazon Web Services Systems
    # Manager console with an ID that is prefixed with "mi-". For information about how to add tags to
    # your managed nodes, see AddTagsToResource. For information about how to remove tags from your
    # managed nodes, see RemoveTagsFromResource.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # Reserved for internal use.
    @[JSON::Field(key: "RegistrationMetadata")]
    property registration_metadata : Array(RegistrationMetadataItem) | Nil

    def initialize(
      @iam_role : String,
      @description : String | Nil = nil,
      @default_instance_name : String | Nil = nil,
      @registration_limit : Int32 | Nil = nil,
      @expiration_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @registration_metadata : Array(RegistrationMetadataItem) | Nil = nil,
    )
    end
  end
end
