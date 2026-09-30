private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class PurchaseHostReservationRequest
    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # The currency in which the `totalUpfrontPrice`, `LimitPrice`, and `totalHourlyPrice` amounts are
    # specified. At this time, the only supported currency is `USD`.
    property currency_code : CurrencyCodeValues | Nil

    # The IDs of the Dedicated Hosts with which the reservation will be associated.
    property host_id_set : Array(String) = [] of String

    # The specified limit is checked against the total upfront cost of the reservation (calculated as
    # the offering's upfront cost multiplied by the host count). If the total upfront cost is greater
    # than the specified price limit, the request fails. This is used to ensure that the purchase does
    # not exceed the expected upfront cost of the purchase. At this time, the only supported currency
    # is `USD`. For example, to indicate a limit price of USD 100, specify 100.00.
    property limit_price : String | Nil

    # The ID of the offering.
    property offering_id : String

    # The tags to apply to the Dedicated Host Reservation during purchase.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @host_id_set : Array(String),
      @offering_id : String,
      @client_token : String | Nil = nil,
      @currency_code : CurrencyCodeValues | Nil = nil,
      @limit_price : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @currency_code
        params << {"#{prefix}CurrencyCode", value.to_json_object_key}
      end

      @host_id_set.each_with_index(1) do |item, i|
        params << {"#{prefix}HostIdSet.#{i}", item}
      end

      if value = @limit_price
        params << {"#{prefix}LimitPrice", value}
      end

      params << {"#{prefix}OfferingId", @offering_id}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        currency_code: (n = node.xpath_node("*[local-name()='CurrencyCode']")) ? AEC::CurrencyCodeValues.from_json_object_key?(n.content) : nil,
        host_id_set: node.xpath_nodes("*[local-name()='HostIdSet']/*[local-name()='item']").map { |n| n.content },
        limit_price: Core::XMLValue.string(node.xpath_node("*[local-name()='LimitPrice']")),
        offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OfferingId']")).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@client_token, @currency_code, @host_id_set, @limit_price, @offering_id, @tag_specifications)
  end
end
