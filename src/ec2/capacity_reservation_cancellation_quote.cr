private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Capacity Reservation cancellation quote, which provides the cancellation terms for
  # cancelling a future-dated Capacity Reservation during its commitment duration.
  class CapacityReservationCancellationQuote
    # The ID of the cancellation quote.
    property capacity_reservation_cancellation_quote_id : String | Nil

    # The ID of the Capacity Reservation associated with the cancellation quote.
    property capacity_reservation_id : String | Nil

    # The date and time at which the cancellation quote was created.
    property create_time : Time | Nil

    # The date and time at which the cancellation quote expires.
    property expiration_time : Time | Nil

    # The state of the cancellation quote. Possible values include `pending`, `active`, and `expired`.
    property quote_state : CapacityReservationCancellationQuoteState | Nil

    # The current configuration of the Capacity Reservation.
    property current_configuration : CapacityReservationConfiguration | Nil

    # The cancellation terms associated with the quote, including the fee type and charge details.
    property cancellation_terms : Array(CancellationTerms) | Nil

    # The tags assigned to the cancellation quote.
    property tags : Array(Tag) | Nil

    def initialize(
      @capacity_reservation_cancellation_quote_id : String | Nil = nil,
      @capacity_reservation_id : String | Nil = nil,
      @create_time : Time | Nil = nil,
      @expiration_time : Time | Nil = nil,
      @quote_state : CapacityReservationCancellationQuoteState | Nil = nil,
      @current_configuration : CapacityReservationConfiguration | Nil = nil,
      @cancellation_terms : Array(CancellationTerms) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_cancellation_quote_id
        params << {"#{prefix}CapacityReservationCancellationQuoteId", value}
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

      (@cancellation_terms || [] of CancellationTerms).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CancellationTermSet.#{i}."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_cancellation_quote_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationCancellationQuoteId']")),
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationId']")),
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        expiration_time: Core::XMLValue.time(node.xpath_node("*[local-name()='expirationTime']")),
        quote_state: (n = node.xpath_node("*[local-name()='quoteState']")) ? AEC::CapacityReservationCancellationQuoteState.from_json_object_key?(n.content) : nil,
        current_configuration: node.xpath_node("*[local-name()='currentConfiguration']").try { |n| CapacityReservationConfiguration.from_xml(n) },
        cancellation_terms: node.xpath_nodes("*[local-name()='cancellationTermSet']/*[local-name()='item']").map { |n| CancellationTerms.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @current_configuration
        value.validate!
      end

      if value = @cancellation_terms
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_reservation_cancellation_quote_id, @capacity_reservation_id, @create_time, @expiration_time, @quote_state, @current_configuration, @cancellation_terms, @tags)
  end
end
