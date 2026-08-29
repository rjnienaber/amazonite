private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class AddPermissionInput
    property topic_arn : String

    property label : String

    property aws_account_id : Array(String) = [] of String

    property action_name : Array(String) = [] of String

    def initialize(
      @topic_arn : String,
      @label : String,
      @aws_account_id : Array(String),
      @action_name : Array(String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TopicArn", @topic_arn}

      params << {"#{prefix}Label", @label}

      @aws_account_id.each_with_index(1) do |item, i|
        params << {"#{prefix}AWSAccountId.member.#{i}", item}
      end

      @action_name.each_with_index(1) do |item, i|
        params << {"#{prefix}ActionName.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        topic_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TopicArn']")).not_nil!,
        label: Core::XMLValue.string(node.xpath_node("*[local-name()='Label']")).not_nil!,
        aws_account_id: node.xpath_nodes("*[local-name()='AWSAccountId']/*[local-name()='member']").map { |n| n.content },
        action_name: node.xpath_nodes("*[local-name()='ActionName']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
