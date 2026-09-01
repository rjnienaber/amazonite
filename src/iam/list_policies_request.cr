private alias AI = Amazonite::Iam
private alias Core = Amazonite::Core

module Amazonite::Iam
  class ListPoliciesRequest
    # The scope to use for filtering the results.
    #
    # To list only Amazon Web Services managed policies, set `Scope` to `AWS`. To list only the
    # customer managed policies in your Amazon Web Services account, set `Scope` to `Local`.
    #
    # This parameter is optional. If it is not included, or if it is set to `All`, all policies are
    # returned.
    property scope : PolicyScopeType | Nil

    # A flag to filter the results to only the attached policies.
    #
    # When `OnlyAttached` is `true`, the returned list contains only the policies that are attached to
    # an IAM user, group, or role. When `OnlyAttached` is `false`, or when the parameter is not
    # included, all policies are returned.
    property only_attached : Bool | Nil

    # The path prefix for filtering the results. This parameter is optional. If it is not included, it
    # defaults to a slash (/), listing all policies. This parameter allows (through its [regex
    # pattern](http://wikipedia.org/wiki/regex)) a string of characters consisting of either a forward
    # slash (/) by itself or a string that must begin and end with forward slashes. In addition, it
    # can contain any ASCII character from the ! (`\u0021`) through the DEL character (`\u007F`),
    # including most punctuation characters, digits, and upper and lowercased letters.
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
      @scope : PolicyScopeType | Nil = nil,
      @only_attached : Bool | Nil = nil,
      @path_prefix : String | Nil = nil,
      @policy_usage_filter : PolicyUsageType | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @scope
        params << {"#{prefix}Scope", value.to_json_object_key}
      end

      if value = @only_attached
        params << {"#{prefix}OnlyAttached", Core::QueryValue.bool(value)}
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
        scope: (n = node.xpath_node("*[local-name()='Scope']")) ? AI::PolicyScopeType.from_json_object_key?(n.content) : nil,
        only_attached: Core::XMLValue.bool(node.xpath_node("*[local-name()='OnlyAttached']")),
        path_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='PathPrefix']")),
        policy_usage_filter: (n = node.xpath_node("*[local-name()='PolicyUsageFilter']")) ? AI::PolicyUsageType.from_json_object_key?(n.content) : nil,
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
      )
    end

    def validate! : Nil
      if value = @path_prefix
        raise Core::ValidationError.new("PathPrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PathPrefix length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("PathPrefix does not match the required pattern") unless value.matches?(Regex.new("^((/[A-Za-z0-9\\.,\\+@=_-]+)*)/$"))
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

    def_equals_and_hash(@scope, @only_attached, @path_prefix, @policy_usage_filter, @marker, @max_items)
  end
end
