private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Encloses data related to a successful message in a batch request for topic.
  class PublishBatchResultEntry
    # The `Id` of an entry in a batch request.
    property id : String | Nil

    # An identifier for the message.
    property message_id : String | Nil

    # This parameter applies only to FIFO (first-in-first-out) topics.
    #
    # The large, non-consecutive number that Amazon SNS assigns to each message.
    #
    # The length of `SequenceNumber` is 128 bits. `SequenceNumber` continues to increase for a
    # particular `MessageGroupId`.
    property sequence_number : String | Nil

    def initialize(
      @id : String | Nil = nil,
      @message_id : String | Nil = nil,
      @sequence_number : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @id
        params << {"#{prefix}Id", value}
      end

      if value = @message_id
        params << {"#{prefix}MessageId", value}
      end

      if value = @sequence_number
        params << {"#{prefix}SequenceNumber", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='Id']")),
        message_id: Core::XMLValue.string(node.xpath_node("*[local-name()='MessageId']")),
        sequence_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SequenceNumber']")),
      )
    end

    def_equals_and_hash(@id, @message_id, @sequence_number)
  end
end
