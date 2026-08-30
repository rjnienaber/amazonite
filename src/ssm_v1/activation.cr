private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # An activation registers one or more on-premises servers or virtual machines (VMs) with Amazon
  # Web Services so that you can configure those servers or VMs using Run Command. A server or VM
  # that has been registered with Amazon Web Services Systems Manager is called a managed node.
  class Activation
    include JSON::Serializable

    # The ID created by Systems Manager when you submitted the activation.
    @[JSON::Field(key: "ActivationId")]
    property activation_id : String | Nil

    # A user defined description of the activation.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # A name for the managed node when it is created.
    @[JSON::Field(key: "DefaultInstanceName")]
    property default_instance_name : String | Nil

    # The Identity and Access Management (IAM) role to assign to the managed node.
    @[JSON::Field(key: "IamRole")]
    property iam_role : String | Nil

    # The maximum number of managed nodes that can be registered using this activation.
    @[JSON::Field(key: "RegistrationLimit")]
    property registration_limit : Int32 | Nil

    # The number of managed nodes already registered with this activation.
    @[JSON::Field(key: "RegistrationsCount")]
    property registrations_count : Int32 | Nil

    # The date when this activation can no longer be used to register managed nodes.
    @[JSON::Field(key: "ExpirationDate", converter: Core::AWSEpochConverter)]
    property expiration_date : Time | Nil

    # Whether or not the activation is expired.
    @[JSON::Field(key: "Expired")]
    property expired : Bool | Nil

    # The date the activation was created.
    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # Tags assigned to the activation.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @activation_id : String | Nil = nil,
      @description : String | Nil = nil,
      @default_instance_name : String | Nil = nil,
      @iam_role : String | Nil = nil,
      @registration_limit : Int32 | Nil = nil,
      @registrations_count : Int32 | Nil = nil,
      @expiration_date : Time | Nil = nil,
      @expired : Bool | Nil = nil,
      @created_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def_equals_and_hash(@activation_id, @description, @default_instance_name, @iam_role, @registration_limit, @registrations_count, @expiration_date, @expired, @created_date, @tags)
  end
end
