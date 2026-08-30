private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Describes whether StackSets performs non-conflicting operations concurrently and queues
  # conflicting operations.
  class ManagedExecution
    # When `true`, CloudFormation performs non-conflicting operations concurrently and queues
    # conflicting operations. After conflicting operations finish, CloudFormation starts queued
    # operations in request order.
    #
    # If there are already running or queued operations, CloudFormation queues all incoming operations
    # even if they are non-conflicting.
    #
    # You can't modify your StackSet's execution configuration while there are running or queued
    # operations for that StackSet.
    #
    # When `false` (default), StackSets performs one operation at a time in request order.
    property active : Bool | Nil

    def initialize(
      @active : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @active
        params << {"#{prefix}Active", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        active: Core::XMLValue.bool(node.xpath_node("*[local-name()='Active']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@active)
  end
end
