private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Network Access Scope.
  class NetworkInsightsAccessScope
    # The ID of the Network Access Scope.
    property network_insights_access_scope_id : String | Nil

    # The Amazon Resource Name (ARN) of the Network Access Scope.
    property network_insights_access_scope_arn : String | Nil

    # The creation date.
    property created_date : Time | Nil

    # The last updated date.
    property updated_date : Time | Nil

    # The tags.
    property tags : Array(Tag) | Nil

    def initialize(
      @network_insights_access_scope_id : String | Nil = nil,
      @network_insights_access_scope_arn : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @updated_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_insights_access_scope_id
        params << {"#{prefix}NetworkInsightsAccessScopeId", value}
      end

      if value = @network_insights_access_scope_arn
        params << {"#{prefix}NetworkInsightsAccessScopeArn", value}
      end

      if value = @created_date
        params << {"#{prefix}CreatedDate", Core::QueryValue.time(value)}
      end

      if value = @updated_date
        params << {"#{prefix}UpdatedDate", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_access_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsAccessScopeId']")),
        network_insights_access_scope_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsAccessScopeArn']")),
        created_date: Core::XMLValue.time(node.xpath_node("*[local-name()='createdDate']")),
        updated_date: Core::XMLValue.time(node.xpath_node("*[local-name()='updatedDate']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @network_insights_access_scope_arn
        raise Core::ValidationError.new("NetworkInsightsAccessScopeArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NetworkInsightsAccessScopeArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_insights_access_scope_id, @network_insights_access_scope_arn, @created_date, @updated_date, @tags)
  end
end
