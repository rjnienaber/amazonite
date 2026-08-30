private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about an IAM user entity.
  #
  # This data type is used as a response element in the following operations:
  #
  # - [CreateUser](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateUser.html)
  #
  # - [GetUser](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUser.html)
  #
  # - [ListUsers](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListUsers.html)
  class User
    # The path to the user. For more information about paths, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    #
    # The ARN of the policy used to set the permissions boundary for the user.
    property path : String

    # The friendly name identifying the user.
    property user_name : String

    # The stable and unique string identifying the user. For more information about IDs, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property user_id : String

    # The Amazon Resource Name (ARN) that identifies the user. For more information about ARNs and how
    # to use ARNs in policies, see [IAM
    # Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property arn : String

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the user
    # was created.
    property create_date : Time

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the
    # user's password was last used to sign in to an Amazon Web Services website. For a list of Amazon
    # Web Services websites that capture a user's last sign-in time, see the [Credential
    # reports](https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html) topic in the
    # *IAM User Guide*. If a password is used more than once in a five-minute span, only the first use
    # is returned in this field. If the field is null (no value), then it indicates that they never
    # signed in with a password. This can be because:
    #
    # - The user never had a password.
    #
    # - A password exists but has not been used since IAM started tracking this information on October
    # 20, 2014.
    #
    # A null value does not mean that the user *never* had a password. Also, if the user does not
    # currently have a password but had one in the past, then this field contains the date and time
    # the most recent password was used.
    #
    # This value is returned only in the
    # [GetUser](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUser.html) and
    # [ListUsers](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListUsers.html) operations.
    property password_last_used : Time | Nil

    # For more information about permissions boundaries, see [Permissions boundaries for IAM
    # identities ](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
    # in the *IAM User Guide*.
    property permissions_boundary : AttachedPermissionsBoundary | Nil

    # A list of tags that are associated with the user. For more information about tagging, see
    # [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the
    # *IAM User Guide*.
    property tags : Array(Tag) | Nil

    def initialize(
      @path : String,
      @user_name : String,
      @user_id : String,
      @arn : String,
      @create_date : Time,
      @password_last_used : Time | Nil = nil,
      @permissions_boundary : AttachedPermissionsBoundary | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Path", @path}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}UserId", @user_id}

      params << {"#{prefix}Arn", @arn}

      params << {"#{prefix}CreateDate", Core::QueryValue.time(@create_date)}

      if value = @password_last_used
        params << {"#{prefix}PasswordLastUsed", Core::QueryValue.time(value)}
      end

      if value = @permissions_boundary
        params.concat(value.to_query_params("#{prefix}PermissionsBoundary."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")).not_nil!,
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UserId']")).not_nil!,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")).not_nil!,
        password_last_used: Core::XMLValue.time(node.xpath_node("*[local-name()='PasswordLastUsed']")),
        permissions_boundary: node.xpath_node("*[local-name()='PermissionsBoundary']").try { |n| AttachedPermissionsBoundary.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @path
        raise Core::ValidationError.new("Path length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Path length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Path does not match the required pattern") unless value.matches?(Regex.new("^(\\u002F)|(\\u002F[\\u0021-\\u007E]+\\u002F)$"))
      end

      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @user_id
        raise Core::ValidationError.new("UserId length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("UserId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("UserId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
      end

      if value = @permissions_boundary
        value.validate!
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@path, @user_name, @user_id, @arn, @create_date, @password_last_used, @permissions_boundary, @tags)
  end
end
