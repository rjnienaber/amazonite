private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeHostReservationOfferingsRequest
    # The filters.
    #
    # - `instance-family` - The instance family of the offering (for example, `m4`).
    #
    # - `payment-option` - The payment option (`NoUpfront` | `PartialUpfront` | `AllUpfront`).
    property filter : Array(Filter) | Nil

    # This is the maximum duration of the reservation to purchase, specified in seconds. Reservations
    # are available in one-year and three-year terms. The number of seconds specified must be the
    # number of seconds in a year (365x24x60x60) times one of the supported durations (1 or 3). For
    # example, specify 94608000 for three years.
    property max_duration : Int32 | Nil

    # The maximum number of results to return for the request in a single page. The remaining results
    # can be seen by sending another request with the returned `nextToken` value. This value can be
    # between 5 and 500. If `maxResults` is given a larger value than 500, you receive an error.
    property max_results : Int32 | Nil

    # This is the minimum duration of the reservation you'd like to purchase, specified in seconds.
    # Reservations are available in one-year and three-year terms. The number of seconds specified
    # must be the number of seconds in a year (365x24x60x60) times one of the supported durations (1
    # or 3). For example, specify 31536000 for one year.
    property min_duration : Int32 | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    # The ID of the reservation offering.
    property offering_id : String | Nil

    def initialize(
      @filter : Array(Filter) | Nil = nil,
      @max_duration : Int32 | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @min_duration : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @offering_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@filter || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @max_duration
        params << {"#{prefix}MaxDuration", value.to_s}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @min_duration
        params << {"#{prefix}MinDuration", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @offering_id
        params << {"#{prefix}OfferingId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        filter: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxDuration']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        min_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='MinDuration']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OfferingId']")),
      )
    end

    def validate! : Nil
      if value = @filter
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 500") if value > 500
      end
    end

    def_equals_and_hash(@filter, @max_duration, @max_results, @min_duration, @next_token, @offering_id)
  end
end
