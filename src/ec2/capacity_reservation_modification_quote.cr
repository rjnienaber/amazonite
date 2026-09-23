private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Capacity Reservation modification quote, which provides the terms for changing the
  # start date or the commitment of a future-dated Capacity Reservation.
  class CapacityReservationModificationQuote
    # The ID of the modification quote.
    property capacity_reservation_modification_quote_id : String | Nil

    # The ID of the Capacity Reservation associated with the modification quote.
    property capacity_reservation_id : String | Nil

    # The date and time at which the modification quote was created.
    property create_time : Time | Nil

    # The date and time at which the modification quote expires.
    property expiration_time : Time | Nil

    # The state of the modification quote itself. Possible values are:
    #
    # - `active` - The quote can still be used.
    #
    # - `expired` - The quote can no longer be used. A quote becomes `expired` at its
    # `expirationTime`.
    property quote_state : CapacityReservationModificationQuoteState | Nil

    # The configuration that the Capacity Reservation has at the time the quote was generated.
    property current_configuration : ModificationQuoteCurrentConfiguration | Nil

    # The terms of the modification, including the configuration that the Capacity Reservation will
    # have if you accept them by using `ModifyCapacityReservation`.
    property modification_terms : ModificationTerms | Nil

    # The tags assigned to the modification quote.
    property tags : Array(Tag) | Nil

    def initialize(
      @capacity_reservation_modification_quote_id : String | Nil = nil,
      @capacity_reservation_id : String | Nil = nil,
      @create_time : Time | Nil = nil,
      @expiration_time : Time | Nil = nil,
      @quote_state : CapacityReservationModificationQuoteState | Nil = nil,
      @current_configuration : ModificationQuoteCurrentConfiguration | Nil = nil,
      @modification_terms : ModificationTerms | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_modification_quote_id
        params << {"#{prefix}CapacityReservationModificationQuoteId", value}
      end

      if value = @capacity_reservation_id
        params << {"#{prefix}CapacityReservationId", value}
      end

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      if value = @expiration_time
        params << {"#{prefix}ExpirationTime", Core::QueryValue.time(value)}
      end

      if value = @quote_state
        params << {"#{prefix}QuoteState", value.to_json_object_key}
      end

      if value = @current_configuration
        params.concat(value.to_query_params("#{prefix}CurrentConfiguration."))
      end

      if value = @modification_terms
        params.concat(value.to_query_params("#{prefix}ModificationTerms."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_modification_quote_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationModificationQuoteId']")),
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationId']")),
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        expiration_time: Core::XMLValue.time(node.xpath_node("*[local-name()='expirationTime']")),
        quote_state: (n = node.xpath_node("*[local-name()='quoteState']")) ? AEC::CapacityReservationModificationQuoteState.from_json_object_key?(n.content) : nil,
        current_configuration: node.xpath_node("*[local-name()='currentConfiguration']").try { |n| ModificationQuoteCurrentConfiguration.from_xml(n) },
        modification_terms: node.xpath_node("*[local-name()='modificationTerms']").try { |n| ModificationTerms.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @current_configuration
        value.validate!
      end

      if value = @modification_terms
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_reservation_modification_quote_id, @capacity_reservation_id, @create_time, @expiration_time, @quote_state, @current_configuration, @modification_terms, @tags)
  end
end
