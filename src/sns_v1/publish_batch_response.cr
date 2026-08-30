module Amazonite::SnsV1
  class PublishBatchResponse
    # A list of successful `PublishBatch` responses.
    property successful : Array(PublishBatchResultEntry) | Nil

    # A list of failed `PublishBatch` responses.
    property failed : Array(BatchResultErrorEntry) | Nil

    def initialize(
      @successful : Array(PublishBatchResultEntry) | Nil = nil,
      @failed : Array(BatchResultErrorEntry) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@successful || [] of PublishBatchResultEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Successful.member.#{i}."))
      end

      (@failed || [] of BatchResultErrorEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Failed.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successful: node.xpath_nodes("*[local-name()='Successful']/*[local-name()='member']").map { |n| PublishBatchResultEntry.from_xml(n) },
        failed: node.xpath_nodes("*[local-name()='Failed']/*[local-name()='member']").map { |n| BatchResultErrorEntry.from_xml(n) },
      )
    end

    def_equals_and_hash(@successful, @failed)
  end
end
