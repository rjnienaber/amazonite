private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class AddPermissionInput
    # The ARN of the topic whose access control policy you wish to modify.
    property topic_arn : String

    # A unique identifier for the new policy statement.
    property label : String

    # The Amazon Web Services account IDs of the users (principals) who will be given access to the
    # specified actions. The users must have Amazon Web Services account, but do not need to be signed
    # up for this service.
    property aws_account_id : Array(String) = [] of String

    # The action you want to allow for the specified principal(s).
    #
    # Valid values: Any Amazon SNS action name, for example `Publish`.
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

    def validate! : Nil
    end

    def_equals_and_hash(@topic_arn, @label, @aws_account_id, @action_name)
  end
end
