module Amazonite::CloudFormation
  # The output for the ExecuteChangeSet action.
  class ExecuteChangeSetOutput
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

    def validate! : Nil
    end

    def_equals_and_hash()
  end
end
