private alias Core = Amazonite::Core

module Amazonite::EC2
  class ConfirmProductInstanceResult
    # The return value of the request. Returns `true` if the specified product code is owned by the
    # requester and associated with the specified instance.
    property return : Bool | Nil

    # The Amazon Web Services account ID of the instance owner. This is only present if the product
    # code is attached to the instance.
    property owner_id : String | Nil

    def initialize(
      @return : Bool | Nil = nil,
      @owner_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @return
        params << {"#{prefix}Return", Core::QueryValue.bool(value)}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        return: Core::XMLValue.bool(node.xpath_node("*[local-name()='return']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@return, @owner_id)
  end
end
