private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # For extensions that are modules, a public third-party extension that must be activated in your
  # account in order for the module itself to be activated.
  #
  # For more information, see [Requirements for activating third-party public
  # modules](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/module-versioning.html#requirements-for-modules)
  # in the *CloudFormation User Guide*.
  class RequiredActivatedType
    # An alias assigned to the public extension, in this account and Region. If you specify an alias
    # for the extension, CloudFormation treats the alias as the extension type name within this
    # account and Region. You must use the alias to refer to the extension in your templates, API
    # calls, and CloudFormation console.
    property type_name_alias : String | Nil

    # The type name of the public extension.
    #
    # If you specified a `TypeNameAlias` when enabling the extension in this account and Region,
    # CloudFormation treats that alias as the extension's type name within the account and Region, not
    # the type name of the public extension. For more information, see [Use aliases to refer to
    # extensions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-alias)
    # in the *CloudFormation User Guide*.
    property original_type_name : String | Nil

    # The publisher ID of the extension publisher.
    property publisher_id : String | Nil

    # A list of the major versions of the extension type that the macro supports.
    property supported_major_versions : Array(Int32) | Nil

    def initialize(
      @type_name_alias : String | Nil = nil,
      @original_type_name : String | Nil = nil,
      @publisher_id : String | Nil = nil,
      @supported_major_versions : Array(Int32) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type_name_alias
        params << {"#{prefix}TypeNameAlias", value}
      end

      if value = @original_type_name
        params << {"#{prefix}OriginalTypeName", value}
      end

      if value = @publisher_id
        params << {"#{prefix}PublisherId", value}
      end

      (@supported_major_versions || [] of Int32).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedMajorVersions.member.#{i}", item.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type_name_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeNameAlias']")),
        original_type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='OriginalTypeName']")),
        publisher_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherId']")),
        supported_major_versions: node.xpath_nodes("*[local-name()='SupportedMajorVersions']/*[local-name()='member']").map { |n| n.content.to_i32 },
      )
    end
  end
end
