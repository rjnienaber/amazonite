private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a path.
  class NetworkInsightsPath
    # The ID of the path.
    property network_insights_path_id : String | Nil

    # The Amazon Resource Name (ARN) of the path.
    property network_insights_path_arn : String | Nil

    # The time stamp when the path was created.
    property created_date : Time | Nil

    # The ID of the source.
    property source : String | Nil

    # The ID of the destination.
    property destination : String | Nil

    # The Amazon Resource Name (ARN) of the source.
    property source_arn : String | Nil

    # The Amazon Resource Name (ARN) of the destination.
    property destination_arn : String | Nil

    # The IP address of the source.
    property source_ip : String | Nil

    # The IP address of the destination.
    property destination_ip : String | Nil

    # The protocol.
    property protocol : Protocol | Nil

    # The destination port.
    property destination_port : Int32 | Nil

    # The tags associated with the path.
    property tags : Array(Tag) | Nil

    # Scopes the analysis to network paths that match specific filters at the source.
    property filter_at_source : PathFilter | Nil

    # Scopes the analysis to network paths that match specific filters at the destination.
    property filter_at_destination : PathFilter | Nil

    def initialize(
      @network_insights_path_id : String | Nil = nil,
      @network_insights_path_arn : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @source : String | Nil = nil,
      @destination : String | Nil = nil,
      @source_arn : String | Nil = nil,
      @destination_arn : String | Nil = nil,
      @source_ip : String | Nil = nil,
      @destination_ip : String | Nil = nil,
      @protocol : Protocol | Nil = nil,
      @destination_port : Int32 | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @filter_at_source : PathFilter | Nil = nil,
      @filter_at_destination : PathFilter | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_insights_path_id
        params << {"#{prefix}NetworkInsightsPathId", value}
      end

      if value = @network_insights_path_arn
        params << {"#{prefix}NetworkInsightsPathArn", value}
      end

      if value = @created_date
        params << {"#{prefix}CreatedDate", Core::QueryValue.time(value)}
      end

      if value = @source
        params << {"#{prefix}Source", value}
      end

      if value = @destination
        params << {"#{prefix}Destination", value}
      end

      if value = @source_arn
        params << {"#{prefix}SourceArn", value}
      end

      if value = @destination_arn
        params << {"#{prefix}DestinationArn", value}
      end

      if value = @source_ip
        params << {"#{prefix}SourceIp", value}
      end

      if value = @destination_ip
        params << {"#{prefix}DestinationIp", value}
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value.to_json_object_key}
      end

      if value = @destination_port
        params << {"#{prefix}DestinationPort", value.to_s}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

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
        network_insights_path_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsPathId']")),
        network_insights_path_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsPathArn']")),
        created_date: Core::XMLValue.time(node.xpath_node("*[local-name()='createdDate']")),
        source: Core::XMLValue.string(node.xpath_node("*[local-name()='source']")),
        destination: Core::XMLValue.string(node.xpath_node("*[local-name()='destination']")),
        source_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceArn']")),
        destination_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationArn']")),
        source_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceIp']")),
        destination_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationIp']")),
        protocol: (n = node.xpath_node("*[local-name()='protocol']")) ? AEC::Protocol.from_json_object_key?(n.content) : nil,
        destination_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='destinationPort']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        filter_at_source: node.xpath_node("*[local-name()='filterAtSource']").try { |n| PathFilter.from_xml(n) },
        filter_at_destination: node.xpath_node("*[local-name()='filterAtDestination']").try { |n| PathFilter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @network_insights_path_arn
        raise Core::ValidationError.new("NetworkInsightsPathArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NetworkInsightsPathArn length must be <= 1283") if value.size > 1283
      end

      if value = @source_arn
        raise Core::ValidationError.new("SourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SourceArn length must be <= 1283") if value.size > 1283
      end

      if value = @destination_arn
        raise Core::ValidationError.new("DestinationArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DestinationArn length must be <= 1283") if value.size > 1283
      end

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

      if value = @tags
        value.each(&.validate!)
      end

      if value = @filter_at_source
        value.validate!
      end

      if value = @filter_at_destination
        value.validate!
      end
    end

    def_equals_and_hash(@network_insights_path_id, @network_insights_path_arn, @created_date, @source, @destination, @source_arn, @destination_arn, @source_ip, @destination_ip, @protocol, @destination_port, @tags, @filter_at_source, @filter_at_destination)
  end
end
