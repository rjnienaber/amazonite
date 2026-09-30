private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a transit gateway policy table.
  class TransitGatewayPolicyTable
    # The ID of the transit gateway policy table.
    property transit_gateway_policy_table_id : String | Nil

    # The ID of the transit gateway.
    property transit_gateway_id : String | Nil

    # The state of the transit gateway policy table
    property state : TransitGatewayPolicyTableState | Nil

    # The timestamp when the transit gateway policy table was created.
    property creation_time : Time | Nil

    # he key-value pairs associated with the transit gateway policy table.
    property tags : Array(Tag) | Nil

    def initialize(
      @transit_gateway_policy_table_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @state : TransitGatewayPolicyTableState | Nil = nil,
      @creation_time : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_policy_table_id
        params << {"#{prefix}TransitGatewayPolicyTableId", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_policy_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayPolicyTableId']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayPolicyTableState.from_json_object_key?(n.content) : nil,
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_policy_table_id, @transit_gateway_id, @state, @creation_time, @tags)
  end
end
