private alias Core = Amazonite::Core

module Amazonite::ElastiCacheV1
  class ReservedCacheNode
    property reserved_cache_node_id : String | Nil
    property reserved_cache_nodes_offering_id : String | Nil
    property cache_node_type : String | Nil
    property start_time : Time | Nil
    property duration : Int32 | Nil
    property fixed_price : Float64 | Nil
    property usage_price : Float64 | Nil
    property cache_node_count : Int32 | Nil
    property product_description : String | Nil
    property offering_type : String | Nil
    property state : String | Nil
    property recurring_charges : Array(RecurringCharge) | Nil
    property reservation_arn : String | Nil

    def initialize(
      @reserved_cache_node_id : String | Nil = nil,
      @reserved_cache_nodes_offering_id : String | Nil = nil,
      @cache_node_type : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @duration : Int32 | Nil = nil,
      @fixed_price : Float64 | Nil = nil,
      @usage_price : Float64 | Nil = nil,
      @cache_node_count : Int32 | Nil = nil,
      @product_description : String | Nil = nil,
      @offering_type : String | Nil = nil,
      @state : String | Nil = nil,
      @recurring_charges : Array(RecurringCharge) | Nil = nil,
      @reservation_arn : String | Nil = nil
    )
    end

    def initialize(node : XML::Node)
      recurring_charges = [] of RecurringCharge
      node.children.each do |n|
        case n.name
        when "ReservedCacheNodeId"          then @reserved_cache_node_id = n.children[0].to_s
        when "ReservedCacheNodesOfferingId" then @reserved_cache_nodes_offering_id = n.children[0].to_s
        when "CacheNodeType"                then @cache_node_type = n.children[0].to_s
        when "StartTime"                    then @start_time = Core::StringUtils.to_time(n.children[0].to_s)
        when "Duration"                     then @duration = Int32.new(n.children[0].to_s)
        when "FixedPrice"                   then @fixed_price = Float64.new(n.children[0].to_s)
        when "UsagePrice"                   then @usage_price = Float64.new(n.children[0].to_s)
        when "CacheNodeCount"               then @cache_node_count = Int32.new(n.children[0].to_s)
        when "ProductDescription"           then @product_description = n.children[0].to_s
        when "OfferingType"                 then @offering_type = n.children[0].to_s
        when "State"                        then @state = n.children[0].to_s
        when "RecurringCharge"              then recurring_charges << RecurringCharge.new(n)
        when "ReservationARN"               then @reservation_arn = n.children[0].to_s
        end
      end

      @recurring_charges = recurring_charges unless recurring_charges.empty?
    end
  end
end
