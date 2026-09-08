private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateNetworkInsightsPathRequest
    # The IP address of the source.
    property source_ip : String | Nil

    # The IP address of the destination.
    property destination_ip : String | Nil

    # The ID or ARN of the source. If the resource is in another account, you must specify an ARN.
    property source : String

    # The ID or ARN of the destination. If the resource is in another account, you must specify an
    # ARN.
    property destination : String | Nil

    # The protocol.
    property protocol : Protocol

    # The destination port.
    property destination_port : Int32 | Nil

    # The tags to add to the path.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [How to ensure
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String

    # Scopes the analysis to network paths that match specific filters at the source. If you specify
    # this parameter, you can't specify the parameters for the source IP address or the destination
    # port.
    property filter_at_source : PathRequestFilter | Nil

    # Scopes the analysis to network paths that match specific filters at the destination. If you
    # specify this parameter, you can't specify the parameter for the destination IP address.
    property filter_at_destination : PathRequestFilter | Nil

    def initialize(
      @source : String,
      @protocol : Protocol,
      @client_token : String,
      @source_ip : String | Nil = nil,
      @destination_ip : String | Nil = nil,
      @destination : String | Nil = nil,
      @destination_port : Int32 | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filter_at_source : PathRequestFilter | Nil = nil,
      @filter_at_destination : PathRequestFilter | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @source_ip
        params << {"#{prefix}SourceIp", value}
      end

      if value = @destination_ip
        params << {"#{prefix}DestinationIp", value}
      end

      params << {"#{prefix}Source", @source}

      if value = @destination
        params << {"#{prefix}Destination", value}
      end

      params << {"#{prefix}Protocol", @protocol.to_json_object_key}

      if value = @destination_port
        params << {"#{prefix}DestinationPort", value.to_s}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}ClientToken", @client_token}

      if value = @filter_at_source
        params.concat(value.to_query_params("#{prefix}FilterAtSource."))
      end

      if value = @filter_at_destination
        params.concat(value.to_query_params("#{prefix}FilterAtDestination."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceIp']")),
        destination_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationIp']")),
        source: Core::XMLValue.string(node.xpath_node("*[local-name()='Source']")).not_nil!,
        destination: Core::XMLValue.string(node.xpath_node("*[local-name()='Destination']")),
        protocol: ((n = node.xpath_node("*[local-name()='Protocol']")) ? AEC::Protocol.from_json_object_key?(n.content) : nil).not_nil!,
        destination_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='DestinationPort']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")).not_nil!,
        filter_at_source: node.xpath_node("*[local-name()='FilterAtSource']").try { |n| PathRequestFilter.from_xml(n) },
        filter_at_destination: node.xpath_node("*[local-name()='FilterAtDestination']").try { |n| PathRequestFilter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @source_ip
        raise Core::ValidationError.new("SourceIp length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SourceIp length must be <= 15") if value.size > 15
        raise Core::ValidationError.new("SourceIp does not match the required pattern") unless value.matches?(Regex.new("^([0-9]{1,3}.){3}[0-9]{1,3}$"))
      end

      if value = @destination_ip
        raise Core::ValidationError.new("DestinationIp length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("DestinationIp length must be <= 15") if value.size > 15
        raise Core::ValidationError.new("DestinationIp does not match the required pattern") unless value.matches?(Regex.new("^([0-9]{1,3}.){3}[0-9]{1,3}$"))
      end

      if value = @destination_port
        raise Core::ValidationError.new("DestinationPort value must be >= 0") if value < 0
        raise Core::ValidationError.new("DestinationPort value must be <= 65535") if value > 65535
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @filter_at_source
        value.validate!
      end

      if value = @filter_at_destination
        value.validate!
      end
    end

    def_equals_and_hash(@source_ip, @destination_ip, @source, @destination, @protocol, @destination_port, @tag_specifications, @dry_run, @client_token, @filter_at_source, @filter_at_destination)
  end
end
