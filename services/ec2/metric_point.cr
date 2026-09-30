private alias Core = Amazonite::Core

module Amazonite::EC2
  # Indicates whether the network was healthy or degraded at a particular point. The value is
  # aggregated from the `startDate` to the `endDate`. Currently only `five_minutes` is supported.
  class MetricPoint
    # The start date for the metric point. The starting date for the metric point. The starting time
    # must be formatted as `yyyy-mm-ddThh:mm:ss`. For example, `2022-06-10T12:00:00.000Z`.
    property start_date : Time | Nil

    # The end date for the metric point. The ending time must be formatted as `yyyy-mm-ddThh:mm:ss`.
    # For example, `2022-06-12T12:00:00.000Z`.
    property end_date : Time | Nil

    property value : Float32 | Nil

    # The status of the metric point.
    property status : String | Nil

    def initialize(
      @start_date : Time | Nil = nil,
      @end_date : Time | Nil = nil,
      @value : Float32 | Nil = nil,
      @status : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @start_date
        params << {"#{prefix}StartDate", Core::QueryValue.time(value)}
      end

      if value = @end_date
        params << {"#{prefix}EndDate", Core::QueryValue.time(value)}
      end

      if value = @value
        params << {"#{prefix}Value", value.to_s}
      end

      if value = @status
        params << {"#{prefix}Status", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='startDate']")),
        end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='endDate']")),
        value: Core::XMLValue.f32(node.xpath_node("*[local-name()='value']")),
        status: Core::XMLValue.string(node.xpath_node("*[local-name()='status']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@start_date, @end_date, @value, @status)
  end
end
