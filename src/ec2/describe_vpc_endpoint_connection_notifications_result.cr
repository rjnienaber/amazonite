private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEndpointConnectionNotificationsResult
    # The notifications.
    property connection_notification_set : Array(ConnectionNotification) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @connection_notification_set : Array(ConnectionNotification) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@connection_notification_set || [] of ConnectionNotification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ConnectionNotificationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        connection_notification_set: node.xpath_nodes("*[local-name()='connectionNotificationSet']/*[local-name()='item']").map { |n| ConnectionNotification.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @connection_notification_set
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@connection_notification_set, @next_token)
  end
end
