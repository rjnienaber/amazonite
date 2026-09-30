private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetHostReservationPurchasePreviewRequest
    # The IDs of the Dedicated Hosts with which the reservation is associated.
    property host_id_set : Array(String) = [] of String

    # The offering ID of the reservation.
    property offering_id : String

    def initialize(
      @host_id_set : Array(String),
      @offering_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @host_id_set.each_with_index(1) do |item, i|
        params << {"#{prefix}HostIdSet.#{i}", item}
      end

      params << {"#{prefix}OfferingId", @offering_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        host_id_set: node.xpath_nodes("*[local-name()='HostIdSet']/*[local-name()='item']").map { |n| n.content },
        offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OfferingId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@host_id_set, @offering_id)
  end
end
