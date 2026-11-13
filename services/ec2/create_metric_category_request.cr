private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateMetricCategoryRequest
    # The names of the metrics to include in the metric category.
    #
    # Specify each metric by its Amazon CloudWatch metric name or its OpenTelemetry metric name. The
    # two names for a measurement are separate entries, and you can include both.
    #
    # In Regions where Amazon CloudWatch OpenTelemetry metrics aren't available, you can't specify
    # OpenTelemetry metric names.
    property metrics : Array(String) = [] of String

    # The tags to apply to the metric category during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensure
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @metrics : Array(String),
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @metrics.each_with_index(1) do |item, i|
        params << {"#{prefix}Metric.#{i}", item}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metrics: node.xpath_nodes("*[local-name()='Metric']/*[local-name()='item']").map { |n| n.content },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@metrics, @tag_specifications, @client_token, @dry_run)
  end
end
