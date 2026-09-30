private alias Core = Amazonite::Core

module Amazonite::EC2
  # The configuration and status of an image usage report.
  class ImageUsageReport
    # The ID of the image that was specified when the report was created.
    property image_id : String | Nil

    # The ID of the report.
    property report_id : String | Nil

    # The resource types that were specified when the report was created.
    property resource_types : Array(ImageUsageResourceType) | Nil

    # The IDs of the Amazon Web Services accounts that were specified when the report was created.
    property account_ids : Array(String) | Nil

    # The current state of the report. Possible values:
    #
    # - `available` - The report is available to view.
    #
    # - `pending` - The report is being created and not available to view.
    #
    # - `error` - The report could not be created.
    property state : String | Nil

    # Provides additional details when the report is in an `error` state.
    property state_reason : String | Nil

    # The date and time when the report was created.
    property creation_time : Time | Nil

    # The date and time when Amazon EC2 will delete the report (30 days after the report was created).
    property expiration_time : Time | Nil

    # Any tags assigned to the report.
    property tags : Array(Tag) | Nil

    def initialize(
      @image_id : String | Nil = nil,
      @report_id : String | Nil = nil,
      @resource_types : Array(ImageUsageResourceType) | Nil = nil,
      @account_ids : Array(String) | Nil = nil,
      @state : String | Nil = nil,
      @state_reason : String | Nil = nil,
      @creation_time : Time | Nil = nil,
      @expiration_time : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @report_id
        params << {"#{prefix}ReportId", value}
      end

      (@resource_types || [] of ImageUsageResourceType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ResourceTypeSet.#{i}."))
      end

      (@account_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AccountIdSet.#{i}", item}
      end

      if value = @state
        params << {"#{prefix}State", value}
      end

      if value = @state_reason
        params << {"#{prefix}StateReason", value}
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", Core::QueryValue.time(value)}
      end

      if value = @expiration_time
        params << {"#{prefix}ExpirationTime", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        report_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reportId']")),
        resource_types: node.xpath_nodes("*[local-name()='resourceTypeSet']/*[local-name()='item']").map { |n| ImageUsageResourceType.from_xml(n) },
        account_ids: node.xpath_nodes("*[local-name()='accountIdSet']/*[local-name()='item']").map { |n| n.content },
        state: Core::XMLValue.string(node.xpath_node("*[local-name()='state']")),
        state_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='stateReason']")),
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        expiration_time: Core::XMLValue.time(node.xpath_node("*[local-name()='expirationTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @resource_types
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@image_id, @report_id, @resource_types, @account_ids, @state, @state_reason, @creation_time, @expiration_time, @tags)
  end
end
