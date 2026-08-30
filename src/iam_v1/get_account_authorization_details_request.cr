private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetAccountAuthorizationDetailsRequest
    # A list of entity types used to filter the results. Only the entities that match the types you
    # specify are included in the output. Use the value `LocalManagedPolicy` to include customer
    # managed policies.
    #
    # The format for this parameter is a comma-separated (if more than one) list of strings. Each
    # string value in the list must be one of the valid values listed below.
    property filter : Array(EntityType) | Nil

    # Use this only when paginating results to indicate the maximum number of items you want in the
    # response. If additional items exist beyond the maximum you specify, the `IsTruncated` response
    # element is `true`.
    #
    # If you do not include this parameter, the number of items defaults to 100. Note that IAM might
    # return fewer results, even when there are more results available. In that case, the
    # `IsTruncated` response element returns `true`, and `Marker` contains a value to include in the
    # subsequent call that tells the service where to continue from.
    property max_items : Int32 | Nil

    # Use this parameter only when paginating results and only after you receive a response indicating
    # that the results are truncated. Set it to the value of the `Marker` element in the response that
    # you received to indicate where the next call should start.
    property marker : String | Nil

    def initialize(
      @filter : Array(EntityType) | Nil = nil,
      @max_items : Int32 | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@filter || [] of EntityType).each_with_index(1) do |item, i|
        params << {"#{prefix}Filter.member.#{i}", item.to_json_object_key}
      end

      if value = @max_items
        params << {"#{prefix}MaxItems", value.to_s}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        filter: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='member']").compact_map { |n| AI::EntityType.from_json_object_key?(n.content) },
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end

    def_equals_and_hash(@filter, @max_items, @marker)
  end
end
