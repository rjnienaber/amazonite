module Amazonite::CloudFormationV1
  # The output for a ContinueUpdateRollback operation.
  class ContinueUpdateRollbackOutput
    def initialize
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
      )
    end

    def_equals_and_hash()
  end
end
