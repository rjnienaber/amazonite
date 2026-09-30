private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @activation_id
        raise Core::ValidationError.new("ActivationId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 256") if value.size > 256
      end

      if value = @default_instance_name
        raise Core::ValidationError.new("DefaultInstanceName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("DefaultInstanceName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("DefaultInstanceName does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$"))
      end

      if value = @iam_role
        raise Core::ValidationError.new("IamRole length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("IamRole length must be <= 64") if value.size > 64
      end

      if value = @registration_limit
        raise Core::ValidationError.new("RegistrationLimit value must be >= 1") if value < 1
        raise Core::ValidationError.new("RegistrationLimit value must be <= 1000") if value > 1000
      end

      if value = @registrations_count
        raise Core::ValidationError.new("RegistrationsCount value must be >= 1") if value < 1
        raise Core::ValidationError.new("RegistrationsCount value must be <= 1000") if value > 1000
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 1000 item(s)") if value.size > 1000
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@activation_id, @description, @default_instance_name, @iam_role, @registration_limit, @registrations_count, @expiration_date, @expired, @created_date, @tags)
  end
end
