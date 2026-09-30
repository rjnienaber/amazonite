private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the response to a successful
  # [ListInstanceProfiles](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListInstanceProfiles.html)
  # request.
  class ListInstanceProfilesResponse
    # A list of instance profiles.
    property instance_profiles : Array(InstanceProfile) = [] of InstanceProfile

    # A flag that indicates whether there are more items to return. If your results were truncated,
    # you can make a subsequent pagination request using the `Marker` request parameter to retrieve
    # more items. Note that IAM might return fewer than the `MaxItems` number of results even when
    # there are more results available. We recommend that you check `IsTruncated` after every call to
    # ensure that you receive all your results.
    property is_truncated : Bool | Nil

    # When `IsTruncated` is `true`, this element is present and contains the value to use for the
    # `Marker` parameter in a subsequent pagination request.
    property marker : String | Nil

    def initialize(
      @instance_profiles : Array(InstanceProfile),
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @instance_profiles.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceProfiles.member.#{i}."))
      end

      if value = @is_truncated
        params << {"#{prefix}IsTruncated", Core::QueryValue.bool(value)}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_profiles: node.xpath_nodes("*[local-name()='InstanceProfiles']/*[local-name()='member']").map { |n| InstanceProfile.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end

    def validate! : Nil
      if value = @instance_profiles
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_profiles, @is_truncated, @marker)
  end
end
