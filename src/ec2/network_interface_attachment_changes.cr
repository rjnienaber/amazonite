private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an attachment change.
  class NetworkInterfaceAttachmentChanges
    # The default number of the ENA queues.
    property default_ena_queue_count : Bool | Nil

    # The number of ENA queues to be created with the instance.
    property ena_queue_count : Int32 | Nil

    # The ID of the network interface attachment.
    property attachment_id : String | Nil

    # Indicates whether the network interface is deleted when the instance is terminated.
    property delete_on_termination : Bool | Nil

    def initialize(
      @default_ena_queue_count : Bool | Nil = nil,
      @ena_queue_count : Int32 | Nil = nil,
      @attachment_id : String | Nil = nil,
      @delete_on_termination : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @default_ena_queue_count
        params << {"#{prefix}DefaultEnaQueueCount", Core::QueryValue.bool(value)}
      end

      if value = @ena_queue_count
        params << {"#{prefix}EnaQueueCount", value.to_s}
      end

      if value = @attachment_id
        params << {"#{prefix}AttachmentId", value}
      end

      if value = @delete_on_termination
        params << {"#{prefix}DeleteOnTermination", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        default_ena_queue_count: Core::XMLValue.bool(node.xpath_node("*[local-name()='DefaultEnaQueueCount']")),
        ena_queue_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='EnaQueueCount']")),
        attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='attachmentId']")),
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='deleteOnTermination']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@default_ena_queue_count, @ena_queue_count, @attachment_id, @delete_on_termination)
  end
end
