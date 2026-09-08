private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteQueuedReservedInstancesResult
    # Information about the queued purchases that were successfully deleted.
    property successful_queued_purchase_deletions : Array(SuccessfulQueuedPurchaseDeletion) | Nil

    # Information about the queued purchases that could not be deleted.
    property failed_queued_purchase_deletions : Array(FailedQueuedPurchaseDeletion) | Nil

    def initialize(
      @successful_queued_purchase_deletions : Array(SuccessfulQueuedPurchaseDeletion) | Nil = nil,
      @failed_queued_purchase_deletions : Array(FailedQueuedPurchaseDeletion) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@successful_queued_purchase_deletions || [] of SuccessfulQueuedPurchaseDeletion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SuccessfulQueuedPurchaseDeletionSet.#{i}."))
      end

      (@failed_queued_purchase_deletions || [] of FailedQueuedPurchaseDeletion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FailedQueuedPurchaseDeletionSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successful_queued_purchase_deletions: node.xpath_nodes("*[local-name()='successfulQueuedPurchaseDeletionSet']/*[local-name()='item']").map { |n| SuccessfulQueuedPurchaseDeletion.from_xml(n) },
        failed_queued_purchase_deletions: node.xpath_nodes("*[local-name()='failedQueuedPurchaseDeletionSet']/*[local-name()='item']").map { |n| FailedQueuedPurchaseDeletion.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @successful_queued_purchase_deletions
        value.each(&.validate!)
      end

      if value = @failed_queued_purchase_deletions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@successful_queued_purchase_deletions, @failed_queued_purchase_deletions)
  end
end
