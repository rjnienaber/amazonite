private alias Core = Amazonite::Core

module Amazonite::StsV1
  class GetFederationTokenRequest
    # The name of the federated user. The name is used as an identifier for the temporary security
    # credentials (such as `Bob`). For example, you can reference the federated user name in a
    # resource-based policy, such as in an Amazon S3 bucket policy.
    #
    # The regex used to validate this parameter is a string of characters consisting of upper- and
    # lower-case alphanumeric characters with no spaces. You can also include underscores or any of
    # the following characters: =,.@-
    property name : String

    # An IAM policy in JSON format that you want to use as an inline session policy.
    #
    # You must pass an inline or managed [session
    # policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
    # to this operation. You can pass a single JSON policy document to use as an inline session
    # policy. You can also specify up to 10 managed policy Amazon Resource Names (ARNs) to use as
    # managed session policies.
    #
    # This parameter is optional. However, if you do not pass any session policies, then the resulting
    # federated user session has no permissions.
    #
    # When you pass session policies, the session permissions are the intersection of the IAM user
    # policies and the session policies that you pass. This gives you a way to further restrict the
    # permissions for a federated user. You cannot use session policies to grant more permissions than
    # those that are defined in the permissions policy of the IAM user. For more information, see
    # [Session
    # Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
    # in the *IAM User Guide*.
    #
    # The resulting credentials can be used to access a resource that has a resource-based policy. If
    # that policy specifically references the federated user session in the `Principal` element of the
    # policy, the session has the permissions allowed by the policy. These permissions are granted in
    # addition to the permissions that are granted by the session policies.
    #
    # The plaintext that you use for both inline and managed session policies can't exceed 2,048
    # characters. The JSON policy characters can be any ASCII character from the space character to
    # the end of the valid character list (\u0020 through \u00FF). It can also include the tab
    # (\u0009), linefeed (\u000A), and carriage return (\u000D) characters.
    #
    # An Amazon Web Services conversion compresses the passed inline session policy, managed policy
    # ARNs, and session tags into a packed binary format that has a separate limit. Your request can
    # fail for this limit even if your plaintext meets the other requirements. The `PackedPolicySize`
    # response element indicates by percentage how close the policies and tags for your request are to
    # the upper size limit.
    property policy : String | Nil

    # The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as a managed
    # session policy. The policies must exist in the same account as the IAM user that is requesting
    # federated access.
    #
    # You must pass an inline or managed [session
    # policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
    # to this operation. You can pass a single JSON policy document to use as an inline session
    # policy. You can also specify up to 10 managed policy Amazon Resource Names (ARNs) to use as
    # managed session policies. The plaintext that you use for both inline and managed session
    # policies can't exceed 2,048 characters. You can provide up to 10 managed policy ARNs. For more
    # information about ARNs, see [Amazon Resource Names (ARNs) and Amazon Web Services Service
    # Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # Amazon Web Services General Reference.
    #
    # This parameter is optional. However, if you do not pass any session policies, then the resulting
    # federated user session has no permissions.
    #
    # When you pass session policies, the session permissions are the intersection of the IAM user
    # policies and the session policies that you pass. This gives you a way to further restrict the
    # permissions for a federated user. You cannot use session policies to grant more permissions than
    # those that are defined in the permissions policy of the IAM user. For more information, see
    # [Session
    # Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
    # in the *IAM User Guide*.
    #
    # The resulting credentials can be used to access a resource that has a resource-based policy. If
    # that policy specifically references the federated user session in the `Principal` element of the
    # policy, the session has the permissions allowed by the policy. These permissions are granted in
    # addition to the permissions that are granted by the session policies.
    #
    # An Amazon Web Services conversion compresses the passed inline session policy, managed policy
    # ARNs, and session tags into a packed binary format that has a separate limit. Your request can
    # fail for this limit even if your plaintext meets the other requirements. The `PackedPolicySize`
    # response element indicates by percentage how close the policies and tags for your request are to
    # the upper size limit.
    property policy_arns : Array(PolicyDescriptorType) | Nil

    # The duration, in seconds, that the session should last. Acceptable durations for federation
    # sessions range from 900 seconds (15 minutes) to 129,600 seconds (36 hours), with 43,200 seconds
    # (12 hours) as the default. Sessions obtained using root user credentials are restricted to a
    # maximum of 3,600 seconds (one hour). If the specified duration is longer than one hour, the
    # session obtained by using root user credentials defaults to one hour.
    property duration_seconds : Int32 | Nil

    # A list of session tags. Each session tag consists of a key name and an associated value. For
    # more information about session tags, see [Passing Session Tags in
    # STS](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html) in the *IAM User
    # Guide*.
    #
    # This parameter is optional. You can pass up to 50 session tags. The plaintext session tag keys
    # can’t exceed 128 characters and the values can’t exceed 256 characters. For these and additional
    # limits, see [IAM and STS Character
    # Limits](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length)
    # in the *IAM User Guide*.
    #
    # An Amazon Web Services conversion compresses the passed inline session policy, managed policy
    # ARNs, and session tags into a packed binary format that has a separate limit. Your request can
    # fail for this limit even if your plaintext meets the other requirements. The `PackedPolicySize`
    # response element indicates by percentage how close the policies and tags for your request are to
    # the upper size limit.
    #
    # You can pass a session tag with the same key as a tag that is already attached to the user you
    # are federating. When you do, session tags override a user tag with the same key.
    #
    # Tag key–value pairs are not case sensitive, but case is preserved. This means that you cannot
    # have separate `Department` and `department` tag keys. Assume that the role has the
    # `Department`=`Marketing` tag and you pass the `department`=`engineering` session tag.
    # `Department` and `department` are not saved as separate tags, and the session tag passed in the
    # request takes precedence over the role tag.
    property tags : Array(Tag) | Nil

    def initialize(
      @name : String,
      @policy : String | Nil = nil,
      @policy_arns : Array(PolicyDescriptorType) | Nil = nil,
      @duration_seconds : Int32 | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Name", @name}

      if value = @policy
        params << {"#{prefix}Policy", value}
      end

      (@policy_arns || [] of PolicyDescriptorType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PolicyArns.member.#{i}."))
      end

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")).not_nil!,
        policy: Core::XMLValue.string(node.xpath_node("*[local-name()='Policy']")),
        policy_arns: node.xpath_nodes("*[local-name()='PolicyArns']/*[local-name()='member']").map { |n| PolicyDescriptorType.from_xml(n) },
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 2") if value.size < 2
        raise Core::ValidationError.new("Name length must be <= 32") if value.size > 32
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]*$"))
      end

      if value = @policy
        raise Core::ValidationError.new("Policy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Policy length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Policy does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end

      if value = @policy_arns
        value.each(&.validate!)
      end

      if value = @duration_seconds
        raise Core::ValidationError.new("DurationSeconds value must be >= 900") if value < 900
        raise Core::ValidationError.new("DurationSeconds value must be <= 129600") if value > 129600
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@name, @policy, @policy_arns, @duration_seconds, @tags)
  end
end
