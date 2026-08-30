module Amazonite::CloudFormationV1
  # A filter that is used to specify which resource types to scan.
  class ScanFilter
    # An array of strings where each string represents an Amazon Web Services resource type you want
    # to scan. Each string defines the resource type using the format
    # `AWS::ServiceName::ResourceType`, for example, `AWS::DynamoDB::Table`. For the full list of
    # supported resource types, see the [Resource type
    # support](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html)
    # table in the *CloudFormation User Guide*.
    #
    # To scan all resource types within a service, you can use a wildcard, represented by an asterisk
    # (`*`). You can place an asterisk at only the end of the string, for example, `AWS::S3::*`.
    property types : Array(String) | Nil

    def initialize(
      @types : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Types.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        types: node.xpath_nodes("*[local-name()='Types']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def_equals_and_hash(@types)
  end
end
