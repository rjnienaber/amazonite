private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about a version of a managed policy.
  #
  # This data type is used as a response element in the
  # [CreatePolicyVersion](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicyVersion.html),
  # [GetPolicyVersion](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicyVersion.html),
  # [ListPolicyVersions](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicyVersions.html),
  # and
  # [GetAccountAuthorizationDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html)
  # operations.
  #
  # For more information about managed policies, refer to [Managed policies and inline
  # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
  # the *IAM User Guide*.
  class PolicyVersion
    # The policy document.
    #
    # The policy document is returned in the response to the
    # [GetPolicyVersion](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicyVersion.html)
    # and
    # [GetAccountAuthorizationDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html)
    # operations. It is not returned in the response to the
    # [CreatePolicyVersion](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicyVersion.html)
    # or
    # [ListPolicyVersions](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicyVersions.html)
    # operations.
    #
    # The policy document returned in this structure is URL-encoded compliant with [RFC
    # 3986](https://tools.ietf.org/html/rfc3986). You can use a URL decoding method to convert the
    # policy back to plain JSON text. For example, if you use Java, you can use the `decode` method of
    # the `java.net.URLDecoder` utility class in the Java SDK. Other languages and SDKs provide
    # similar functionality.
    property document : String | Nil

    # The identifier for the policy version.
    #
    # Policy version identifiers always begin with `v` (always lowercase). When a policy is created,
    # the first policy version is `v1`.
    property version_id : String | Nil

    # Specifies whether the policy version is set as the policy's default version.
    property is_default_version : Bool | Nil

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the
    # policy version was created.
    property create_date : Time | Nil

    def initialize(
      @document : String | Nil = nil,
      @version_id : String | Nil = nil,
      @is_default_version : Bool | Nil = nil,
      @create_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @document
        params << {"#{prefix}Document", value}
      end

      if value = @version_id
        params << {"#{prefix}VersionId", value}
      end

      if value = @is_default_version
        params << {"#{prefix}IsDefaultVersion", Core::QueryValue.bool(value)}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        document: Core::XMLValue.string(node.xpath_node("*[local-name()='Document']")),
        version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionId']")),
        is_default_version: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsDefaultVersion']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
      )
    end

    def_equals_and_hash(@document, @version_id, @is_default_version, @create_date)
  end
end
