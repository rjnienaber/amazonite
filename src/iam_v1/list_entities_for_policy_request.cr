private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListEntitiesForPolicyRequest
    # The Amazon Resource Name (ARN) of the IAM policy for which you want the versions.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property policy_arn : String

    # The entity type to use for filtering the results.
    #
    # For example, when `EntityFilter` is `Role`, only the roles that are attached to the specified
    # policy are returned. This parameter is optional. If it is not included, all attached entities
    # (users, groups, and roles) are returned. The argument for this parameter must be one of the
    # valid values listed below.
    property entity_filter : EntityType | Nil

    # The path prefix for filtering the results. This parameter is optional. If it is not included, it
    # defaults to a slash (/), listing all entities.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of either a forward slash (/) by itself or a string that must begin and
    # end with forward slashes. In addition, it can contain any ASCII character from the ! (`\u0021`)
    # through the DEL character (`\u007F`), including most punctuation characters, digits, and upper
    # and lowercased letters.
    property path_prefix : String | Nil

    # The policy usage method to use for filtering the results.
    #
    # To list only permissions policies, set `PolicyUsageFilter` to `PermissionsPolicy`. To list only
    # the policies used to set permissions boundaries, set the value to `PermissionsBoundary`.
    #
    # This parameter is optional. If it is not included, all policies are returned.
    property policy_usage_filter : PolicyUsageType | Nil

    # Use this parameter only when paginating results and only after you receive a response indicating
    # that the results are truncated. Set it to the value of the `Marker` element in the response that
    # you received to indicate where the next call should start.
    property marker : String | Nil

    # Use this only when paginating results to indicate the maximum number of items you want in the
    # response. If additional items exist beyond the maximum you specify, the `IsTruncated` response
    # element is `true`.
    #
    # If you do not include this parameter, the number of items defaults to 100. Note that IAM might
    # return fewer results, even when there are more results available. In that case, the
    # `IsTruncated` response element returns `true`, and `Marker` contains a value to include in the
    # subsequent call that tells the service where to continue from.
    property max_items : Int32 | Nil

    def initialize(
      @policy_arn : String,
      @entity_filter : EntityType | Nil = nil,
      @path_prefix : String | Nil = nil,
      @policy_usage_filter : PolicyUsageType | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyArn", @policy_arn}

      if value = @entity_filter
        params << {"#{prefix}EntityFilter", value.to_json_object_key}
      end

      if value = @path_prefix
        params << {"#{prefix}PathPrefix", value}
      end

      if value = @policy_usage_filter
        params << {"#{prefix}PolicyUsageFilter", value.to_json_object_key}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      if value = @max_items
        params << {"#{prefix}MaxItems", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")).not_nil!,
        entity_filter: (n = node.xpath_node("*[local-name()='EntityFilter']")) ? AI::EntityType.from_json_object_key?(n.content) : nil,
        path_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='PathPrefix']")),
        policy_usage_filter: (n = node.xpath_node("*[local-name()='PolicyUsageFilter']")) ? AI::PolicyUsageType.from_json_object_key?(n.content) : nil,
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
      )
    end

    def validate! : Nil
      if value = @policy_arn
        raise Core::ValidationError.new("PolicyArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("PolicyArn length must be <= 2048") if value.size > 2048
      end

      if value = @path_prefix
        raise Core::ValidationError.new("PathPrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PathPrefix length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("PathPrefix does not match the required pattern") unless value.matches?(Regex.new("^(/)|(/[!-~]+/)$"))
      end

      if value = @marker
        raise Core::ValidationError.new("Marker length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Marker length must be <= 320") if value.size > 320
        raise Core::ValidationError.new("Marker does not match the required pattern") unless value.matches?(Regex.new("^[ -ÿ]+$"))
      end

      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxItems value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@policy_arn, @entity_filter, @path_prefix, @policy_usage_filter, @marker, @max_items)
  end
end
